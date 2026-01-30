// METAL4 Implementation begins here (except where other things need to be modified)
// NOTE: You need to add the selectors in the selector struct in selectors.jai
// all you need to do is copy the string, and add it as a property, replacing the 
// colons with underscores.
// remember, the method/property names in the strings must be exactly as they are
// in apple's documentation

#scope_export

/* ========== Class Definitions ========== */

/* ===== Encoding Commands and Arguments ===== */
MTL4CommandQueue :: struct {}
#insert #run METHOD(*MTL4CommandQueue, "commit:count:", #type (commandBuffers: **MTL4CommandBuffer, count: NSUInteger) -> ());
#insert #run METHOD(*MTL4CommandQueue, "signalDrawable:", #type (drawable: *CAMetalDrawable) -> ());
#insert #run METHOD(*MTL4CommandQueue, "waitForDrawable:", #type (drawable: *CAMetalDrawable) -> ());
#insert #run METHOD(*MTL4CommandQueue, "addResidencySet:", #type (residencySet: *MTLResidencySet) -> ());

MTL4CommandBuffer :: struct {}
#insert #run METHOD(*MTL4CommandBuffer, "renderCommandEncoderWithDescriptor:", #type (descriptor: *MTL4RenderPassDescriptor) -> *MTL4RenderCommandEncoder);
#insert #run METHOD(*MTL4CommandBuffer, "renderCommandEncoderWithDescriptor:options:", #type (descriptor: *MTL4RenderPassDescriptor, options: MTL4RenderEncoderOptions) -> *MTL4RenderCommandEncoder);
#insert #run METHOD(*MTL4CommandBuffer, "beginCommandBufferWithAllocator:", #type (allocator: *MTL4CommandAllocator) -> ());
#insert #run METHOD(*MTL4CommandBuffer, "endCommandBuffer", #type () -> ());

MTL4CommandAllocator :: struct {}
#insert #run METHOD(*MTL4CommandAllocator , "reset", #type () -> ());


MTL4CommandEncoder :: struct {}
#insert #run METHOD(*MTL4CommandEncoder, "endEncoding", #type () -> ());

MTL4RenderCommandEncoder :: struct { 
    using #as base: MTL4CommandEncoder;
}
#insert #run METHOD(*MTL4RenderCommandEncoder, "setRenderPipelineState:", #type (pipelineState: *MTLRenderPipelineState) -> ());
#insert #run METHOD(*MTL4RenderCommandEncoder, "setCullMode:", #type (cullMode: MTLCullMode) -> ());
#insert #run METHOD(*MTL4RenderCommandEncoder, "setArgumentTable:atStages:", #type (argumentTable: *MTL4ArgumentTable, atStages: MTLRenderStages) -> ());
#insert #run METHOD(*MTL4RenderCommandEncoder, "drawIndexedPrimitives:indexCount:indexType:indexBuffer:indexBufferLength:", #type (primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger) -> ());
#insert #run METHOD(*MTL4RenderCommandEncoder, "setViewport:", #type (viewport: MTLViewport) -> ());
#insert #run METHOD(*MTL4RenderCommandEncoder, "setScissorRect:", #type (viewport: MTLScissorRect) -> ());
#insert #run METHOD(*MTL4RenderCommandEncoder, "drawPrimitives:vertexStart:vertexCount:", #type (primitive: MTLPrimitiveType, vertex_start: NSUInteger, vertex_end: NSUInteger) -> ());
#insert #run METHOD(*MTL4RenderCommandEncoder, "setDepthStencilState:", #type (depthStencilState: *MTLDepthStencilState) -> ());
#insert #run METHOD(*MTL4RenderCommandEncoder, "setDepthBias:slopeScale:clamp:", #type (depthBias: float, slopeScale: float, clamp: float) -> ());
#insert #run METHOD(*MTL4RenderCommandEncoder, "setStencilFrontReferenceValue:backReferenceValue:", #type (frontReferenceValue: u32, backReferenceValue: u32) -> ());
setStencilReferenceValues :: setStencilFrontReferenceValue; // the macro names it poorly (but it's really apple's fault for naming it poorly

MTL4ComputeCommandEncoder :: struct {
    using #as base: MTL4CommandEncoder;
}

