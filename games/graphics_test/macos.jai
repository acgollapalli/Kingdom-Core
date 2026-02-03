/* Macos platform layer for graphics

    sort of inspired by the No Graphics API post by Sebastian Aaltonen:
    https://www.sebastianaaltonen.com/blog/no-graphics-api

    this is also a really helpful reference:
    https://developer.apple.com/documentation/metal/managing-your-game-window-for-metal-in-macos?language=objc
*/

#scope_export


init_graphics :: () {
    init_mtl();

    arc_pool = objc_new(NSAutoreleasePool);

    // set content view 
    {
        view := objc_init(objc_alloc(NSView));
        NSView.setWantsLayer(view, YES);
        //autorelease(view);

        the_swapchain = objc_init(objc_alloc(CAMetalLayer));
        the_device = MTLCreateSystemDefaultDevice();
        setDevice(the_swapchain, the_device);

        setDrawableSize(the_swapchain, { WINDOW_WIDTH, WINDOW_HEIGHT }); // @TODO: Use convertSizeToBacking instead
        setFramebufferOnly(the_swapchain, false); // set to false for debugging and true for performance
        setPixelFormat(the_swapchain, .MTLPixelFormatBGRA8Unorm_sRGB); // TODO: set up a standard way for users to know from the platform layer what pixel format the swapchain is in. (just saying it's always BGRA8Unorm_sRGB would prevent us from ever supporting HDR in the future)

        NSView.setLayer(view, the_swapchain);
        assert(NSView.layer(view) == the_swapchain);

        NSWindow.setContentView(the_window, view);
        NSWindow.makeFirstResponder(the_window, view);
    }

    // set up argument table descriptors
    {
        compute_arg_table_descriptor = objc_new(MTL4ArgumentTableDescriptor);
        setMaxBufferBindCount(compute_arg_table_descriptor, 2);
        setSupportAttributeStrides(compute_arg_table_descriptor, xx true);

        render_arg_table_descriptor = objc_new(MTL4ArgumentTableDescriptor);
        setMaxBufferBindCount(render_arg_table_descriptor, 2);
        setSupportAttributeStrides(render_arg_table_descriptor, xx true);
    }

    // set up gpu memory heap
    #if #exists(USE_APPLE_HEAP_ALLOCATION) {
        descriptor := objc_new(MTLHeapDescriptor);
        //autorelease(descriptor);

        setType(descriptor, .Automatic); // technically the default
        setStorageMode(descriptor, .MTLStorageModeShared);
        setSize(descriptor, 1024*1024*512);

        the_heap = cast( *MTLHeap, newHeap(the_device, descriptor));
    }

    // set up residency set so we can just add it on the command queue
    {
        descriptor := objc_new(MTLResidencySetDescriptor);
        setInitialCapacity(descriptor, xx 1);

        error : *NSError;
        the_residency_set = newResidencySet(the_device, descriptor, *error);
        if !the_residency_set  log_error("Problem creating residency set: %", error);
        assert(the_residency_set != null);

        addAllocation(the_residency_set, xx the_heap);
        commit(the_residency_set);
    }

    // setup a compiler instance
    #if __USE_MTL4_COMPILER // as of january 2025, MTL4Compiler breaks XCodes Metal Debugger
    {
        pipeline_data_set_serializer_descriptor := objc_new(MTL4PipelineDataSetSerializerDescriptor);
        setConfiguration(pipeline_data_set_serializer_descriptor, .CaptureBinaries | .CaptureDescriptors);
        //autorelease(pipeline_data_set_serializer_descriptor);

        pipeline_data_set_serializer := newPipelineDataSetSerializer(the_device, pipeline_data_set_serializer_descriptor);

        compiler_descriptor := objc_new(MTL4CompilerDescriptor);
        setPipelineDataSetSerializer(compiler_descriptor, pipeline_data_set_serializer);
        //autorelease(compiler_descriptor);

        error: *NSError;
        the_compiler = newCompiler(the_device, compiler_descriptor, *error);
        if !the_compiler log_error("Problem creating shader compiler: %", error);
        assert(the_compiler != null);
    }

    // init timeline_semaphore
    {
        timeline_semaphore = create_semaphore();
    }
}

