/* Macos platform layer 

    sort of inspired by the No Graphics API post by Sebastian Aaltonen:
    https://www.sebastianaaltonen.com/blog/no-graphics-api

    this is also a really helpful reference:
    https://developer.apple.com/documentation/metal/managing-your-game-window-for-metal-in-macos?language=objc
*/

#scope_export

init :: () {
    init_metal();

    // set content view 
    {
        view := objc_init(objc_alloc(NSView));
        NSView.setWantsLayer(view, YES);
        autorelease(view);

        the_swapchain = objc_init(objc_alloc(CAMetalLayer));
        device = xx MTLCreateSystemDefaultDevice();
        CAMetalLayer.setDevice(the_swapchain, device);
        // CAMetalLayer.setOpaque(the_swapchain, true); // @TODO: Update the Objective_C Module so that CALayer has the opaque property

        CAMetalLayer.setDrawableSize(the_swapchain, { 1280, 720 }); // @TODO: Use convertSizeToBacking instead
        CAMetalLayer.setFramebufferOnly(the_swapchain, xx true);
        // @TODO: set pixel format here

        LightweightMetalView.setLayer(view, xx the_swapchain);
        assert(LightweightMetalView.layer(view) == xx the_swapchain);

        NSWindow.setContentView(the_window, view);
        NSWindow.makeFirstResponder(the_window, view);

    }
}

begin_render_pass :: (command_buffer: CommandBuffer, render_pass_descriptor: RenderPassDescriptor) -> RenderPass {

    //if arc_pool != null  NSAutoreleasePool.drain(arc_pool); // release the last autorelease pool
    //arc_pool = objc_init(objc_alloc(NSAutoreleasePool)); // create the new autorelease pool

    render_pass := MTLRenderPassDescriptor.renderPassDescriptor();

    // set color targets
    for render_pass_descriptor.color_attachments {
        color_attachment := MTLRenderPassColorAttachmentDescriptorArray.objectAtIndexedSubscript(MTLRenderPassDescriptor.colorAttachments(render_pass), xx it_index);
        MTLRenderPassAttachmentDescriptor.setTexture(color_attachment, xx it.texture);
        MTLRenderPassAttachmentDescriptor.setLoadAction(color_attachment, it.load_op.(MTLLoadAction));
        MTLRenderPassAttachmentDescriptor.setStoreAction(color_attachment, it.store_op.(MTLStoreAction));
        MTLRenderPassColorAttachmentDescriptor.setClearColor(color_attachment, convert_clear_color(it.clear_color));
    }

    // @TODO: set depth and stencil targets here

    active_encoder = xx MTLCommandBuffer.renderCommandEncoderWithDescriptor(command_buffer, render_pass);


    active_encoder_kind = .Render;
    return render_pass;
}

end_render_pass :: (command_buffer: CommandBuffer) {
    assert(active_encoder_kind == .Render); // @TODO: need to ensure this becomes a wasm_runtime_assert in wasm
    MTLRenderCommandEncoder.endEncoding(xx active_encoder);
   active_encoder = null;
    active_encoder_kind = .None;
}

get_command_queue :: () -> CommandQueue {
    return MTLDevice.newCommandQueue(device);
}

get_command_buffer :: (command_queue: CommandQueue) -> CommandBuffer {
    return MTLCommandQueue.commandBuffer(command_queue);
}

// We don't really need the command_queue here, though we will for metal 4.
// Unfortunately, the metal bindings that currently ship with jai's compiler don't
// support it just yet, so we'll either have to build our own and submit them, or
// else just wait until Jon or Raphael update them.
// Also, the No Api example has submit_command_buffers this way, so we'll go ahead
// and follow Aaltonen's example for now.
submit_command_buffers :: (command_queue: CommandQueue, command_buffers: .. CommandBuffer) {
    for command_buffers  MTLCommandBuffer.commit(it);
}

get_next_swapchain_image :: () -> *CAMetalDrawable {
    return CAMetalLayer.nextDrawable(the_swapchain);
}

get_swapchain_texture :: (swapchain_image: *CAMetalDrawable) -> *MTLTexture {
    return xx CAMetalDrawable.texture(swapchain_image);
}