MTL4ArgumentTableDescriptor :: struct{}
#insert #run PROP(*MTL4ArgumentTableDescriptor, "maxBufferBindCount", NSUInteger);
#insert #run PROP(*MTL4ArgumentTableDescriptor, "supportAttributeStrides", BOOL);

MTL4ArgumentTable :: struct{}
#insert #run METHOD(*MTL4ArgumentTable, "setAddress:atIndex:", #type (gpuAddress: MTLGPUAddress, atIndex: NSUInteger)-> ()); 
#insert #run METHOD(*MTL4ArgumentTable, "setAddress:attributeStride:atIndex:", #type (gpuAddress: MTLGPUAddress, attributeStride: NSUInteger, atIndex: NSUInteger)-> ());

/* ===== Pipeline State ===== */
MTL4PipelineOptions :: struct {}
#insert #run PROP(*MTL4PipelineOptions, "shaderReflection", MTL4ShaderReflection);
#insert #run PROP(*MTL4PipelineOptions, "shaderValidation", MTL4ShaderValidation);

MTL4RenderPipelineDescriptor :: struct {}
#insert #run PROP(*MTL4RenderPipelineDescriptor, "label", *NSString);
#insert #run PROP(*MTL4RenderPipelineDescriptor, "options", *MTL4PipelineOptions);
#insert #run PROP(*MTL4RenderPipelineDescriptor, "alphaToCoverageState", MTL4AlphaToCoverageState);
#insert #run PROP(*MTL4RenderPipelineDescriptor, "alphaToOneState", MTL4AlphaToOneState);
#insert #run PROP(*MTL4RenderPipelineDescriptor, "colorAttachmentMappingState", MTL4LogicalToPhysicalColorAttachmentMappingState);
#insert #run METHOD(*MTL4RenderPipelineDescriptor, "colorAttachments", #type () -> *MTL4RenderPipelineColorAttachmentDescriptorArray);
#insert #run PROP(*MTL4RenderPipelineDescriptor, "fragmentFunctionDescriptor", *MTL4FunctionDescriptor);
#insert #run PROP(*MTL4RenderPipelineDescriptor, "fragmentStaticLinkingDescriptor", *MTL4StaticLinkingDescriptor);
#insert #run PROP(*MTL4RenderPipelineDescriptor, "inputPrimitiveTopology", MTLPrimitiveTopologyClass);
#insert #run METHOD(*MTL4RenderPipelineDescriptor, "isRasterizationEnabled", #type () -> BOOL); // DEFAULTS TO TRUE
#insert #run METHOD(*MTL4RenderPipelineDescriptor, "setRasterizationEnabled:", #type (rasterizationEnabled: BOOL) -> ());
#insert #run PROP(*MTL4RenderPipelineDescriptor, "maxVertexAmplificationCount", NSUInteger);
#insert #run PROP(*MTL4RenderPipelineDescriptor, "rasterSampleCount", NSUInteger);
#insert #run PROP(*MTL4RenderPipelineDescriptor, "supportFragmentBinaryLinking", BOOL);
#insert #run PROP(*MTL4RenderPipelineDescriptor, "supportIndirectCommandBuffers", BOOL);
#insert #run PROP(*MTL4RenderPipelineDescriptor, "supportVertexBinaryLinking", BOOL);
#insert #run PROP(*MTL4RenderPipelineDescriptor, "vertexDescriptor", *MTLVertexDescriptor);
#insert #run PROP(*MTL4RenderPipelineDescriptor, "vertexFunctionDescriptor", *MTL4FunctionDescriptor);
#insert #run PROP(*MTL4RenderPipelineDescriptor, "vertexStaticLinkingDescriptor", *MTL4StaticLinkingDescriptor);
#insert #run METHOD(*MTL4RenderPipelineDescriptor, "reset", #type () -> ());