begin_render_pass :: (command_buffer: CommandBuffer, render_pass_descriptor: RenderPassDescriptor) {

    render_pass := objc_new(MTL4RenderPassDescriptor);
    //autorelease(render_pass);

    // debug asserts
    target_texture := render_pass_descriptor.color_targets[0].texture;
    assert(width(target_texture) > 1);
    assert(height(target_texture) > 1);
    assert(pixelFormat(target_texture) == .BGRA8Unorm_sRGB);

    // validate RenderPassDescriptor
    // TODO: ensure this whole block gets compiled out on release builds
    // TODO: figure out which, if any ,of these constraints we can remove without metal just silently failing to render primitives
    // TODO: figure out if this kind of assertion can be done statically instead of at runtime
    { 
        using render_pass_descriptor;

        assert(color_targets.count > 0, "You must specify at least 1 color target to render to!");

        for color_targets  assert(it.texture != null, "You must specify a texture for color target number: %!", it_index);

        assert(depth_target.texture != null, "You must specify a depth target texture in your render pass!");
        assert(stencil_target.texture != null, "You must specify a stencil target texture in your render pass!");
    }

    configure_render_pass_attachment :: (attachment: *MTLRenderPassAttachmentDescriptor, texture_handle: TextureHandle, load_op: LoadOp, store_op: StoreOp) {
        setTexture(attachment, texture_handle);

        // setLevel(attachment, 0); // mipmap level, this is the default value
        // setSlice(attachment, 0); // texture layer, this is the default value
        // setDepthPlane(attachment, 0); // only applies to 3d textures, this is the default value

        #assert(MTLLoadAction.Load == cast(MTLLoadAction, LoadOp.Load));
        load_action := cast(MTLLoadAction, load_op);
        setLoadAction(attachment, load_action);

        #assert(MTLStoreAction.Store == cast(MTLStoreAction, StoreOp.Store));
        store_action := cast(MTLStoreAction, store_op);
        setStoreAction(attachment, store_action);

        // Used for multisampling
        // setStoreActionOptions(attachment, ...);

        // The destination texture used when resolving multisampled texture data into single sample values.
        // resolveTexture(attachment, ...);

        // The mipmap level of the texture used for the multisample resolve action.
        // resolveLevel(attachment, ...);

        // The slice of the texture used for the multisample resolve action.
        // resolveSlice(attachment, ...);

        // The depth plane of the texture used for the multisample resolve action.
        // resolveDepthPlane(attachment, ...);
    }



    // set color targets
    for render_pass_descriptor.color_targets {
        color_attachment := object(colorAttachments(render_pass), xx it_index);
        //autorelease(color_attachment);

        configure_render_pass_attachment(color_attachment, it.texture, it.load_op, it.store_op);

        clear_color := convert_clear_color(it.clear_color);
        setClearColor(color_attachment, clear_color);
    }

    setDefaultRasterSampleCount(render_pass, 1);

    // set depth target
    {
        //depth_attachment := objc_new(MTLRenderPassDepthAttachmentDescriptor);
        //autorelease(depth_attachment);
        depth_attachment := depthAttachment(render_pass);
        assert(depth_attachment != null);
        depth_target := render_pass_descriptor.depth_target;

        configure_render_pass_attachment(depth_attachment, depth_target.texture, depth_target.load_op, depth_target.store_op);

        setClearDepth(depth_attachment, depth_target.clear_value);

        // filter for MSAA operations
        // setDepthResolveFilter(depth_attachment, ...);
    }

    
    // Assigns the per-sample size, in bytes, of the largest explicit imageblock layout in the render pass.
    // imageblockSampleLength

    // Assigns an optional variable rasterization rate map that Metal uses in the render pass.
    // rasterizationRateMap
    
    // Assigns the number of layers that all attachments this descriptor references have.
    // renderTargetArrayLength
    
    // Sets the height, in pixels, to which Metal constrains the render target.
    // renderTargetHeight
    
    // Sets the width, in pixels, to which Metal constrains the render target.
    // renderTargetWidth

    // set stencil target
    {
        //stencil_attachment := objc_new(MTLRenderPassStencilAttachmentDescriptor);
        //autorelease(stencil_attachment);
        stencil_attachment := stencilAttachment(render_pass);
        assert(stencil_attachment != null);

        stencil_target := render_pass_descriptor.stencil_target;

        configure_render_pass_attachment(stencil_attachment, stencil_target.texture, stencil_target.load_op, stencil_target.store_op);

        // filter for MSAA
        // setStencilResolveFilter(stencil_attachment, ...);

        setClearStencil(stencil_attachment, stencil_target.clear_value);
    }

    //Controls if the render pass supports color attachment mapping.
    //supportColorAttachmentMapping

    //Assigns the per-tile size, in bytes, of the persistent threadgroup memory allocation of this render pass.
    //threadgroupMemoryLength

    //The height of the tiles, in pixels, a render pass you create with this descriptor applies to its attachments.
    //tileHeight

    //tileWidth
    //The width of the tiles, in pixels, a render pass you create with this descriptor applies to its attachments.

    //Configures a buffer into which Metal writes counts of fragments (pixels) passing the depth and stencil tests.
    //visibilityResultBuffer

    //Determines if Metal accumulates visibility results between render encoders or resets them.
    //visibilityResultType

    if command_buffer.active_encoder != null {
        endEncoding(command_buffer.active_encoder);
        //autorelease(command_buffer.active_encoder);
    }
    
    command_buffer.active_encoder = renderCommandEncoder(command_buffer.buffer, render_pass);
    assert(command_buffer.active_encoder != null);

    command_buffer.active_encoder_kind = .Render;

    setArgumentTable(xx command_buffer.active_encoder, command_buffer.vertex_argument_table, .MTLRenderStageVertex);
    setArgumentTable(xx command_buffer.active_encoder, command_buffer.pixel_argument_table, .MTLRenderStageFragment);
}

end_render_pass :: (command_buffer: CommandBuffer) {
    assert(command_buffer.active_encoder_kind == .Render); // @TODO: need to ensure this becomes a wasm_runtime_assert in wasm
    endEncoding(command_buffer.active_encoder);
    //autorelease(command_buffer.active_encoder); // TODO: We may be able to reuse these. But should we? It adds complexity
    command_buffer.active_encoder = null;
    command_buffer.active_encoder_kind = .None;
}

get_command_queue :: () -> CommandQueue {
    command_queue := newMTL4CommandQueue(the_device);
    addResidencySet(command_queue, the_residency_set);

    return command_queue;
}

start_command_recording :: (command_queue: CommandQueue) -> CommandBuffer {
    command_buffer := get_command_buffer();
    beginCommandBuffer(command_buffer.buffer, command_buffer.allocator);

    return command_buffer;
}

submit :: (command_queue: CommandQueue, command_buffers: .. CommandBuffer) {
    _buffers := NewArray(command_buffers.count, *MTL4CommandBuffer);
    defer array_free(_buffers);
    for command_buffers {
        _buffers[it_index] = it.buffer;
        endCommandBuffer(it.buffer);
    }

    commit(command_queue, _buffers.data, xx _buffers.count);
    signalEvent(command_queue, timeline_semaphore, frame_counter);
    frame_counter += 1;
}

submit :: (command_queue: CommandQueue, command_buffers: .. CommandBuffer, semaphore: Semaphore, semaphore_value: u64) {
    submit(command_queue, ..command_buffers);
    signalEvent(command_queue, semaphore, semaphore_value);
}

get_next_swapchain_image :: () -> *CAMetalDrawable {
    swapchain_image := nextDrawable(the_swapchain);
    return swapchain_image;
}

get_swapchain_texture :: (swapchain_image: *CAMetalDrawable) -> *MTLTexture {
    swapchain_texture := texture(swapchain_image);
    return swapchain_texture;
}

// NOTE: Since we're acquiring our swapchain image from CAMetalLayer.nextDrawable(),
// we probably don't actually need this. It's unnecessary clutter
await_swapchain_image :: (command_queue: CommandQueue, swapchain_image: *CAMetalDrawable) {
    //MTLCommandBuffer.presentDrawable(command_buffer, xx swapchain_image);
    wait(command_queue, swapchain_image);
}

// NOTE: We could probably just merge these two together with submit_command_buffers
present_swapchain_image :: (command_queue: CommandQueue, swapchain_image: *CAMetalDrawable) {
    //MTLCommandBuffer.presentDrawable(command_buffer, xx swapchain_image);
    signalDrawable(command_queue, swapchain_image);
    present(swapchain_image);

    // NOTE: We'll test it without releasing since it's technically safe to do
    //release(swapchain_image); 
}

/* 
    Texture stuff
        `GpuTextureSizeAlign gpuTextureSizeAlign(GpuTextureDesc desc);
        `GpuTexture gpuCreateTexture(GpuTextureDesc desc, void* ptrGpu);
        `GpuTextureDescriptor gpuTextureViewDescriptor(GpuTexture texture, GpuViewDesc desc);
        `GpuTextureDescriptor gpuRWTextureViewDescriptor(GpuTexture texture, GpuViewDesc desc);
*/

