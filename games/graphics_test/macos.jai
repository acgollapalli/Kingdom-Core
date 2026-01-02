/* Macos platform layer 

    sort of inspired by the No Graphics API post by Sebastian Aaltonen:
    https://www.sebastianaaltonen.com/blog/no-graphics-api
*/

#import "Objective_C";
#import "Objective_C/AppKit";
#import "Objective_C/LightweightRenderingView";
#import "Metal";

#scope_export

gpu_init :: () {
    init_metal();

    // set content view 
    {
        view := objc_init(objc_alloc(NSView));
        NSView.setWantsLayer(view, YES);
        //NSView.setWantsBestResolutionOpenGLSurface(view, YES);
        autorelease(view);

        the_swapchain = objc_init(objc_alloc(CAMetalLayer));
        device = xx MTLCreateSystemDefaultDevice();
        CAMetalLayer.setDevice(the_swapchain, device);

        CAMetalLayer.setDrawableSize(the_swapchain, { 1280, 720 });
        CAMetalLayer.setFramebufferOnly(the_swapchain, xx true);
        print("pixelformat %\n", CAMetalLayer.pixelFormat);

        LightweightMetalView.setLayer(view, xx the_swapchain);
        assert(LightweightMetalView.layer(view) == xx the_swapchain);

        NSWindow.setContentView(the_window, view);
        NSWindow.makeFirstResponder(the_window, view);

        print("drawable_size: %\n", CAMetalLayer.drawableSize(the_swapchain));
    }
}

gpu_begin_render_pass :: (command_buffer: *MTLCommandBuffer, render_pass_descriptor: GPURenderPassDescriptor) -> *MTLRenderPassDescriptor {

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

gpu_end_render_pass :: (command_buffer: *MTLCommandBuffer) {
    assert(active_encoder_kind == .Render); // @TODO: need to ensure this becomes a wasm_runtime_assert in wasm
    MTLRenderCommandEncoder.endEncoding(xx active_encoder);
    active_encoder = null;
    active_encoder_kind = .None;
}

gpu_get_command_queue :: () -> *MTLCommandQueue {
    return MTLDevice.newCommandQueue(device);
}

gpu_get_command_buffer :: (command_queue: *MTLCommandQueue) -> *MTLCommandBuffer {
    return MTLCommandQueue.commandBuffer(command_queue);
}

// We don't really need the command_queue here, though we will for metal 4.
// Unfortunately, the metal bindings that currently ship with jai's compiler don't
// support it just yet, so we'll either have to build our own and submit them, or
// else just wait until Jon or Raphael update them.
// Also, the No Api example has gpu_submit_command_buffers this way, so we'll go ahead
// and follow Aaltonen's example for now.
gpu_submit_command_buffers :: (command_queue: *MTLCommandQueue, command_buffers: .. *MTLCommandBuffer) {
    for command_buffers  MTLCommandBuffer.commit(it);
}

gpu_get_next_swapchain_image :: () -> *CAMetalDrawable {
    return CAMetalLayer.nextDrawable(the_swapchain);
}

gpu_get_swapchain_texture :: (swapchain_image: *CAMetalDrawable) -> *MTLTexture {
    return xx CAMetalDrawable.texture(swapchain_image);
}

gpu_present_swapchain_image :: (command_buffer: *MTLCommandBuffer, swapchain_image: *CAMetalDrawable) {
    MTLCommandBuffer.presentDrawable(command_buffer, xx swapchain_image);
}


#load "graphics.jai";

#scope_module

Encoder_Kind :: enum {
    None;
    Render;
    Compute;
    Blit;
}

convert_clear_color :: (clear_color: GPUClearColor) -> MTLClearColor {
    return { 
        red = clear_color.red, 
        green = clear_color.green, 
        blue = clear_color.blue, 
        alpha = clear_color.alpha 
    };
}

the_swapchain : *CAMetalLayer;
device : *MTLDevice;
arc_pool: *NSAutoreleasePool;
active_encoder: *MTLCommandEncoder;
active_encoder_kind: Encoder_Kind;
active_pipeline: GPUPipeline;