MTL4RenderPipelineColorAttachmentDescriptor :: struct {}
#insert #run PROP(*MTL4RenderPipelineColorAttachmentDescriptor, "alphaBlendOperation", MTLBlendOperation);
#insert #run PROP(*MTL4RenderPipelineColorAttachmentDescriptor, "blendingState", MTL4BlendState);
#insert #run PROP(*MTL4RenderPipelineColorAttachmentDescriptor, "destinationAlphaBlendFactor", MTLBlendFactor);
#insert #run PROP(*MTL4RenderPipelineColorAttachmentDescriptor, "destinationRGBBlendFactor", MTLBlendFactor);
#insert #run PROP(*MTL4RenderPipelineColorAttachmentDescriptor, "pixelFormat", MTLPixelFormat);
#insert #run PROP(*MTL4RenderPipelineColorAttachmentDescriptor, "rgbBlendOperation", MTLBlendOperation);
#insert #run PROP(*MTL4RenderPipelineColorAttachmentDescriptor, "sourceAlphaBlendFactor", MTLBlendFactor);
#insert #run PROP(*MTL4RenderPipelineColorAttachmentDescriptor, "sourceRGBBlendFactor", MTLBlendFactor);
#insert #run PROP(*MTL4RenderPipelineColorAttachmentDescriptor, "writeMask", MTLColorWriteMask);

MTL4RenderPipelineColorAttachmentDescriptorArray :: struct {}
#insert #run METHOD(*MTL4RenderPipelineColorAttachmentDescriptorArray, "reset", #type () -> ());
#insert #run METHOD(*MTL4RenderPipelineColorAttachmentDescriptorArray, "setObject:atIndexedSubscript:", #type (attachment: *MTL4RenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> ());
#insert #run METHOD(*MTL4RenderPipelineColorAttachmentDescriptorArray, "objectAtIndexedSubscript:", #type (attachmentIndex: NSUInteger) -> ());

/* ===== Compiler, Shaders and Metal Functions ===== */
MTL4CompilerDescriptor :: struct {}
#insert #run PROP(*MTL4CompilerDescriptor, "label", *NSString);
#insert #run PROP(*MTL4CompilerDescriptor, "pipelineDataSetSerializer", *MTL4PipelineDataSetSerializer);

MTL4Compiler :: struct {}
#insert #run METHOD(*MTL4Compiler , "newLibraryWithDescriptor:error:", #type (descriptor: *MTL4LibraryDescriptor, error: **NSError) -> *MTLLibrary);
#insert #run METHOD(*MTL4Compiler , "newRenderPipelineStateWithDescriptor:compilerTaskOptions:error:", #type (descriptor: *MTL4RenderPipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLRenderPipelineState);
// FIXME: add async version of newRenderPipelineStateWithDescriptor here
// FIXME: add specialization versino of newRenderPipelineStateWithDescriptor here, so that we can 
// support adding blend state in the render pass instead of on the raster descriptor
//#insert #run PROP(*MTL4Compiler, "pipelineDataSetSerializer", *MTL4PipelineDataSetSerializer);

MTL4CompilerTask :: struct {}
// TODO: Not Implmented

MTL4CompilerTaskOptions :: struct {}
#insert #run PROP(*MTL4CompilerTaskOptions, "lookupArchives", *NSArray(*MTL4Archive));

MTL4PipelineDataSetSerializerDescriptor :: struct {}
#insert #run PROP(*MTL4PipelineDataSetSerializerDescriptor , "configuration", MTL4PipelineDataSetSerializerConfiguration);

MTL4PipelineDataSetSerializer :: struct {}

MTL4LibraryDescriptor :: struct {}

// NOTE: I think that the MTL4Compiler can serialize these and the MTLDevice can
// read them from files. I think this is basically how you implement shader caching.
// For this project, we'll need to track the hashes of the IR, and correlate them
// somehow, json seems like a bit of a pain, maybe some kind of binary format, or even
// sqlite
MTL4Archive :: struct {}

MTL4FunctionDescriptor :: struct {}