/* NOTE: We're going to need an actual malloc style allocator, in order to allow us to:
    a) free gpu memory from the heap from a pointer while:
    b) using a heap as a residency set and
    c) passing the cpu part of the shared memory to a wasm heap as shared memory and
    d) calculating the cpu pointer from the gpu pointer

    There MAY be a significantly simpler way to do it than maintaining our own free lists
    and block sizes, but it mighht just end up an uglier and slower hack too, so we'll try
    the malloc style allocator first.
*/
#if #exists(USE_APPLE_HEAP_ALLOCATION) {

    // the actual Aaltonen api has allocation go like this: 
    // void* gpuMalloc(size_t bytes, MEMORY memory = MEMORY_DEFAULT);
    // void* gpuMalloc(size_t bytes, size_t align, MEMORY memory = MEMORY_DEFAULT);
    // but host to device pointer seems a bit silly and returning the struct just seems better
    // this may change when we have to do the vulkan implementation.
    // TODO: enforce 16 byte alignment here
    gpu_alloc :: (size: int, align: int = 16, memory: Memory = .Default) -> Allocation {
        assert(align == 16, "alloc alignment overload not implemented yet!");
        resource_options := ifx memory == .GPU then MTLResourceOptions.StorageModePrivate else MTLResourceOptions.StorageModeShared;

        //buffer := newBufferWithLength_options(the_device, xx size, resource_options);
        buffer := newBuffer(the_heap, xx size, resource_options); 

        // FIXME: We need to set up individual heaps for different memory types,
        // because we're using the heap for residency set purposes, and the memory
        // type needs to match the heap's storage type. 
        assert(memory == .Default);

        cpu_address := ifx memory != .GPU contents(buffer) else null;
        gpu_address := gpuAddress(buffer);

        // looks like metal autmoatically aligns to 16
        assert((gpu_address.(u64) % align.(u64)) == 0); 
        assert((cpu_address.(u64) % align.(u64)) == 0);

        table_add(*allocations, gpu_address.(*void), buffer);

        // TODO: fix gpu_address casting
        return { cpu = cpu_address, gpu = xx gpu_address, size = xx size };
    }

    gpu_free :: (address: *void) {
        found_id, mtl_buffer_id := table_find(*allocations, address);
        assert(found_id, "Attempted to double-free gpu memory at %!\n", address);

        cast(*MTLResource, mtl_buffer_id); // MTLBuffer inherits from MTLResource
        makeAliasable(mtl_buffer_id); // allows the heap memory to be reused
        //autorelease(mtl_buffer_id);
        table_remove(*allocations, address);
    }
}
// NOTE: vertex_shader and pixel_shader are the IR of the Slang Shading Language.
// This means that if you want to pass shaders to this procedure, then you need 
// to compile them using the compile_to_slang_ir in shader_compiler.jai (in modules).
// If you only want to use this api to target native code, then you can very easily
// refactor it to take the native IR of the platform so that you can go directly from
// your shader source directly to the metallib.
create_graphics_pipeline :: (vertex_shader: []u8, pixel_shader: []u8, raster_descriptor: RasterDescriptor) -> Pipeline {
    #if __USE_MTL4_COMPILER {
        #run print("Module[GFX]: using MTL4Compiler, using MTL4RenderPipelineDescriptor\n");
        return create_MTL4_graphics_pipeline(vertex_shader, pixel_shader, raster_descriptor);
    } else {
        #run print("Module[GFX]: NOT using MTL4Compiler, using MTLRenderPipelineDescriptor\n");
        return create_MTL_graphics_pipeline(vertex_shader, pixel_shader, raster_descriptor);
    }
}

#scope_file

create_MTL4_graphics_pipeline :: (vertex_shader: []u8, pixel_shader: []u8, raster_descriptor: RasterDescriptor) -> Pipeline {
    pipeline_descriptor := objc_new(MTL4RenderPipelineDescriptor);
    autorelease(pipeline_descriptor);

    pipeline_options := objc_new(MTL4PipelineOptions);
    //#if #exists(DEBUG_PIPELINES) {
        setShaderReflection(pipeline_options, xx true);
        setShaderValidation(pipeline_options, xx true);
    //}
    setOptions(pipeline_descriptor, pipeline_options);
    
    alpha_to_coverage : MTL4AlphaToCoverageState  = ifx raster_descriptor.alpha_to_coverage then .Enabled else .Disabled; 
    setAlphaToCoverageState(pipeline_descriptor, alpha_to_coverage);

    // NOTE: This should probably always be false, and it is by default
    // our RasterDescriptor doesn't have a field for it for that reason.
    // alpha_to_one := MTL4AlphaToOneState.Disabled;
    // setAlphaToOneState(pipeline_options, alpha_to_one);

    // NOTE: I also have no clue whether this should be Identity or Inherited
    // but I think that the identity one might solve our problem here.
    setColorAttachmentMappingState(pipeline_descriptor, .Identity);

    color_attachments := colorAttachments(pipeline_descriptor);
    reset(color_attachments); // just to make sure there isn't anything finicky going on there

    for raster_descriptor.color_targets {
        color_attachment_descriptor := object(color_attachments, xx it_index);

        pixel_format := convert_pixel_format(it.format);
        setPixelFormat(color_attachment_descriptor, pixel_format);

        write_mask := convert_write_mask(it.write_mask);
        setWriteMask(color_attachment_descriptor, write_mask);

        if raster_descriptor.blend_descriptor {
            blend := raster_descriptor.blend_descriptor;

            #assert(MTLBlendOperation.ReverseSubtract == cast(MTLBlendOperation, Blend.Rev_Subtract));
            #assert(MTLBlendFactor.SourceAlpha == cast(MTLBlendFactor, Factor.Src_Alpha));

            setBlendingState(color_attachment_descriptor, .Enabled);

            alpha_blend_operation := cast(MTLBlendOperation, blend.alpha_op);
            setAlphaBlendOperation(color_attachment_descriptor, alpha_blend_operation);

            dst_alpha_blend_factor := cast(MTLBlendFactor, blend.src_alpha_factor);
            setDestinationAlphaBlendFactor(color_attachment_descriptor, dst_alpha_blend_factor);

            dst_rgb_blend_factor := cast(MTLBlendFactor, blend.src_color_factor);
            setDestinationRGBBlendFactor(color_attachment_descriptor, dst_rgb_blend_factor);

            rgb_blend_operation := cast(MTLBlendOperation, blend.color_op);
            setRgbBlendOperation(color_attachment_descriptor, rgb_blend_operation);

            src_alpha_blend_factor := cast(MTLBlendFactor, blend.src_alpha_factor);
            setSourceAlphaBlendFactor(color_attachment_descriptor, src_alpha_blend_factor);

            src_rgb_blend_factor := cast(MTLBlendFactor, blend.src_color_factor);
            setSourceRGBBlendFactor(color_attachment_descriptor, src_rgb_blend_factor);
        } else {
            setBlendingState(color_attachment_descriptor, .Unspecialized);
        }
    }

    
    fragment_fn_descriptor := make_metal4_function_descriptor(pixel_shader);
    setFragmentFunctionDescriptor(pipeline_descriptor, fragment_fn_descriptor);

    // NOTE: used for adding binary functions to the fragment stage
    //setFragmentStaticLinkingDescriptor(pipeline_descriptor, ...);

    topology_class := convert_primitive_topology(raster_descriptor.topology);
    assert(topology_class == MTLPrimitiveTopologyClass.Triangle); // FIXME: only for testing
    setInputPrimitiveTopology(pipeline_descriptor, topology_class);

    #assert(1 == cast(BOOL, true));
    setRasterizationEnabled(pipeline_descriptor, xx true); // evidently it can sometimes be false (?!)

    //Don't think I need this. Don't think we use this
    //maxVertexAmplificationCount

    raster_sample_count := cast(NSUInteger, raster_descriptor.sample_count);
    setRasterSampleCount(pipeline_descriptor, raster_sample_count);

    // NOTE: we don't do this, but it's for binary functions in the fragment shader
    //setSupportsFragmentBinaryLinking(pipeline_descriptor, ...)

    // NOTE: we may need this for implementing indirect multidraw
    //setSupportsIndirectCommandBuffers(pipeline_descriptor, ...)

    // NOTE: we don't do this, but it's for binary functions in the vertex shader
    //setSupportsVertexBinaryLinking(pipeline_descriptor, ...)

    vertex_fn_descriptor := make_metal4_function_descriptor(vertex_shader);
    setVertexFunctionDescriptor(pipeline_descriptor, vertex_fn_descriptor);

    // NOTE: used for adding binary functions to the vertex stage
    //setVertexStaticLinkingDescriptor(pipeline_descriptor, ...);

    // Cull is set on the encoder

    // I don't think the dual source blending option can be set on metal, because
    // I think it's on by default

    // Depth and Stencil are not set on the MTL4RenderPipelineDescriptor

    compiler_task_options := objc_new(MTL4CompilerTaskOptions);
    // NOTE: we can add archives here that are precompiled shaders

    error : *NSError;
    pipeline_state := newRenderPipelineState(the_compiler, pipeline_descriptor, compiler_task_options, *error);
    if !pipeline_state  log_error("Problem creating graphics pipeline: %", error);
    assert(pipeline_state != null);

    pipeline := New(Pipeline_);
    pipeline.* = { 
        kind = .Graphics,
        graphics = { raster_descriptor, pipeline_state }, 
    };

    log("pipeline created: %, deref'd: %", pipeline, pipeline.*);

    return pipeline;
}

