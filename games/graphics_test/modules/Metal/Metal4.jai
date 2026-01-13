// METAL4 Implementation begins here (except where other things need to be modified

#scope_export

MTL4CommandQueue :: struct {
    METHOD(*MTL4CommandQueue, "commit_count", #type (commandBuffers: *MTL4CommandBuffer, count: NSUInteger) -> ());
}
MTL4CommandBuffer :: struct {}
MTL4RenderCommandEncoder :: struct {}
MTL4ComputeCommandEncoder :: struct {}

#scope_module


#load "macros.jai";
#load "selectors.jai";