MTL4LibraryFunctionDescriptor :: struct { using #as base: MTL4FunctionDescriptor; }
#insert #run PROP(*MTL4LibraryFunctionDescriptor , "library", *MTLLibrary);
#insert #run PROP(*MTL4LibraryFunctionDescriptor , "name", *NSString);

MTL4StaticLinkingDescriptor :: struct {}
// TODO: Not Implemented

/* ===== Passes and Descriptors ==== */
MTL4RenderPassDescriptor :: struct {}
#insert #run METHOD(*MTL4RenderPassDescriptor, "colorAttachments", #type () -> *MTLRenderPassColorAttachmentDescriptorArray);
#insert #run PROP(*MTL4RenderPassDescriptor, "defaultRasterSampleCount", NSUInteger);


/* ===== Memory, Residency Sets and so forth ===== */
MTLResidencySetDescriptor :: struct {}
#insert #run PROP(*MTLResidencySetDescriptor, "initialCapacity", NSUInteger);

MTLAllocation :: NSObject;

MTLResidencySet :: struct {}
#insert #run METHOD(*MTLResidencySet, "addAllocation:", #type (allocation: *MTLAllocation) -> ());
#insert #run METHOD(*MTLResidencySet, "commit", #type () -> ());

/* Typedefs */
MTLGPUAddress :: u64;

MTL4ShaderReflection :: enum NSUInteger {
    MTL4ShaderReflectionNone            :: 0;
    MTL4ShaderReflectionBindingInfo     :: 1;
    MTL4ShaderReflectionBufferTypeInfo  :: 2;

    None                                :: MTL4ShaderReflectionNone;
    BindingInfo                         :: MTL4ShaderReflectionBindingInfo;
    BufferTypeInfo                      :: MTL4ShaderReflectionBufferTypeInfo;
}

MTL4ShaderValidation :: enum NSInteger {
    MTLShaderValidationDefault  :: 0;
    MTLShaderValidationDisabled :: 1;
    MTLShaderValidationEnabled  :: 2;

    Default                     :: MTLShaderValidationDefault;
    Disabled                    :: MTLShaderValidationDisabled;
    Enabled                     :: MTLShaderValidationEnabled;
}

MTL4AlphaToCoverageState :: enum NSInteger {
    MTL4AlphaToCoverageStateDisabled :: 0;
    MTL4AlphaToCoverageStateEnabled :: 1;

    Disabled :: MTL4AlphaToCoverageStateDisabled;
    Enabled :: MTL4AlphaToCoverageStateEnabled;
}

MTL4AlphaToOneState :: enum NSInteger {
    MTL4AlphaToOneStateDisabled :: 0;
    MTL4AlphaToOneStateEnabled :: 1;

    Disabled :: MTL4AlphaToOneStateDisabled;
    Enabled :: MTL4AlphaToOneStateEnabled;
}

MTL4BlendState :: enum NSInteger {
    MTL4BlendStateDisabled :: 0;
    MTL4BlendStateEnabled :: 1;
    MTL4BlendStateUnspecialized :: 2;

    Disabled :: MTL4BlendStateDisabled;
    Enabled :: MTL4BlendStateEnabled;
    Unspecialized :: MTL4BlendStateUnspecialized;
}

MTL4LogicalToPhysicalColorAttachmentMappingState :: enum NSInteger {
    MTL4LogicalToPhysicalColorAttachmentMappingStateIdentity :: 0;
    MTL4LogicalToPhysicalColorAttachmentMappingStateInherited :: 1;

    Identity :: MTL4LogicalToPhysicalColorAttachmentMappingStateIdentity;
    Inherited :: MTL4LogicalToPhysicalColorAttachmentMappingStateInherited;
}

MTL4PipelineDataSetSerializerConfiguration :: enum_flags NSUInteger {
    MTL4PipelineDataSetSerializerConfigurationCaptureBinaries :: 1;
    MTL4PipelineDataSetSerializerConfigurationCaptureDescriptors :: 1 << 1;
    
    CaptureBinaries :: MTL4PipelineDataSetSerializerConfigurationCaptureBinaries;
    CaptureDescriptors :: MTL4PipelineDataSetSerializerConfigurationCaptureDescriptors;
}

MTL4RenderEncoderOptions :: enum NSUInteger {
    RenderEncoderOptionNone :: 0;
    RenderEncoderOptionSuspending :: 1;
    RenderEncoderOptionResuming :: 1 << 1;
}

MTLHeapType :: enum NSInteger {
    MTLHeapTypeAutomatic :: 0;
    MTLHeapTypePlacement :: 1;
    MTLHeapTypeSparse :: 2;

    Automatic :: MTLHeapTypeAutomatic;
    Placement :: MTLHeapTypePlacement;
    Sparse :: MTLHeapTypeSparse;
}


#scope_module


#load "macros.jai";
#load "selectors.jai";