create_MTL_graphics_pipeline :: (vertex_shader: []u8, pixel_shader: []u8, raster_descriptor: RasterDescriptor) -> Pipeline {
    mtl_descriptor := objc_new(MTLRenderPipelineDescriptor);
    autorelease(mtl_descriptor);

    // NOTE: we might want to call this if we were reusing them
    // reset(mtl_descriptor);

    vertex_fn := make_metal_function(vertex_shader);
    setVertexFunction(mtl_descriptor, vertex_fn);

    fragment_fn := make_metal_function(pixel_shader);
    setFragmentFunction(mtl_descriptor, fragment_fn);

    // NOTE: default values
    //setMaxVertexCallStackDepth(mtl_descriptor, 1);
    //setMaxFragmentCallStackDepth(mtl_descriptor, 1);

    // NOTE: we don't use this since we're using vertex fetch via an argument buffer
    // setVertexDescriptor(mtl_descriptor, null);

    // NOTE: set pipeline mutability options. We don't use this, although maybe we need to
    // vertex_buffers := vertexBuffers(mtl_descriptor);
    // fragment_buffers := fragmentBuffers(mtl_descriptor);

    color_attachments := colorAttachments(mtl_descriptor);
    for raster_descriptor.color_targets {
        attachment := object(color_attachments, xx it_index);

        pixel_format := convert_pixel_format(it.format);
        setPixelFormat(attachment, pixel_format);

        write_mask := convert_write_mask(it.write_mask);
        setWriteMask(attachment, write_mask);

        assert(raster_descriptor.blend_descriptor != null); // only for debugging
//        if raster_descriptor.blend_descriptor 
        {
            blend := raster_descriptor.blend_descriptor.*;

            setBlendingEnabled(attachment, true);

            alpha_blend_op := convert_blend(blend.alpha_op);
            setAlphaBlendOperation(attachment, alpha_blend_op);

            rgb_blend_op := convert_blend(blend.color_op);
            setRgbBlendOperation(attachment, rgb_blend_op);

            dst_alpha_blend_factor := convert_factor(blend.dst_alpha_factor);
            setDestinationAlphaBlendFactor(attachment, dst_alpha_blend_factor);

            dst_rgb_blend_factor := convert_factor(blend.dst_color_factor);
            setDestinationRGBBlendFactor(attachment, dst_rgb_blend_factor);

            src_alpha_blend_factor := convert_factor(blend.src_alpha_factor);
            setSourceAlphaBlendFactor(attachment, src_alpha_blend_factor);

            src_rgb_blend_factor := convert_factor(blend.src_color_factor);
            setSourceRGBBlendFactor(attachment, src_rgb_blend_factor);
        }
    }

    depth_format := convert_pixel_format(raster_descriptor.depth_format);
    setDepthAttachmentPixelFormat(mtl_descriptor, depth_format);

    stencil_format := convert_pixel_format(raster_descriptor.stencil_format);
    setStencilAttachmentPixelFormat(mtl_descriptor, stencil_format);

    setAlphaToCoverageEnabled(mtl_descriptor, xx raster_descriptor.alpha_to_coverage);

    // NOTE: I'm not sure we need this.
    //setAlphaToOneEnabled(mtl_descriptor, xx false);

    // NOTE: default value
    //setRasterizationEnabled(mtl_descriptor, xx true);

    primitive_topology := convert_primitive_topology(raster_descriptor.topology);
    setInputPrimitiveTopology(mtl_descriptor, primitive_topology);

    setRasterSampleCount(mtl_descriptor, raster_descriptor.sample_count);

    // NOTE: tesselation and other functions here:
    // see: https://developer.apple.com/documentation/metal/mtlrenderpipelinedescriptor#Specifying-tessellation-state

    // NOTE: we may need this for indirect multidraw
    // setSupportIndirectCommandBuffers(mtl_descriptor, xx true);


    //#if #exists(DEBUG_PIPELINES) {
        setShaderValidation(mtl_descriptor, xx true);
    //}

    error: *NSError;
    pipeline_state := newRenderPipelineState(the_device, mtl_descriptor, *error);
    
    if !pipeline_state  log_error("Problem creating graphics pipeline: %", error);

    assert(pipeline_state != null);

    pipeline := New(Pipeline_);
    pipeline.* = { 
        kind = .Graphics,
        graphics = { raster_descriptor, pipeline_state }, 
    };

    log("pipeline created: %, deref'd: %", pipeline, pipeline.*);

    return pipeline;
}

#scope_module

free_pipeline :: (pipeline: Pipeline) {
    if pipeline.kind == .Graphics || pipeline.kind == .GraphicsMeshlet {
        release(pipeline.graphics.pipeline);
        pipeline.graphics.pipeline = null;
    }
    free(pipeline);
}

