/* Macos platform layer for graphics

    sort of inspired by the No Graphics API post by Sebastian Aaltonen:
    https://www.sebastianaaltonen.com/blog/no-graphics-api

    this is also a really helpful reference:
    https://developer.apple.com/documentation/metal/managing-your-game-window-for-metal-in-macos?language=objc
*/

#scope_export


init :: () {
    init_mtl();

    arc_pool = objc_new(NSAutoreleasePool);

    // set content view 
    {
        view := objc_init(objc_alloc(NSView));
        NSView.setWantsLayer(view, YES);
        autorelease(view);

        the_swapchain = objc_init(objc_alloc(CAMetalLayer));
        the_device = xx MTLCreateSystemDefaultDevice();
        setDevice(the_swapchain, the_device);
        //CAMetalLayer.setOpaque(the_swapchain, true); // @TODO: Update the Objective_C Module so that CALayer has the opaque property

        setDrawableSize(the_swapchain, { WINDOW_WIDTH, WINDOW_HEIGHT }); // @TODO: Use convertSizeToBacking instead
        setFramebufferOnly(the_swapchain, xx true);
        setPixelFormat(the_swapchain, .MTLPixelFormatBGRA8Unorm_sRGB); // TODO: set up a standard way for users to know from the platform layer what pixel format the swapchain is in. (just saying it's always BGRA8Unorm_sRGB would prevent us from ever supporting HDR in the future)

        NSView.setLayer(view, xx the_swapchain);
        assert(NSView.layer(view) == xx the_swapchain);

        NSWindow.setContentView(the_window, view);
        NSWindow.makeFirstResponder(the_window, view);
    }

    // set up argument table descriptors
    {
        compute_arg_table_descriptor = objc_new(MTL4ArgumentTableDescriptor);
        setMaxBufferBindCount(render_arg_table_descriptor, 2);
        setSupportAttributeStrides(render_arg_table_descriptor, xx true);

        render_arg_table_descriptor = objc_new(MTL4ArgumentTableDescriptor);
        setMaxBufferBindCount(render_arg_table_descriptor, 2);
        setSupportAttributeStrides(render_arg_table_descriptor, xx true);
    }

    // add some command allocators
    /* HACK: For some reason, arrray resizes of the argument table arrays are trashing the memory of the pipeline
        state object in our test program. So we just allocate space for a bunch of them
        we shoule either:
            a) just set a max number of these and allocate them at start time (maybe with a module flag for the sizes or something)
            b) move to some kind of pool object where we're explicitly controlling allocations.

        TODO: find a minimal example that reproduces the problem and mail it in to Jon (if he hasn't already fixed it in the next
        compiler update
    */
    {
        expected_buffers_in_flight := 12;
        for 0..(expected_buffers_in_flight -1) array_add(*command_allocators, newCommandAllocator(the_device));
        array_reserve(*command_buffers, expected_buffers_in_flight);
        array_reserve(*vertex_argument_tables, expected_buffers_in_flight);
        array_reserve(*pixel_argument_tables, expected_buffers_in_flight);
        array_reserve(*compute_argument_tables, expected_buffers_in_flight);
    }

    // set up gpu memory heap
    #if #exists(USE_APPLE_HEAP_ALLOCATION) {
        descriptor := objc_new(MTLHeapDescriptor);
        autorelease(descriptor);

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
    {
        pipeline_data_set_serializer_descriptor := objc_new(MTL4PipelineDataSetSerializerDescriptor);
        setConfiguration(pipeline_data_set_serializer_descriptor, .CaptureBinaries | .CaptureDescriptors);
        autorelease(pipeline_data_set_serializer_descriptor);

        pipeline_data_set_serializer := newPipelineDataSetSerializer(the_device, pipeline_data_set_serializer_descriptor);

        compiler_descriptor := objc_new(MTL4CompilerDescriptor);
        setPipelineDataSetSerializer(compiler_descriptor, pipeline_data_set_serializer);
        autorelease(compiler_descriptor);

        error: *NSError;
        the_compiler = newCompiler(the_device, compiler_descriptor, *error);
        if !the_compiler log_error("Problem creating shader compiler: %", error);
        assert(the_compiler != null);
    }
}

