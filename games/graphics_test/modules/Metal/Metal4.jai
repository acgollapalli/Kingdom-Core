// METAL4 Implementation begins here (except where other things need to be modified

#scope_export

MTL4CommandQueue :: struct {
    commit :: #insert #run METHOD("commit:count", #type (commandBuffers: *MTL4CommandBuffer, count: NSUInteger) -> ());
}
MTL4CommandBuffer :: struct {
    renderCommandEncoderWithDescriptor :: #insert #run METHOD("renderCommandEncoderWithDescriptor:", #type(descriptor: *MTL4RenderPassDescriptor) -> *MTL4RenderCommandEncoder);
    renderCommandEncoderWithDescriptor :: #insert #run METHOD("renderCommandEncoderWithDescriptor:options:", #type(descriptor: *MTL4RenderPassDescriptor, options: MTL4RenderEncoderOptions) -> *MTL4RenderCommandEncoder);
}

MTL4RenderEncoderOptions :: enum NSUInteger {
    RenderEncoderOptionNone :: 0;
    RenderEncoderOptionSuspending :: 1;
    RenderEncoderOptionResuming :: 1 << 1;
}

MTL4RenderCommandEncoder :: struct {}
MTL4ComputeCommandEncoder :: struct {}

MTLRenderPassColorAttachmentDescriptorArray :: struct {
    
}

MTL4RenderPassDescriptor :: struct {
    colorAttachments :: #insert #run METHOD("colorAttachments", #type () -> *MTLRenderPassColorAttachmentDescriptorArray);

}

#scope_module


#load "macros.jai";
#load "selectors.jai";
