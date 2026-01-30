#scope_module

// TODO: find some way to generate this programmatically while maintaining the
// integrity of metal as a module... or say screw it and just use a metaprogram
__macro_generated_selectors_t :: struct #type_info_no_size_complaint {
    // stuff in Metal.jai
    newMTL4CommandQueue : *void = ---;
    newCommandBuffer : *void = ---;
    newCommandAllocator : *void = ---;
    present : *void = ---;
    newArgumentTableWithDescriptor_error_ : *void = ---;
    newResidencySetWithDescriptor_error_ : *void = ---;
    newPipelineDataSetSerializerWithDescriptor_ : *void = ---;
    newCompilerWithDescriptor_error_ : *void = ---;

    // on literally everything
    label : *void = ---;
    setLabel_ : *void = ---;

    //MTL4CommandQueue
    commit_count_: *void = ---;
    signalDrawable_: *void = ---;
    waitForDrawable_: *void = ---;
    addResidencySet_: *void = ---;

    //MTL4CommandBuffer
    renderCommandEncoderWithDescriptor_ : *void = ---;
    renderCommandEncoderWithDescriptor_options_ : *void = ---;
    beginCommandBufferWithAllocator_ : *void = ---;
    endCommandBuffer : *void = ---;

    //MTL4CommandAllocator
    reset : *void = ---;

    //MTL4CommandEncoder
    endEncoding : *void = ---;

    //MTL4RenderCommandEncoder
    setRenderPipelineState_ : *void = ---;
    setCullMode_ : *void = ---;
    setArgumentTable_atStages_ : *void = ---;
    drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_ : *void = ---;
    setViewport_ : *void = ---;
    setScissorRect_ : *void = ---;
    drawPrimitives_vertexStart_vertexCount_ : *void = ---;
    setDepthStencilState_ : *void = ---;
    setDepthBias_slopeScale_clamp_ : *void = ---;
    setStencilFrontReferenceValue_backReferenceValue_ : *void = ---;

    //MTl4ArgumentTableDescriptor
    maxBufferBindCount : *void = ---;
    setMaxBufferBindCount_ : *void = ---;
    supportAttributeStrides : *void = ---;
    setSupportAttributeStrides_ : *void = ---;

    //MTL4ArgumentTable
    setAddress_atIndex_ : *void = ---;
    setAddress_attributeStride_atIndex_ : *void = ---;

    //MTL4PipelineOptions
    shaderReflection : *void = ---;
    setShaderReflection_ : *void = ---;
    shaderValidation : *void = ---;
    setShaderValidation_ : *void = ---;

    //MTL4RenderPipelineDescriptor
    options : *void = ---;
    setOptions_ : *void = ---;
    alphaToCoverageState : *void = ---; 
    setAlphaToCoverageState_ : *void = ---; 
    alphaToOneState : *void = ---; 
    setAlphaToOneState_ : *void = ---; 
    colorAttachmentMappingState : *void = ---; 
    setColorAttachmentMappingState_ : *void = ---; 
    colorAttachments : *void = ---; 
    fragmentFunctionDescriptor : *void = ---; 
    setFragmentFunctionDescriptor_ : *void = ---; 
    fragmentStaticLinkingDescriptor : *void = ---; 
    setFragmentStaticLinkingDescriptor_ : *void = ---; 
    inputPrimitiveTopology : *void = ---; 
    setInputPrimitiveTopology_ : *void = ---; 
    isRasterizationEnabled : *void = ---; 
    setRasterizationEnabled_ : *void = ---; 
    maxVertexAmplificationCount : *void = ---; 
    setMaxVertexAmplificationCount_ : *void = ---; 
    rasterSampleCount : *void = ---; 
    setRasterSampleCount_ : *void = ---; 
    supportFragmentBinaryLinking : *void = ---; 
    setSupportFragmentBinaryLinking_ : *void = ---; 
    supportIndirectCommandBuffers : *void = ---; 
    setSupportIndirectCommandBuffers_ : *void = ---; 
    supportVertexBinaryLinking : *void = ---; 
    setSupportVertexBinaryLinking_ : *void = ---; 
    vertexDescriptor : *void = ---; 
    setVertexDescriptor_ : *void = ---; 
    vertexFunctionDescriptor : *void = ---; 
    setVertexFunctionDescriptor_ : *void = ---; 
    vertexStaticLinkingDescriptor : *void = ---; 
    setVertexStaticLinkingDescriptor_ : *void = ---; 
    //reset : *void = ---; 

    //MTL4RenderPipelineColorAttachmentDescriptor
    alphaBlendOperation : *void = ---;
    setAlphaBlendOperation_ : *void = ---;
    blendingState : *void = ---;
    setBlendingState_ : *void = ---;
    destinationAlphaBlendFactor : *void = ---;
    setDestinationAlphaBlendFactor_ : *void = ---;
    destinationRGBBlendFactor : *void = ---;
    setDestinationRGBBlendFactor_ : *void = ---;
    pixelFormat : *void = ---;
    setPixelFormat_ : *void = ---;
    rgbBlendOperation : *void = ---;
    setRgbBlendOperation_ : *void = ---;
    sourceAlphaBlendFactor : *void = ---;
    setSourceAlphaBlendFactor_ : *void = ---;
    sourceRGBBlendFactor : *void = ---;
    setSourceRGBBlendFactor_ : *void = ---;
    writeMask : *void = ---;
    setWriteMask_ : *void = ---;
    
    //MTL4RenderPipelineColorAttachmentDescriptorArray
    //reset : *void = ---;
    setObject_atIndexedSubscript_ : *void = ---;
    objectAtIndexedSubscript_ : *void = ---;


    /* ===== Compiler, Shaders and Metal Functions ===== */
    // MTL4CompilerDescriptor
    //label : *void = ---;
    pipelineDataSetSerializer : *void = ---;
    setPipelineDataSetSerializer_ : *void = ---;

    // MTL4Compiler
    newLibraryWithDescriptor_error_ : *void = ---;
    newRenderPipelineStateWithDescriptor_compilerTaskOptions_error_ : *void = ---;

    //pipelineDataSetSerializer

    // MTL4CompilerTask
    // TODO: Not Implmented

    // MTL4CompilerTaskOptions
    lookupArchives : *void = ---;
    setLookupArchives_ : *void = ---;

    // MTL4PipelineDataSetSerializerDescriptor
    configuration : *void = ---;
    setConfiguration_ : *void = ---;

    // MTL4PipelineDataSetSerializer

    // MTL4LibraryDescriptor

    // MTL4Archive

    // MTL4FunctionDescriptor

    // MTL4LibraryFunctionDescriptor 
    library : *void = ---;
    setLibrary_ : *void = ---;
    name : *void = ---;
    setName_ : *void = ---;

    // MTL4StaticLinkingDescriptor



    //MTL4RenderPassDescriptor
    //colorAttachments : *void = ---;
    defaultRasterSampleCount : *void = ---;
    setDefaultRasterSampleCount_ : *void = ---;

   //MTLResidencySetDescriptor
    initialCapacity : *void = ---;
    setInitialCapacity_ : *void = ---;

    //MTLResidencySet
    addAllocation_ : *void = ---;
    commit : *void = ---;

    Placeholder : *void = ---;
}
__macro_generated_selectors : __macro_generated_selectors_t;