present_swapchain_image :: (command_buffer: *MTLCommandBuffer, swapchain_image: *CAMetalDrawable) {
    MTLCommandBuffer.presentDrawable(command_buffer, xx swapchain_image);
}

// the actual Aaltonen api has allocation go like this: 
// void* gpuMalloc(size_t bytes, MEMORY memory = MEMORY_DEFAULT);
// void* gpuMalloc(size_t bytes, size_t align, MEMORY memory = MEMORY_DEFAULT);
// but host to device pointer seems a bit silly and returning the struct just seems better
// this may change when we have to do the vulkan implementation.
// TODO: enforce 16 byte alignment here
gpu_alloc :: (size: int, memory: Memory) -> Allocation {
    resource_options := ifx memory == .GPU then MTLResourceStorageModePrivate else MTLResourceStorageModeShared;

    buffer := MTLDevice.newBufferWithLength_options(device, xx size, resource_options);
    contents := ifx memory != .GPU MTLBuffer.contents(buffer) else null;
    gpuAddress := MTLBuffer.gpuAddress(buffer);

    table_add(*allocations, gpuAddress, buffer);

    return { cpu = contents, gpu = gpuAddress };
}

gpu_alloc :: (size: int, align: int, memory: Memory) -> Allocation {
    assert(false, "alloc alignment overload not implemented yet!");
    return {};
}

gpu_free :: (address: *void) {
    found_id, mtl_buffer_id := table_find(*allocations, address);
    assert(found_id, "Attempted to double-free gpu memory at %!\n", address);

    release(mtl_buffer_id);
    table_remove(*allocations, address);
}

create_graphics_pipeline :: (vertex_shader: Shader, pixel_shader: Shader, raster_descriptor: RasterDescriptor) -> Pipeline {
    descriptor := objc_new(MTLRenderPipelineDescriptor);
    defer release(descriptor);

    MTLRenderPipelineDescriptor.setVertexFunction(descriptor, xx vertex_shader);
    MTLRenderPipelineDescriptor.setFragmentFunction(descriptor, xx pixel_shader);

    // Not sure this is necessary. Seems like draw primitives should handle it.
    topology := convert_primitive_topology(raster_descriptor.topology); 
    
    MTLRenderPipelineDescriptor.setInputPrimitiveTopology(descriptor, topology);
    // NOTE: Topology in the way that Aaltonen has it is set on the draw command, I think
    // the topology setting on the pipeline is for layered rendering. 
    // I'm honestly not even sure that this matters...

    // cull is set on the encoder
    
    MTLRenderPipelineDescriptor.setAlphaToCoverageEnabled(descriptor, xx raster_descriptor.alpha_to_coverage);

    // I don't think the dual source blending option can be set on metal
    // At best we can update the Factors

    MTLRenderPipelineDescriptor.setRasterSampleCount(descriptor, raster_descriptor.sample_count);

    MTLRenderPipelineDescriptor.setDepthAttachmentPixelFormat(descriptor, xx raster_descriptor.depth_format);
    MTLRenderPipelineDescriptor.setStencilAttachmentPixelFormat(descriptor, xx raster_descriptor.stencil_format);
    
    for raster_descriptor.color_targets {
        color_attachment := MTLRenderPipelineColorAttachmentDescriptorArray.objectAtIndexedSubscript(MTLRenderPipelineDescriptor.colorAttachments(descriptor), xx it_index);
        MTLRenderPipelineColorAttachmentDescriptor.setPixelFormat(color_attachment, xx it.format);
        MTLRenderPipelineColorAttachmentDescriptor.setWriteMask(color_attachment, xx it.write_mask); // TODO: Set up the write mask in graphics.jai

        // setting up the blend state
        // apparently, you can also set this later, separately, but we won't worry about that 
        // for now (and I'm not sure metal can do it yet)
        if raster_descriptor.blend_descriptor != null {
            blend := raster_descriptor.blend_descriptor;
            MTLRenderPipelineColorAttachmentDescriptor.setBlendingEnabled(color_attachment, xx true);

            MTLRenderPipelineColorAttachmentDescriptor.setRgbBlendOperation(color_attachment, xx blend.color_op);
            MTLRenderPipelineColorAttachmentDescriptor.setSourceRGBBlendFactor(color_attachment, xx blend.src_color_factor);
            MTLRenderPipelineColorAttachmentDescriptor.setDestinationRGBBlendFactor(color_attachment, xx blend.dst_color_factor);
            MTLRenderPipelineColorAttachmentDescriptor.setSourceRGBBlendFactor(color_attachment, xx blend.src_color_factor);
            MTLRenderPipelineColorAttachmentDescriptor.setDestinationRGBBlendFactor(color_attachment, xx blend.dst_color_factor);

            MTLRenderPipelineColorAttachmentDescriptor.setAlphaBlendOperation(color_attachment, xx blend.alpha_op);
            MTLRenderPipelineColorAttachmentDescriptor.setSourceAlphaBlendFactor(color_attachment, xx blend.src_alpha_factor);
            MTLRenderPipelineColorAttachmentDescriptor.setDestinationAlphaBlendFactor(color_attachment, xx blend.dst_alpha_factor);
            MTLRenderPipelineColorAttachmentDescriptor.setSourceAlphaBlendFactor(color_attachment, xx blend.src_alpha_factor);
            MTLRenderPipelineColorAttachmentDescriptor.setDestinationAlphaBlendFactor(color_attachment, xx blend.dst_alpha_factor);
        }
    }

    pipeline_state := MTLDevice.newRenderPipelineStateWithDescriptor_error(device, descriptor, null); // TODO: figure out a good way to report these errors

    return { graphics = { raster_descriptor, pipeline_state } };
}