set_pipeline :: (command_buffer: CommandBuffer, pipeline: Pipeline) {
    if pipeline.kind == .Graphics || pipeline.kind == .GraphicsMeshlet {
        assert(command_buffer.active_encoder_kind == .Render);
        render_encoder := cast(*MTL4RenderCommandEncoder, command_buffer.active_encoder);

        setRenderPipelineState(render_encoder, pipeline.graphics.pipeline);

        cull_mode := convert_cull(pipeline.graphics.descriptor.cull);
        setCullMode(render_encoder, cull_mode);

        viewport := MTLViewport.{ 0, 0, WINDOW_WIDTH.(float32), WINDOW_HEIGHT.(float32), 0, 1};
        setViewport(render_encoder, viewport);

        scissor_rect := MTLScissorRect.{ 0, 0, xx WINDOW_WIDTH, xx WINDOW_HEIGHT };
        setScissorRect(render_encoder, scissor_rect);

        command_buffer.active_pipeline = pipeline;
    }
    else {
        log_error("pipeline passed to set_pipeline: %, deref'd %", pipeline, pipeline.*);
        assert(false, "Compute Pipelines are not implemented yet!");
    }
}

create_depth_stencil_state :: (descriptor: DepthStencilDescriptor) -> DepthStencilState {

    configure_stencil :: (stencil_descriptor: *MTLStencilDescriptor, stencil: Stencil, read_mask: u32, write_mask: u32) {
        using MTLStencilDescriptor;
        using stencil;
        compare_fn := convert_op(test);
        stencil_fail_op := convert_stencil_op(fail_op);
        depth_fail_op_ := convert_stencil_op(depth_fail_op);
        both_pass_op := convert_stencil_op(pass_op);

        setStencilFailureOperation(stencil_descriptor, stencil_fail_op);
        setDepthFailureOperation(stencil_descriptor, depth_fail_op_);
        setDepthStencilPassOperation(stencil_descriptor, both_pass_op);
        setStencilCompareFunction(stencil_descriptor, compare_fn);
        setReadMask(stencil_descriptor, read_mask);
        setWriteMask(stencil_descriptor, write_mask);
    }

    back_stencil := objc_new(MTLStencilDescriptor);
    configure_stencil(back_stencil, descriptor.stencil_back, descriptor.stencil_read_mask, descriptor.stencil_write_mask);
    autorelease(back_stencil);

    front_stencil := objc_new(MTLStencilDescriptor);
    configure_stencil(front_stencil, descriptor.stencil_front, descriptor.stencil_read_mask, descriptor.stencil_write_mask);
    autorelease(front_stencil);

    mtl_descriptor := objc_new(MTLDepthStencilDescriptor);
    autorelease(mtl_descriptor);
    { 
        using MTLDepthStencilDescriptor;

        depth_test := convert_op(descriptor.depth_test);
        setDepthCompareFunction(mtl_descriptor, depth_test);

        depth_write_enabled := cast(bool, descriptor.depth_mode & DepthFlags.Write);
        assert(depth_write_enabled == false);
        setDepthWriteEnabled(mtl_descriptor, xx depth_write_enabled);

        setBackFaceStencil(mtl_descriptor, back_stencil);

        setFrontFaceStencil(mtl_descriptor, front_stencil);
    }

    depth_stencil_state := newDepthStencilState(the_device, mtl_descriptor);

    depth_stencil_state_ptr := New(DepthStencilState_, false);
    depth_stencil_state_ptr.* = { descriptor, depth_stencil_state };
    return depth_stencil_state_ptr;
}

free_depth_stencil_state :: (depth_stencil_state: DepthStencilState) {
    autorelease(depth_stencil_state.state);
    depth_stencil_state.state = null;
    free(depth_stencil_state);
}

set_depth_stencil_state :: (command_buffer: CommandBuffer, depth_stencil_state: DepthStencilState) {
    assert(command_buffer.active_encoder_kind == .Render);
    encoder := cast(*MTL4RenderCommandEncoder, command_buffer.active_encoder);
    if depth_stencil_state {

        setDepthStencilState(encoder, depth_stencil_state.state);
        setDepthBias(encoder, depth_stencil_state.descriptor.depth_bias, depth_stencil_state.descriptor.depth_bias_slope_factor, depth_stencil_state.descriptor.depth_bias_clamp);
        setStencilReferenceValues(encoder, depth_stencil_state.descriptor.stencil_front.reference, depth_stencil_state.descriptor.stencil_back.reference);
    } else {
        setDepthStencilState(encoder, null);
    }
}

set_blend_state :: () {} // FIXME: IMPLEMENT

// NOTE: Our GPU Semaphores are monotonically increasing timeline semaphores
// we currently can't set the initial value of the semaphore without passing
// in a command queue
create_semaphore :: () -> Semaphore {
    return newSharedEvent(the_device);
}

wait_semaphore :: (semaphore: Semaphore, wait_value: u64) {
    while signaledValue(semaphore) <= wait_value {}
}

value_semaphore :: (semaphore: Semaphore) -> u64 {
    return signaledValue(semaphore);
}

destroy_semaphore :: (semaphore: Semaphore) {
    release(semaphore);
}

/* TODO: implement these. I'm not sure how you'd do this in metal yet.
    The barrier part seems easy enough but the signal and wait parts of it
    but the gpuSignalAfter and gpuWaitBefore are more complicated because
    I don't know if Metal has a primitive that we can use to do that 

    void gpuBarrier(GpuCommandBuffer cb, STAGE before, STAGE after, HAZARD_FLAGS hazards = 0);
    void gpuSignalAfter(GpuCommandBuffer cb, STAGE before, void *ptrGpu, uint64 value, SIGNAL signal);
    void gpuWaitBefore(GpuCommandBuffer cb, STAGE after, void *ptrGpu, uint64 value, OP op, HAZARD_FLAGS hazards = 0, uint64 mask = ~0);
*/

draw_indexed :: (command_buffer: CommandBuffer, vertex_data_gpu: *void, pixel_data_gpu: *void, index_buffer_gpu: *void, index_count: int){
    #insert,scope() draw_call_assertions;
    render_encoder := cast(*MTL4RenderCommandEncoder, command_buffer.active_encoder);

    setAddress(command_buffer.vertex_argument_table, xx vertex_data_gpu, 0);
    setAddress(command_buffer.pixel_argument_table, xx pixel_data_gpu, 0);

    primitive_type := convert_topology_to_primitive(command_buffer.active_pipeline.graphics.descriptor.topology);
    nsu_index_count := cast(NSUInteger, index_count);
    assert(nsu_index_count != 0, "draw_indexed received an index buffer of size 0!");
    drawIndexedPrimitives(render_encoder, primitive_type, nsu_index_count, .MTLIndexTypeUInt32, xx index_buffer_gpu, nsu_index_count * 4);
}

#load "graphics.jai";

Encoder_Kind :: enum {
    None;
    Render;
    Compute;
    Blit;
}