begin_render_pass :: (command_buffer: CommandBuffer, render_pass_descriptor: RenderPassDescriptor) {

    render_pass := objc_new(MTL4RenderPassDescriptor);
    autorelease(render_pass);

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
        setTexture(attachment, xx texture_handle);

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
        using MTLRenderPassColorAttachmentDescriptor;

        color_attachment := object(colorAttachments(render_pass), xx it_index);
        //autorelease(color_attachment);

        configure_render_pass_attachment(color_attachment, it.texture, it.load_op, it.store_op);

        clear_color := convert_clear_color(it.clear_color);
        setClearColor(color_attachment, clear_color);
    }

    setDefaultRasterSampleCount(render_pass, 1);

    // set depth target
    {
        using MTLRenderPassDepthAttachmentDescriptor;
        depth_attachment := objc_new(MTLRenderPassDepthAttachmentDescriptor);
        autorelease(depth_attachment);
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
        using MTLRenderPassStencilAttachmentDescriptor;
        stencil_attachment := objc_new(MTLRenderPassStencilAttachmentDescriptor);
        autorelease(stencil_attachment);
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
        autorelease(command_buffer.active_encoder);
    }
    
    command_buffer.active_encoder = renderCommandEncoder(command_buffer.buffer, render_pass);

    command_buffer.active_encoder_kind = .Render;

    setArgumentTable(xx command_buffer.active_encoder, command_buffer.vertex_argument_table, .MTLRenderStageVertex);
    setArgumentTable(xx command_buffer.active_encoder, command_buffer.pixel_argument_table, .MTLRenderStageFragment);
}

end_render_pass :: (command_buffer: CommandBuffer) {
    assert(command_buffer.active_encoder_kind == .Render); // @TODO: need to ensure this becomes a wasm_runtime_assert in wasm
    endEncoding(command_buffer.active_encoder);
    autorelease(command_buffer.active_encoder); // TODO: We may be able to reuse these. But should we? It adds complexity
    command_buffer.active_encoder = null;
    command_buffer.active_encoder_kind = .None;
}

get_command_queue :: () -> CommandQueue {
    command_queue := newMTL4CommandQueue(the_device);
    addResidencySet(command_queue, the_residency_set);

    return command_queue;
}

start_command_recording :: (command_queue: CommandQueue) -> CommandBuffer {
    command_buffer := New(CommandBuffer_);
    command_buffer.buffer = newCommandBuffer(the_device);
    command_buffer.allocator = get_command_allocator_from_pool();
    command_buffer.vertex_argument_table = get_vertex_argument_table();
    command_buffer.pixel_argument_table = get_pixel_argument_table();
    command_buffer.compute_argument_table = get_compute_argument_table();

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

    // NOTE: we may get a performance boost by reusing the allocators
    // but we need to set up and manage fences for that first
    // actually everything here is reusable, and the only reason we aren't 
    // is to minimize initial bugs at the cost of performance
    // for command_buffers  return_command_allocator_to_pool(it.allocator);
    /* WARNING: resizes of these arrays for some reason trash memory elsewhere.
        It's likely a compiler bug, so not something we can fix ourselves.
    */
    for command_buffers {
        return_command_allocator_to_pool(it.allocator);
        return_command_buffer_to_pool(it.buffer);
        return_vertex_argument_table_to_pool(it.vertex_argument_table);
        return_pixel_argument_table_to_pool(it.pixel_argument_table);
        return_compute_argument_table_to_pool(it.compute_argument_table);
    }

    // xcode gives a bad memory access on this
    // apparently it's trying to release something that it can't or shouldn't
    // no clue what's happening here, but best thing is to just not use arc
    //NSAutoreleasePool.drain(arc_pool);
    //release(arc_pool);
    //arc_pool = objc_new(NSAutoreleasePool);
}

get_next_swapchain_image :: () -> *CAMetalDrawable {
    return nextDrawable(the_swapchain);
}

get_swapchain_texture :: (swapchain_image: *CAMetalDrawable) -> *MTLTexture {
    return texture(swapchain_image);
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
        autorelease(mtl_buffer_id);
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
    pipeline_descriptor := objc_new(MTL4RenderPipelineDescriptor);
    autorelease(pipeline_descriptor);

    pipeline_options := objc_new(MTL4PipelineOptions);
    #if #exists(DEBUG_PIPELINES) {
        setShaderReflection(pipeline_options, xx true);
        setShaderValidation(pipeline_options, xx true);
    }
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
        color_attachment_descriptor := objc_new(MTL4RenderPipelineColorAttachmentDescriptor);
        autorelease(color_attachment_descriptor); //TODO: once it works, uncomment this

        #assert(MTLPixelFormat.EAC_RGBA8_sRGB == cast(MTLPixelFormat, Format.EAC_RGBA8_sRGB));
        pixel_format := cast(MTLPixelFormat, it.format);
        setPixelFormat(color_attachment_descriptor, pixel_format);

        #assert(MTLColorWriteMask.Green == cast(MTLColorWriteMask, (0x04).(u8))); 
        write_mask := cast(MTLColorWriteMask, it.write_mask);
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
        setObject(color_attachments, color_attachment_descriptor, xx it_index);
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

        setRenderPipelineState(render_encoder, xx pipeline.graphics.pipeline);

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
    depth_stencil_state_ptr.* = { descriptor, xx depth_stencil_state };
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