free_pipeline_state :: (pipeline: *Pipeline) {
    if pipeline.kind == .Graphics || pipeline.kind == .GraphicsMeshlet {
        release(pipeline.graphics.pipeline);
        pipeline.graphics.pipeline = null;
    }
}

set_pipeline :: (command_buffer: CommandBuffer, pipeline: Pipeline) {
    if pipeline.kind == .Graphics || pipeline.kind == .GraphicsMeshlet {
        assert(active_encoder_kind == .Render);
        MTLRenderCommandEncoder.setRenderPipelineState(xx active_encoder, xx pipeline.graphics.pipeline);
        cull_mode := convert_cull(pipeline.graphics.descriptor.cull);
        MTLRenderCommandEncoder.setCullMode(xx active_encoder, cull_mode);
        active_pipeline = pipeline;
    }
}

create_depth_stencil_state :: (descriptor: DepthStencilDescriptor) -> DepthStencilState {
    back_stencil := objc_new(MTLStencilDescriptor);
    defer release(back_stencil);
    {
        using MTLStencilDescriptor;
        using descriptor.stencil_back;

        compare_fn := convert_op(test);
        stencil_fail_op := convert_stencil_op(fail_op);
        depth_fail_op_ := convert_stencil_op(depth_fail_op);
        both_pass_op := convert_stencil_op(pass_op);

        setStencilCompareFunction(back_stencil, compare_fn);
        setStencilFailureOperation(back_stencil, stencil_fail_op);
        setDepthFailureOperation(back_stencil, depth_fail_op_);
        setDepthStencilPassOperation(back_stencil, both_pass_op);
        setReadMask(back_stencil, descriptor.stencil_read_mask);
        setWriteMask(back_stencil, descriptor.stencil_write_mask);
        
    }

    front_stencil := objc_new(MTLStencilDescriptor);
    defer release(front_stencil);
    {
        using MTLStencilDescriptor;
        using descriptor.stencil_front;

        compare_fn := convert_op(test);
        stencil_fail_op := convert_stencil_op(fail_op);
        depth_fail_op_ := convert_stencil_op(depth_fail_op);
        both_pass_op := convert_stencil_op(pass_op);

        setStencilCompareFunction(front_stencil, compare_fn);
        setStencilFailureOperation(front_stencil, stencil_fail_op);
        setDepthFailureOperation(front_stencil, depth_fail_op_);
        setDepthStencilPassOperation(front_stencil, both_pass_op);
        setReadMask(front_stencil, descriptor.stencil_read_mask);
        setWriteMask(front_stencil, descriptor.stencil_write_mask);
        
    }

    
    mtl_descriptor := objc_new(MTLDepthStencilDescriptor);
    defer release(mtl_descriptor);
    { 
        using MTLDepthStencilDescriptor;

        setDepthCompareFunction(mtl_descriptor, convert_op(descriptor.depth_test));
        if descriptor.depth_mode & DepthFlags.Write  setDepthWriteEnabled(mtl_descriptor, xx true);
    }
        
    depth_stencil_state := MTLDevice.newDepthStencilStateWithDescriptor(device, mtl_descriptor);
    
    return { descriptor, xx depth_stencil_state };
}