convert_clear_color :: (clear_color: ClearColor) -> MTLClearColor {
    return { 
        red = clear_color.red, 
        green = clear_color.green, 
        blue = clear_color.blue, 
        alpha = clear_color.alpha 
    };
}

convert_blend :: (blend: Blend) -> MTLBlendOperation {
    if #complete blend == {
        case .Add; return .Add; 
        case .Subtract; return .Subtract; 
        case .Rev_Subtract; return .ReverseSubtract; 
        case .Min; return .Min; 
        case .Max; return .Max; 
    }
}

convert_factor :: (factor: Factor) -> MTLBlendFactor {
    if #complete factor == {
        case .Zero; return .Zero; 
        case .One; return .One; 
        case .Src_Color; return .SourceColor; 
        case .Dst_Color; return .DestinationColor; 
        case .Src_Alpha; return .SourceAlpha; 
        case .Dst_Alpha; return .DestinationAlpha; 
    }
}

convert_op :: (op: Op) -> MTLCompareFunction {
    if op == {
        case .Never; return .Never; 
	    case .Less; return .Less; 
	    case .Equal; return .Equal; 
	    case .Less_Equal; return .LessEqual; 
	    case .Greater; return .Greater; 
	    case .Not_Equal; return .NotEqual; 
	    case .Greater_Equal; return .GreaterEqual; 
	    case .Always; return .Always; 
        case; { assert(false); return .Always; }
    }
}

convert_stencil_op :: (op: Op) -> MTLStencilOperation {
    if op == {
	    case .Keep; return .Keep; 
	    case .Zero; return .Zero; 
	    case .Replace; return .Replace; 
	    case .IncrementClamp; return .IncrementClamp; 
	    case .DecrementClamp; return .DecrementClamp; 
	    case .Invert; return .Invert; 
	    case .IncrementWrap; return .IncrementWrap; 
	    case .DecrementWrap; return .DecrementWrap; 
        case; { assert(false); return .Keep; }
    }
}

convert_cull :: (cull: Cull) -> MTLCullMode {
    if #complete cull == {
        case .CCW;      return .Back;
        case .CW;       return .Front;
        case .All;      return .None; // I have no idea what cull all is supposed to do
        case .None;     return .None;
        case; assert(false); return .None;
    };
}

convert_topology_to_primitive :: (topology: Topology) -> MTLPrimitiveType {
    if #complete topology == {
        case .None;             assert(false); return .Triangle;
        case .Triangle;         return .Triangle;
        case .Line;             return .Line;
        case .Point;            return .Point;
        case .Triangle_Strip;   return .TriangleStrip;
        case; assert(false); return .Triangle;
    };
}

convert_primitive_topology :: (topology: Topology) -> MTLPrimitiveTopologyClass {
if #complete topology == {
        case .None;             return .Unspecified;
        case .Point;            return .Point;
        case .Line;             return .Line;
        case .Triangle;         return .Triangle;
        case .Triangle_Strip;   return .Triangle;
        case; return .Unspecified;
    }
}