#scope_module

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
    return xx blend;
}

convert_op :: (op: Op) -> MTLCompareFunction {
   return xx op; 
}

convert_stencil_op :: (op: Op) -> MTLStencilOperation {
    return xx op;
}

convert_cull :: (cull: Cull) -> MTLCullMode {
    if cull == {
        case .CCW;      return .Back;
        case .CW;       return .Front;
        case .All;      return .None; // I have no idea what cull all is supposed to do
        case .None;     return .None;
        case; assert(false); return .None;
    };
}

convert_topology_to_primitive :: (topology: Topology) -> MTLPrimitiveType {
    if topology == {
        case .None;             assert(false); return .Triangle;
        case .Triangle;         return .Triangle;
        case .Line;             return .Line;
        case .Point;            return .Point;
        case .Triangle_Strip;   return .TriangleStrip;
        case; assert(false); return .Triangle;
    };
}
convert_primitive_topology :: (topology: Topology) -> MTLPrimitiveTopologyClass {
if topology == {
        case .None;             return .Unspecified;
        case .Point;            return .Point;
        case .Line;             return .Line;
        case .Triangle;         return .Triangle;
        case .Triangle_Strip;   return .Triangle;
        case; return .Unspecified;
    }
}

/* OPTIMIZE: This is slow and NOT how you run a queue
    I should just make it a ringbuffer, but I don't know how many allocators I need */
get_command_allocator_from_pool :: () -> *MTL4CommandAllocator {
    allocator: *MTL4CommandAllocator;
    if command_allocators.count > 0 {
        allocator = command_allocators[0];
        array_ordered_remove_by_index(*command_allocators, 0);
        reset(allocator);
        //log("got allocator % from pool", allocator);
    } else {
        allocator = newCommandAllocator(the_device);
        //log("allocated new command allocator: %", allocator);
    }
    return allocator;
}

return_command_allocator_to_pool :: (allocator: *MTL4CommandAllocator) { 
    array_add(*command_allocators, allocator); 
    //log("returned command allocator % to pool. count is now: %", allocator, command_allocators.count);
}

get_command_buffer_from_pool :: () -> *MTL4CommandBuffer {
    buffer : *MTL4CommandBuffer;
    if command_buffers.count > 0 {
        last_index := command_buffers.count -1;
        buffer = command_buffers[last_index];
        array_ordered_remove_by_index(*command_buffers, last_index);
    } else {
        buffer = objc_new(MTL4CommandBuffer);
    }
    return buffer;
}

return_command_buffer_to_pool :: (command_buffer: *MTL4CommandBuffer) { array_add(*command_buffers, command_buffer); }

// TODO: I think we can bake the first argument 
get_argument_table_from_pool :: (pool : *[..]*MTL4ArgumentTable, descriptor: *MTL4ArgumentTableDescriptor) -> *MTL4ArgumentTable {
    error: *NSError;
    argument_table := newArgumentTable(the_device, descriptor, *error);
    if !argument_table  log_error("Problem creating argument table %", error);
    assert(argument_table != null);
    return argument_table;
}

return_to_pool :: (pool: *[..]$T, pool_member: T) {
    array_add(pool, pool_member);
}

get_vertex_argument_table :: () -> *MTL4ArgumentTable { return get_argument_table_from_pool(*vertex_argument_tables, render_arg_table_descriptor); }

// WARNING: for some reason this trashes the memory of the pipeline variable in main.jai
return_vertex_argument_table_to_pool :: (argument_table: *MTL4ArgumentTable) { 
    return_to_pool(*vertex_argument_tables, argument_table); 
}

get_pixel_argument_table :: () -> *MTL4ArgumentTable { return get_argument_table_from_pool(*pixel_argument_tables, render_arg_table_descriptor);}
return_pixel_argument_table_to_pool :: (argument_table: *MTL4ArgumentTable) { return_to_pool(*pixel_argument_tables, argument_table); }

get_compute_argument_table :: () -> *MTL4ArgumentTable { return get_argument_table_from_pool(*compute_argument_tables, compute_arg_table_descriptor); }
return_compute_argument_table_to_pool :: (argument_table: *MTL4ArgumentTable) { return_to_pool(*compute_argument_tables, argument_table); }

/* from <dispatch/dispatch.h>
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
command_allocators: [..]*MTL4CommandAllocator;
command_buffers: [..]*MTL4CommandBuffer;


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
#import "MTL";
#import "Hash_Table";
#import "macos";
#import "Basic";

libSystem :: #library,system "libSystem";
dispatch_block_t :: *NSObject;