free_depth_stencil_state :: (depth_stencil_state: *DepthStencilState) {
    release(depth_stencil_state.state);
    depth_stencil_state.state = null;
}

set_depth_stencil_state :: (command_buffer: CommandBuffer, depth_stencil_state: DepthStencilState) {
    using MTLRenderCommandEncoder;
    setDepthStencilState(xx active_encoder, xx depth_stencil_state.state);
    setDepthBias_slopeScale_clamp(xx active_encoder, depth_stencil_state.descriptor.depth_bias, depth_stencil_state.descriptor.depth_bias_slope_factor, depth_stencil_state.descriptor.depth_bias_clamp);
    //setStencilFrontReferenceValue(xx active_encoder, depth_stencil_state.descriptor.front.reference);
    //setStencilBackReferenceValue(xx active_encoder, depth_stencil_state.descriptor.back.reference);
    setStencilFrontReferenceValue_backReferenceValue(xx active_encoder, depth_stencil_state.descriptor.stencil_front.reference, depth_stencil_state.descriptor.stencil_back.reference);
}

draw_indexed :: (command_buffer: CommandBuffer, vertex_data: *void, pixel_data: *void, indices: *void, index_count: int){
    assert(active_pipeline.kind == .Graphics || active_pipeline.kind == .GraphicsMeshlet);
    primitive_type := convert_topology_to_primitive(active_pipeline.graphics.descriptor.topology);
    // TODO: write MTL4 command encoder implementation and MTL4 Command Buffer Implementation
    // so you can actually write a damned draw call
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
        case .CCW;      return MTLCullModeFront;
        case .CW;       return MTLCullModeBack;
        case .All;      return MTLCullModeNone; // I have no idea what cull all is supposed to do
        case .None;     return MTLCullModeNone;
        case; assert(false); return MTLCullModeNone;
    };
}

convert_topology_to_primitive :: (topology: Topology) -> MTLPrimitiveType {
    if topology == {
        case .None;             assert(false); return MTLPrimitiveTypeTriangle;
        case .Triangle;         return MTLPrimitiveTypeTriangle;
        case .Line;             return MTLPrimitiveTypeLine;
        case .Point;            return MTLPrimitiveTypePoint;
        case .Triangle_Strip;   return MTLPrimitiveTypeTriangleStrip;
        case; assert(false); return MTLPrimitiveTypeTriangle;
    };
}
convert_primitive_topology :: (topology: Topology) -> MTLPrimitiveTopologyClass {
if topology == {
        case .None;             return MTLPrimitiveTopologyClassUnspecified;
        case .Point;            return MTLPrimitiveTopologyClassPoint;
        case .Line;             return MTLPrimitiveTopologyClassLine;
        case .Triangle;         return MTLPrimitiveTopologyClassTriangle;
        case .Triangle_Strip;   return MTLPrimitiveTopologyClassTriangle;
        case; return MTLPrimitiveTopologyClassUnspecified;
    }
}


the_swapchain : *CAMetalLayer;
device : *MTLDevice;
arc_pool: *NSAutoreleasePool;
active_encoder: *MTLCommandEncoder;
active_encoder_kind: Encoder_Kind;
active_pipeline: Pipeline;
allocations: Table(*void, *MTLBuffer);

#import "Objective_C";
#import "Objective_C/AppKit";
#import "Objective_C/LightweightRenderingView";
#import "Metal";
#import "Hash_Table";