convert_pixel_format :: (format: Format) -> MTLPixelFormat {
    if #complete format == {
	    case .None; return .Invalid; 
	    case .A8Unorm; return .A8Unorm; 
	    case .R8Unorm; return .R8Unorm; 
	    case .R8Unorm_sRGB; return .R8Unorm_sRGB; 
	    case .R8Snorm; return .R8Snorm; 
	    case .R8Uint; return .R8Uint; 
	    case .R8Sint; return .R8Sint; 
	    case .R16Unorm; return .R16Unorm; 
	    case .R16Snorm; return .R16Snorm; 
	    case .R16Uint; return .R16Uint; 
	    case .R16Sint; return .R16Sint; 
	    case .R16Float; return .R16Float; 
	    case .RG8Unorm; return .RG8Unorm; 
	    case .RG8Unorm_sRGB; return .RG8Unorm_sRGB; 
	    case .RG8Snorm; return .RG8Snorm; 
	    case .RG8Uint; return .RG8Uint; 
	    case .RG8Sint; return .RG8Sint; 
	    case .B5G6R5Unorm; return .B5G6R5Unorm; 
	    case .A1BGR5Unorm; return .A1BGR5Unorm; 
	    case .ABGR4Unorm; return .ABGR4Unorm; 
	    case .BGR5A1Unorm; return .BGR5A1Unorm; 
	    case .R32Uint; return .R32Uint; 
	    case .R32Sint; return .R32Sint; 
	    case .R32Float; return .R32Float; 
	    case .RG16Unorm; return .RG16Unorm; 
	    case .RG16Snorm; return .RG16Snorm; 
	    case .RG16Uint; return .RG16Uint; 
	    case .RG16Sint; return .RG16Sint; 
	    case .RG16Float; return .RG16Float; 
	    case .RGBA8Unorm; return .RGBA8Unorm; 
	    case .RGBA8Unorm_sRGB; return .RGBA8Unorm_sRGB; 
	    case .RGBA8Snorm; return .RGBA8Snorm; 
	    case .RGBA8Uint; return .RGBA8Uint; 
	    case .RGBA8Sint; return .RGBA8Sint; 
	    case .BGRA8Unorm; return .BGRA8Unorm; 
	    case .BGRA8Unorm_sRGB; return .BGRA8Unorm_sRGB; 
	    case .RGB10A2Unorm; return .RGB10A2Unorm; 
	    case .RGB10A2Uint; return .RGB10A2Uint; 
	    case .RG11B10Float; return .RG11B10Float; 
	    case .RGB9E5Float; return .RGB9E5Float; 
	    case .BGR10A2Unorm; return .BGR10A2Unorm; 
	    case .BGR10_XR; return .BGR10_XR; 
	    case .BGR10_XR_sRGB; return .BGR10_XR_sRGB; 
	    case .RG32Uint; return .RG32Uint; 
	    case .RG32Sint; return .RG32Sint; 
	    case .RG32Float; return .RG32Float; 
	    case .RGBA16Unorm; return .RGBA16Unorm; 
	    case .RGBA16Snorm; return .RGBA16Snorm; 
	    case .RGBA16Uint; return .RGBA16Uint; 
	    case .RGBA16Sint; return .RGBA16Sint; 
	    case .RGBA16Float; return .RGBA16Float; 
	    case .BGRA10_XR; return .BGRA10_XR; 
	    case .BGRA10_XR_sRGB; return .BGRA10_XR_sRGB; 
	    case .RGBA32Uint; return .RGBA32Uint; 
	    case .RGBA32Sint; return .RGBA32Sint; 
	    case .RGBA32Float; return .RGBA32Float; 
	    case .BC1_RGBA; return .BC1_RGBA; 
	    case .BC1_RGBA_sRGB; return .BC1_RGBA_sRGB; 
	    case .BC2_RGBA; return .BC2_RGBA; 
	    case .BC2_RGBA_sRGB; return .BC2_RGBA_sRGB; 
	    case .BC3_RGBA; return .BC3_RGBA; 
	    case .BC3_RGBA_sRGB; return .BC3_RGBA_sRGB; 
	    case .BC4_RUnorm; return .BC4_RUnorm; 
	    case .BC4_RSnorm; return .BC4_RSnorm; 
	    case .BC5_RGUnorm; return .BC5_RGUnorm; 
	    case .BC5_RGSnorm; return .BC5_RGSnorm; 
	    case .BC6H_RGBFloat; return .BC6H_RGBFloat; 
	    case .BC6H_RGBUfloat; return .BC6H_RGBUfloat; 
	    case .BC7_RGBAUnorm; return .BC7_RGBAUnorm; 
	    case .BC7_RGBAUnorm_sRGB; return .BC7_RGBAUnorm_sRGB; 
	    case .PVRTC_RGB_2BPP; return .PVRTC_RGB_2BPP; 
	    case .PVRTC_RGB_2BPP_sRGB; return .PVRTC_RGB_2BPP_sRGB; 
	    case .PVRTC_RGB_4BPP; return .PVRTC_RGB_4BPP; 
	    case .PVRTC_RGB_4BPP_sRGB; return .PVRTC_RGB_4BPP_sRGB; 
	    case .PVRTC_RGBA_2BPP; return .PVRTC_RGBA_2BPP; 
	    case .PVRTC_RGBA_2BPP_sRGB; return .PVRTC_RGBA_2BPP_sRGB; 
	    case .PVRTC_RGBA_4BPP; return .PVRTC_RGBA_4BPP; 
	    case .PVRTC_RGBA_4BPP_sRGB; return .PVRTC_RGBA_4BPP_sRGB; 
	    case .EAC_R11Unorm; return .EAC_R11Unorm; 
	    case .EAC_R11Snorm; return .EAC_R11Snorm; 
	    case .EAC_RG11Unorm; return .EAC_RG11Unorm; 
	    case .EAC_RG11Snorm; return .EAC_RG11Snorm; 
	    case .EAC_RGBA8; return .EAC_RGBA8; 
	    case .EAC_RGBA8_sRGB; return .EAC_RGBA8_sRGB; 
	    case .ETC2_RGB8; return .ETC2_RGB8; 
	    case .ETC2_RGB8_sRGB; return .ETC2_RGB8_sRGB; 
	    case .ETC2_RGB8A1; return .ETC2_RGB8A1; 
	    case .ETC2_RGB8A1_sRGB; return .ETC2_RGB8A1_sRGB; 
	    case .ASTC_4x4_sRGB; return .ASTC_4x4_sRGB; 
	    case .ASTC_5x4_sRGB; return .ASTC_5x4_sRGB; 
	    case .ASTC_5x5_sRGB; return .ASTC_5x5_sRGB; 
	    case .ASTC_6x5_sRGB; return .ASTC_6x5_sRGB; 
	    case .ASTC_6x6_sRGB; return .ASTC_6x6_sRGB; 
	    case .ASTC_8x5_sRGB; return .ASTC_8x5_sRGB; 
	    case .ASTC_8x6_sRGB; return .ASTC_8x6_sRGB; 
	    case .ASTC_8x8_sRGB; return .ASTC_8x8_sRGB; 
	    case .ASTC_10x5_sRGB; return .ASTC_10x5_sRGB; 
	    case .ASTC_10x6_sRGB; return .ASTC_10x6_sRGB; 
	    case .ASTC_10x8_sRGB; return .ASTC_10x8_sRGB; 
	    case .ASTC_10x10_sRGB; return .ASTC_10x10_sRGB; 
	    case .ASTC_12x10_sRGB; return .ASTC_12x10_sRGB; 
	    case .ASTC_12x12_sRGB; return .ASTC_12x12_sRGB; 
	    case .ASTC_4x4_LDR; return .ASTC_4x4_LDR; 
	    case .ASTC_5x4_LDR; return .ASTC_5x4_LDR; 
	    case .ASTC_5x5_LDR; return .ASTC_5x5_LDR; 
	    case .ASTC_6x5_LDR; return .ASTC_6x5_LDR; 
	    case .ASTC_6x6_LDR; return .ASTC_6x6_LDR; 
	    case .ASTC_8x5_LDR; return .ASTC_8x5_LDR; 
	    case .ASTC_8x6_LDR; return .ASTC_8x6_LDR; 
	    case .ASTC_8x8_LDR; return .ASTC_8x8_LDR; 
	    case .ASTC_10x5_LDR; return .ASTC_10x5_LDR; 
	    case .ASTC_10x6_LDR; return .ASTC_10x6_LDR; 
	    case .ASTC_10x8_LDR; return .ASTC_10x8_LDR; 
	    case .ASTC_10x10_LDR; return .ASTC_10x10_LDR; 
	    case .ASTC_12x10_LDR; return .ASTC_12x10_LDR; 
	    case .ASTC_12x12_LDR; return .ASTC_12x12_LDR; 
	    case .ASTC_4x4_HDR; return .ASTC_4x4_HDR; 
	    case .ASTC_5x4_HDR; return .ASTC_5x4_HDR; 
	    case .ASTC_5x5_HDR; return .ASTC_5x5_HDR; 
	    case .ASTC_6x5_HDR; return .ASTC_6x5_HDR; 
	    case .ASTC_6x6_HDR; return .ASTC_6x6_HDR; 
	    case .ASTC_8x5_HDR; return .ASTC_8x5_HDR; 
	    case .ASTC_8x6_HDR; return .ASTC_8x6_HDR; 
	    case .ASTC_8x8_HDR; return .ASTC_8x8_HDR; 
	    case .ASTC_10x5_HDR; return .ASTC_10x5_HDR; 
	    case .ASTC_10x6_HDR; return .ASTC_10x6_HDR; 
	    case .ASTC_10x8_HDR; return .ASTC_10x8_HDR; 
	    case .ASTC_10x10_HDR; return .ASTC_10x10_HDR; 
	    case .ASTC_12x10_HDR; return .ASTC_12x10_HDR; 
	    case .ASTC_12x12_HDR; return .ASTC_12x12_HDR; 
	    case .GBGR422; return .GBGR422; 
	    case .BGRG422; return .BGRG422; 
	    case .Depth16Unorm; return .Depth16Unorm; 
	    case .Depth32Float; return .Depth32Float; 
	    case .Stencil8; return .Stencil8; 
	    case .Depth24Unorm_Stencil8; return .Depth24Unorm_Stencil8; 
	    case .Depth32Float_Stencil8; return .Depth32Float_Stencil8; 
	    case .X32_Stencil8; return .X32_Stencil8; 
	    case .X24_Stencil8; return .X24_Stencil8; 
	    case .Unspecificied; return .Unspecialized; 
    }
}

