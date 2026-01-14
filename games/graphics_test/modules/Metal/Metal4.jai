// METAL4 Implementation begins here (except where other things need to be modified

#scope_export

MTL4CommandQueue :: struct {}
#insert #run METHOD(*MTL4CommandQueue, "commit:count:", #type (commandBuffers: **MTL4CommandBuffer, count: NSUInteger) -> ());
#insert #run METHOD(*MTL4CommandQueue, "signalDrawable:", #type (drawable: *CAMetalDrawable) -> ());
#insert #run METHOD(*MTL4CommandQueue, "waitForDrawable:", #type (drawable: *CAMetalDrawable) -> ());

MTL4CommandBuffer :: struct {}
#insert #run METHOD(*MTL4CommandBuffer, "renderCommandEncoderWithDescriptor:", #type (descriptor: *MTL4RenderPassDescriptor) -> *MTL4RenderCommandEncoder);
#insert #run METHOD(*MTL4CommandBuffer, "renderCommandEncoderWithDescriptor:options:", #type (descriptor: *MTL4RenderPassDescriptor, options: MTL4RenderEncoderOptions) -> *MTL4RenderCommandEncoder);
#insert #run METHOD(*MTL4CommandBuffer, "beginCommandBufferWithAllocator:", #type (allocator: *MTL4CommandAllocator) -> ());

MTL4CommandAllocator :: struct {}
#insert #run METHOD(*MTL4CommandAllocator , "reset", #type () -> ());

MTL4RenderEncoderOptions :: enum NSUInteger {
    RenderEncoderOptionNone :: 0;
    RenderEncoderOptionSuspending :: 1;
    RenderEncoderOptionResuming :: 1 << 1;
}

MTL4CommandEncoder :: struct {}
#insert #run METHOD(*MTL4CommandEncoder, "endEncoding", #type () -> ());

MTL4RenderCommandEncoder :: struct { 
    using #as base: MTL4CommandEncoder;
}
#insert #run METHOD(*MTL4RenderCommandEncoder, "setRenderPipelineState:", #type (pipelineState: *MTLRenderPipelineState) -> ());
#insert #run METHOD(*MTL4RenderCommandEncoder, "setCullMode:", #type (cullMode: MTLCullMode) -> ());

MTL4ComputeCommandEncoder :: struct {
    using #as base: MTL4CommandEncoder;
}


MTL4RenderPassDescriptor :: struct {}
#insert #run METHOD(*MTL4RenderPassDescriptor, "colorAttachments", #type () -> *MTLRenderPassColorAttachmentDescriptorArray);


#scope_module


#load "macros.jai";
#load "selectors.jai";