// NOTE: This could just be a straight cast, but I don't 
convert_write_mask :: (write_mask: WriteMask) -> MTLColorWriteMask {
    mtl_write_mask : MTLColorWriteMask;

    if write_mask.R  mtl_write_mask |= .Red;
    if write_mask.G  mtl_write_mask |= .Green;
    if write_mask.B  mtl_write_mask |= .Blue;
    if write_mask.A  mtl_write_mask |= .Alpha;

    return mtl_write_mask;
}

get_command_buffer :: () -> CommandBuffer {
    init_cb: CommandBuffer;
    timeline_value := value_semaphore(timeline_semaphore);

    // NOTE: command_buffer_pool is a fixed size array so this is fine
    for * command_buffer_pool { 
        if !it.buffer && !init_cb {
            init_cb = it;
        }

        if it.buffer && it.frame_used <= timeline_value {
            reset(it.allocator);
            // TODO: we could probably do some resetting of the argument tables
            // to ensure that draw calls are actually binding the values they should
            return it;
        }
    }

    assert(init_cb != null, "All command buffers are in use!");
    
    init_cb.* = .{
        buffer = newCommandBuffer(the_device),
        allocator = newCommandAllocator(the_device),
        vertex_argument_table = create_argument_table(render_arg_table_descriptor),
        pixel_argument_table = create_argument_table(render_arg_table_descriptor), // same for vertex and pixel stages right now
        compute_argument_table = create_argument_table(compute_arg_table_descriptor),
    };

    assert(init_cb.buffer != null, "failed to assign properly");

    return init_cb;
}

create_argument_table :: (descriptor: *MTL4ArgumentTableDescriptor) -> *MTL4ArgumentTable {
    // TODO: it'd be nice it MTL.jai just generated an overload for procedures that took 
    // an **NSError to do this, instead of having to follow this pattern everywhere
    error: *NSError;
    argument_table := newArgumentTable(the_device, descriptor, *error);
    if !argument_table  log_error("Problem creating argument table %", error);
    assert(argument_table != null);
    return argument_table;
}

// TODO: It'd be nice if MTL.jai just overloaded a function that took dispatch_data_t
// with a version that took an array and followed the pattern below
/* NOTE: from <dispatch/dispatch.h>
dispatch_data_t
dispatch_data_create(const void *buffer,
	size_t size,
	dispatch_queue_t _Nullable queue,
	dispatch_block_t _Nullable destructor);*/
dispatch_data_create :: (buffer: *void, size: u64, queue: dispatch_queue_t, block: dispatch_block_t) -> dispatch_data_t #foreign libSystem;

make_metal_lib :: (slang_ir: []u8) -> *MTLLibrary {
    compiled, metal_lib_data := compile_slang_ir_to_platform(slang_ir, debug_symbols = true);
    assert(compiled, "Failed to compile shader");
    dispatch_data := dispatch_data_create(metal_lib_data.data, xx metal_lib_data.count, null, null);

    error : *NSError;
    metal_lib := newLibrary(the_device, dispatch_data, *error);
    if !metal_lib log_error("Problem creating metal_lib: %\n", error);
    assert(metal_lib != null);

    return metal_lib;
}

make_metal_function :: (slang_ir: []u8) -> *MTLFunction {
    metal_lib := make_metal_lib(slang_ir);
    apple_string := NSString.getTempString("main_0");
    fn := newFunction(metal_lib, apple_string);
    metal_fn := cast(*MTLFunction, fn);

    // to fail
    assert(metal_fn != null, "METAL FN IS NULL");

    return metal_fn;
}

make_metal4_function_descriptor :: (slang_ir: []u8) -> *MTL4LibraryFunctionDescriptor {
    metal_lib := make_metal_lib(slang_ir);

    fn := objc_new(MTL4LibraryFunctionDescriptor);

    setLibrary(fn, metal_lib);
    
    setName(fn, NSString.initWithString(objc_alloc(NSString), "main_0")); // TODO: does this autorelease?

    return fn;
}

Heap :: struct {
    mtl_heap : *MTLHeap;
    starting_address : u64;
    align_offset : u64;
    size : u64;
    allocations : Table(u64, u64); // a table of gpu addresses and sizes
}



the_swapchain : *CAMetalLayer;
the_device : *MTLDevice;
arc_pool: *NSAutoreleasePool;
allocations: Table(*void, *MTLBuffer);
command_buffer_pool  : [COMMAND_BUFFER_POOL_SIZE]CommandBuffer_;
frame_counter : u64;
timeline_semaphore : Semaphore; 

COMMAND_BUFFER_POOL_SIZE :: 100;


/* WARNING: resizes of these arrays for some reason trash memory elsewhere.
    It's likely a compiler bug, so not something we can fix ourselves. */
vertex_argument_tables: [..]*MTL4ArgumentTable;
pixel_argument_tables: [..]*MTL4ArgumentTable;
compute_argument_tables: [..]*MTL4ArgumentTable;
the_compiler: *MTL4Compiler;


// NOTE: This is a placeholder implementation that we're using to test. 
// eventually we'll actually need a map of lists, with a wasm-app's id correlating to
// all the resources used by that app. If we can keep them as a single heap per process
// that'd actually be ideal. BUT it just depends. We don't apps crashing due to lack of
// memory, especially if they have no realistic way of knowing how much memory they have
// or limiting how much they use to a set paramenter unless we set minimum specs (we should
// set minimum specs)
// TODO: move to multi-heap set up for multitenancy on a single graphics runtime
the_heap : *MTLHeap; // TODO: make it so that there's a list of these 
the_residency_set : *MTLResidencySet; // TODO: make it so that there's a list of these

compute_arg_table_descriptor: *MTL4ArgumentTableDescriptor;
render_arg_table_descriptor: *MTL4ArgumentTableDescriptor;

log_error :: (format_string: string, error: *NSError) {
    ns_string := NSError.localizedDescription(error);
    c_string := NSString.UTF8String(ns_string);
    error_string := to_string(c_string);
    log_error(format_string, error_string);
}

// TODO: right not these are for both raster and meshlets. We MAY want to split these
// apart depending on how the raster vs meshlet descriptor thing works out and 
// whether we actually need to do a pipeline switch for them, since they both use the 
// same kind of encoder on mac
draw_call_assertions :: #string END
    assert(command_buffer.active_encoder != null, "active encoder is null on draw call!");
    assert(command_buffer.active_pipeline != null, "active pipeline is null on draw call!");
    assert(command_buffer.active_pipeline.kind == .Graphics || command_buffer.active_pipeline.kind == .GraphicsMeshlet, "active pipeline kind is not graphics or graphics_meshlet!");
    assert(command_buffer.active_encoder_kind == .Render);
END

#import "shader_compiler";

#import "Objective_C";
#import "Objective_C/AppKit";
#import "Objective_C/LightweightRenderingView";
#import "MTL"(#exists(MTL_GENERATE));
#import "Hash_Table";
#import "macos";
#import "Basic";

libSystem :: #library,system "libSystem";
dispatch_block_t :: *NSObject;
