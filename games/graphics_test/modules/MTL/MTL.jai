/* Metal Wrappers generated from metal-cpp
	 NOTE: While this library uses metal-cpp for code generation, 
	 it doesn't bind a separate C++ library, but calls the Objective C, 
	 system libraries directly. */

#scope_export

MTL4UpdateSparseTextureMappingOperation :: struct {
	mode : MTLSparseTextureMappingMode;
	textureRegion : MTLRegion;
	textureLevel : NSUInteger;
	textureSlice : NSUInteger;
	heapOffset : NSUInteger;
}

MTL4CopySparseTextureMappingOperation :: struct {
	sourceRegion : MTLRegion;
	sourceLevel : NSUInteger;
	sourceSlice : NSUInteger;
	destinationOrigin : MTLOrigin;
	destinationLevel : NSUInteger;
	destinationSlice : NSUInteger;
}

MTL4UpdateSparseBufferMappingOperation :: struct {
	mode : MTLSparseTextureMappingMode;
	bufferRange : NSRange;
	heapOffset : NSUInteger;
}

MTL4CopySparseBufferMappingOperation :: struct {
	sourceRange : NSRange;
	destinationOffset : NSUInteger;
}

MTLOrigin :: struct {
	x : NSUInteger;
	y : NSUInteger;
	z : NSUInteger;
}

MTLSize :: struct {
	width : NSUInteger;
	height : NSUInteger;
	depth : NSUInteger;
}

MTLRegion :: struct {
	origin : MTLOrigin;
	size : MTLSize;
}

MTLSamplePosition :: struct {
	x : float;
	y : float;
}

MTLResourceID :: struct {
	_impl : u64;
}

MTLMapIndirectArguments :: struct {
	regionOriginX : u32;
	regionOriginY : u32;
	regionOriginZ : u32;
	regionSizeWidth : u32;
	regionSizeHeight : u32;
	regionSizeDepth : u32;
	mipMapLevel : u32;
	sliceId : u32;
}

MTLScissorRect :: struct {
	x : NSUInteger;
	y : NSUInteger;
	width : NSUInteger;
	height : NSUInteger;
}

MTLViewport :: struct {
	originX : float64;
	originY : float64;
	width : float64;
	height : float64;
	znear : float64;
	zfar : float64;
}

MTLDrawPrimitivesIndirectArguments :: struct {
	vertexCount : u32;
	instanceCount : u32;
	vertexStart : u32;
	baseInstance : u32;
}

MTLDrawIndexedPrimitivesIndirectArguments :: struct {
	indexCount : u32;
	instanceCount : u32;
	indexStart : u32;
	baseVertex : s32;
	baseInstance : u32;
}

MTLVertexAmplificationViewMapping :: struct {
	viewportArrayIndexOffset : u32;
	renderTargetArrayIndexOffset : u32;
}

MTLDrawPatchIndirectArguments :: struct {
	patchCount : u32;
	instanceCount : u32;
	patchStart : u32;
	baseInstance : u32;
}

MTLQuadTessellationFactorsHalf :: struct {
	edgeTessellationFactor : [4]u16;
	insideTessellationFactor : [2]u16;
}

MTLTriangleTessellationFactorsHalf :: struct {
	edgeTessellationFactor : [3]u16;
	insideTessellationFactor : u16;
}

MTLPackedFloat3 :: struct {
	x : float;
	y : float;
	z : float;
}

MTLPackedFloat4x3 :: struct {
	columns : [4]PackedFloat3;
}

MTLAxisAlignedBoundingBox :: struct {
	min : PackedFloat3;
	max : PackedFloat3;
}

MTLPackedFloatQuaternion :: struct {
	x : float;
	y : float;
	z : float;
	w : float;
}

MTLComponentTransform :: struct {
	scale : PackedFloat3;
	shear : PackedFloat3;
	pivot : PackedFloat3;
	rotation : PackedFloatQuaternion;
	translation : PackedFloat3;
}

MTL4BufferRange :: struct {
	bufferAddress : u64;
	length : u64;
}

MTLTextureSwizzleChannels :: struct {
	red : MTLTextureSwizzle;
	green : MTLTextureSwizzle;
	blue : MTLTextureSwizzle;
	alpha : MTLTextureSwizzle;
}

MTL4TimestampHeapEntry :: struct {
	timestamp : u64;
}

MTLIntersectionFunctionBufferArguments :: struct {
	intersectionFunctionBuffer : u64;
	intersectionFunctionBufferSize : u64;
	intersectionFunctionStride : u64;
}

MTLAccelerationStructureInstanceDescriptor :: struct {
	transformationMatrix : MTLPackedFloat4x3;
	options : MTLAccelerationStructureInstanceOptions;
	mask : u32;
	intersectionFunctionTableOffset : u32;
	accelerationStructureIndex : u32;
}

MTLAccelerationStructureUserIDInstanceDescriptor :: struct {
	transformationMatrix : MTLPackedFloat4x3;
	options : MTLAccelerationStructureInstanceOptions;
	mask : u32;
	intersectionFunctionTableOffset : u32;
	accelerationStructureIndex : u32;
	userID : u32;
}

MTLAccelerationStructureMotionInstanceDescriptor :: struct {
	options : MTLAccelerationStructureInstanceOptions;
	mask : u32;
	intersectionFunctionTableOffset : u32;
	accelerationStructureIndex : u32;
	userID : u32;
	motionTransformsStartIndex : u32;
	motionTransformsCount : u32;
	motionStartBorderMode : MTLMotionBorderMode;
	motionEndBorderMode : MTLMotionBorderMode;
	motionStartTime : float;
	motionEndTime : float;
}

MTLIndirectAccelerationStructureInstanceDescriptor :: struct {
	transformationMatrix : MTLPackedFloat4x3;
	options : MTLAccelerationStructureInstanceOptions;
	mask : u32;
	intersectionFunctionTableOffset : u32;
	userID : u32;
	accelerationStructureID : MTLResourceID;
}

MTLIndirectAccelerationStructureMotionInstanceDescriptor :: struct {
	options : MTLAccelerationStructureInstanceOptions;
	mask : u32;
	intersectionFunctionTableOffset : u32;
	userID : u32;
	accelerationStructureID : MTLResourceID;
	motionTransformsStartIndex : u32;
	motionTransformsCount : u32;
	motionStartBorderMode : MTLMotionBorderMode;
	motionEndBorderMode : MTLMotionBorderMode;
	motionStartTime : float;
	motionEndTime : float;
}

MTLAccelerationStructureSizes :: struct {
	accelerationStructureSize : NSUInteger;
	buildScratchBufferSize : NSUInteger;
	refitScratchBufferSize : NSUInteger;
}

MTLSizeAndAlign :: struct {
	size : NSUInteger;
	align : NSUInteger;
}

MTLClearColor :: struct {
	red : float64;
	green : float64;
	blue : float64;
	alpha : float64;
}

MTLIndirectCommandBufferExecutionRange :: struct {
	location : u32;
	length : u32;
}

MTLDispatchThreadgroupsIndirectArguments :: struct {
	threadgroupsPerGrid : [3]u32;
}

MTLDispatchThreadsIndirectArguments :: struct {
	threadsPerGrid : [3]u32;
	threadsPerThreadgroup : [3]u32;
}

MTLStageInRegionIndirectArguments :: struct {
	stageInOrigin : [3]u32;
	stageInSize : [3]u32;
}

MTLCounterResultTimestamp :: struct {
	timestamp : u64;
}

MTLCounterResultStageUtilization :: struct {
	totalCycles : u64;
	vertexCycles : u64;
	tessellationCycles : u64;
	postTessellationVertexCycles : u64;
	fragmentCycles : u64;
	renderTargetCycles : u64;
}

MTLCounterResultStatistic :: struct {
	tessellationInputPatches : u64;
	vertexInvocations : u64;
	postTessellationVertexInvocations : u64;
	clipperInvocations : u64;
	clipperPrimitivesOut : u64;
	fragmentInvocations : u64;
	fragmentsPassed : u64;
	computeKernelInvocations : u64;
}

MTL4CommandQueueError :: enum NSInteger {
	None :: 0;
	Timeout :: 1;
	NotPermitted :: 2;
	OutOfMemory :: 3;
	DeviceRemoved :: 4;
	AccessRevoked :: 5;
	Internal :: 6;
;
	MTL4CommandQueueErrorNone :: 0;
	MTL4CommandQueueErrorTimeout :: 1;
	MTL4CommandQueueErrorNotPermitted :: 2;
	MTL4CommandQueueErrorOutOfMemory :: 3;
	MTL4CommandQueueErrorDeviceRemoved :: 4;
	MTL4CommandQueueErrorAccessRevoked :: 5;
	MTL4CommandQueueErrorInternal :: 6;
}

MTLSparseTextureMappingMode :: enum NSUInteger {
	Map :: 0;
	Unmap :: 1;
;
	MTLSparseTextureMappingModeMap :: 0;
	MTLSparseTextureMappingModeUnmap :: 1;
}

MTLDynamicLibraryError :: enum NSUInteger {
	None :: 0;
	InvalidFile :: 1;
	CompilationFailure :: 2;
	UnresolvedInstallName :: 3;
	DependencyLoadFailure :: 4;
	Unsupported :: 5;
;
	MTLDynamicLibraryErrorNone :: 0;
	MTLDynamicLibraryErrorInvalidFile :: 1;
	MTLDynamicLibraryErrorCompilationFailure :: 2;
	MTLDynamicLibraryErrorUnresolvedInstallName :: 3;
	MTLDynamicLibraryErrorDependencyLoadFailure :: 4;
	MTLDynamicLibraryErrorUnsupported :: 5;
}

MTLMutability :: enum NSUInteger {
	Default :: 0;
	Mutable :: 1;
	Immutable :: 2;
;
	MTLMutabilityDefault :: 0;
	MTLMutabilityMutable :: 1;
	MTLMutabilityImmutable :: 2;
}

MTLShaderValidation :: enum NSInteger {
	Default :: 0;
	Enabled :: 1;
	Disabled :: 2;
;
	MTLShaderValidationDefault :: 0;
	MTLShaderValidationEnabled :: 1;
	MTLShaderValidationDisabled :: 2;
}

MTL4CompilerTaskStatus :: enum NSInteger {
	None :: 0;
	Scheduled :: 1;
	Compiling :: 2;
	Finished :: 3;
;
	MTL4CompilerTaskStatusNone :: 0;
	MTL4CompilerTaskStatusScheduled :: 1;
	MTL4CompilerTaskStatusCompiling :: 2;
	MTL4CompilerTaskStatusFinished :: 3;
}

MTLPrimitiveType :: enum NSUInteger {
	Point :: 0;
	Line :: 1;
	LineStrip :: 2;
	Triangle :: 3;
	TriangleStrip :: 4;
;
	MTLPrimitiveTypePoint :: 0;
	MTLPrimitiveTypeLine :: 1;
	MTLPrimitiveTypeLineStrip :: 2;
	MTLPrimitiveTypeTriangle :: 3;
	MTLPrimitiveTypeTriangleStrip :: 4;
}

MTLVisibilityResultMode :: enum NSUInteger {
	Disabled :: 0;
	Boolean :: 1;
	Counting :: 2;
;
	MTLVisibilityResultModeDisabled :: 0;
	MTLVisibilityResultModeBoolean :: 1;
	MTLVisibilityResultModeCounting :: 2;
}

MTLCullMode :: enum NSUInteger {
	None :: 0;
	Front :: 1;
	Back :: 2;
;
	MTLCullModeNone :: 0;
	MTLCullModeFront :: 1;
	MTLCullModeBack :: 2;
}

MTLWinding :: enum NSUInteger {
	Clockwise :: 0;
	CounterClockwise :: 1;
;
	MTLWindingClockwise :: 0;
	MTLWindingCounterClockwise :: 1;
}

MTLDepthClipMode :: enum NSUInteger {
	Clip :: 0;
	Clamp :: 1;
;
	MTLDepthClipModeClip :: 0;
	MTLDepthClipModeClamp :: 1;
}

MTLTriangleFillMode :: enum NSUInteger {
	Fill :: 0;
	Lines :: 1;
;
	MTLTriangleFillModeFill :: 0;
	MTLTriangleFillModeLines :: 1;
}

MTLTensorDataType :: enum NSInteger {
	None :: 0;
	Float32 :: 3;
	Float16 :: 16;
	BFloat16 :: 121;
	Int8 :: 45;
	UInt8 :: 49;
	Int16 :: 37;
	UInt16 :: 41;
	Int32 :: 29;
	UInt32 :: 33;
;
	MTLTensorDataTypeNone :: 0;
	MTLTensorDataTypeFloat32 :: 3;
	MTLTensorDataTypeFloat16 :: 16;
	MTLTensorDataTypeBFloat16 :: 121;
	MTLTensorDataTypeInt8 :: 45;
	MTLTensorDataTypeUInt8 :: 49;
	MTLTensorDataTypeInt16 :: 37;
	MTLTensorDataTypeUInt16 :: 41;
	MTLTensorDataTypeInt32 :: 29;
	MTLTensorDataTypeUInt32 :: 33;
}

MTLTensorError :: enum NSInteger {
	None :: 0;
	InternalError :: 1;
	InvalidDescriptor :: 2;
;
	MTLTensorErrorNone :: 0;
	MTLTensorErrorInternalError :: 1;
	MTLTensorErrorInvalidDescriptor :: 2;
}

MTLCaptureError :: enum NSInteger {
	NotSupported :: 1;
	AlreadyCapturing :: 2;
	InvalidDescriptor :: 3;
;
	MTLCaptureErrorNotSupported :: 1;
	MTLCaptureErrorAlreadyCapturing :: 2;
	MTLCaptureErrorInvalidDescriptor :: 3;
}

MTLCaptureDestination :: enum NSInteger {
	DeveloperTools :: 1;
	GPUTraceDocument :: 2;
;
	MTLCaptureDestinationDeveloperTools :: 1;
	MTLCaptureDestinationGPUTraceDocument :: 2;
}

MTLAttributeFormat :: enum NSUInteger {
	Invalid :: 0;
	UChar2 :: 1;
	UChar3 :: 2;
	UChar4 :: 3;
	Char2 :: 4;
	Char3 :: 5;
	Char4 :: 6;
	UChar2Normalized :: 7;
	UChar3Normalized :: 8;
	UChar4Normalized :: 9;
	Char2Normalized :: 10;
	Char3Normalized :: 11;
	Char4Normalized :: 12;
	UShort2 :: 13;
	UShort3 :: 14;
	UShort4 :: 15;
	Short2 :: 16;
	Short3 :: 17;
	Short4 :: 18;
	UShort2Normalized :: 19;
	UShort3Normalized :: 20;
	UShort4Normalized :: 21;
	Short2Normalized :: 22;
	Short3Normalized :: 23;
	Short4Normalized :: 24;
	Half2 :: 25;
	Half3 :: 26;
	Half4 :: 27;
	Float :: 28;
	Float2 :: 29;
	Float3 :: 30;
	Float4 :: 31;
	Int :: 32;
	Int2 :: 33;
	Int3 :: 34;
	Int4 :: 35;
	UInt :: 36;
	UInt2 :: 37;
	UInt3 :: 38;
	UInt4 :: 39;
	Int1010102Normalized :: 40;
	UInt1010102Normalized :: 41;
	UChar4Normalized_BGRA :: 42;
	UChar :: 45;
	Char :: 46;
	UCharNormalized :: 47;
	CharNormalized :: 48;
	UShort :: 49;
	Short :: 50;
	UShortNormalized :: 51;
	ShortNormalized :: 52;
	Half :: 53;
	FloatRG11B10 :: 54;
	FloatRGB9E5 :: 55;
;
	MTLAttributeFormatInvalid :: 0;
	MTLAttributeFormatUChar2 :: 1;
	MTLAttributeFormatUChar3 :: 2;
	MTLAttributeFormatUChar4 :: 3;
	MTLAttributeFormatChar2 :: 4;
	MTLAttributeFormatChar3 :: 5;
	MTLAttributeFormatChar4 :: 6;
	MTLAttributeFormatUChar2Normalized :: 7;
	MTLAttributeFormatUChar3Normalized :: 8;
	MTLAttributeFormatUChar4Normalized :: 9;
	MTLAttributeFormatChar2Normalized :: 10;
	MTLAttributeFormatChar3Normalized :: 11;
	MTLAttributeFormatChar4Normalized :: 12;
	MTLAttributeFormatUShort2 :: 13;
	MTLAttributeFormatUShort3 :: 14;
	MTLAttributeFormatUShort4 :: 15;
	MTLAttributeFormatShort2 :: 16;
	MTLAttributeFormatShort3 :: 17;
	MTLAttributeFormatShort4 :: 18;
	MTLAttributeFormatUShort2Normalized :: 19;
	MTLAttributeFormatUShort3Normalized :: 20;
	MTLAttributeFormatUShort4Normalized :: 21;
	MTLAttributeFormatShort2Normalized :: 22;
	MTLAttributeFormatShort3Normalized :: 23;
	MTLAttributeFormatShort4Normalized :: 24;
	MTLAttributeFormatHalf2 :: 25;
	MTLAttributeFormatHalf3 :: 26;
	MTLAttributeFormatHalf4 :: 27;
	MTLAttributeFormatFloat :: 28;
	MTLAttributeFormatFloat2 :: 29;
	MTLAttributeFormatFloat3 :: 30;
	MTLAttributeFormatFloat4 :: 31;
	MTLAttributeFormatInt :: 32;
	MTLAttributeFormatInt2 :: 33;
	MTLAttributeFormatInt3 :: 34;
	MTLAttributeFormatInt4 :: 35;
	MTLAttributeFormatUInt :: 36;
	MTLAttributeFormatUInt2 :: 37;
	MTLAttributeFormatUInt3 :: 38;
	MTLAttributeFormatUInt4 :: 39;
	MTLAttributeFormatInt1010102Normalized :: 40;
	MTLAttributeFormatUInt1010102Normalized :: 41;
	MTLAttributeFormatUChar4Normalized_BGRA :: 42;
	MTLAttributeFormatUChar :: 45;
	MTLAttributeFormatChar :: 46;
	MTLAttributeFormatUCharNormalized :: 47;
	MTLAttributeFormatCharNormalized :: 48;
	MTLAttributeFormatUShort :: 49;
	MTLAttributeFormatShort :: 50;
	MTLAttributeFormatUShortNormalized :: 51;
	MTLAttributeFormatShortNormalized :: 52;
	MTLAttributeFormatHalf :: 53;
	MTLAttributeFormatFloatRG11B10 :: 54;
	MTLAttributeFormatFloatRGB9E5 :: 55;
}

MTLStepFunction :: enum NSUInteger {
	Constant :: 0;
	PerVertex :: 1;
	PerInstance :: 2;
	PerPatch :: 3;
	PerPatchControlPoint :: 4;
	ThreadPositionInGridX :: 5;
	ThreadPositionInGridY :: 6;
	ThreadPositionInGridXIndexed :: 7;
	ThreadPositionInGridYIndexed :: 8;
;
	MTLStepFunctionConstant :: 0;
	MTLStepFunctionPerVertex :: 1;
	MTLStepFunctionPerInstance :: 2;
	MTLStepFunctionPerPatch :: 3;
	MTLStepFunctionPerPatchControlPoint :: 4;
	MTLStepFunctionThreadPositionInGridX :: 5;
	MTLStepFunctionThreadPositionInGridY :: 6;
	MTLStepFunctionThreadPositionInGridXIndexed :: 7;
	MTLStepFunctionThreadPositionInGridYIndexed :: 8;
}

MTLTextureType :: enum NSUInteger {
	Type1D :: 0;
	Type1DArray :: 1;
	Type2D :: 2;
	Type2DArray :: 3;
	Type2DMultisample :: 4;
	TypeCube :: 5;
	TypeCubeArray :: 6;
	Type3D :: 7;
	Type2DMultisampleArray :: 8;
	TypeTextureBuffer :: 9;
;
	MTLTextureType1D :: 0;
	MTLTextureType1DArray :: 1;
	MTLTextureType2D :: 2;
	MTLTextureType2DArray :: 3;
	MTLTextureType2DMultisample :: 4;
	MTLTextureTypeCube :: 5;
	MTLTextureTypeCubeArray :: 6;
	MTLTextureType3D :: 7;
	MTLTextureType2DMultisampleArray :: 8;
	MTLTextureTypeTextureBuffer :: 9;
}

MTLTextureSwizzle :: enum u8 {
	Zero :: 0;
	One :: 1;
	Red :: 2;
	Green :: 3;
	Blue :: 4;
	Alpha :: 5;
;
	MTLTextureSwizzleZero :: 0;
	MTLTextureSwizzleOne :: 1;
	MTLTextureSwizzleRed :: 2;
	MTLTextureSwizzleGreen :: 3;
	MTLTextureSwizzleBlue :: 4;
	MTLTextureSwizzleAlpha :: 5;
}

MTLTextureCompressionType :: enum NSInteger {
	Lossless :: 0;
	Lossy :: 1;
;
	MTLTextureCompressionTypeLossless :: 0;
	MTLTextureCompressionTypeLossy :: 1;
}

MTLDataType :: enum NSUInteger {
	None :: 0;
	Struct :: 1;
	Array :: 2;
	Float :: 3;
	Float2 :: 4;
	Float3 :: 5;
	Float4 :: 6;
	Float2x2 :: 7;
	Float2x3 :: 8;
	Float2x4 :: 9;
	Float3x2 :: 10;
	Float3x3 :: 11;
	Float3x4 :: 12;
	Float4x2 :: 13;
	Float4x3 :: 14;
	Float4x4 :: 15;
	Half :: 16;
	Half2 :: 17;
	Half3 :: 18;
	Half4 :: 19;
	Half2x2 :: 20;
	Half2x3 :: 21;
	Half2x4 :: 22;
	Half3x2 :: 23;
	Half3x3 :: 24;
	Half3x4 :: 25;
	Half4x2 :: 26;
	Half4x3 :: 27;
	Half4x4 :: 28;
	Int :: 29;
	Int2 :: 30;
	Int3 :: 31;
	Int4 :: 32;
	UInt :: 33;
	UInt2 :: 34;
	UInt3 :: 35;
	UInt4 :: 36;
	Short :: 37;
	Short2 :: 38;
	Short3 :: 39;
	Short4 :: 40;
	UShort :: 41;
	UShort2 :: 42;
	UShort3 :: 43;
	UShort4 :: 44;
	Char :: 45;
	Char2 :: 46;
	Char3 :: 47;
	Char4 :: 48;
	UChar :: 49;
	UChar2 :: 50;
	UChar3 :: 51;
	UChar4 :: 52;
	Bool :: 53;
	Bool2 :: 54;
	Bool3 :: 55;
	Bool4 :: 56;
	Texture :: 58;
	Sampler :: 59;
	Pointer :: 60;
	R8Unorm :: 62;
	R8Snorm :: 63;
	R16Unorm :: 64;
	R16Snorm :: 65;
	RG8Unorm :: 66;
	RG8Snorm :: 67;
	RG16Unorm :: 68;
	RG16Snorm :: 69;
	RGBA8Unorm :: 70;
	RGBA8Unorm_sRGB :: 71;
	RGBA8Snorm :: 72;
	RGBA16Unorm :: 73;
	RGBA16Snorm :: 74;
	RGB10A2Unorm :: 75;
	RG11B10Float :: 76;
	RGB9E5Float :: 77;
	RenderPipeline :: 78;
	ComputePipeline :: 79;
	IndirectCommandBuffer :: 80;
	Long :: 81;
	Long2 :: 82;
	Long3 :: 83;
	Long4 :: 84;
	ULong :: 85;
	ULong2 :: 86;
	ULong3 :: 87;
	ULong4 :: 88;
	VisibleFunctionTable :: 115;
	IntersectionFunctionTable :: 116;
	PrimitiveAccelerationStructure :: 117;
	InstanceAccelerationStructure :: 118;
	BFloat :: 121;
	BFloat2 :: 122;
	BFloat3 :: 123;
	BFloat4 :: 124;
	DepthStencilState :: 139;
	Tensor :: 140;
;
	MTLDataTypeNone :: 0;
	MTLDataTypeStruct :: 1;
	MTLDataTypeArray :: 2;
	MTLDataTypeFloat :: 3;
	MTLDataTypeFloat2 :: 4;
	MTLDataTypeFloat3 :: 5;
	MTLDataTypeFloat4 :: 6;
	MTLDataTypeFloat2x2 :: 7;
	MTLDataTypeFloat2x3 :: 8;
	MTLDataTypeFloat2x4 :: 9;
	MTLDataTypeFloat3x2 :: 10;
	MTLDataTypeFloat3x3 :: 11;
	MTLDataTypeFloat3x4 :: 12;
	MTLDataTypeFloat4x2 :: 13;
	MTLDataTypeFloat4x3 :: 14;
	MTLDataTypeFloat4x4 :: 15;
	MTLDataTypeHalf :: 16;
	MTLDataTypeHalf2 :: 17;
	MTLDataTypeHalf3 :: 18;
	MTLDataTypeHalf4 :: 19;
	MTLDataTypeHalf2x2 :: 20;
	MTLDataTypeHalf2x3 :: 21;
	MTLDataTypeHalf2x4 :: 22;
	MTLDataTypeHalf3x2 :: 23;
	MTLDataTypeHalf3x3 :: 24;
	MTLDataTypeHalf3x4 :: 25;
	MTLDataTypeHalf4x2 :: 26;
	MTLDataTypeHalf4x3 :: 27;
	MTLDataTypeHalf4x4 :: 28;
	MTLDataTypeInt :: 29;
	MTLDataTypeInt2 :: 30;
	MTLDataTypeInt3 :: 31;
	MTLDataTypeInt4 :: 32;
	MTLDataTypeUInt :: 33;
	MTLDataTypeUInt2 :: 34;
	MTLDataTypeUInt3 :: 35;
	MTLDataTypeUInt4 :: 36;
	MTLDataTypeShort :: 37;
	MTLDataTypeShort2 :: 38;
	MTLDataTypeShort3 :: 39;
	MTLDataTypeShort4 :: 40;
	MTLDataTypeUShort :: 41;
	MTLDataTypeUShort2 :: 42;
	MTLDataTypeUShort3 :: 43;
	MTLDataTypeUShort4 :: 44;
	MTLDataTypeChar :: 45;
	MTLDataTypeChar2 :: 46;
	MTLDataTypeChar3 :: 47;
	MTLDataTypeChar4 :: 48;
	MTLDataTypeUChar :: 49;
	MTLDataTypeUChar2 :: 50;
	MTLDataTypeUChar3 :: 51;
	MTLDataTypeUChar4 :: 52;
	MTLDataTypeBool :: 53;
	MTLDataTypeBool2 :: 54;
	MTLDataTypeBool3 :: 55;
	MTLDataTypeBool4 :: 56;
	MTLDataTypeTexture :: 58;
	MTLDataTypeSampler :: 59;
	MTLDataTypePointer :: 60;
	MTLDataTypeR8Unorm :: 62;
	MTLDataTypeR8Snorm :: 63;
	MTLDataTypeR16Unorm :: 64;
	MTLDataTypeR16Snorm :: 65;
	MTLDataTypeRG8Unorm :: 66;
	MTLDataTypeRG8Snorm :: 67;
	MTLDataTypeRG16Unorm :: 68;
	MTLDataTypeRG16Snorm :: 69;
	MTLDataTypeRGBA8Unorm :: 70;
	MTLDataTypeRGBA8Unorm_sRGB :: 71;
	MTLDataTypeRGBA8Snorm :: 72;
	MTLDataTypeRGBA16Unorm :: 73;
	MTLDataTypeRGBA16Snorm :: 74;
	MTLDataTypeRGB10A2Unorm :: 75;
	MTLDataTypeRG11B10Float :: 76;
	MTLDataTypeRGB9E5Float :: 77;
	MTLDataTypeRenderPipeline :: 78;
	MTLDataTypeComputePipeline :: 79;
	MTLDataTypeIndirectCommandBuffer :: 80;
	MTLDataTypeLong :: 81;
	MTLDataTypeLong2 :: 82;
	MTLDataTypeLong3 :: 83;
	MTLDataTypeLong4 :: 84;
	MTLDataTypeULong :: 85;
	MTLDataTypeULong2 :: 86;
	MTLDataTypeULong3 :: 87;
	MTLDataTypeULong4 :: 88;
	MTLDataTypeVisibleFunctionTable :: 115;
	MTLDataTypeIntersectionFunctionTable :: 116;
	MTLDataTypePrimitiveAccelerationStructure :: 117;
	MTLDataTypeInstanceAccelerationStructure :: 118;
	MTLDataTypeBFloat :: 121;
	MTLDataTypeBFloat2 :: 122;
	MTLDataTypeBFloat3 :: 123;
	MTLDataTypeBFloat4 :: 124;
	MTLDataTypeDepthStencilState :: 139;
	MTLDataTypeTensor :: 140;
}

MTLSamplerMinMagFilter :: enum NSUInteger {
	Nearest :: 0;
	Linear :: 1;
;
	MTLSamplerMinMagFilterNearest :: 0;
	MTLSamplerMinMagFilterLinear :: 1;
}

MTLSamplerMipFilter :: enum NSUInteger {
	NotMipmapped :: 0;
	Nearest :: 1;
	Linear :: 2;
;
	MTLSamplerMipFilterNotMipmapped :: 0;
	MTLSamplerMipFilterNearest :: 1;
	MTLSamplerMipFilterLinear :: 2;
}

MTLSamplerAddressMode :: enum NSUInteger {
	ClampToEdge :: 0;
	MirrorClampToEdge :: 1;
	Repeat :: 2;
	MirrorRepeat :: 3;
	ClampToZero :: 4;
	ClampToBorderColor :: 5;
;
	MTLSamplerAddressModeClampToEdge :: 0;
	MTLSamplerAddressModeMirrorClampToEdge :: 1;
	MTLSamplerAddressModeRepeat :: 2;
	MTLSamplerAddressModeMirrorRepeat :: 3;
	MTLSamplerAddressModeClampToZero :: 4;
	MTLSamplerAddressModeClampToBorderColor :: 5;
}

MTLSamplerBorderColor :: enum NSUInteger {
	TransparentBlack :: 0;
	OpaqueBlack :: 1;
	OpaqueWhite :: 2;
;
	MTLSamplerBorderColorTransparentBlack :: 0;
	MTLSamplerBorderColorOpaqueBlack :: 1;
	MTLSamplerBorderColorOpaqueWhite :: 2;
}

MTLSamplerReductionMode :: enum NSUInteger {
	WeightedAverage :: 0;
	Minimum :: 1;
	Maximum :: 2;
;
	MTLSamplerReductionModeWeightedAverage :: 0;
	MTLSamplerReductionModeMinimum :: 1;
	MTLSamplerReductionModeMaximum :: 2;
}

MTLCompareFunction :: enum NSUInteger {
	Never :: 0;
	Less :: 1;
	Equal :: 2;
	LessEqual :: 3;
	Greater :: 4;
	NotEqual :: 5;
	GreaterEqual :: 6;
	Always :: 7;
;
	MTLCompareFunctionNever :: 0;
	MTLCompareFunctionLess :: 1;
	MTLCompareFunctionEqual :: 2;
	MTLCompareFunctionLessEqual :: 3;
	MTLCompareFunctionGreater :: 4;
	MTLCompareFunctionNotEqual :: 5;
	MTLCompareFunctionGreaterEqual :: 6;
	MTLCompareFunctionAlways :: 7;
}

MTLStencilOperation :: enum NSUInteger {
	Keep :: 0;
	Zero :: 1;
	Replace :: 2;
	IncrementClamp :: 3;
	DecrementClamp :: 4;
	Invert :: 5;
	IncrementWrap :: 6;
	DecrementWrap :: 7;
;
	MTLStencilOperationKeep :: 0;
	MTLStencilOperationZero :: 1;
	MTLStencilOperationReplace :: 2;
	MTLStencilOperationIncrementClamp :: 3;
	MTLStencilOperationDecrementClamp :: 4;
	MTLStencilOperationInvert :: 5;
	MTLStencilOperationIncrementWrap :: 6;
	MTLStencilOperationDecrementWrap :: 7;
}

MTL4CounterHeapType :: enum NSInteger {
	Invalid;
	Timestamp;
;
	MTL4CounterHeapTypeInvalid;
	MTL4CounterHeapTypeTimestamp;
}

MTL4TimestampGranularity :: enum NSInteger {
	Relaxed :: 0;
	Precise :: 1;
;
	MTL4TimestampGranularityRelaxed :: 0;
	MTL4TimestampGranularityPrecise :: 1;
}

MTLPurgeableState :: enum NSUInteger {
	KeepCurrent :: 1;
	NonVolatile :: 2;
	Volatile :: 3;
	Empty :: 4;
;
	MTLPurgeableStateKeepCurrent :: 1;
	MTLPurgeableStateNonVolatile :: 2;
	MTLPurgeableStateVolatile :: 3;
	MTLPurgeableStateEmpty :: 4;
}

MTLCPUCacheMode :: enum NSUInteger {
	DefaultCache :: 0;
	WriteCombined :: 1;
;
	MTLCPUCacheModeDefaultCache :: 0;
	MTLCPUCacheModeWriteCombined :: 1;
}

MTLStorageMode :: enum NSUInteger {
	Shared :: 0;
	Managed :: 1;
	Private :: 2;
	Memoryless :: 3;
;
	MTLStorageModeShared :: 0;
	MTLStorageModeManaged :: 1;
	MTLStorageModePrivate :: 2;
	MTLStorageModeMemoryless :: 3;
}

MTLHazardTrackingMode :: enum NSUInteger {
	Default :: 0;
	Untracked :: 1;
	Tracked :: 2;
;
	MTLHazardTrackingModeDefault :: 0;
	MTLHazardTrackingModeUntracked :: 1;
	MTLHazardTrackingModeTracked :: 2;
}

MTLSparsePageSize :: enum NSInteger {
;
	MTLSparsePageSize16 :: 101;
	MTLSparsePageSize64 :: 102;
	MTLSparsePageSize256 :: 103;
}

MTLBufferSparseTier :: enum NSInteger {
	None :: 0;
;
	MTLBufferSparseTierNone :: 0;
	MTLBufferSparseTier1 :: 1;
}

MTLTextureSparseTier :: enum NSInteger {
	None :: 0;
;
	MTLTextureSparseTierNone :: 0;
	MTLTextureSparseTier1 :: 1;
	MTLTextureSparseTier2 :: 2;
}

MTLMatrixLayout :: enum NSInteger {
	ColumnMajor :: 0;
	RowMajor :: 1;
;
	MTLMatrixLayoutColumnMajor :: 0;
	MTLMatrixLayoutRowMajor :: 1;
}

MTLMotionBorderMode :: enum u32 {
	Clamp :: 0;
	Vanish :: 1;
;
	MTLMotionBorderModeClamp :: 0;
	MTLMotionBorderModeVanish :: 1;
}

MTLCurveType :: enum NSInteger {
	Round :: 0;
	Flat :: 1;
;
	MTLCurveTypeRound :: 0;
	MTLCurveTypeFlat :: 1;
}

MTLCurveBasis :: enum NSInteger {
	BSpline :: 0;
	CatmullRom :: 1;
	Linear :: 2;
	Bezier :: 3;
;
	MTLCurveBasisBSpline :: 0;
	MTLCurveBasisCatmullRom :: 1;
	MTLCurveBasisLinear :: 2;
	MTLCurveBasisBezier :: 3;
}

MTLCurveEndCaps :: enum NSInteger {
	None :: 0;
	Disk :: 1;
	Sphere :: 2;
;
	MTLCurveEndCapsNone :: 0;
	MTLCurveEndCapsDisk :: 1;
	MTLCurveEndCapsSphere :: 2;
}

MTLAccelerationStructureInstanceDescriptorType :: enum NSUInteger {
	Default :: 0;
	UserID :: 1;
	Motion :: 2;
	Indirect :: 3;
	IndirectMotion :: 4;
;
	MTLAccelerationStructureInstanceDescriptorTypeDefault :: 0;
	MTLAccelerationStructureInstanceDescriptorTypeUserID :: 1;
	MTLAccelerationStructureInstanceDescriptorTypeMotion :: 2;
	MTLAccelerationStructureInstanceDescriptorTypeIndirect :: 3;
	MTLAccelerationStructureInstanceDescriptorTypeIndirectMotion :: 4;
}

MTLTransformType :: enum NSInteger {
	PackedFloat4x3 :: 0;
	Component :: 1;
;
	MTLTransformTypePackedFloat4x3 :: 0;
	MTLTransformTypeComponent :: 1;
}

MTLIOCompressionMethod :: enum NSInteger {
	Zlib :: 0;
	LZFSE :: 1;
	LZ4 :: 2;
	LZMA :: 3;
	LZBitmap :: 4;
;
	MTLIOCompressionMethodZlib :: 0;
	MTLIOCompressionMethodLZFSE :: 1;
	MTLIOCompressionMethodLZ4 :: 2;
	MTLIOCompressionMethodLZMA :: 3;
	MTLIOCompressionMethodLZBitmap :: 4;
}

MTLFeatureSet :: enum NSUInteger {
	iOS_GPUFamily1_v1 :: 0;
	iOS_GPUFamily2_v1 :: 1;
	iOS_GPUFamily1_v2 :: 2;
	iOS_GPUFamily2_v2 :: 3;
	iOS_GPUFamily3_v1 :: 4;
	iOS_GPUFamily1_v3 :: 5;
	iOS_GPUFamily2_v3 :: 6;
	iOS_GPUFamily3_v2 :: 7;
	iOS_GPUFamily1_v4 :: 8;
	iOS_GPUFamily2_v4 :: 9;
	iOS_GPUFamily3_v3 :: 10;
	iOS_GPUFamily4_v1 :: 11;
	iOS_GPUFamily1_v5 :: 12;
	iOS_GPUFamily2_v5 :: 13;
	iOS_GPUFamily3_v4 :: 14;
	iOS_GPUFamily4_v2 :: 15;
	iOS_GPUFamily5_v1 :: 16;
	macOS_GPUFamily1_v1 :: 10000;
	OSX_GPUFamily1_v1 :: 10000;
	macOS_GPUFamily1_v2 :: 10001;
	OSX_GPUFamily1_v2 :: 10001;
	macOS_ReadWriteTextureTier2 :: 10002;
	OSX_ReadWriteTextureTier2 :: 10002;
	macOS_GPUFamily1_v3 :: 10003;
	macOS_GPUFamily1_v4 :: 10004;
	macOS_GPUFamily2_v1 :: 10005;
	watchOS_GPUFamily1_v1 :: 20000;
	WatchOS_GPUFamily1_v1 :: 20000;
	watchOS_GPUFamily2_v1 :: 20001;
	WatchOS_GPUFamily2_v1 :: 20001;
	tvOS_GPUFamily1_v1 :: 30000;
	TVOS_GPUFamily1_v1 :: 30000;
	tvOS_GPUFamily1_v2 :: 30001;
	tvOS_GPUFamily1_v3 :: 30002;
	tvOS_GPUFamily2_v1 :: 30003;
	tvOS_GPUFamily1_v4 :: 30004;
	tvOS_GPUFamily2_v2 :: 30005;
;
	MTLFeatureSet_iOS_GPUFamily1_v1 :: 0;
	MTLFeatureSet_iOS_GPUFamily2_v1 :: 1;
	MTLFeatureSet_iOS_GPUFamily1_v2 :: 2;
	MTLFeatureSet_iOS_GPUFamily2_v2 :: 3;
	MTLFeatureSet_iOS_GPUFamily3_v1 :: 4;
	MTLFeatureSet_iOS_GPUFamily1_v3 :: 5;
	MTLFeatureSet_iOS_GPUFamily2_v3 :: 6;
	MTLFeatureSet_iOS_GPUFamily3_v2 :: 7;
	MTLFeatureSet_iOS_GPUFamily1_v4 :: 8;
	MTLFeatureSet_iOS_GPUFamily2_v4 :: 9;
	MTLFeatureSet_iOS_GPUFamily3_v3 :: 10;
	MTLFeatureSet_iOS_GPUFamily4_v1 :: 11;
	MTLFeatureSet_iOS_GPUFamily1_v5 :: 12;
	MTLFeatureSet_iOS_GPUFamily2_v5 :: 13;
	MTLFeatureSet_iOS_GPUFamily3_v4 :: 14;
	MTLFeatureSet_iOS_GPUFamily4_v2 :: 15;
	MTLFeatureSet_iOS_GPUFamily5_v1 :: 16;
	MTLFeatureSet_macOS_GPUFamily1_v1 :: 10000;
	MTLFeatureSet_OSX_GPUFamily1_v1 :: 10000;
	MTLFeatureSet_macOS_GPUFamily1_v2 :: 10001;
	MTLFeatureSet_OSX_GPUFamily1_v2 :: 10001;
	MTLFeatureSet_macOS_ReadWriteTextureTier2 :: 10002;
	MTLFeatureSet_OSX_ReadWriteTextureTier2 :: 10002;
	MTLFeatureSet_macOS_GPUFamily1_v3 :: 10003;
	MTLFeatureSet_macOS_GPUFamily1_v4 :: 10004;
	MTLFeatureSet_macOS_GPUFamily2_v1 :: 10005;
	MTLFeatureSet_watchOS_GPUFamily1_v1 :: 20000;
	MTLFeatureSet_WatchOS_GPUFamily1_v1 :: 20000;
	MTLFeatureSet_watchOS_GPUFamily2_v1 :: 20001;
	MTLFeatureSet_WatchOS_GPUFamily2_v1 :: 20001;
	MTLFeatureSet_tvOS_GPUFamily1_v1 :: 30000;
	MTLFeatureSet_TVOS_GPUFamily1_v1 :: 30000;
	MTLFeatureSet_tvOS_GPUFamily1_v2 :: 30001;
	MTLFeatureSet_tvOS_GPUFamily1_v3 :: 30002;
	MTLFeatureSet_tvOS_GPUFamily2_v1 :: 30003;
	MTLFeatureSet_tvOS_GPUFamily1_v4 :: 30004;
	MTLFeatureSet_tvOS_GPUFamily2_v2 :: 30005;
}

MTLGPUFamily :: enum NSInteger {
	Apple1 :: 1001;
	Apple2 :: 1002;
	Apple3 :: 1003;
	Apple4 :: 1004;
	Apple5 :: 1005;
	Apple6 :: 1006;
	Apple7 :: 1007;
	Apple8 :: 1008;
	Apple9 :: 1009;
	Apple10 :: 1010;
	Mac1 :: 2001;
	Mac2 :: 2002;
	Common1 :: 3001;
	Common2 :: 3002;
	Common3 :: 3003;
	MacCatalyst1 :: 4001;
	MacCatalyst2 :: 4002;
	Metal3 :: 5001;
	Metal4 :: 5002;
;
	MTLGPUFamilyApple1 :: 1001;
	MTLGPUFamilyApple2 :: 1002;
	MTLGPUFamilyApple3 :: 1003;
	MTLGPUFamilyApple4 :: 1004;
	MTLGPUFamilyApple5 :: 1005;
	MTLGPUFamilyApple6 :: 1006;
	MTLGPUFamilyApple7 :: 1007;
	MTLGPUFamilyApple8 :: 1008;
	MTLGPUFamilyApple9 :: 1009;
	MTLGPUFamilyApple10 :: 1010;
	MTLGPUFamilyMac1 :: 2001;
	MTLGPUFamilyMac2 :: 2002;
	MTLGPUFamilyCommon1 :: 3001;
	MTLGPUFamilyCommon2 :: 3002;
	MTLGPUFamilyCommon3 :: 3003;
	MTLGPUFamilyMacCatalyst1 :: 4001;
	MTLGPUFamilyMacCatalyst2 :: 4002;
	MTLGPUFamilyMetal3 :: 5001;
	MTLGPUFamilyMetal4 :: 5002;
}

MTLDeviceLocation :: enum NSUInteger {
	BuiltIn :: 0;
	Slot :: 1;
	External :: 2;
	Unspecified :: 0xFFFFFFFFFFFFFFFF;
;
	MTLDeviceLocationBuiltIn :: 0;
	MTLDeviceLocationSlot :: 1;
	MTLDeviceLocationExternal :: 2;
	MTLDeviceLocationUnspecified :: 0xFFFFFFFFFFFFFFFF;
}

MTLReadWriteTextureTier :: enum NSUInteger {
	None :: 0;
;
	MTLReadWriteTextureTierNone :: 0;
	MTLReadWriteTextureTier1 :: 1;
	MTLReadWriteTextureTier2 :: 2;
}

MTLArgumentBuffersTier :: enum NSUInteger {
;
	MTLArgumentBuffersTier1 :: 0;
	MTLArgumentBuffersTier2 :: 1;
}

MTLSparseTextureRegionAlignmentMode :: enum NSUInteger {
	Outward :: 0;
	Inward :: 1;
;
	MTLSparseTextureRegionAlignmentModeOutward :: 0;
	MTLSparseTextureRegionAlignmentModeInward :: 1;
}

MTLCounterSamplingPoint :: enum NSUInteger {
	AtStageBoundary :: 0;
	AtDrawBoundary :: 1;
	AtDispatchBoundary :: 2;
	AtTileDispatchBoundary :: 3;
	AtBlitBoundary :: 4;
;
	MTLCounterSamplingPointAtStageBoundary :: 0;
	MTLCounterSamplingPointAtDrawBoundary :: 1;
	MTLCounterSamplingPointAtDispatchBoundary :: 2;
	MTLCounterSamplingPointAtTileDispatchBoundary :: 3;
	MTLCounterSamplingPointAtBlitBoundary :: 4;
}

MTLIndexType :: enum NSUInteger {
	UInt16 :: 0;
	UInt32 :: 1;
;
	MTLIndexTypeUInt16 :: 0;
	MTLIndexTypeUInt32 :: 1;
}

MTLBindingType :: enum NSInteger {
	Buffer :: 0;
	ThreadgroupMemory :: 1;
	Texture :: 2;
	Sampler :: 3;
	ImageblockData :: 16;
	Imageblock :: 17;
	VisibleFunctionTable :: 24;
	PrimitiveAccelerationStructure :: 25;
	InstanceAccelerationStructure :: 26;
	IntersectionFunctionTable :: 27;
	ObjectPayload :: 34;
	Tensor :: 37;
;
	MTLBindingTypeBuffer :: 0;
	MTLBindingTypeThreadgroupMemory :: 1;
	MTLBindingTypeTexture :: 2;
	MTLBindingTypeSampler :: 3;
	MTLBindingTypeImageblockData :: 16;
	MTLBindingTypeImageblock :: 17;
	MTLBindingTypeVisibleFunctionTable :: 24;
	MTLBindingTypePrimitiveAccelerationStructure :: 25;
	MTLBindingTypeInstanceAccelerationStructure :: 26;
	MTLBindingTypeIntersectionFunctionTable :: 27;
	MTLBindingTypeObjectPayload :: 34;
	MTLBindingTypeTensor :: 37;
}

MTLArgumentType :: enum NSUInteger {
	Buffer :: 0;
	ThreadgroupMemory :: 1;
	Texture :: 2;
	Sampler :: 3;
	ImageblockData :: 16;
	Imageblock :: 17;
	VisibleFunctionTable :: 24;
	PrimitiveAccelerationStructure :: 25;
	InstanceAccelerationStructure :: 26;
	IntersectionFunctionTable :: 27;
;
	MTLArgumentTypeBuffer :: 0;
	MTLArgumentTypeThreadgroupMemory :: 1;
	MTLArgumentTypeTexture :: 2;
	MTLArgumentTypeSampler :: 3;
	MTLArgumentTypeImageblockData :: 16;
	MTLArgumentTypeImageblock :: 17;
	MTLArgumentTypeVisibleFunctionTable :: 24;
	MTLArgumentTypePrimitiveAccelerationStructure :: 25;
	MTLArgumentTypeInstanceAccelerationStructure :: 26;
	MTLArgumentTypeIntersectionFunctionTable :: 27;
}

MTLBindingAccess :: enum NSUInteger {
	ReadOnly :: 0;
	ReadWrite :: 1;
	WriteOnly :: 2;
	sReadOnly :: 0;
	sReadWrite :: 1;
	sWriteOnly :: 2;
;
	MTLBindingAccessReadOnly :: 0;
	MTLBindingAccessReadWrite :: 1;
	MTLBindingAccessWriteOnly :: 2;
	MTLArgumentAccessReadOnly :: 0;
	MTLArgumentAccessReadWrite :: 1;
	MTLArgumentAccessWriteOnly :: 2;
}

MTLFunctionLogType :: enum NSUInteger {
	Validation :: 0;
;
	MTLFunctionLogTypeValidation :: 0;
}

MTL4LogicalToPhysicalColorAttachmentMappingState :: enum NSInteger {
	Identity :: 0;
	Inherited :: 1;
;
	MTL4LogicalToPhysicalColorAttachmentMappingStateIdentity :: 0;
	MTL4LogicalToPhysicalColorAttachmentMappingStateInherited :: 1;
}

MTLLoadAction :: enum NSUInteger {
	DontCare :: 0;
	Load :: 1;
	Clear :: 2;
;
	MTLLoadActionDontCare :: 0;
	MTLLoadActionLoad :: 1;
	MTLLoadActionClear :: 2;
}

MTLStoreAction :: enum NSUInteger {
	DontCare :: 0;
	Store :: 1;
	MultisampleResolve :: 2;
	StoreAndMultisampleResolve :: 3;
	Unknown :: 4;
	CustomSampleDepthStore :: 5;
;
	MTLStoreActionDontCare :: 0;
	MTLStoreActionStore :: 1;
	MTLStoreActionMultisampleResolve :: 2;
	MTLStoreActionStoreAndMultisampleResolve :: 3;
	MTLStoreActionUnknown :: 4;
	MTLStoreActionCustomSampleDepthStore :: 5;
}

MTLVisibilityResultType :: enum NSInteger {
	Reset :: 0;
	Accumulate :: 1;
;
	MTLVisibilityResultTypeReset :: 0;
	MTLVisibilityResultTypeAccumulate :: 1;
}

MTLMultisampleDepthResolveFilter :: enum NSUInteger {
	Sample0 :: 0;
	Min :: 1;
	Max :: 2;
;
	MTLMultisampleDepthResolveFilterSample0 :: 0;
	MTLMultisampleDepthResolveFilterMin :: 1;
	MTLMultisampleDepthResolveFilterMax :: 2;
}

MTLMultisampleStencilResolveFilter :: enum NSUInteger {
	Sample0 :: 0;
	DepthResolvedSample :: 1;
;
	MTLMultisampleStencilResolveFilterSample0 :: 0;
	MTLMultisampleStencilResolveFilterDepthResolvedSample :: 1;
}

MTLHeapType :: enum NSInteger {
	Automatic :: 0;
	Placement :: 1;
	Sparse :: 2;
;
	MTLHeapTypeAutomatic :: 0;
	MTLHeapTypePlacement :: 1;
	MTLHeapTypeSparse :: 2;
}

MTLVertexFormat :: enum NSUInteger {
	Invalid :: 0;
	UChar2 :: 1;
	UChar3 :: 2;
	UChar4 :: 3;
	Char2 :: 4;
	Char3 :: 5;
	Char4 :: 6;
	UChar2Normalized :: 7;
	UChar3Normalized :: 8;
	UChar4Normalized :: 9;
	Char2Normalized :: 10;
	Char3Normalized :: 11;
	Char4Normalized :: 12;
	UShort2 :: 13;
	UShort3 :: 14;
	UShort4 :: 15;
	Short2 :: 16;
	Short3 :: 17;
	Short4 :: 18;
	UShort2Normalized :: 19;
	UShort3Normalized :: 20;
	UShort4Normalized :: 21;
	Short2Normalized :: 22;
	Short3Normalized :: 23;
	Short4Normalized :: 24;
	Half2 :: 25;
	Half3 :: 26;
	Half4 :: 27;
	Float :: 28;
	Float2 :: 29;
	Float3 :: 30;
	Float4 :: 31;
	Int :: 32;
	Int2 :: 33;
	Int3 :: 34;
	Int4 :: 35;
	UInt :: 36;
	UInt2 :: 37;
	UInt3 :: 38;
	UInt4 :: 39;
	Int1010102Normalized :: 40;
	UInt1010102Normalized :: 41;
	UChar4Normalized_BGRA :: 42;
	UChar :: 45;
	Char :: 46;
	UCharNormalized :: 47;
	CharNormalized :: 48;
	UShort :: 49;
	Short :: 50;
	UShortNormalized :: 51;
	ShortNormalized :: 52;
	Half :: 53;
	FloatRG11B10 :: 54;
	FloatRGB9E5 :: 55;
;
	MTLVertexFormatInvalid :: 0;
	MTLVertexFormatUChar2 :: 1;
	MTLVertexFormatUChar3 :: 2;
	MTLVertexFormatUChar4 :: 3;
	MTLVertexFormatChar2 :: 4;
	MTLVertexFormatChar3 :: 5;
	MTLVertexFormatChar4 :: 6;
	MTLVertexFormatUChar2Normalized :: 7;
	MTLVertexFormatUChar3Normalized :: 8;
	MTLVertexFormatUChar4Normalized :: 9;
	MTLVertexFormatChar2Normalized :: 10;
	MTLVertexFormatChar3Normalized :: 11;
	MTLVertexFormatChar4Normalized :: 12;
	MTLVertexFormatUShort2 :: 13;
	MTLVertexFormatUShort3 :: 14;
	MTLVertexFormatUShort4 :: 15;
	MTLVertexFormatShort2 :: 16;
	MTLVertexFormatShort3 :: 17;
	MTLVertexFormatShort4 :: 18;
	MTLVertexFormatUShort2Normalized :: 19;
	MTLVertexFormatUShort3Normalized :: 20;
	MTLVertexFormatUShort4Normalized :: 21;
	MTLVertexFormatShort2Normalized :: 22;
	MTLVertexFormatShort3Normalized :: 23;
	MTLVertexFormatShort4Normalized :: 24;
	MTLVertexFormatHalf2 :: 25;
	MTLVertexFormatHalf3 :: 26;
	MTLVertexFormatHalf4 :: 27;
	MTLVertexFormatFloat :: 28;
	MTLVertexFormatFloat2 :: 29;
	MTLVertexFormatFloat3 :: 30;
	MTLVertexFormatFloat4 :: 31;
	MTLVertexFormatInt :: 32;
	MTLVertexFormatInt2 :: 33;
	MTLVertexFormatInt3 :: 34;
	MTLVertexFormatInt4 :: 35;
	MTLVertexFormatUInt :: 36;
	MTLVertexFormatUInt2 :: 37;
	MTLVertexFormatUInt3 :: 38;
	MTLVertexFormatUInt4 :: 39;
	MTLVertexFormatInt1010102Normalized :: 40;
	MTLVertexFormatUInt1010102Normalized :: 41;
	MTLVertexFormatUChar4Normalized_BGRA :: 42;
	MTLVertexFormatUChar :: 45;
	MTLVertexFormatChar :: 46;
	MTLVertexFormatUCharNormalized :: 47;
	MTLVertexFormatCharNormalized :: 48;
	MTLVertexFormatUShort :: 49;
	MTLVertexFormatShort :: 50;
	MTLVertexFormatUShortNormalized :: 51;
	MTLVertexFormatShortNormalized :: 52;
	MTLVertexFormatHalf :: 53;
	MTLVertexFormatFloatRG11B10 :: 54;
	MTLVertexFormatFloatRGB9E5 :: 55;
}

MTLVertexStepFunction :: enum NSUInteger {
	Constant :: 0;
	PerVertex :: 1;
	PerInstance :: 2;
	PerPatch :: 3;
	PerPatchControlPoint :: 4;
;
	MTLVertexStepFunctionConstant :: 0;
	MTLVertexStepFunctionPerVertex :: 1;
	MTLVertexStepFunctionPerInstance :: 2;
	MTLVertexStepFunctionPerPatch :: 3;
	MTLVertexStepFunctionPerPatchControlPoint :: 4;
}

MTLIOStatus :: enum NSInteger {
	Pending :: 0;
	Cancelled :: 1;
	Error :: 2;
	Complete :: 3;
;
	MTLIOStatusPending :: 0;
	MTLIOStatusCancelled :: 1;
	MTLIOStatusError :: 2;
	MTLIOStatusComplete :: 3;
}

MTLLogLevel :: enum NSInteger {
	Undefined :: 0;
	Debug :: 1;
	Info :: 2;
	Notice :: 3;
	Error :: 4;
	Fault :: 5;
;
	MTLLogLevelUndefined :: 0;
	MTLLogLevelDebug :: 1;
	MTLLogLevelInfo :: 2;
	MTLLogLevelNotice :: 3;
	MTLLogLevelError :: 4;
	MTLLogLevelFault :: 5;
}

MTLLogStateError :: enum NSUInteger {
	InvalidSize :: 1;
	Invalid :: 2;
;
	MTLLogStateErrorInvalidSize :: 1;
	MTLLogStateErrorInvalid :: 2;
}

MTLPatchType :: enum NSUInteger {
	None :: 0;
	Triangle :: 1;
	Quad :: 2;
;
	MTLPatchTypeNone :: 0;
	MTLPatchTypeTriangle :: 1;
	MTLPatchTypeQuad :: 2;
}

MTLFunctionType :: enum NSUInteger {
	Vertex :: 1;
	Fragment :: 2;
	Kernel :: 3;
	Visible :: 5;
	Intersection :: 6;
	Mesh :: 7;
	Object :: 8;
;
	MTLFunctionTypeVertex :: 1;
	MTLFunctionTypeFragment :: 2;
	MTLFunctionTypeKernel :: 3;
	MTLFunctionTypeVisible :: 5;
	MTLFunctionTypeIntersection :: 6;
	MTLFunctionTypeMesh :: 7;
	MTLFunctionTypeObject :: 8;
}

MTLLanguageVersion :: enum NSUInteger {
;
	MTLLanguageVersion1_0 :: 65536;
	MTLLanguageVersion1_1 :: 65537;
	MTLLanguageVersion1_2 :: 65538;
	MTLLanguageVersion2_0 :: 131072;
	MTLLanguageVersion2_1 :: 131073;
	MTLLanguageVersion2_2 :: 131074;
	MTLLanguageVersion2_3 :: 131075;
	MTLLanguageVersion2_4 :: 131076;
	MTLLanguageVersion3_0 :: 196608;
	MTLLanguageVersion3_1 :: 196609;
	MTLLanguageVersion3_2 :: 196610;
	MTLLanguageVersion4_0 :: 262144;
}

MTLLibraryType :: enum NSInteger {
	Executable :: 0;
	Dynamic :: 1;
;
	MTLLibraryTypeExecutable :: 0;
	MTLLibraryTypeDynamic :: 1;
}

MTLLibraryOptimizationLevel :: enum NSInteger {
	Default :: 0;
	Size :: 1;
;
	MTLLibraryOptimizationLevelDefault :: 0;
	MTLLibraryOptimizationLevelSize :: 1;
}

MTLCompileSymbolVisibility :: enum NSInteger {
	Default :: 0;
	Hidden :: 1;
;
	MTLCompileSymbolVisibilityDefault :: 0;
	MTLCompileSymbolVisibilityHidden :: 1;
}

MTLMathMode :: enum NSInteger {
	Safe :: 0;
	Relaxed :: 1;
	Fast :: 2;
;
	MTLMathModeSafe :: 0;
	MTLMathModeRelaxed :: 1;
	MTLMathModeFast :: 2;
}

MTLMathFloatingPointFunctions :: enum NSInteger {
	Fast :: 0;
	Precise :: 1;
;
	MTLMathFloatingPointFunctionsFast :: 0;
	MTLMathFloatingPointFunctionsPrecise :: 1;
}

MTLLibraryError :: enum NSUInteger {
	Unsupported :: 1;
	Internal :: 2;
	CompileFailure :: 3;
	CompileWarning :: 4;
	FunctionNotFound :: 5;
	FileNotFound :: 6;
;
	MTLLibraryErrorUnsupported :: 1;
	MTLLibraryErrorInternal :: 2;
	MTLLibraryErrorCompileFailure :: 3;
	MTLLibraryErrorCompileWarning :: 4;
	MTLLibraryErrorFunctionNotFound :: 5;
	MTLLibraryErrorFileNotFound :: 6;
}

MTLPixelFormat :: enum NSUInteger {
	Invalid :: 0;
	A8Unorm :: 1;
	R8Unorm :: 10;
	R8Unorm_sRGB :: 11;
	R8Snorm :: 12;
	R8Uint :: 13;
	R8Sint :: 14;
	R16Unorm :: 20;
	R16Snorm :: 22;
	R16Uint :: 23;
	R16Sint :: 24;
	R16Float :: 25;
	RG8Unorm :: 30;
	RG8Unorm_sRGB :: 31;
	RG8Snorm :: 32;
	RG8Uint :: 33;
	RG8Sint :: 34;
	B5G6R5Unorm :: 40;
	A1BGR5Unorm :: 41;
	ABGR4Unorm :: 42;
	BGR5A1Unorm :: 43;
	R32Uint :: 53;
	R32Sint :: 54;
	R32Float :: 55;
	RG16Unorm :: 60;
	RG16Snorm :: 62;
	RG16Uint :: 63;
	RG16Sint :: 64;
	RG16Float :: 65;
	RGBA8Unorm :: 70;
	RGBA8Unorm_sRGB :: 71;
	RGBA8Snorm :: 72;
	RGBA8Uint :: 73;
	RGBA8Sint :: 74;
	BGRA8Unorm :: 80;
	BGRA8Unorm_sRGB :: 81;
	RGB10A2Unorm :: 90;
	RGB10A2Uint :: 91;
	RG11B10Float :: 92;
	RGB9E5Float :: 93;
	BGR10A2Unorm :: 94;
	BGR10_XR :: 554;
	BGR10_XR_sRGB :: 555;
	RG32Uint :: 103;
	RG32Sint :: 104;
	RG32Float :: 105;
	RGBA16Unorm :: 110;
	RGBA16Snorm :: 112;
	RGBA16Uint :: 113;
	RGBA16Sint :: 114;
	RGBA16Float :: 115;
	BGRA10_XR :: 552;
	BGRA10_XR_sRGB :: 553;
	RGBA32Uint :: 123;
	RGBA32Sint :: 124;
	RGBA32Float :: 125;
	BC1_RGBA :: 130;
	BC1_RGBA_sRGB :: 131;
	BC2_RGBA :: 132;
	BC2_RGBA_sRGB :: 133;
	BC3_RGBA :: 134;
	BC3_RGBA_sRGB :: 135;
	BC4_RUnorm :: 140;
	BC4_RSnorm :: 141;
	BC5_RGUnorm :: 142;
	BC5_RGSnorm :: 143;
	BC6H_RGBFloat :: 150;
	BC6H_RGBUfloat :: 151;
	BC7_RGBAUnorm :: 152;
	BC7_RGBAUnorm_sRGB :: 153;
	PVRTC_RGB_2BPP :: 160;
	PVRTC_RGB_2BPP_sRGB :: 161;
	PVRTC_RGB_4BPP :: 162;
	PVRTC_RGB_4BPP_sRGB :: 163;
	PVRTC_RGBA_2BPP :: 164;
	PVRTC_RGBA_2BPP_sRGB :: 165;
	PVRTC_RGBA_4BPP :: 166;
	PVRTC_RGBA_4BPP_sRGB :: 167;
	EAC_R11Unorm :: 170;
	EAC_R11Snorm :: 172;
	EAC_RG11Unorm :: 174;
	EAC_RG11Snorm :: 176;
	EAC_RGBA8 :: 178;
	EAC_RGBA8_sRGB :: 179;
	ETC2_RGB8 :: 180;
	ETC2_RGB8_sRGB :: 181;
	ETC2_RGB8A1 :: 182;
	ETC2_RGB8A1_sRGB :: 183;
	ASTC_4x4_sRGB :: 186;
	ASTC_5x4_sRGB :: 187;
	ASTC_5x5_sRGB :: 188;
	ASTC_6x5_sRGB :: 189;
	ASTC_6x6_sRGB :: 190;
	ASTC_8x5_sRGB :: 192;
	ASTC_8x6_sRGB :: 193;
	ASTC_8x8_sRGB :: 194;
	ASTC_10x5_sRGB :: 195;
	ASTC_10x6_sRGB :: 196;
	ASTC_10x8_sRGB :: 197;
	ASTC_10x10_sRGB :: 198;
	ASTC_12x10_sRGB :: 199;
	ASTC_12x12_sRGB :: 200;
	ASTC_4x4_LDR :: 204;
	ASTC_5x4_LDR :: 205;
	ASTC_5x5_LDR :: 206;
	ASTC_6x5_LDR :: 207;
	ASTC_6x6_LDR :: 208;
	ASTC_8x5_LDR :: 210;
	ASTC_8x6_LDR :: 211;
	ASTC_8x8_LDR :: 212;
	ASTC_10x5_LDR :: 213;
	ASTC_10x6_LDR :: 214;
	ASTC_10x8_LDR :: 215;
	ASTC_10x10_LDR :: 216;
	ASTC_12x10_LDR :: 217;
	ASTC_12x12_LDR :: 218;
	ASTC_4x4_HDR :: 222;
	ASTC_5x4_HDR :: 223;
	ASTC_5x5_HDR :: 224;
	ASTC_6x5_HDR :: 225;
	ASTC_6x6_HDR :: 226;
	ASTC_8x5_HDR :: 228;
	ASTC_8x6_HDR :: 229;
	ASTC_8x8_HDR :: 230;
	ASTC_10x5_HDR :: 231;
	ASTC_10x6_HDR :: 232;
	ASTC_10x8_HDR :: 233;
	ASTC_10x10_HDR :: 234;
	ASTC_12x10_HDR :: 235;
	ASTC_12x12_HDR :: 236;
	GBGR422 :: 240;
	BGRG422 :: 241;
	Depth16Unorm :: 250;
	Depth32Float :: 252;
	Stencil8 :: 253;
	Depth24Unorm_Stencil8 :: 255;
	Depth32Float_Stencil8 :: 260;
	X32_Stencil8 :: 261;
	X24_Stencil8 :: 262;
	Unspecialized :: 263;
;
	MTLPixelFormatInvalid :: 0;
	MTLPixelFormatA8Unorm :: 1;
	MTLPixelFormatR8Unorm :: 10;
	MTLPixelFormatR8Unorm_sRGB :: 11;
	MTLPixelFormatR8Snorm :: 12;
	MTLPixelFormatR8Uint :: 13;
	MTLPixelFormatR8Sint :: 14;
	MTLPixelFormatR16Unorm :: 20;
	MTLPixelFormatR16Snorm :: 22;
	MTLPixelFormatR16Uint :: 23;
	MTLPixelFormatR16Sint :: 24;
	MTLPixelFormatR16Float :: 25;
	MTLPixelFormatRG8Unorm :: 30;
	MTLPixelFormatRG8Unorm_sRGB :: 31;
	MTLPixelFormatRG8Snorm :: 32;
	MTLPixelFormatRG8Uint :: 33;
	MTLPixelFormatRG8Sint :: 34;
	MTLPixelFormatB5G6R5Unorm :: 40;
	MTLPixelFormatA1BGR5Unorm :: 41;
	MTLPixelFormatABGR4Unorm :: 42;
	MTLPixelFormatBGR5A1Unorm :: 43;
	MTLPixelFormatR32Uint :: 53;
	MTLPixelFormatR32Sint :: 54;
	MTLPixelFormatR32Float :: 55;
	MTLPixelFormatRG16Unorm :: 60;
	MTLPixelFormatRG16Snorm :: 62;
	MTLPixelFormatRG16Uint :: 63;
	MTLPixelFormatRG16Sint :: 64;
	MTLPixelFormatRG16Float :: 65;
	MTLPixelFormatRGBA8Unorm :: 70;
	MTLPixelFormatRGBA8Unorm_sRGB :: 71;
	MTLPixelFormatRGBA8Snorm :: 72;
	MTLPixelFormatRGBA8Uint :: 73;
	MTLPixelFormatRGBA8Sint :: 74;
	MTLPixelFormatBGRA8Unorm :: 80;
	MTLPixelFormatBGRA8Unorm_sRGB :: 81;
	MTLPixelFormatRGB10A2Unorm :: 90;
	MTLPixelFormatRGB10A2Uint :: 91;
	MTLPixelFormatRG11B10Float :: 92;
	MTLPixelFormatRGB9E5Float :: 93;
	MTLPixelFormatBGR10A2Unorm :: 94;
	MTLPixelFormatBGR10_XR :: 554;
	MTLPixelFormatBGR10_XR_sRGB :: 555;
	MTLPixelFormatRG32Uint :: 103;
	MTLPixelFormatRG32Sint :: 104;
	MTLPixelFormatRG32Float :: 105;
	MTLPixelFormatRGBA16Unorm :: 110;
	MTLPixelFormatRGBA16Snorm :: 112;
	MTLPixelFormatRGBA16Uint :: 113;
	MTLPixelFormatRGBA16Sint :: 114;
	MTLPixelFormatRGBA16Float :: 115;
	MTLPixelFormatBGRA10_XR :: 552;
	MTLPixelFormatBGRA10_XR_sRGB :: 553;
	MTLPixelFormatRGBA32Uint :: 123;
	MTLPixelFormatRGBA32Sint :: 124;
	MTLPixelFormatRGBA32Float :: 125;
	MTLPixelFormatBC1_RGBA :: 130;
	MTLPixelFormatBC1_RGBA_sRGB :: 131;
	MTLPixelFormatBC2_RGBA :: 132;
	MTLPixelFormatBC2_RGBA_sRGB :: 133;
	MTLPixelFormatBC3_RGBA :: 134;
	MTLPixelFormatBC3_RGBA_sRGB :: 135;
	MTLPixelFormatBC4_RUnorm :: 140;
	MTLPixelFormatBC4_RSnorm :: 141;
	MTLPixelFormatBC5_RGUnorm :: 142;
	MTLPixelFormatBC5_RGSnorm :: 143;
	MTLPixelFormatBC6H_RGBFloat :: 150;
	MTLPixelFormatBC6H_RGBUfloat :: 151;
	MTLPixelFormatBC7_RGBAUnorm :: 152;
	MTLPixelFormatBC7_RGBAUnorm_sRGB :: 153;
	MTLPixelFormatPVRTC_RGB_2BPP :: 160;
	MTLPixelFormatPVRTC_RGB_2BPP_sRGB :: 161;
	MTLPixelFormatPVRTC_RGB_4BPP :: 162;
	MTLPixelFormatPVRTC_RGB_4BPP_sRGB :: 163;
	MTLPixelFormatPVRTC_RGBA_2BPP :: 164;
	MTLPixelFormatPVRTC_RGBA_2BPP_sRGB :: 165;
	MTLPixelFormatPVRTC_RGBA_4BPP :: 166;
	MTLPixelFormatPVRTC_RGBA_4BPP_sRGB :: 167;
	MTLPixelFormatEAC_R11Unorm :: 170;
	MTLPixelFormatEAC_R11Snorm :: 172;
	MTLPixelFormatEAC_RG11Unorm :: 174;
	MTLPixelFormatEAC_RG11Snorm :: 176;
	MTLPixelFormatEAC_RGBA8 :: 178;
	MTLPixelFormatEAC_RGBA8_sRGB :: 179;
	MTLPixelFormatETC2_RGB8 :: 180;
	MTLPixelFormatETC2_RGB8_sRGB :: 181;
	MTLPixelFormatETC2_RGB8A1 :: 182;
	MTLPixelFormatETC2_RGB8A1_sRGB :: 183;
	MTLPixelFormatASTC_4x4_sRGB :: 186;
	MTLPixelFormatASTC_5x4_sRGB :: 187;
	MTLPixelFormatASTC_5x5_sRGB :: 188;
	MTLPixelFormatASTC_6x5_sRGB :: 189;
	MTLPixelFormatASTC_6x6_sRGB :: 190;
	MTLPixelFormatASTC_8x5_sRGB :: 192;
	MTLPixelFormatASTC_8x6_sRGB :: 193;
	MTLPixelFormatASTC_8x8_sRGB :: 194;
	MTLPixelFormatASTC_10x5_sRGB :: 195;
	MTLPixelFormatASTC_10x6_sRGB :: 196;
	MTLPixelFormatASTC_10x8_sRGB :: 197;
	MTLPixelFormatASTC_10x10_sRGB :: 198;
	MTLPixelFormatASTC_12x10_sRGB :: 199;
	MTLPixelFormatASTC_12x12_sRGB :: 200;
	MTLPixelFormatASTC_4x4_LDR :: 204;
	MTLPixelFormatASTC_5x4_LDR :: 205;
	MTLPixelFormatASTC_5x5_LDR :: 206;
	MTLPixelFormatASTC_6x5_LDR :: 207;
	MTLPixelFormatASTC_6x6_LDR :: 208;
	MTLPixelFormatASTC_8x5_LDR :: 210;
	MTLPixelFormatASTC_8x6_LDR :: 211;
	MTLPixelFormatASTC_8x8_LDR :: 212;
	MTLPixelFormatASTC_10x5_LDR :: 213;
	MTLPixelFormatASTC_10x6_LDR :: 214;
	MTLPixelFormatASTC_10x8_LDR :: 215;
	MTLPixelFormatASTC_10x10_LDR :: 216;
	MTLPixelFormatASTC_12x10_LDR :: 217;
	MTLPixelFormatASTC_12x12_LDR :: 218;
	MTLPixelFormatASTC_4x4_HDR :: 222;
	MTLPixelFormatASTC_5x4_HDR :: 223;
	MTLPixelFormatASTC_5x5_HDR :: 224;
	MTLPixelFormatASTC_6x5_HDR :: 225;
	MTLPixelFormatASTC_6x6_HDR :: 226;
	MTLPixelFormatASTC_8x5_HDR :: 228;
	MTLPixelFormatASTC_8x6_HDR :: 229;
	MTLPixelFormatASTC_8x8_HDR :: 230;
	MTLPixelFormatASTC_10x5_HDR :: 231;
	MTLPixelFormatASTC_10x6_HDR :: 232;
	MTLPixelFormatASTC_10x8_HDR :: 233;
	MTLPixelFormatASTC_10x10_HDR :: 234;
	MTLPixelFormatASTC_12x10_HDR :: 235;
	MTLPixelFormatASTC_12x12_HDR :: 236;
	MTLPixelFormatGBGR422 :: 240;
	MTLPixelFormatBGRG422 :: 241;
	MTLPixelFormatDepth16Unorm :: 250;
	MTLPixelFormatDepth32Float :: 252;
	MTLPixelFormatStencil8 :: 253;
	MTLPixelFormatDepth24Unorm_Stencil8 :: 255;
	MTLPixelFormatDepth32Float_Stencil8 :: 260;
	MTLPixelFormatX32_Stencil8 :: 261;
	MTLPixelFormatX24_Stencil8 :: 262;
	MTLPixelFormatUnspecialized :: 263;
}

MTLBlendFactor :: enum NSUInteger {
	Zero :: 0;
	One :: 1;
	SourceColor :: 2;
	OneMinusSourceColor :: 3;
	SourceAlpha :: 4;
	OneMinusSourceAlpha :: 5;
	DestinationColor :: 6;
	OneMinusDestinationColor :: 7;
	DestinationAlpha :: 8;
	OneMinusDestinationAlpha :: 9;
	SourceAlphaSaturated :: 10;
	BlendColor :: 11;
	OneMinusBlendColor :: 12;
	BlendAlpha :: 13;
	OneMinusBlendAlpha :: 14;
	Source1Color :: 15;
	OneMinusSource1Color :: 16;
	Source1Alpha :: 17;
	OneMinusSource1Alpha :: 18;
	Unspecialized :: 19;
;
	MTLBlendFactorZero :: 0;
	MTLBlendFactorOne :: 1;
	MTLBlendFactorSourceColor :: 2;
	MTLBlendFactorOneMinusSourceColor :: 3;
	MTLBlendFactorSourceAlpha :: 4;
	MTLBlendFactorOneMinusSourceAlpha :: 5;
	MTLBlendFactorDestinationColor :: 6;
	MTLBlendFactorOneMinusDestinationColor :: 7;
	MTLBlendFactorDestinationAlpha :: 8;
	MTLBlendFactorOneMinusDestinationAlpha :: 9;
	MTLBlendFactorSourceAlphaSaturated :: 10;
	MTLBlendFactorBlendColor :: 11;
	MTLBlendFactorOneMinusBlendColor :: 12;
	MTLBlendFactorBlendAlpha :: 13;
	MTLBlendFactorOneMinusBlendAlpha :: 14;
	MTLBlendFactorSource1Color :: 15;
	MTLBlendFactorOneMinusSource1Color :: 16;
	MTLBlendFactorSource1Alpha :: 17;
	MTLBlendFactorOneMinusSource1Alpha :: 18;
	MTLBlendFactorUnspecialized :: 19;
}

MTLBlendOperation :: enum NSUInteger {
	Add :: 0;
	Subtract :: 1;
	ReverseSubtract :: 2;
	Min :: 3;
	Max :: 4;
	Unspecialized :: 5;
;
	MTLBlendOperationAdd :: 0;
	MTLBlendOperationSubtract :: 1;
	MTLBlendOperationReverseSubtract :: 2;
	MTLBlendOperationMin :: 3;
	MTLBlendOperationMax :: 4;
	MTLBlendOperationUnspecialized :: 5;
}

MTLPrimitiveTopologyClass :: enum NSUInteger {
	Unspecified :: 0;
	Point :: 1;
	Line :: 2;
	Triangle :: 3;
;
	MTLPrimitiveTopologyClassUnspecified :: 0;
	MTLPrimitiveTopologyClassPoint :: 1;
	MTLPrimitiveTopologyClassLine :: 2;
	MTLPrimitiveTopologyClassTriangle :: 3;
}

MTLTessellationPartitionMode :: enum NSUInteger {
	Pow2 :: 0;
	Integer :: 1;
	FractionalOdd :: 2;
	FractionalEven :: 3;
;
	MTLTessellationPartitionModePow2 :: 0;
	MTLTessellationPartitionModeInteger :: 1;
	MTLTessellationPartitionModeFractionalOdd :: 2;
	MTLTessellationPartitionModeFractionalEven :: 3;
}

MTLTessellationFactorStepFunction :: enum NSUInteger {
	Constant :: 0;
	PerPatch :: 1;
	PerInstance :: 2;
	PerPatchAndPerInstance :: 3;
;
	MTLTessellationFactorStepFunctionConstant :: 0;
	MTLTessellationFactorStepFunctionPerPatch :: 1;
	MTLTessellationFactorStepFunctionPerInstance :: 2;
	MTLTessellationFactorStepFunctionPerPatchAndPerInstance :: 3;
}

MTLTessellationFactorFormat :: enum NSUInteger {
	Half :: 0;
;
	MTLTessellationFactorFormatHalf :: 0;
}

MTLTessellationControlPointIndexType :: enum NSUInteger {
	None :: 0;
	UInt16 :: 1;
	UInt32 :: 2;
;
	MTLTessellationControlPointIndexTypeNone :: 0;
	MTLTessellationControlPointIndexTypeUInt16 :: 1;
	MTLTessellationControlPointIndexTypeUInt32 :: 2;
}

MTL4AlphaToOneState :: enum NSInteger {
	Disabled :: 0;
	Enabled :: 1;
;
	MTL4AlphaToOneStateDisabled :: 0;
	MTL4AlphaToOneStateEnabled :: 1;
}

MTL4AlphaToCoverageState :: enum NSInteger {
	Disabled :: 0;
	Enabled :: 1;
;
	MTL4AlphaToCoverageStateDisabled :: 0;
	MTL4AlphaToCoverageStateEnabled :: 1;
}

MTL4BlendState :: enum NSInteger {
	Disabled :: 0;
	Enabled :: 1;
	Unspecialized :: 2;
;
	MTL4BlendStateDisabled :: 0;
	MTL4BlendStateEnabled :: 1;
	MTL4BlendStateUnspecialized :: 2;
}

MTL4IndirectCommandBufferSupportState :: enum NSInteger {
	Disabled :: 0;
	Enabled :: 1;
;
	MTL4IndirectCommandBufferSupportStateDisabled :: 0;
	MTL4IndirectCommandBufferSupportStateEnabled :: 1;
}

MTLBinaryArchiveError :: enum NSUInteger {
	None :: 0;
	InvalidFile :: 1;
	UnexpectedElement :: 2;
	CompilationFailure :: 3;
	InternalError :: 4;
;
	MTLBinaryArchiveErrorNone :: 0;
	MTLBinaryArchiveErrorInvalidFile :: 1;
	MTLBinaryArchiveErrorUnexpectedElement :: 2;
	MTLBinaryArchiveErrorCompilationFailure :: 3;
	MTLBinaryArchiveErrorInternalError :: 4;
}

MTLIOPriority :: enum NSInteger {
	High :: 0;
	Normal :: 1;
	Low :: 2;
;
	MTLIOPriorityHigh :: 0;
	MTLIOPriorityNormal :: 1;
	MTLIOPriorityLow :: 2;
}

MTLIOCommandQueueType :: enum NSInteger {
	Concurrent :: 0;
	Serial :: 1;
;
	MTLIOCommandQueueTypeConcurrent :: 0;
	MTLIOCommandQueueTypeSerial :: 1;
}

MTLIOError :: enum NSInteger {
	URLInvalid :: 1;
	Internal :: 2;
;
	MTLIOErrorURLInvalid :: 1;
	MTLIOErrorInternal :: 2;
}

MTLIOCompressionStatus :: enum NSInteger {
	Complete :: 0;
	Error :: 1;
;
	MTLIOCompressionStatusComplete :: 0;
	MTLIOCompressionStatusError :: 1;
}

MTLCounterSampleBufferError :: enum NSInteger {
	OutOfMemory :: 0;
	Invalid :: 1;
	Internal :: 2;
;
	MTLCounterSampleBufferErrorOutOfMemory :: 0;
	MTLCounterSampleBufferErrorInvalid :: 1;
	MTLCounterSampleBufferErrorInternal :: 2;
}

MTLCommandBufferStatus :: enum NSUInteger {
	NotEnqueued :: 0;
	Enqueued :: 1;
	Committed :: 2;
	Scheduled :: 3;
	Completed :: 4;
	Error :: 5;
;
	MTLCommandBufferStatusNotEnqueued :: 0;
	MTLCommandBufferStatusEnqueued :: 1;
	MTLCommandBufferStatusCommitted :: 2;
	MTLCommandBufferStatusScheduled :: 3;
	MTLCommandBufferStatusCompleted :: 4;
	MTLCommandBufferStatusError :: 5;
}

MTLCommandBufferError :: enum NSUInteger {
	None :: 0;
	Internal :: 1;
	Timeout :: 2;
	PageFault :: 3;
	Blacklisted :: 4;
	AccessRevoked :: 4;
	NotPermitted :: 7;
	OutOfMemory :: 8;
	InvalidResource :: 9;
	Memoryless :: 10;
	DeviceRemoved :: 11;
	StackOverflow :: 12;
;
	MTLCommandBufferErrorNone :: 0;
	MTLCommandBufferErrorInternal :: 1;
	MTLCommandBufferErrorTimeout :: 2;
	MTLCommandBufferErrorPageFault :: 3;
	MTLCommandBufferErrorBlacklisted :: 4;
	MTLCommandBufferErrorAccessRevoked :: 4;
	MTLCommandBufferErrorNotPermitted :: 7;
	MTLCommandBufferErrorOutOfMemory :: 8;
	MTLCommandBufferErrorInvalidResource :: 9;
	MTLCommandBufferErrorMemoryless :: 10;
	MTLCommandBufferErrorDeviceRemoved :: 11;
	MTLCommandBufferErrorStackOverflow :: 12;
}

MTLCommandEncoderErrorState :: enum NSInteger {
	Unknown :: 0;
	Completed :: 1;
	Affected :: 2;
	Pending :: 3;
	Faulted :: 4;
;
	MTLCommandEncoderErrorStateUnknown :: 0;
	MTLCommandEncoderErrorStateCompleted :: 1;
	MTLCommandEncoderErrorStateAffected :: 2;
	MTLCommandEncoderErrorStatePending :: 3;
	MTLCommandEncoderErrorStateFaulted :: 4;
}

MTLDispatchType :: enum NSUInteger {
	Serial :: 0;
	Concurrent :: 1;
;
	MTLDispatchTypeSerial :: 0;
	MTLDispatchTypeConcurrent :: 1;
}

MTL4LibraryDescriptor :: struct {}
name :: (self: *MTL4LibraryDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTL4LibraryDescriptor) -> *NSString);
}
options :: (self: *MTL4LibraryDescriptor) -> *MTLCompileOptions {
	#insert #run METHOD_BODY(__selectors.options, #type (self: *MTL4LibraryDescriptor) -> *MTLCompileOptions);
}
setName :: (self: *MTL4LibraryDescriptor, name: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setName_, #type (self: *MTL4LibraryDescriptor, name: *NSString) -> ());
}
setOptions :: (self: *MTL4LibraryDescriptor, options: *MTLCompileOptions) -> () {
	#insert #run METHOD_BODY(__selectors.setOptions_, #type (self: *MTL4LibraryDescriptor, options: *MTLCompileOptions) -> ());
}
setSource :: (self: *MTL4LibraryDescriptor, source: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setSource_, #type (self: *MTL4LibraryDescriptor, source: *NSString) -> ());
}
source :: (self: *MTL4LibraryDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.source, #type (self: *MTL4LibraryDescriptor) -> *NSString);
}


MTL4MachineLearningCommandEncoder :: struct { using #as _: MTL4CommandEncoder; }
dispatchNetwork :: (self: *MTL4MachineLearningCommandEncoder, heap: *MTLHeap) -> () {
	#insert #run METHOD_BODY(__selectors.dispatchNetworkWithIntermediatesHeap_, #type (self: *MTL4MachineLearningCommandEncoder, heap: *MTLHeap) -> ());
}
setArgumentTable :: (self: *MTL4MachineLearningCommandEncoder, argumentTable: *MTL4ArgumentTable) -> () {
	#insert #run METHOD_BODY(__selectors.setArgumentTable_, #type (self: *MTL4MachineLearningCommandEncoder, argumentTable: *MTL4ArgumentTable) -> ());
}
setPipelineState :: (self: *MTL4MachineLearningCommandEncoder, pipelineState: *MTL4MachineLearningPipelineState) -> () {
	#insert #run METHOD_BODY(__selectors.setPipelineState_, #type (self: *MTL4MachineLearningCommandEncoder, pipelineState: *MTL4MachineLearningPipelineState) -> ());
}


MTL4CommitOptions :: struct {}
addFeedbackHandler :: (self: *MTL4CommitOptions, block: MTL4CommitFeedbackHandler) -> () {
	#insert #run METHOD_BODY(__selectors.addFeedbackHandler_, #type (self: *MTL4CommitOptions, block: MTL4CommitFeedbackHandler) -> ());
}


MTL4CommandQueueDescriptor :: struct {}
feedbackQueue :: (self: *MTL4CommandQueueDescriptor) -> dispatch_queue_t {
	#insert #run METHOD_BODY(__selectors.feedbackQueue, #type (self: *MTL4CommandQueueDescriptor) -> dispatch_queue_t);
}
label :: (self: *MTL4CommandQueueDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTL4CommandQueueDescriptor) -> *NSString);
}
setFeedbackQueue :: (self: *MTL4CommandQueueDescriptor, feedbackQueue: dispatch_queue_t) -> () {
	#insert #run METHOD_BODY(__selectors.setFeedbackQueue_, #type (self: *MTL4CommandQueueDescriptor, feedbackQueue: dispatch_queue_t) -> ());
}
setLabel :: (self: *MTL4CommandQueueDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTL4CommandQueueDescriptor, label: *NSString) -> ());
}


MTL4CommandQueue :: struct {}
addResidencySet :: (self: *MTL4CommandQueue, residencySet: *MTLResidencySet) -> () {
	#insert #run METHOD_BODY(__selectors.addResidencySet_, #type (self: *MTL4CommandQueue, residencySet: *MTLResidencySet) -> ());
}
addResidencySets :: (self: *MTL4CommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.addResidencySets_count_, #type (self: *MTL4CommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> ());
}
commit :: (self: *MTL4CommandQueue, commandBuffers: **MTL4CommandBuffer, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.commit_count_, #type (self: *MTL4CommandQueue, commandBuffers: **MTL4CommandBuffer, count: NSUInteger) -> ());
}
commit :: (self: *MTL4CommandQueue, commandBuffers: **MTL4CommandBuffer, count: NSUInteger, options: *MTL4CommitOptions) -> () {
	#insert #run METHOD_BODY(__selectors.commit_count_options_, #type (self: *MTL4CommandQueue, commandBuffers: **MTL4CommandBuffer, count: NSUInteger, options: *MTL4CommitOptions) -> ());
}
copyBufferMappingsFromBuffer :: (self: *MTL4CommandQueue, sourceBuffer: *MTLBuffer, destinationBuffer: *MTLBuffer, operations: *MTL4CopySparseBufferMappingOperation, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.copyBufferMappingsFromBuffer_toBuffer_operations_count_, #type (self: *MTL4CommandQueue, sourceBuffer: *MTLBuffer, destinationBuffer: *MTLBuffer, operations: *MTL4CopySparseBufferMappingOperation, count: NSUInteger) -> ());
}
copyTextureMappingsFromTexture :: (self: *MTL4CommandQueue, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture, operations: *MTL4CopySparseTextureMappingOperation, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.copyTextureMappingsFromTexture_toTexture_operations_count_, #type (self: *MTL4CommandQueue, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture, operations: *MTL4CopySparseTextureMappingOperation, count: NSUInteger) -> ());
}
device :: (self: *MTL4CommandQueue) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTL4CommandQueue) -> *MTLDevice);
}
label :: (self: *MTL4CommandQueue) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTL4CommandQueue) -> *NSString);
}
removeResidencySet :: (self: *MTL4CommandQueue, residencySet: *MTLResidencySet) -> () {
	#insert #run METHOD_BODY(__selectors.removeResidencySet_, #type (self: *MTL4CommandQueue, residencySet: *MTLResidencySet) -> ());
}
removeResidencySets :: (self: *MTL4CommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.removeResidencySets_count_, #type (self: *MTL4CommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> ());
}
signalDrawable :: (self: *MTL4CommandQueue, drawable: *MTLDrawable) -> () {
	#insert #run METHOD_BODY(__selectors.signalDrawable_, #type (self: *MTL4CommandQueue, drawable: *MTLDrawable) -> ());
}
signalEvent :: (self: *MTL4CommandQueue, event: *MTLEvent, value: u64) -> () {
	#insert #run METHOD_BODY(__selectors.signalEvent_value_, #type (self: *MTL4CommandQueue, event: *MTLEvent, value: u64) -> ());
}
updateBufferMappings :: (self: *MTL4CommandQueue, buffer: *MTLBuffer, heap: *MTLHeap, operations: *MTL4UpdateSparseBufferMappingOperation, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.updateBufferMappings_heap_operations_count_, #type (self: *MTL4CommandQueue, buffer: *MTLBuffer, heap: *MTLHeap, operations: *MTL4UpdateSparseBufferMappingOperation, count: NSUInteger) -> ());
}
updateTextureMappings :: (self: *MTL4CommandQueue, texture: *MTLTexture, heap: *MTLHeap, operations: *MTL4UpdateSparseTextureMappingOperation, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.updateTextureMappings_heap_operations_count_, #type (self: *MTL4CommandQueue, texture: *MTLTexture, heap: *MTLHeap, operations: *MTL4UpdateSparseTextureMappingOperation, count: NSUInteger) -> ());
}
wait :: (self: *MTL4CommandQueue, event: *MTLEvent, value: u64) -> () {
	#insert #run METHOD_BODY(__selectors.waitForEvent_value_, #type (self: *MTL4CommandQueue, event: *MTLEvent, value: u64) -> ());
}
wait :: (self: *MTL4CommandQueue, drawable: *MTLDrawable) -> () {
	#insert #run METHOD_BODY(__selectors.waitForDrawable_, #type (self: *MTL4CommandQueue, drawable: *MTLDrawable) -> ());
}


MTL4StaticLinkingDescriptor :: struct {}
functionDescriptors :: (self: *MTL4StaticLinkingDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.functionDescriptors, #type (self: *MTL4StaticLinkingDescriptor) -> *NSArray);
}
groups :: (self: *MTL4StaticLinkingDescriptor) -> *NSDictionary {
	#insert #run METHOD_BODY(__selectors.groups, #type (self: *MTL4StaticLinkingDescriptor) -> *NSDictionary);
}
privateFunctionDescriptors :: (self: *MTL4StaticLinkingDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.privateFunctionDescriptors, #type (self: *MTL4StaticLinkingDescriptor) -> *NSArray);
}
setFunctionDescriptors :: (self: *MTL4StaticLinkingDescriptor, functionDescriptors: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setFunctionDescriptors_, #type (self: *MTL4StaticLinkingDescriptor, functionDescriptors: *NSArray) -> ());
}
setGroups :: (self: *MTL4StaticLinkingDescriptor, groups: *NSDictionary) -> () {
	#insert #run METHOD_BODY(__selectors.setGroups_, #type (self: *MTL4StaticLinkingDescriptor, groups: *NSDictionary) -> ());
}
setPrivateFunctionDescriptors :: (self: *MTL4StaticLinkingDescriptor, privateFunctionDescriptors: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setPrivateFunctionDescriptors_, #type (self: *MTL4StaticLinkingDescriptor, privateFunctionDescriptors: *NSArray) -> ());
}


MTL4PipelineStageDynamicLinkingDescriptor :: struct {}
binaryLinkedFunctions :: (self: *MTL4PipelineStageDynamicLinkingDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.binaryLinkedFunctions, #type (self: *MTL4PipelineStageDynamicLinkingDescriptor) -> *NSArray);
}
maxCallStackDepth :: (self: *MTL4PipelineStageDynamicLinkingDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxCallStackDepth, #type (self: *MTL4PipelineStageDynamicLinkingDescriptor) -> NSUInteger);
}
preloadedLibraries :: (self: *MTL4PipelineStageDynamicLinkingDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.preloadedLibraries, #type (self: *MTL4PipelineStageDynamicLinkingDescriptor) -> *NSArray);
}
setBinaryLinkedFunctions :: (self: *MTL4PipelineStageDynamicLinkingDescriptor, binaryLinkedFunctions: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setBinaryLinkedFunctions_, #type (self: *MTL4PipelineStageDynamicLinkingDescriptor, binaryLinkedFunctions: *NSArray) -> ());
}
setMaxCallStackDepth :: (self: *MTL4PipelineStageDynamicLinkingDescriptor, maxCallStackDepth: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxCallStackDepth_, #type (self: *MTL4PipelineStageDynamicLinkingDescriptor, maxCallStackDepth: NSUInteger) -> ());
}
setPreloadedLibraries :: (self: *MTL4PipelineStageDynamicLinkingDescriptor, preloadedLibraries: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setPreloadedLibraries_, #type (self: *MTL4PipelineStageDynamicLinkingDescriptor, preloadedLibraries: *NSArray) -> ());
}


MTL4RenderPipelineDynamicLinkingDescriptor :: struct {}
fragmentLinkingDescriptor :: (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
	#insert #run METHOD_BODY(__selectors.fragmentLinkingDescriptor, #type (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor);
}
meshLinkingDescriptor :: (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
	#insert #run METHOD_BODY(__selectors.meshLinkingDescriptor, #type (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor);
}
objectLinkingDescriptor :: (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
	#insert #run METHOD_BODY(__selectors.objectLinkingDescriptor, #type (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor);
}
tileLinkingDescriptor :: (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
	#insert #run METHOD_BODY(__selectors.tileLinkingDescriptor, #type (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor);
}
vertexLinkingDescriptor :: (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor {
	#insert #run METHOD_BODY(__selectors.vertexLinkingDescriptor, #type (self: *MTL4RenderPipelineDynamicLinkingDescriptor) -> *MTL4PipelineStageDynamicLinkingDescriptor);
}


MTLResourceStateCommandEncoder :: struct { using #as _: MTLCommandEncoder; }
moveTextureMappingsFromTexture :: (self: *MTLResourceStateCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> () {
	#insert #run METHOD_BODY(__selectors.moveTextureMappingsFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, #type (self: *MTLResourceStateCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> ());
}
updateFence :: (self: *MTLResourceStateCommandEncoder, fence: *MTLFence) -> () {
	#insert #run METHOD_BODY(__selectors.updateFence_, #type (self: *MTLResourceStateCommandEncoder, fence: *MTLFence) -> ());
}
updateTextureMapping :: (self: *MTLResourceStateCommandEncoder, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.updateTextureMapping_mode_region_mipLevel_slice_, #type (self: *MTLResourceStateCommandEncoder, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger) -> ());
}
updateTextureMapping :: (self: *MTLResourceStateCommandEncoder, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.updateTextureMapping_mode_indirectBuffer_indirectBufferOffset_, #type (self: *MTLResourceStateCommandEncoder, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> ());
}
updateTextureMappings :: (self: *MTLResourceStateCommandEncoder, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, regions: *MTLRegion, mipLevels: *NSUInteger, slices: *NSUInteger, numRegions: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.updateTextureMappings_mode_regions_mipLevels_slices_numRegions_, #type (self: *MTLResourceStateCommandEncoder, texture: *MTLTexture, mode: MTLSparseTextureMappingMode, regions: *MTLRegion, mipLevels: *NSUInteger, slices: *NSUInteger, numRegions: NSUInteger) -> ());
}
waitForFence :: (self: *MTLResourceStateCommandEncoder, fence: *MTLFence) -> () {
	#insert #run METHOD_BODY(__selectors.waitForFence_, #type (self: *MTLResourceStateCommandEncoder, fence: *MTLFence) -> ());
}


MTLIndirectRenderCommand :: struct {}
clearBarrier :: (self: *MTLIndirectRenderCommand) -> () {
	#insert #run METHOD_BODY(__selectors.clearBarrier, #type (self: *MTLIndirectRenderCommand) -> ());
}
drawIndexedPatches :: (self: *MTLIndirectRenderCommand, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, controlPointIndexBuffer: *MTLBuffer, controlPointIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger, buffer: *MTLBuffer, offset: NSUInteger, instanceStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_, #type (self: *MTLIndirectRenderCommand, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, controlPointIndexBuffer: *MTLBuffer, controlPointIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger, buffer: *MTLBuffer, offset: NSUInteger, instanceStride: NSUInteger) -> ());
}
drawIndexedPrimitives :: (self: *MTLIndirectRenderCommand, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_, #type (self: *MTLIndirectRenderCommand, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> ());
}
drawMeshThreadgroups :: (self: *MTLIndirectRenderCommand, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, #type (self: *MTLIndirectRenderCommand, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> ());
}
drawMeshThreads :: (self: *MTLIndirectRenderCommand, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, #type (self: *MTLIndirectRenderCommand, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> ());
}
drawPatches :: (self: *MTLIndirectRenderCommand, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger, buffer: *MTLBuffer, offset: NSUInteger, instanceStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_, #type (self: *MTLIndirectRenderCommand, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger, buffer: *MTLBuffer, offset: NSUInteger, instanceStride: NSUInteger) -> ());
}
drawPrimitives :: (self: *MTLIndirectRenderCommand, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_, #type (self: *MTLIndirectRenderCommand, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> ());
}
reset :: (self: *MTLIndirectRenderCommand) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTLIndirectRenderCommand) -> ());
}
setBarrier :: (self: *MTLIndirectRenderCommand) -> () {
	#insert #run METHOD_BODY(__selectors.setBarrier, #type (self: *MTLIndirectRenderCommand) -> ());
}
setCullMode :: (self: *MTLIndirectRenderCommand, cullMode: MTLCullMode) -> () {
	#insert #run METHOD_BODY(__selectors.setCullMode_, #type (self: *MTLIndirectRenderCommand, cullMode: MTLCullMode) -> ());
}
setDepthBias :: (self: *MTLIndirectRenderCommand, depthBias: float, slopeScale: float, clamp: float) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthBias_slopeScale_clamp_, #type (self: *MTLIndirectRenderCommand, depthBias: float, slopeScale: float, clamp: float) -> ());
}
setDepthClipMode :: (self: *MTLIndirectRenderCommand, depthClipMode: MTLDepthClipMode) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthClipMode_, #type (self: *MTLIndirectRenderCommand, depthClipMode: MTLDepthClipMode) -> ());
}
setDepthStencilState :: (self: *MTLIndirectRenderCommand, depthStencilState: *MTLDepthStencilState) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthStencilState_, #type (self: *MTLIndirectRenderCommand, depthStencilState: *MTLDepthStencilState) -> ());
}
setFragmentBuffer :: (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentBuffer_offset_atIndex_, #type (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> ());
}
setFrontFacingWinding :: (self: *MTLIndirectRenderCommand, frontFacingWindning: MTLWinding) -> () {
	#insert #run METHOD_BODY(__selectors.setFrontFacingWinding_, #type (self: *MTLIndirectRenderCommand, frontFacingWindning: MTLWinding) -> ());
}
setMeshBuffer :: (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshBuffer_offset_atIndex_, #type (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> ());
}
setObjectBuffer :: (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectBuffer_offset_atIndex_, #type (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> ());
}
setObjectThreadgroupMemoryLength :: (self: *MTLIndirectRenderCommand, length: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectThreadgroupMemoryLength_atIndex_, #type (self: *MTLIndirectRenderCommand, length: NSUInteger, index: NSUInteger) -> ());
}
setRenderPipelineState :: (self: *MTLIndirectRenderCommand, pipelineState: *MTLRenderPipelineState) -> () {
	#insert #run METHOD_BODY(__selectors.setRenderPipelineState_, #type (self: *MTLIndirectRenderCommand, pipelineState: *MTLRenderPipelineState) -> ());
}
setTriangleFillMode :: (self: *MTLIndirectRenderCommand, fillMode: MTLTriangleFillMode) -> () {
	#insert #run METHOD_BODY(__selectors.setTriangleFillMode_, #type (self: *MTLIndirectRenderCommand, fillMode: MTLTriangleFillMode) -> ());
}
setVertexBuffer :: (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexBuffer_offset_atIndex_, #type (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> ());
}
setVertexBuffer :: (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexBuffer_offset_attributeStride_atIndex_, #type (self: *MTLIndirectRenderCommand, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> ());
}


MTLIndirectComputeCommand :: struct {}
clearBarrier :: (self: *MTLIndirectComputeCommand) -> () {
	#insert #run METHOD_BODY(__selectors.clearBarrier, #type (self: *MTLIndirectComputeCommand) -> ());
}
concurrentDispatchThreadgroups :: (self: *MTLIndirectComputeCommand, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.concurrentDispatchThreadgroups_threadsPerThreadgroup_, #type (self: *MTLIndirectComputeCommand, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> ());
}
concurrentDispatchThreads :: (self: *MTLIndirectComputeCommand, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.concurrentDispatchThreads_threadsPerThreadgroup_, #type (self: *MTLIndirectComputeCommand, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> ());
}
reset :: (self: *MTLIndirectComputeCommand) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTLIndirectComputeCommand) -> ());
}
setBarrier :: (self: *MTLIndirectComputeCommand) -> () {
	#insert #run METHOD_BODY(__selectors.setBarrier, #type (self: *MTLIndirectComputeCommand) -> ());
}
setComputePipelineState :: (self: *MTLIndirectComputeCommand, pipelineState: *MTLComputePipelineState) -> () {
	#insert #run METHOD_BODY(__selectors.setComputePipelineState_, #type (self: *MTLIndirectComputeCommand, pipelineState: *MTLComputePipelineState) -> ());
}
setImageblockWidth :: (self: *MTLIndirectComputeCommand, width: NSUInteger, height: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setImageblockWidth_height_, #type (self: *MTLIndirectComputeCommand, width: NSUInteger, height: NSUInteger) -> ());
}
setKernelBuffer :: (self: *MTLIndirectComputeCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setKernelBuffer_offset_atIndex_, #type (self: *MTLIndirectComputeCommand, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> ());
}
setKernelBuffer :: (self: *MTLIndirectComputeCommand, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setKernelBuffer_offset_attributeStride_atIndex_, #type (self: *MTLIndirectComputeCommand, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> ());
}
setStageInRegion :: (self: *MTLIndirectComputeCommand, region: MTLRegion) -> () {
	#insert #run METHOD_BODY(__selectors.setStageInRegion_, #type (self: *MTLIndirectComputeCommand, region: MTLRegion) -> ());
}
setThreadgroupMemoryLength :: (self: *MTLIndirectComputeCommand, length: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setThreadgroupMemoryLength_atIndex_, #type (self: *MTLIndirectComputeCommand, length: NSUInteger, index: NSUInteger) -> ());
}


MTL4Archive :: struct {}
label :: (self: *MTL4Archive) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTL4Archive) -> *NSString);
}
newBinaryFunction :: (self: *MTL4Archive, descriptor: *MTL4BinaryFunctionDescriptor, error: **NSError) -> *MTL4BinaryFunction {
	#insert #run METHOD_BODY(__selectors.newBinaryFunctionWithDescriptor_error_, #type (self: *MTL4Archive, descriptor: *MTL4BinaryFunctionDescriptor, error: **NSError) -> *MTL4BinaryFunction);
}
newComputePipelineState :: (self: *MTL4Archive, descriptor: *MTL4ComputePipelineDescriptor, error: **NSError) -> *MTLComputePipelineState {
	#insert #run METHOD_BODY(__selectors.newComputePipelineStateWithDescriptor_error_, #type (self: *MTL4Archive, descriptor: *MTL4ComputePipelineDescriptor, error: **NSError) -> *MTLComputePipelineState);
}
newComputePipelineState :: (self: *MTL4Archive, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, error: **NSError) -> *MTLComputePipelineState {
	#insert #run METHOD_BODY(__selectors.newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_error_, #type (self: *MTL4Archive, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, error: **NSError) -> *MTLComputePipelineState);
}
newRenderPipelineState :: (self: *MTL4Archive, descriptor: *MTL4PipelineDescriptor, error: **NSError) -> *MTLRenderPipelineState {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateWithDescriptor_error_, #type (self: *MTL4Archive, descriptor: *MTL4PipelineDescriptor, error: **NSError) -> *MTLRenderPipelineState);
}
newRenderPipelineState :: (self: *MTL4Archive, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, error: **NSError) -> *MTLRenderPipelineState {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_error_, #type (self: *MTL4Archive, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, error: **NSError) -> *MTLRenderPipelineState);
}
setLabel :: (self: *MTL4Archive, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTL4Archive, label: *NSString) -> ());
}


MTLComputePipelineReflection :: struct {}
arguments :: (self: *MTLComputePipelineReflection) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.arguments, #type (self: *MTLComputePipelineReflection) -> *NSArray);
}
bindings :: (self: *MTLComputePipelineReflection) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.bindings, #type (self: *MTLComputePipelineReflection) -> *NSArray);
}


MTLComputePipelineDescriptor :: struct {}
binaryArchives :: (self: *MTLComputePipelineDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.binaryArchives, #type (self: *MTLComputePipelineDescriptor) -> *NSArray);
}
buffers :: (self: *MTLComputePipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
	#insert #run METHOD_BODY(__selectors.buffers, #type (self: *MTLComputePipelineDescriptor) -> *MTLPipelineBufferDescriptorArray);
}
computeFunction :: (self: *MTLComputePipelineDescriptor) -> *MTLFunction {
	#insert #run METHOD_BODY(__selectors.computeFunction, #type (self: *MTLComputePipelineDescriptor) -> *MTLFunction);
}
insertLibraries :: (self: *MTLComputePipelineDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.insertLibraries, #type (self: *MTLComputePipelineDescriptor) -> *NSArray);
}
label :: (self: *MTLComputePipelineDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLComputePipelineDescriptor) -> *NSString);
}
linkedFunctions :: (self: *MTLComputePipelineDescriptor) -> *MTLLinkedFunctions {
	#insert #run METHOD_BODY(__selectors.linkedFunctions, #type (self: *MTLComputePipelineDescriptor) -> *MTLLinkedFunctions);
}
maxCallStackDepth :: (self: *MTLComputePipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxCallStackDepth, #type (self: *MTLComputePipelineDescriptor) -> NSUInteger);
}
maxTotalThreadsPerThreadgroup :: (self: *MTLComputePipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTotalThreadsPerThreadgroup, #type (self: *MTLComputePipelineDescriptor) -> NSUInteger);
}
preloadedLibraries :: (self: *MTLComputePipelineDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.preloadedLibraries, #type (self: *MTLComputePipelineDescriptor) -> *NSArray);
}
requiredThreadsPerThreadgroup :: (self: *MTLComputePipelineDescriptor) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.requiredThreadsPerThreadgroup, #type (self: *MTLComputePipelineDescriptor) -> MTLSize);
}
reset :: (self: *MTLComputePipelineDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTLComputePipelineDescriptor) -> ());
}
setBinaryArchives :: (self: *MTLComputePipelineDescriptor, binaryArchives: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setBinaryArchives_, #type (self: *MTLComputePipelineDescriptor, binaryArchives: *NSArray) -> ());
}
setComputeFunction :: (self: *MTLComputePipelineDescriptor, computeFunction: *MTLFunction) -> () {
	#insert #run METHOD_BODY(__selectors.setComputeFunction_, #type (self: *MTLComputePipelineDescriptor, computeFunction: *MTLFunction) -> ());
}
setInsertLibraries :: (self: *MTLComputePipelineDescriptor, insertLibraries: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setInsertLibraries_, #type (self: *MTLComputePipelineDescriptor, insertLibraries: *NSArray) -> ());
}
setLabel :: (self: *MTLComputePipelineDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLComputePipelineDescriptor, label: *NSString) -> ());
}
setLinkedFunctions :: (self: *MTLComputePipelineDescriptor, linkedFunctions: *MTLLinkedFunctions) -> () {
	#insert #run METHOD_BODY(__selectors.setLinkedFunctions_, #type (self: *MTLComputePipelineDescriptor, linkedFunctions: *MTLLinkedFunctions) -> ());
}
setMaxCallStackDepth :: (self: *MTLComputePipelineDescriptor, maxCallStackDepth: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxCallStackDepth_, #type (self: *MTLComputePipelineDescriptor, maxCallStackDepth: NSUInteger) -> ());
}
setMaxTotalThreadsPerThreadgroup :: (self: *MTLComputePipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxTotalThreadsPerThreadgroup_, #type (self: *MTLComputePipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> ());
}
setPreloadedLibraries :: (self: *MTLComputePipelineDescriptor, preloadedLibraries: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setPreloadedLibraries_, #type (self: *MTLComputePipelineDescriptor, preloadedLibraries: *NSArray) -> ());
}
setRequiredThreadsPerThreadgroup :: (self: *MTLComputePipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.setRequiredThreadsPerThreadgroup_, #type (self: *MTLComputePipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> ());
}
setShaderValidation :: (self: *MTLComputePipelineDescriptor, shaderValidation: MTLShaderValidation) -> () {
	#insert #run METHOD_BODY(__selectors.setShaderValidation_, #type (self: *MTLComputePipelineDescriptor, shaderValidation: MTLShaderValidation) -> ());
}
setStageInputDescriptor :: (self: *MTLComputePipelineDescriptor, stageInputDescriptor: *MTLStageInputOutputDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setStageInputDescriptor_, #type (self: *MTLComputePipelineDescriptor, stageInputDescriptor: *MTLStageInputOutputDescriptor) -> ());
}
setSupportAddingBinaryFunctions :: (self: *MTLComputePipelineDescriptor, supportAddingBinaryFunctions: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportAddingBinaryFunctions_, #type (self: *MTLComputePipelineDescriptor, supportAddingBinaryFunctions: bool) -> ());
}
setSupportIndirectCommandBuffers :: (self: *MTLComputePipelineDescriptor, supportIndirectCommandBuffers: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportIndirectCommandBuffers_, #type (self: *MTLComputePipelineDescriptor, supportIndirectCommandBuffers: bool) -> ());
}
setThreadGroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTLComputePipelineDescriptor, threadGroupSizeIsMultipleOfThreadExecutionWidth: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setThreadGroupSizeIsMultipleOfThreadExecutionWidth_, #type (self: *MTLComputePipelineDescriptor, threadGroupSizeIsMultipleOfThreadExecutionWidth: bool) -> ());
}
shaderValidation :: (self: *MTLComputePipelineDescriptor) -> MTLShaderValidation {
	#insert #run METHOD_BODY(__selectors.shaderValidation, #type (self: *MTLComputePipelineDescriptor) -> MTLShaderValidation);
}
stageInputDescriptor :: (self: *MTLComputePipelineDescriptor) -> *MTLStageInputOutputDescriptor {
	#insert #run METHOD_BODY(__selectors.stageInputDescriptor, #type (self: *MTLComputePipelineDescriptor) -> *MTLStageInputOutputDescriptor);
}
supportAddingBinaryFunctions :: (self: *MTLComputePipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportAddingBinaryFunctions, #type (self: *MTLComputePipelineDescriptor) -> bool);
}
supportIndirectCommandBuffers :: (self: *MTLComputePipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportIndirectCommandBuffers, #type (self: *MTLComputePipelineDescriptor) -> bool);
}
threadGroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTLComputePipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.threadGroupSizeIsMultipleOfThreadExecutionWidth, #type (self: *MTLComputePipelineDescriptor) -> bool);
}


MTLComputePipelineState :: struct { using #as _: MTLAllocation; }
device :: (self: *MTLComputePipelineState) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLComputePipelineState) -> *MTLDevice);
}
functionHandle :: (self: *MTLComputePipelineState, name: *NSString) -> *MTLFunctionHandle {
	#insert #run METHOD_BODY(__selectors.functionHandleWithName_, #type (self: *MTLComputePipelineState, name: *NSString) -> *MTLFunctionHandle);
}
functionHandle :: (self: *MTLComputePipelineState, function: *MTL4BinaryFunction) -> *MTLFunctionHandle {
	#insert #run METHOD_BODY(__selectors.functionHandleWithBinaryFunction_, #type (self: *MTLComputePipelineState, function: *MTL4BinaryFunction) -> *MTLFunctionHandle);
}
functionHandle :: (self: *MTLComputePipelineState, function: *MTLFunction) -> *MTLFunctionHandle {
	#insert #run METHOD_BODY(__selectors.functionHandleWithFunction_, #type (self: *MTLComputePipelineState, function: *MTLFunction) -> *MTLFunctionHandle);
}
gpuResourceID :: (self: *MTLComputePipelineState) -> MTLResourceID {
	#insert #run METHOD_BODY(__selectors.gpuResourceID, #type (self: *MTLComputePipelineState) -> MTLResourceID);
}
imageblockMemoryLength :: (self: *MTLComputePipelineState, imageblockDimensions: MTLSize) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.imageblockMemoryLengthForDimensions_, #type (self: *MTLComputePipelineState, imageblockDimensions: MTLSize) -> NSUInteger);
}
label :: (self: *MTLComputePipelineState) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLComputePipelineState) -> *NSString);
}
maxTotalThreadsPerThreadgroup :: (self: *MTLComputePipelineState) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTotalThreadsPerThreadgroup, #type (self: *MTLComputePipelineState) -> NSUInteger);
}
newComputePipelineStateWithBinaryFunctions :: (self: *MTLComputePipelineState, additionalBinaryFunctions: *NSArray, error: **NSError) -> *MTLComputePipelineState {
	#insert #run METHOD_BODY(__selectors.newComputePipelineStateWithBinaryFunctions_error_, #type (self: *MTLComputePipelineState, additionalBinaryFunctions: *NSArray, error: **NSError) -> *MTLComputePipelineState);
}
newComputePipelineState :: (self: *MTLComputePipelineState, functions: *NSArray, error: **NSError) -> *MTLComputePipelineState {
	#insert #run METHOD_BODY(__selectors.newComputePipelineStateWithAdditionalBinaryFunctions_error_, #type (self: *MTLComputePipelineState, functions: *NSArray, error: **NSError) -> *MTLComputePipelineState);
}
newIntersectionFunctionTable :: (self: *MTLComputePipelineState, descriptor: *MTLIntersectionFunctionTableDescriptor) -> *MTLIntersectionFunctionTable {
	#insert #run METHOD_BODY(__selectors.newIntersectionFunctionTableWithDescriptor_, #type (self: *MTLComputePipelineState, descriptor: *MTLIntersectionFunctionTableDescriptor) -> *MTLIntersectionFunctionTable);
}
newVisibleFunctionTable :: (self: *MTLComputePipelineState, descriptor: *MTLVisibleFunctionTableDescriptor) -> *MTLVisibleFunctionTable {
	#insert #run METHOD_BODY(__selectors.newVisibleFunctionTableWithDescriptor_, #type (self: *MTLComputePipelineState, descriptor: *MTLVisibleFunctionTableDescriptor) -> *MTLVisibleFunctionTable);
}
reflection :: (self: *MTLComputePipelineState) -> *MTLComputePipelineReflection {
	#insert #run METHOD_BODY(__selectors.reflection, #type (self: *MTLComputePipelineState) -> *MTLComputePipelineReflection);
}
requiredThreadsPerThreadgroup :: (self: *MTLComputePipelineState) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.requiredThreadsPerThreadgroup, #type (self: *MTLComputePipelineState) -> MTLSize);
}
shaderValidation :: (self: *MTLComputePipelineState) -> MTLShaderValidation {
	#insert #run METHOD_BODY(__selectors.shaderValidation, #type (self: *MTLComputePipelineState) -> MTLShaderValidation);
}
staticThreadgroupMemoryLength :: (self: *MTLComputePipelineState) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.staticThreadgroupMemoryLength, #type (self: *MTLComputePipelineState) -> NSUInteger);
}
supportIndirectCommandBuffers :: (self: *MTLComputePipelineState) -> bool {
	#insert #run METHOD_BODY(__selectors.supportIndirectCommandBuffers, #type (self: *MTLComputePipelineState) -> bool);
}
threadExecutionWidth :: (self: *MTLComputePipelineState) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.threadExecutionWidth, #type (self: *MTLComputePipelineState) -> NSUInteger);
}


MTLFunctionHandle :: struct {}
device :: (self: *MTLFunctionHandle) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLFunctionHandle) -> *MTLDevice);
}
functionType :: (self: *MTLFunctionHandle) -> MTLFunctionType {
	#insert #run METHOD_BODY(__selectors.functionType, #type (self: *MTLFunctionHandle) -> MTLFunctionType);
}
gpuResourceID :: (self: *MTLFunctionHandle) -> MTLResourceID {
	#insert #run METHOD_BODY(__selectors.gpuResourceID, #type (self: *MTLFunctionHandle) -> MTLResourceID);
}
name :: (self: *MTLFunctionHandle) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTLFunctionHandle) -> *NSString);
}


MTL4MeshRenderPipelineDescriptor :: struct { using #as _: MTL4PipelineDescriptor; }
alphaToCoverageState :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4AlphaToCoverageState {
	#insert #run METHOD_BODY(__selectors.alphaToCoverageState, #type (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4AlphaToCoverageState);
}
alphaToOneState :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4AlphaToOneState {
	#insert #run METHOD_BODY(__selectors.alphaToOneState, #type (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4AlphaToOneState);
}
colorAttachmentMappingState :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4LogicalToPhysicalColorAttachmentMappingState {
	#insert #run METHOD_BODY(__selectors.colorAttachmentMappingState, #type (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4LogicalToPhysicalColorAttachmentMappingState);
}
colorAttachments :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4RenderPipelineColorAttachmentDescriptorArray {
	#insert #run METHOD_BODY(__selectors.colorAttachments, #type (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4RenderPipelineColorAttachmentDescriptorArray);
}
fragmentFunctionDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
	#insert #run METHOD_BODY(__selectors.fragmentFunctionDescriptor, #type (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4FunctionDescriptor);
}
fragmentStaticLinkingDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
	#insert #run METHOD_BODY(__selectors.fragmentStaticLinkingDescriptor, #type (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor);
}
isRasterizationEnabled :: (self: *MTL4MeshRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isRasterizationEnabled, #type (self: *MTL4MeshRenderPipelineDescriptor) -> bool);
}
maxTotalThreadgroupsPerMeshGrid :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTotalThreadgroupsPerMeshGrid, #type (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger);
}
maxTotalThreadsPerMeshThreadgroup :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTotalThreadsPerMeshThreadgroup, #type (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger);
}
maxTotalThreadsPerObjectThreadgroup :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTotalThreadsPerObjectThreadgroup, #type (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger);
}
maxVertexAmplificationCount :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxVertexAmplificationCount, #type (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger);
}
meshFunctionDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
	#insert #run METHOD_BODY(__selectors.meshFunctionDescriptor, #type (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4FunctionDescriptor);
}
meshStaticLinkingDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
	#insert #run METHOD_BODY(__selectors.meshStaticLinkingDescriptor, #type (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor);
}
meshThreadgroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTL4MeshRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.meshThreadgroupSizeIsMultipleOfThreadExecutionWidth, #type (self: *MTL4MeshRenderPipelineDescriptor) -> bool);
}
objectFunctionDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
	#insert #run METHOD_BODY(__selectors.objectFunctionDescriptor, #type (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4FunctionDescriptor);
}
objectStaticLinkingDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
	#insert #run METHOD_BODY(__selectors.objectStaticLinkingDescriptor, #type (self: *MTL4MeshRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor);
}
objectThreadgroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTL4MeshRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.objectThreadgroupSizeIsMultipleOfThreadExecutionWidth, #type (self: *MTL4MeshRenderPipelineDescriptor) -> bool);
}
payloadMemoryLength :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.payloadMemoryLength, #type (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger);
}
rasterSampleCount :: (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.rasterSampleCount, #type (self: *MTL4MeshRenderPipelineDescriptor) -> NSUInteger);
}
rasterizationEnabled :: (self: *MTL4MeshRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isRasterizationEnabled, #type (self: *MTL4MeshRenderPipelineDescriptor) -> bool);
}
requiredThreadsPerMeshThreadgroup :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.requiredThreadsPerMeshThreadgroup, #type (self: *MTL4MeshRenderPipelineDescriptor) -> MTLSize);
}
requiredThreadsPerObjectThreadgroup :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.requiredThreadsPerObjectThreadgroup, #type (self: *MTL4MeshRenderPipelineDescriptor) -> MTLSize);
}
reset :: (self: *MTL4MeshRenderPipelineDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTL4MeshRenderPipelineDescriptor) -> ());
}
setAlphaToCoverageState :: (self: *MTL4MeshRenderPipelineDescriptor, alphaToCoverageState: MTL4AlphaToCoverageState) -> () {
	#insert #run METHOD_BODY(__selectors.setAlphaToCoverageState_, #type (self: *MTL4MeshRenderPipelineDescriptor, alphaToCoverageState: MTL4AlphaToCoverageState) -> ());
}
setAlphaToOneState :: (self: *MTL4MeshRenderPipelineDescriptor, alphaToOneState: MTL4AlphaToOneState) -> () {
	#insert #run METHOD_BODY(__selectors.setAlphaToOneState_, #type (self: *MTL4MeshRenderPipelineDescriptor, alphaToOneState: MTL4AlphaToOneState) -> ());
}
setColorAttachmentMappingState :: (self: *MTL4MeshRenderPipelineDescriptor, colorAttachmentMappingState: MTL4LogicalToPhysicalColorAttachmentMappingState) -> () {
	#insert #run METHOD_BODY(__selectors.setColorAttachmentMappingState_, #type (self: *MTL4MeshRenderPipelineDescriptor, colorAttachmentMappingState: MTL4LogicalToPhysicalColorAttachmentMappingState) -> ());
}
setFragmentFunctionDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor, fragmentFunctionDescriptor: *MTL4FunctionDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentFunctionDescriptor_, #type (self: *MTL4MeshRenderPipelineDescriptor, fragmentFunctionDescriptor: *MTL4FunctionDescriptor) -> ());
}
setFragmentStaticLinkingDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor, fragmentStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentStaticLinkingDescriptor_, #type (self: *MTL4MeshRenderPipelineDescriptor, fragmentStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> ());
}
setMaxTotalThreadgroupsPerMeshGrid :: (self: *MTL4MeshRenderPipelineDescriptor, maxTotalThreadgroupsPerMeshGrid: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxTotalThreadgroupsPerMeshGrid_, #type (self: *MTL4MeshRenderPipelineDescriptor, maxTotalThreadgroupsPerMeshGrid: NSUInteger) -> ());
}
setMaxTotalThreadsPerMeshThreadgroup :: (self: *MTL4MeshRenderPipelineDescriptor, maxTotalThreadsPerMeshThreadgroup: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxTotalThreadsPerMeshThreadgroup_, #type (self: *MTL4MeshRenderPipelineDescriptor, maxTotalThreadsPerMeshThreadgroup: NSUInteger) -> ());
}
setMaxTotalThreadsPerObjectThreadgroup :: (self: *MTL4MeshRenderPipelineDescriptor, maxTotalThreadsPerObjectThreadgroup: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxTotalThreadsPerObjectThreadgroup_, #type (self: *MTL4MeshRenderPipelineDescriptor, maxTotalThreadsPerObjectThreadgroup: NSUInteger) -> ());
}
setMaxVertexAmplificationCount :: (self: *MTL4MeshRenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxVertexAmplificationCount_, #type (self: *MTL4MeshRenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> ());
}
setMeshFunctionDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor, meshFunctionDescriptor: *MTL4FunctionDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshFunctionDescriptor_, #type (self: *MTL4MeshRenderPipelineDescriptor, meshFunctionDescriptor: *MTL4FunctionDescriptor) -> ());
}
setMeshStaticLinkingDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor, meshStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshStaticLinkingDescriptor_, #type (self: *MTL4MeshRenderPipelineDescriptor, meshStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> ());
}
setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTL4MeshRenderPipelineDescriptor, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth_, #type (self: *MTL4MeshRenderPipelineDescriptor, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth: bool) -> ());
}
setObjectFunctionDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor, objectFunctionDescriptor: *MTL4FunctionDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectFunctionDescriptor_, #type (self: *MTL4MeshRenderPipelineDescriptor, objectFunctionDescriptor: *MTL4FunctionDescriptor) -> ());
}
setObjectStaticLinkingDescriptor :: (self: *MTL4MeshRenderPipelineDescriptor, objectStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectStaticLinkingDescriptor_, #type (self: *MTL4MeshRenderPipelineDescriptor, objectStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> ());
}
setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTL4MeshRenderPipelineDescriptor, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth_, #type (self: *MTL4MeshRenderPipelineDescriptor, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth: bool) -> ());
}
setPayloadMemoryLength :: (self: *MTL4MeshRenderPipelineDescriptor, payloadMemoryLength: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setPayloadMemoryLength_, #type (self: *MTL4MeshRenderPipelineDescriptor, payloadMemoryLength: NSUInteger) -> ());
}
setRasterSampleCount :: (self: *MTL4MeshRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRasterSampleCount_, #type (self: *MTL4MeshRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> ());
}
setRasterizationEnabled :: (self: *MTL4MeshRenderPipelineDescriptor, rasterizationEnabled: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setRasterizationEnabled_, #type (self: *MTL4MeshRenderPipelineDescriptor, rasterizationEnabled: bool) -> ());
}
setRequiredThreadsPerMeshThreadgroup :: (self: *MTL4MeshRenderPipelineDescriptor, requiredThreadsPerMeshThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.setRequiredThreadsPerMeshThreadgroup_, #type (self: *MTL4MeshRenderPipelineDescriptor, requiredThreadsPerMeshThreadgroup: MTLSize) -> ());
}
setRequiredThreadsPerObjectThreadgroup :: (self: *MTL4MeshRenderPipelineDescriptor, requiredThreadsPerObjectThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.setRequiredThreadsPerObjectThreadgroup_, #type (self: *MTL4MeshRenderPipelineDescriptor, requiredThreadsPerObjectThreadgroup: MTLSize) -> ());
}
setSupportFragmentBinaryLinking :: (self: *MTL4MeshRenderPipelineDescriptor, supportFragmentBinaryLinking: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportFragmentBinaryLinking_, #type (self: *MTL4MeshRenderPipelineDescriptor, supportFragmentBinaryLinking: bool) -> ());
}
setSupportIndirectCommandBuffers :: (self: *MTL4MeshRenderPipelineDescriptor, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportIndirectCommandBuffers_, #type (self: *MTL4MeshRenderPipelineDescriptor, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> ());
}
setSupportMeshBinaryLinking :: (self: *MTL4MeshRenderPipelineDescriptor, supportMeshBinaryLinking: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportMeshBinaryLinking_, #type (self: *MTL4MeshRenderPipelineDescriptor, supportMeshBinaryLinking: bool) -> ());
}
setSupportObjectBinaryLinking :: (self: *MTL4MeshRenderPipelineDescriptor, supportObjectBinaryLinking: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportObjectBinaryLinking_, #type (self: *MTL4MeshRenderPipelineDescriptor, supportObjectBinaryLinking: bool) -> ());
}
supportFragmentBinaryLinking :: (self: *MTL4MeshRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportFragmentBinaryLinking, #type (self: *MTL4MeshRenderPipelineDescriptor) -> bool);
}
supportIndirectCommandBuffers :: (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4IndirectCommandBufferSupportState {
	#insert #run METHOD_BODY(__selectors.supportIndirectCommandBuffers, #type (self: *MTL4MeshRenderPipelineDescriptor) -> MTL4IndirectCommandBufferSupportState);
}
supportMeshBinaryLinking :: (self: *MTL4MeshRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportMeshBinaryLinking, #type (self: *MTL4MeshRenderPipelineDescriptor) -> bool);
}
supportObjectBinaryLinking :: (self: *MTL4MeshRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportObjectBinaryLinking, #type (self: *MTL4MeshRenderPipelineDescriptor) -> bool);
}


MTLDrawable :: struct {}
addPresentedHandler :: (self: *MTLDrawable, block: MTLDrawablePresentedHandler) -> () {
	#insert #run METHOD_BODY(__selectors.addPresentedHandler_, #type (self: *MTLDrawable, block: MTLDrawablePresentedHandler) -> ());
}
presentedTime :: (self: *MTLDrawable) -> CFTimeInterval {
	#insert #run METHOD_BODY(__selectors.presentedTime, #type (self: *MTLDrawable) -> CFTimeInterval);
}
drawableID :: (self: *MTLDrawable) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.drawableID, #type (self: *MTLDrawable) -> NSUInteger);
}
present :: (self: *MTLDrawable) -> () {
	#insert #run METHOD_BODY(__selectors.present, #type (self: *MTLDrawable) -> ());
}
presentAfterMinimumDuration :: (self: *MTLDrawable, duration: CFTimeInterval) -> () {
	#insert #run METHOD_BODY(__selectors.presentAfterMinimumDuration_, #type (self: *MTLDrawable, duration: CFTimeInterval) -> ());
}
presentAtTime :: (self: *MTLDrawable, presentationTime: CFTimeInterval) -> () {
	#insert #run METHOD_BODY(__selectors.presentAtTime_, #type (self: *MTLDrawable, presentationTime: CFTimeInterval) -> ());
}


MTLDynamicLibrary :: struct {}
device :: (self: *MTLDynamicLibrary) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLDynamicLibrary) -> *MTLDevice);
}
installName :: (self: *MTLDynamicLibrary) -> *NSString {
	#insert #run METHOD_BODY(__selectors.installName, #type (self: *MTLDynamicLibrary) -> *NSString);
}
label :: (self: *MTLDynamicLibrary) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLDynamicLibrary) -> *NSString);
}
serializeToURL :: (self: *MTLDynamicLibrary, url: *NSURL, error: **NSError) -> bool {
	#insert #run METHOD_BODY(__selectors.serializeToURL_error_, #type (self: *MTLDynamicLibrary, url: *NSURL, error: **NSError) -> bool);
}
setLabel :: (self: *MTLDynamicLibrary, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLDynamicLibrary, label: *NSString) -> ());
}


MTL4FunctionDescriptor :: struct {}


MTLComputePassSampleBufferAttachmentDescriptor :: struct {}
endOfEncoderSampleIndex :: (self: *MTLComputePassSampleBufferAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.endOfEncoderSampleIndex, #type (self: *MTLComputePassSampleBufferAttachmentDescriptor) -> NSUInteger);
}
sampleBuffer :: (self: *MTLComputePassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
	#insert #run METHOD_BODY(__selectors.sampleBuffer, #type (self: *MTLComputePassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer);
}
setEndOfEncoderSampleIndex :: (self: *MTLComputePassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setEndOfEncoderSampleIndex_, #type (self: *MTLComputePassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> ());
}
setSampleBuffer :: (self: *MTLComputePassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setSampleBuffer_, #type (self: *MTLComputePassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> ());
}
setStartOfEncoderSampleIndex :: (self: *MTLComputePassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setStartOfEncoderSampleIndex_, #type (self: *MTLComputePassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> ());
}
startOfEncoderSampleIndex :: (self: *MTLComputePassSampleBufferAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.startOfEncoderSampleIndex, #type (self: *MTLComputePassSampleBufferAttachmentDescriptor) -> NSUInteger);
}


MTLComputePassSampleBufferAttachmentDescriptorArray :: struct {}
object :: (self: *MTLComputePassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLComputePassSampleBufferAttachmentDescriptor {
	#insert #run METHOD_BODY(__selectors.objectAtIndexedSubscript_, #type (self: *MTLComputePassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLComputePassSampleBufferAttachmentDescriptor);
}
setObject :: (self: *MTLComputePassSampleBufferAttachmentDescriptorArray, attachment: *MTLComputePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObject_atIndexedSubscript_, #type (self: *MTLComputePassSampleBufferAttachmentDescriptorArray, attachment: *MTLComputePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> ());
}


MTLComputePassDescriptor :: struct {}
computePassDescriptor :: (self: *MTLComputePassDescriptor) -> *MTLComputePassDescriptor {
	#insert #run METHOD_BODY(__selectors.computePassDescriptor, #type (self: *MTLComputePassDescriptor) -> *MTLComputePassDescriptor);
}
dispatchType :: (self: *MTLComputePassDescriptor) -> MTLDispatchType {
	#insert #run METHOD_BODY(__selectors.dispatchType, #type (self: *MTLComputePassDescriptor) -> MTLDispatchType);
}
sampleBufferAttachments :: (self: *MTLComputePassDescriptor) -> *MTLComputePassSampleBufferAttachmentDescriptorArray {
	#insert #run METHOD_BODY(__selectors.sampleBufferAttachments, #type (self: *MTLComputePassDescriptor) -> *MTLComputePassSampleBufferAttachmentDescriptorArray);
}
setDispatchType :: (self: *MTLComputePassDescriptor, dispatchType: MTLDispatchType) -> () {
	#insert #run METHOD_BODY(__selectors.setDispatchType_, #type (self: *MTLComputePassDescriptor, dispatchType: MTLDispatchType) -> ());
}


MTL4LibraryFunctionDescriptor :: struct { using #as _: MTL4FunctionDescriptor; }
library :: (self: *MTL4LibraryFunctionDescriptor) -> *MTLLibrary {
	#insert #run METHOD_BODY(__selectors.library, #type (self: *MTL4LibraryFunctionDescriptor) -> *MTLLibrary);
}
name :: (self: *MTL4LibraryFunctionDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTL4LibraryFunctionDescriptor) -> *NSString);
}
setLibrary :: (self: *MTL4LibraryFunctionDescriptor, library: *MTLLibrary) -> () {
	#insert #run METHOD_BODY(__selectors.setLibrary_, #type (self: *MTL4LibraryFunctionDescriptor, library: *MTLLibrary) -> ());
}
setName :: (self: *MTL4LibraryFunctionDescriptor, name: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setName_, #type (self: *MTL4LibraryFunctionDescriptor, name: *NSString) -> ());
}


MTLFunctionConstantValues :: struct {}
reset :: (self: *MTLFunctionConstantValues) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTLFunctionConstantValues) -> ());
}
setConstantValue :: (self: *MTLFunctionConstantValues, value: *void, type: MTLDataType, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setConstantValue_type_atIndex_, #type (self: *MTLFunctionConstantValues, value: *void, type: MTLDataType, index: NSUInteger) -> ());
}
setConstantValue :: (self: *MTLFunctionConstantValues, value: *void, type: MTLDataType, name: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setConstantValue_type_withName_, #type (self: *MTLFunctionConstantValues, value: *void, type: MTLDataType, name: *NSString) -> ());
}
setConstantValues :: (self: *MTLFunctionConstantValues, values: *void, type: MTLDataType, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setConstantValues_type_withRange_, #type (self: *MTLFunctionConstantValues, values: *void, type: MTLDataType, range: NSRange) -> ());
}


MTLPipelineBufferDescriptor :: struct {}
mutability :: (self: *MTLPipelineBufferDescriptor) -> MTLMutability {
	#insert #run METHOD_BODY(__selectors.mutability, #type (self: *MTLPipelineBufferDescriptor) -> MTLMutability);
}
setMutability :: (self: *MTLPipelineBufferDescriptor, mutability: MTLMutability) -> () {
	#insert #run METHOD_BODY(__selectors.setMutability_, #type (self: *MTLPipelineBufferDescriptor, mutability: MTLMutability) -> ());
}


MTLPipelineBufferDescriptorArray :: struct {}
object :: (self: *MTLPipelineBufferDescriptorArray, bufferIndex: NSUInteger) -> *MTLPipelineBufferDescriptor {
	#insert #run METHOD_BODY(__selectors.objectAtIndexedSubscript_, #type (self: *MTLPipelineBufferDescriptorArray, bufferIndex: NSUInteger) -> *MTLPipelineBufferDescriptor);
}
setObject :: (self: *MTLPipelineBufferDescriptorArray, buffer: *MTLPipelineBufferDescriptor, bufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObject_atIndexedSubscript_, #type (self: *MTLPipelineBufferDescriptorArray, buffer: *MTLPipelineBufferDescriptor, bufferIndex: NSUInteger) -> ());
}


MTL4StitchedFunctionDescriptor :: struct { using #as _: MTL4FunctionDescriptor; }
functionDescriptors :: (self: *MTL4StitchedFunctionDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.functionDescriptors, #type (self: *MTL4StitchedFunctionDescriptor) -> *NSArray);
}
functionGraph :: (self: *MTL4StitchedFunctionDescriptor) -> *MTLFunctionStitchingGraph {
	#insert #run METHOD_BODY(__selectors.functionGraph, #type (self: *MTL4StitchedFunctionDescriptor) -> *MTLFunctionStitchingGraph);
}
setFunctionDescriptors :: (self: *MTL4StitchedFunctionDescriptor, functionDescriptors: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setFunctionDescriptors_, #type (self: *MTL4StitchedFunctionDescriptor, functionDescriptors: *NSArray) -> ());
}
setFunctionGraph :: (self: *MTL4StitchedFunctionDescriptor, functionGraph: *MTLFunctionStitchingGraph) -> () {
	#insert #run METHOD_BODY(__selectors.setFunctionGraph_, #type (self: *MTL4StitchedFunctionDescriptor, functionGraph: *MTLFunctionStitchingGraph) -> ());
}


MTL4CompilerTask :: struct {}
compiler :: (self: *MTL4CompilerTask) -> *MTL4Compiler {
	#insert #run METHOD_BODY(__selectors.compiler, #type (self: *MTL4CompilerTask) -> *MTL4Compiler);
}
status :: (self: *MTL4CompilerTask) -> MTL4CompilerTaskStatus {
	#insert #run METHOD_BODY(__selectors.status, #type (self: *MTL4CompilerTask) -> MTL4CompilerTaskStatus);
}
waitUntilCompleted :: (self: *MTL4CompilerTask) -> () {
	#insert #run METHOD_BODY(__selectors.waitUntilCompleted, #type (self: *MTL4CompilerTask) -> ());
}


MTLRenderCommandEncoder :: struct { using #as _: MTLCommandEncoder; }
dispatchThreadsPerTile :: (self: *MTLRenderCommandEncoder, threadsPerTile: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.dispatchThreadsPerTile_, #type (self: *MTLRenderCommandEncoder, threadsPerTile: MTLSize) -> ());
}
drawIndexedPatches :: (self: *MTLRenderCommandEncoder, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, controlPointIndexBuffer: *MTLBuffer, controlPointIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_, #type (self: *MTLRenderCommandEncoder, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, controlPointIndexBuffer: *MTLBuffer, controlPointIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> ());
}
drawIndexedPatches :: (self: *MTLRenderCommandEncoder, numberOfPatchControlPoints: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, controlPointIndexBuffer: *MTLBuffer, controlPointIndexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset_, #type (self: *MTLRenderCommandEncoder, numberOfPatchControlPoints: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, controlPointIndexBuffer: *MTLBuffer, controlPointIndexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> ());
}
drawIndexedPrimitives :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_, #type (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger) -> ());
}
drawIndexedPrimitives :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_, #type (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger) -> ());
}
drawIndexedPrimitives :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_, #type (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> ());
}
drawIndexedPrimitives :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_, #type (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indexType: MTLIndexType, indexBuffer: *MTLBuffer, indexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> ());
}
drawMeshThreadgroups :: (self: *MTLRenderCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, #type (self: *MTLRenderCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> ());
}
drawMeshThreadgroups :: (self: *MTLRenderCommandEncoder, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, #type (self: *MTLRenderCommandEncoder, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> ());
}
drawMeshThreads :: (self: *MTLRenderCommandEncoder, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, #type (self: *MTLRenderCommandEncoder, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> ());
}
drawPatches :: (self: *MTLRenderCommandEncoder, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_, #type (self: *MTLRenderCommandEncoder, numberOfPatchControlPoints: NSUInteger, patchStart: NSUInteger, patchCount: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> ());
}
drawPatches :: (self: *MTLRenderCommandEncoder, numberOfPatchControlPoints: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset_, #type (self: *MTLRenderCommandEncoder, numberOfPatchControlPoints: NSUInteger, patchIndexBuffer: *MTLBuffer, patchIndexBufferOffset: NSUInteger, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> ());
}
drawPrimitives :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawPrimitives_vertexStart_vertexCount_instanceCount_, #type (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger) -> ());
}
drawPrimitives :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawPrimitives_vertexStart_vertexCount_, #type (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger) -> ());
}
drawPrimitives :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_, #type (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> ());
}
drawPrimitives :: (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawPrimitives_indirectBuffer_indirectBufferOffset_, #type (self: *MTLRenderCommandEncoder, primitiveType: MTLPrimitiveType, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> ());
}
executeCommandsInBuffer :: (self: *MTLRenderCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.executeCommandsInBuffer_withRange_, #type (self: *MTLRenderCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> ());
}
executeCommandsInBuffer :: (self: *MTLRenderCommandEncoder, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_, #type (self: *MTLRenderCommandEncoder, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> ());
}
memoryBarrier :: (self: *MTLRenderCommandEncoder, scope: MTLBarrierScope, after: MTLRenderStages, before: MTLRenderStages) -> () {
	#insert #run METHOD_BODY(__selectors.memoryBarrierWithScope_afterStages_beforeStages_, #type (self: *MTLRenderCommandEncoder, scope: MTLBarrierScope, after: MTLRenderStages, before: MTLRenderStages) -> ());
}
memoryBarrier :: (self: *MTLRenderCommandEncoder, resources: **MTLResource, count: NSUInteger, after: MTLRenderStages, before: MTLRenderStages) -> () {
	#insert #run METHOD_BODY(__selectors.memoryBarrierWithResources_count_afterStages_beforeStages_, #type (self: *MTLRenderCommandEncoder, resources: **MTLResource, count: NSUInteger, after: MTLRenderStages, before: MTLRenderStages) -> ());
}
sampleCountersInBuffer :: (self: *MTLRenderCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: bool) -> () {
	#insert #run METHOD_BODY(__selectors.sampleCountersInBuffer_atSampleIndex_withBarrier_, #type (self: *MTLRenderCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: bool) -> ());
}
setBlendColor :: (self: *MTLRenderCommandEncoder, red: float, green: float, blue: float, alpha: float) -> () {
	#insert #run METHOD_BODY(__selectors.setBlendColorRed_green_blue_alpha_, #type (self: *MTLRenderCommandEncoder, red: float, green: float, blue: float, alpha: float) -> ());
}
setColorAttachmentMap :: (self: *MTLRenderCommandEncoder, mapping: *MTLLogicalToPhysicalColorAttachmentMap) -> () {
	#insert #run METHOD_BODY(__selectors.setColorAttachmentMap_, #type (self: *MTLRenderCommandEncoder, mapping: *MTLLogicalToPhysicalColorAttachmentMap) -> ());
}
setColorStoreAction :: (self: *MTLRenderCommandEncoder, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setColorStoreAction_atIndex_, #type (self: *MTLRenderCommandEncoder, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> ());
}
setColorStoreActionOptions :: (self: *MTLRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions, colorAttachmentIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setColorStoreActionOptions_atIndex_, #type (self: *MTLRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions, colorAttachmentIndex: NSUInteger) -> ());
}
setCullMode :: (self: *MTLRenderCommandEncoder, cullMode: MTLCullMode) -> () {
	#insert #run METHOD_BODY(__selectors.setCullMode_, #type (self: *MTLRenderCommandEncoder, cullMode: MTLCullMode) -> ());
}
setDepthBias :: (self: *MTLRenderCommandEncoder, depthBias: float, slopeScale: float, clamp: float) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthBias_slopeScale_clamp_, #type (self: *MTLRenderCommandEncoder, depthBias: float, slopeScale: float, clamp: float) -> ());
}
setDepthClipMode :: (self: *MTLRenderCommandEncoder, depthClipMode: MTLDepthClipMode) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthClipMode_, #type (self: *MTLRenderCommandEncoder, depthClipMode: MTLDepthClipMode) -> ());
}
setDepthStencilState :: (self: *MTLRenderCommandEncoder, depthStencilState: *MTLDepthStencilState) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthStencilState_, #type (self: *MTLRenderCommandEncoder, depthStencilState: *MTLDepthStencilState) -> ());
}
setDepthStoreAction :: (self: *MTLRenderCommandEncoder, storeAction: MTLStoreAction) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthStoreAction_, #type (self: *MTLRenderCommandEncoder, storeAction: MTLStoreAction) -> ());
}
setDepthStoreActionOptions :: (self: *MTLRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthStoreActionOptions_, #type (self: *MTLRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> ());
}
setDepthTestBounds :: (self: *MTLRenderCommandEncoder, minBound: float, maxBound: float) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthTestMinBound_maxBound_, #type (self: *MTLRenderCommandEncoder, minBound: float, maxBound: float) -> ());
}
setFragmentAccelerationStructure :: (self: *MTLRenderCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentAccelerationStructure_atBufferIndex_, #type (self: *MTLRenderCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> ());
}
setFragmentBuffer :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentBuffer_offset_atIndex_, #type (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> ());
}
setFragmentBufferOffset :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentBufferOffset_atIndex_, #type (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> ());
}
setFragmentBuffers :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentBuffers_offsets_withRange_, #type (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> ());
}
setFragmentBytes :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentBytes_length_atIndex_, #type (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> ());
}
setFragmentIntersectionFunctionTable :: (self: *MTLRenderCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentIntersectionFunctionTable_atBufferIndex_, #type (self: *MTLRenderCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> ());
}
setFragmentIntersectionFunctionTables :: (self: *MTLRenderCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentIntersectionFunctionTables_withBufferRange_, #type (self: *MTLRenderCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> ());
}
setFragmentSamplerState :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentSamplerState_atIndex_, #type (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> ());
}
setFragmentSamplerState :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_, #type (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> ());
}
setFragmentSamplerStates :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentSamplerStates_withRange_, #type (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> ());
}
setFragmentSamplerStates :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_, #type (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> ());
}
setFragmentTexture :: (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentTexture_atIndex_, #type (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> ());
}
setFragmentTextures :: (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentTextures_withRange_, #type (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> ());
}
setFragmentVisibleFunctionTable :: (self: *MTLRenderCommandEncoder, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentVisibleFunctionTable_atBufferIndex_, #type (self: *MTLRenderCommandEncoder, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> ());
}
setFragmentVisibleFunctionTables :: (self: *MTLRenderCommandEncoder, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentVisibleFunctionTables_withBufferRange_, #type (self: *MTLRenderCommandEncoder, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> ());
}
setFrontFacingWinding :: (self: *MTLRenderCommandEncoder, frontFacingWinding: MTLWinding) -> () {
	#insert #run METHOD_BODY(__selectors.setFrontFacingWinding_, #type (self: *MTLRenderCommandEncoder, frontFacingWinding: MTLWinding) -> ());
}
setMeshBuffer :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshBuffer_offset_atIndex_, #type (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> ());
}
setMeshBufferOffset :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshBufferOffset_atIndex_, #type (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> ());
}
setMeshBuffers :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshBuffers_offsets_withRange_, #type (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> ());
}
setMeshBytes :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshBytes_length_atIndex_, #type (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> ());
}
setMeshSamplerState :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshSamplerState_atIndex_, #type (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> ());
}
setMeshSamplerState :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshSamplerState_lodMinClamp_lodMaxClamp_atIndex_, #type (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> ());
}
setMeshSamplerStates :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshSamplerStates_withRange_, #type (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> ());
}
setMeshSamplerStates :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange_, #type (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> ());
}
setMeshTexture :: (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshTexture_atIndex_, #type (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> ());
}
setMeshTextures :: (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshTextures_withRange_, #type (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> ());
}
setObjectBuffer :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectBuffer_offset_atIndex_, #type (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> ());
}
setObjectBufferOffset :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectBufferOffset_atIndex_, #type (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> ());
}
setObjectBuffers :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectBuffers_offsets_withRange_, #type (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> ());
}
setObjectBytes :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectBytes_length_atIndex_, #type (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> ());
}
setObjectSamplerState :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectSamplerState_atIndex_, #type (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> ());
}
setObjectSamplerState :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectSamplerState_lodMinClamp_lodMaxClamp_atIndex_, #type (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> ());
}
setObjectSamplerStates :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectSamplerStates_withRange_, #type (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> ());
}
setObjectSamplerStates :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange_, #type (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> ());
}
setObjectTexture :: (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectTexture_atIndex_, #type (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> ());
}
setObjectTextures :: (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectTextures_withRange_, #type (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> ());
}
setObjectThreadgroupMemoryLength :: (self: *MTLRenderCommandEncoder, length: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectThreadgroupMemoryLength_atIndex_, #type (self: *MTLRenderCommandEncoder, length: NSUInteger, index: NSUInteger) -> ());
}
setRenderPipelineState :: (self: *MTLRenderCommandEncoder, pipelineState: *MTLRenderPipelineState) -> () {
	#insert #run METHOD_BODY(__selectors.setRenderPipelineState_, #type (self: *MTLRenderCommandEncoder, pipelineState: *MTLRenderPipelineState) -> ());
}
setScissorRect :: (self: *MTLRenderCommandEncoder, rect: MTLScissorRect) -> () {
	#insert #run METHOD_BODY(__selectors.setScissorRect_, #type (self: *MTLRenderCommandEncoder, rect: MTLScissorRect) -> ());
}
setScissorRects :: (self: *MTLRenderCommandEncoder, scissorRects: *MTLScissorRect, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setScissorRects_count_, #type (self: *MTLRenderCommandEncoder, scissorRects: *MTLScissorRect, count: NSUInteger) -> ());
}
setStencilReferenceValue :: (self: *MTLRenderCommandEncoder, referenceValue: u32) -> () {
	#insert #run METHOD_BODY(__selectors.setStencilReferenceValue_, #type (self: *MTLRenderCommandEncoder, referenceValue: u32) -> ());
}
setStencilReferenceValues :: (self: *MTLRenderCommandEncoder, frontReferenceValue: u32, backReferenceValue: u32) -> () {
	#insert #run METHOD_BODY(__selectors.setStencilFrontReferenceValue_backReferenceValue_, #type (self: *MTLRenderCommandEncoder, frontReferenceValue: u32, backReferenceValue: u32) -> ());
}
setStencilStoreAction :: (self: *MTLRenderCommandEncoder, storeAction: MTLStoreAction) -> () {
	#insert #run METHOD_BODY(__selectors.setStencilStoreAction_, #type (self: *MTLRenderCommandEncoder, storeAction: MTLStoreAction) -> ());
}
setStencilStoreActionOptions :: (self: *MTLRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> () {
	#insert #run METHOD_BODY(__selectors.setStencilStoreActionOptions_, #type (self: *MTLRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> ());
}
setTessellationFactorBuffer :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, instanceStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTessellationFactorBuffer_offset_instanceStride_, #type (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, instanceStride: NSUInteger) -> ());
}
setTessellationFactorScale :: (self: *MTLRenderCommandEncoder, scale: float) -> () {
	#insert #run METHOD_BODY(__selectors.setTessellationFactorScale_, #type (self: *MTLRenderCommandEncoder, scale: float) -> ());
}
setThreadgroupMemoryLength :: (self: *MTLRenderCommandEncoder, length: NSUInteger, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setThreadgroupMemoryLength_offset_atIndex_, #type (self: *MTLRenderCommandEncoder, length: NSUInteger, offset: NSUInteger, index: NSUInteger) -> ());
}
setTileAccelerationStructure :: (self: *MTLRenderCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTileAccelerationStructure_atBufferIndex_, #type (self: *MTLRenderCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> ());
}
setTileBuffer :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTileBuffer_offset_atIndex_, #type (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> ());
}
setTileBufferOffset :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTileBufferOffset_atIndex_, #type (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> ());
}
setTileBuffers :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setTileBuffers_offsets_withRange_, #type (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> ());
}
setTileBytes :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTileBytes_length_atIndex_, #type (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> ());
}
setTileIntersectionFunctionTable :: (self: *MTLRenderCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTileIntersectionFunctionTable_atBufferIndex_, #type (self: *MTLRenderCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> ());
}
setTileIntersectionFunctionTables :: (self: *MTLRenderCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setTileIntersectionFunctionTables_withBufferRange_, #type (self: *MTLRenderCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> ());
}
setTileSamplerState :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTileSamplerState_atIndex_, #type (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> ());
}
setTileSamplerState :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex_, #type (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> ());
}
setTileSamplerStates :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setTileSamplerStates_withRange_, #type (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> ());
}
setTileSamplerStates :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange_, #type (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> ());
}
setTileTexture :: (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTileTexture_atIndex_, #type (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> ());
}
setTileTextures :: (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setTileTextures_withRange_, #type (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> ());
}
setTileVisibleFunctionTable :: (self: *MTLRenderCommandEncoder, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTileVisibleFunctionTable_atBufferIndex_, #type (self: *MTLRenderCommandEncoder, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> ());
}
setTileVisibleFunctionTables :: (self: *MTLRenderCommandEncoder, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setTileVisibleFunctionTables_withBufferRange_, #type (self: *MTLRenderCommandEncoder, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> ());
}
setTriangleFillMode :: (self: *MTLRenderCommandEncoder, fillMode: MTLTriangleFillMode) -> () {
	#insert #run METHOD_BODY(__selectors.setTriangleFillMode_, #type (self: *MTLRenderCommandEncoder, fillMode: MTLTriangleFillMode) -> ());
}
setVertexAccelerationStructure :: (self: *MTLRenderCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexAccelerationStructure_atBufferIndex_, #type (self: *MTLRenderCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> ());
}
setVertexAmplificationCount :: (self: *MTLRenderCommandEncoder, count: NSUInteger, viewMappings: *MTLVertexAmplificationViewMapping) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexAmplificationCount_viewMappings_, #type (self: *MTLRenderCommandEncoder, count: NSUInteger, viewMappings: *MTLVertexAmplificationViewMapping) -> ());
}
setVertexBuffer :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexBuffer_offset_atIndex_, #type (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> ());
}
setVertexBuffer :: (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexBuffer_offset_attributeStride_atIndex_, #type (self: *MTLRenderCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> ());
}
setVertexBufferOffset :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexBufferOffset_atIndex_, #type (self: *MTLRenderCommandEncoder, offset: NSUInteger, index: NSUInteger) -> ());
}
setVertexBufferOffset :: (self: *MTLRenderCommandEncoder, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexBufferOffset_attributeStride_atIndex_, #type (self: *MTLRenderCommandEncoder, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> ());
}
setVertexBuffers :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexBuffers_offsets_withRange_, #type (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> ());
}
setVertexBuffers :: (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, strides: *NSUInteger, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexBuffers_offsets_attributeStrides_withRange_, #type (self: *MTLRenderCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, strides: *NSUInteger, range: NSRange) -> ());
}
setVertexBytes :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexBytes_length_atIndex_, #type (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> ());
}
setVertexBytes :: (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, stride: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexBytes_length_attributeStride_atIndex_, #type (self: *MTLRenderCommandEncoder, bytes: *void, length: NSUInteger, stride: NSUInteger, index: NSUInteger) -> ());
}
setVertexIntersectionFunctionTable :: (self: *MTLRenderCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexIntersectionFunctionTable_atBufferIndex_, #type (self: *MTLRenderCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> ());
}
setVertexIntersectionFunctionTables :: (self: *MTLRenderCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexIntersectionFunctionTables_withBufferRange_, #type (self: *MTLRenderCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> ());
}
setVertexSamplerState :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexSamplerState_atIndex_, #type (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> ());
}
setVertexSamplerState :: (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_, #type (self: *MTLRenderCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> ());
}
setVertexSamplerStates :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexSamplerStates_withRange_, #type (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> ());
}
setVertexSamplerStates :: (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_, #type (self: *MTLRenderCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> ());
}
setVertexTexture :: (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexTexture_atIndex_, #type (self: *MTLRenderCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> ());
}
setVertexTextures :: (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexTextures_withRange_, #type (self: *MTLRenderCommandEncoder, textures: **MTLTexture, range: NSRange) -> ());
}
setVertexVisibleFunctionTable :: (self: *MTLRenderCommandEncoder, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexVisibleFunctionTable_atBufferIndex_, #type (self: *MTLRenderCommandEncoder, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> ());
}
setVertexVisibleFunctionTables :: (self: *MTLRenderCommandEncoder, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexVisibleFunctionTables_withBufferRange_, #type (self: *MTLRenderCommandEncoder, functionTables: **MTLVisibleFunctionTable, range: NSRange) -> ());
}
setViewport :: (self: *MTLRenderCommandEncoder, viewport: MTLViewport) -> () {
	#insert #run METHOD_BODY(__selectors.setViewport_, #type (self: *MTLRenderCommandEncoder, viewport: MTLViewport) -> ());
}
setViewports :: (self: *MTLRenderCommandEncoder, viewports: *MTLViewport, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setViewports_count_, #type (self: *MTLRenderCommandEncoder, viewports: *MTLViewport, count: NSUInteger) -> ());
}
setVisibilityResultMode :: (self: *MTLRenderCommandEncoder, mode: MTLVisibilityResultMode, offset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVisibilityResultMode_offset_, #type (self: *MTLRenderCommandEncoder, mode: MTLVisibilityResultMode, offset: NSUInteger) -> ());
}
textureBarrier :: (self: *MTLRenderCommandEncoder) -> () {
	#insert #run METHOD_BODY(__selectors.textureBarrier, #type (self: *MTLRenderCommandEncoder) -> ());
}
tileHeight :: (self: *MTLRenderCommandEncoder) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.tileHeight, #type (self: *MTLRenderCommandEncoder) -> NSUInteger);
}
tileWidth :: (self: *MTLRenderCommandEncoder) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.tileWidth, #type (self: *MTLRenderCommandEncoder) -> NSUInteger);
}
updateFence :: (self: *MTLRenderCommandEncoder, fence: *MTLFence, stages: MTLRenderStages) -> () {
	#insert #run METHOD_BODY(__selectors.updateFence_afterStages_, #type (self: *MTLRenderCommandEncoder, fence: *MTLFence, stages: MTLRenderStages) -> ());
}
useHeap :: (self: *MTLRenderCommandEncoder, heap: *MTLHeap) -> () {
	#insert #run METHOD_BODY(__selectors.useHeap_, #type (self: *MTLRenderCommandEncoder, heap: *MTLHeap) -> ());
}
useHeap :: (self: *MTLRenderCommandEncoder, heap: *MTLHeap, stages: MTLRenderStages) -> () {
	#insert #run METHOD_BODY(__selectors.useHeap_stages_, #type (self: *MTLRenderCommandEncoder, heap: *MTLHeap, stages: MTLRenderStages) -> ());
}
useHeaps :: (self: *MTLRenderCommandEncoder, heaps: **MTLHeap, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.useHeaps_count_, #type (self: *MTLRenderCommandEncoder, heaps: **MTLHeap, count: NSUInteger) -> ());
}
useHeaps :: (self: *MTLRenderCommandEncoder, heaps: **MTLHeap, count: NSUInteger, stages: MTLRenderStages) -> () {
	#insert #run METHOD_BODY(__selectors.useHeaps_count_stages_, #type (self: *MTLRenderCommandEncoder, heaps: **MTLHeap, count: NSUInteger, stages: MTLRenderStages) -> ());
}
useResource :: (self: *MTLRenderCommandEncoder, resource: *MTLResource, usage: MTLResourceUsage) -> () {
	#insert #run METHOD_BODY(__selectors.useResource_usage_, #type (self: *MTLRenderCommandEncoder, resource: *MTLResource, usage: MTLResourceUsage) -> ());
}
useResource :: (self: *MTLRenderCommandEncoder, resource: *MTLResource, usage: MTLResourceUsage, stages: MTLRenderStages) -> () {
	#insert #run METHOD_BODY(__selectors.useResource_usage_stages_, #type (self: *MTLRenderCommandEncoder, resource: *MTLResource, usage: MTLResourceUsage, stages: MTLRenderStages) -> ());
}
useResources :: (self: *MTLRenderCommandEncoder, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> () {
	#insert #run METHOD_BODY(__selectors.useResources_count_usage_, #type (self: *MTLRenderCommandEncoder, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> ());
}
useResources :: (self: *MTLRenderCommandEncoder, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage, stages: MTLRenderStages) -> () {
	#insert #run METHOD_BODY(__selectors.useResources_count_usage_stages_, #type (self: *MTLRenderCommandEncoder, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage, stages: MTLRenderStages) -> ());
}
waitForFence :: (self: *MTLRenderCommandEncoder, fence: *MTLFence, stages: MTLRenderStages) -> () {
	#insert #run METHOD_BODY(__selectors.waitForFence_beforeStages_, #type (self: *MTLRenderCommandEncoder, fence: *MTLFence, stages: MTLRenderStages) -> ());
}


MTLTextureViewPool :: struct { using #as _: MTLResourceViewPool; }
setTextureView :: (self: *MTLTextureViewPool, texture: *MTLTexture, index: NSUInteger) -> MTLResourceID {
	#insert #run METHOD_BODY(__selectors.setTextureView_atIndex_, #type (self: *MTLTextureViewPool, texture: *MTLTexture, index: NSUInteger) -> MTLResourceID);
}
setTextureView :: (self: *MTLTextureViewPool, texture: *MTLTexture, descriptor: *MTLTextureViewDescriptor, index: NSUInteger) -> MTLResourceID {
	#insert #run METHOD_BODY(__selectors.setTextureView_descriptor_atIndex_, #type (self: *MTLTextureViewPool, texture: *MTLTexture, descriptor: *MTLTextureViewDescriptor, index: NSUInteger) -> MTLResourceID);
}
setTextureViewFromBuffer :: (self: *MTLTextureViewPool, buffer: *MTLBuffer, descriptor: *MTLTextureDescriptor, offset: NSUInteger, bytesPerRow: NSUInteger, index: NSUInteger) -> MTLResourceID {
	#insert #run METHOD_BODY(__selectors.setTextureViewFromBuffer_descriptor_offset_bytesPerRow_atIndex_, #type (self: *MTLTextureViewPool, buffer: *MTLBuffer, descriptor: *MTLTextureDescriptor, offset: NSUInteger, bytesPerRow: NSUInteger, index: NSUInteger) -> MTLResourceID);
}


MTLTensorExtents :: struct {}
extentAtDimensionIndex :: (self: *MTLTensorExtents, dimensionIndex: NSUInteger) -> NSInteger {
	#insert #run METHOD_BODY(__selectors.extentAtDimensionIndex_, #type (self: *MTLTensorExtents, dimensionIndex: NSUInteger) -> NSInteger);
}
init :: (self: *MTLTensorExtents, rank: NSUInteger, values: *NSInteger) -> *MTLTensorExtents {
	#insert #run METHOD_BODY(__selectors.initWithRank_values_, #type (self: *MTLTensorExtents, rank: NSUInteger, values: *NSInteger) -> *MTLTensorExtents);
}
rank :: (self: *MTLTensorExtents) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.rank, #type (self: *MTLTensorExtents) -> NSUInteger);
}


MTLTensorDescriptor :: struct {}
cpuCacheMode :: (self: *MTLTensorDescriptor) -> MTLCPUCacheMode {
	#insert #run METHOD_BODY(__selectors.cpuCacheMode, #type (self: *MTLTensorDescriptor) -> MTLCPUCacheMode);
}
dataType :: (self: *MTLTensorDescriptor) -> MTLTensorDataType {
	#insert #run METHOD_BODY(__selectors.dataType, #type (self: *MTLTensorDescriptor) -> MTLTensorDataType);
}
dimensions :: (self: *MTLTensorDescriptor) -> *MTLTensorExtents {
	#insert #run METHOD_BODY(__selectors.dimensions, #type (self: *MTLTensorDescriptor) -> *MTLTensorExtents);
}
hazardTrackingMode :: (self: *MTLTensorDescriptor) -> MTLHazardTrackingMode {
	#insert #run METHOD_BODY(__selectors.hazardTrackingMode, #type (self: *MTLTensorDescriptor) -> MTLHazardTrackingMode);
}
resourceOptions :: (self: *MTLTensorDescriptor) -> MTLResourceOptions {
	#insert #run METHOD_BODY(__selectors.resourceOptions, #type (self: *MTLTensorDescriptor) -> MTLResourceOptions);
}
setCpuCacheMode :: (self: *MTLTensorDescriptor, cpuCacheMode: MTLCPUCacheMode) -> () {
	#insert #run METHOD_BODY(__selectors.setCpuCacheMode_, #type (self: *MTLTensorDescriptor, cpuCacheMode: MTLCPUCacheMode) -> ());
}
setDataType :: (self: *MTLTensorDescriptor, dataType: MTLTensorDataType) -> () {
	#insert #run METHOD_BODY(__selectors.setDataType_, #type (self: *MTLTensorDescriptor, dataType: MTLTensorDataType) -> ());
}
setDimensions :: (self: *MTLTensorDescriptor, dimensions: *MTLTensorExtents) -> () {
	#insert #run METHOD_BODY(__selectors.setDimensions_, #type (self: *MTLTensorDescriptor, dimensions: *MTLTensorExtents) -> ());
}
setHazardTrackingMode :: (self: *MTLTensorDescriptor, hazardTrackingMode: MTLHazardTrackingMode) -> () {
	#insert #run METHOD_BODY(__selectors.setHazardTrackingMode_, #type (self: *MTLTensorDescriptor, hazardTrackingMode: MTLHazardTrackingMode) -> ());
}
setResourceOptions :: (self: *MTLTensorDescriptor, resourceOptions: MTLResourceOptions) -> () {
	#insert #run METHOD_BODY(__selectors.setResourceOptions_, #type (self: *MTLTensorDescriptor, resourceOptions: MTLResourceOptions) -> ());
}
setStorageMode :: (self: *MTLTensorDescriptor, storageMode: MTLStorageMode) -> () {
	#insert #run METHOD_BODY(__selectors.setStorageMode_, #type (self: *MTLTensorDescriptor, storageMode: MTLStorageMode) -> ());
}
setStrides :: (self: *MTLTensorDescriptor, strides: *MTLTensorExtents) -> () {
	#insert #run METHOD_BODY(__selectors.setStrides_, #type (self: *MTLTensorDescriptor, strides: *MTLTensorExtents) -> ());
}
setUsage :: (self: *MTLTensorDescriptor, usage: MTLTensorUsage) -> () {
	#insert #run METHOD_BODY(__selectors.setUsage_, #type (self: *MTLTensorDescriptor, usage: MTLTensorUsage) -> ());
}
storageMode :: (self: *MTLTensorDescriptor) -> MTLStorageMode {
	#insert #run METHOD_BODY(__selectors.storageMode, #type (self: *MTLTensorDescriptor) -> MTLStorageMode);
}
strides :: (self: *MTLTensorDescriptor) -> *MTLTensorExtents {
	#insert #run METHOD_BODY(__selectors.strides, #type (self: *MTLTensorDescriptor) -> *MTLTensorExtents);
}
usage :: (self: *MTLTensorDescriptor) -> MTLTensorUsage {
	#insert #run METHOD_BODY(__selectors.usage, #type (self: *MTLTensorDescriptor) -> MTLTensorUsage);
}


MTLTensor :: struct { using #as _: MTLResource; }
buffer :: (self: *MTLTensor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.buffer, #type (self: *MTLTensor) -> *MTLBuffer);
}
bufferOffset :: (self: *MTLTensor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.bufferOffset, #type (self: *MTLTensor) -> NSUInteger);
}
dataType :: (self: *MTLTensor) -> MTLTensorDataType {
	#insert #run METHOD_BODY(__selectors.dataType, #type (self: *MTLTensor) -> MTLTensorDataType);
}
dimensions :: (self: *MTLTensor) -> *MTLTensorExtents {
	#insert #run METHOD_BODY(__selectors.dimensions, #type (self: *MTLTensor) -> *MTLTensorExtents);
}
getBytes :: (self: *MTLTensor, bytes: *void, strides: *MTLTensorExtents, sliceOrigin: *MTLTensorExtents, sliceDimensions: *MTLTensorExtents) -> () {
	#insert #run METHOD_BODY(__selectors.getBytes_strides_fromSliceOrigin_sliceDimensions_, #type (self: *MTLTensor, bytes: *void, strides: *MTLTensorExtents, sliceOrigin: *MTLTensorExtents, sliceDimensions: *MTLTensorExtents) -> ());
}
gpuResourceID :: (self: *MTLTensor) -> MTLResourceID {
	#insert #run METHOD_BODY(__selectors.gpuResourceID, #type (self: *MTLTensor) -> MTLResourceID);
}
replaceSliceOrigin :: (self: *MTLTensor, sliceOrigin: *MTLTensorExtents, sliceDimensions: *MTLTensorExtents, bytes: *void, strides: *MTLTensorExtents) -> () {
	#insert #run METHOD_BODY(__selectors.replaceSliceOrigin_sliceDimensions_withBytes_strides_, #type (self: *MTLTensor, sliceOrigin: *MTLTensorExtents, sliceDimensions: *MTLTensorExtents, bytes: *void, strides: *MTLTensorExtents) -> ());
}
strides :: (self: *MTLTensor) -> *MTLTensorExtents {
	#insert #run METHOD_BODY(__selectors.strides, #type (self: *MTLTensor) -> *MTLTensorExtents);
}
usage :: (self: *MTLTensor) -> MTLTensorUsage {
	#insert #run METHOD_BODY(__selectors.usage, #type (self: *MTLTensor) -> MTLTensorUsage);
}


MTLResidencySetDescriptor :: struct {}
initialCapacity :: (self: *MTLResidencySetDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.initialCapacity, #type (self: *MTLResidencySetDescriptor) -> NSUInteger);
}
label :: (self: *MTLResidencySetDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLResidencySetDescriptor) -> *NSString);
}
setInitialCapacity :: (self: *MTLResidencySetDescriptor, initialCapacity: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setInitialCapacity_, #type (self: *MTLResidencySetDescriptor, initialCapacity: NSUInteger) -> ());
}
setLabel :: (self: *MTLResidencySetDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLResidencySetDescriptor, label: *NSString) -> ());
}


MTLResidencySet :: struct {}
addAllocation :: (self: *MTLResidencySet, allocation: *MTLAllocation) -> () {
	#insert #run METHOD_BODY(__selectors.addAllocation_, #type (self: *MTLResidencySet, allocation: *MTLAllocation) -> ());
}
addAllocations :: (self: *MTLResidencySet, allocations: **MTLAllocation, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.addAllocations_count_, #type (self: *MTLResidencySet, allocations: **MTLAllocation, count: NSUInteger) -> ());
}
allAllocations :: (self: *MTLResidencySet) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.allAllocations, #type (self: *MTLResidencySet) -> *NSArray);
}
allocatedSize :: (self: *MTLResidencySet) -> u64 {
	#insert #run METHOD_BODY(__selectors.allocatedSize, #type (self: *MTLResidencySet) -> u64);
}
allocationCount :: (self: *MTLResidencySet) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.allocationCount, #type (self: *MTLResidencySet) -> NSUInteger);
}
commit :: (self: *MTLResidencySet) -> () {
	#insert #run METHOD_BODY(__selectors.commit, #type (self: *MTLResidencySet) -> ());
}
containsAllocation :: (self: *MTLResidencySet, anAllocation: *MTLAllocation) -> bool {
	#insert #run METHOD_BODY(__selectors.containsAllocation_, #type (self: *MTLResidencySet, anAllocation: *MTLAllocation) -> bool);
}
device :: (self: *MTLResidencySet) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLResidencySet) -> *MTLDevice);
}
endResidency :: (self: *MTLResidencySet) -> () {
	#insert #run METHOD_BODY(__selectors.endResidency, #type (self: *MTLResidencySet) -> ());
}
label :: (self: *MTLResidencySet) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLResidencySet) -> *NSString);
}
removeAllAllocations :: (self: *MTLResidencySet) -> () {
	#insert #run METHOD_BODY(__selectors.removeAllAllocations, #type (self: *MTLResidencySet) -> ());
}
removeAllocation :: (self: *MTLResidencySet, allocation: *MTLAllocation) -> () {
	#insert #run METHOD_BODY(__selectors.removeAllocation_, #type (self: *MTLResidencySet, allocation: *MTLAllocation) -> ());
}
removeAllocations :: (self: *MTLResidencySet, allocations: **MTLAllocation, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.removeAllocations_count_, #type (self: *MTLResidencySet, allocations: **MTLAllocation, count: NSUInteger) -> ());
}
requestResidency :: (self: *MTLResidencySet) -> () {
	#insert #run METHOD_BODY(__selectors.requestResidency, #type (self: *MTLResidencySet) -> ());
}


MTLBlitCommandEncoder :: struct { using #as _: MTLCommandEncoder; }
copyFromBuffer :: (self: *MTLBlitCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, #type (self: *MTLBlitCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> ());
}
copyFromBuffer :: (self: *MTLBlitCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin, options: MTLBlitOption) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_, #type (self: *MTLBlitCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin, options: MTLBlitOption) -> ());
}
copyFromBuffer :: (self: *MTLBlitCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, size: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, #type (self: *MTLBlitCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, size: NSUInteger) -> ());
}
copyFromTensor :: (self: *MTLBlitCommandEncoder, sourceTensor: *MTLTensor, sourceOrigin: *MTLTensorExtents, sourceDimensions: *MTLTensorExtents, destinationTensor: *MTLTensor, destinationOrigin: *MTLTensorExtents, destinationDimensions: *MTLTensorExtents) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromTensor_sourceOrigin_sourceDimensions_toTensor_destinationOrigin_destinationDimensions_, #type (self: *MTLBlitCommandEncoder, sourceTensor: *MTLTensor, sourceOrigin: *MTLTensorExtents, sourceDimensions: *MTLTensorExtents, destinationTensor: *MTLTensor, destinationOrigin: *MTLTensorExtents, destinationDimensions: *MTLTensorExtents) -> ());
}
copyFromTexture :: (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, #type (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> ());
}
copyFromTexture :: (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_, #type (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger) -> ());
}
copyFromTexture :: (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger, options: MTLBlitOption) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options_, #type (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger, options: MTLBlitOption) -> ());
}
copyFromTexture :: (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, sliceCount: NSUInteger, levelCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount_, #type (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, sliceCount: NSUInteger, levelCount: NSUInteger) -> ());
}
copyFromTexture :: (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromTexture_toTexture_, #type (self: *MTLBlitCommandEncoder, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture) -> ());
}
copyIndirectCommandBuffer :: (self: *MTLBlitCommandEncoder, source: *MTLIndirectCommandBuffer, sourceRange: NSRange, destination: *MTLIndirectCommandBuffer, destinationIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_, #type (self: *MTLBlitCommandEncoder, source: *MTLIndirectCommandBuffer, sourceRange: NSRange, destination: *MTLIndirectCommandBuffer, destinationIndex: NSUInteger) -> ());
}
fillBuffer :: (self: *MTLBlitCommandEncoder, buffer: *MTLBuffer, range: NSRange, value: u8) -> () {
	#insert #run METHOD_BODY(__selectors.fillBuffer_range_value_, #type (self: *MTLBlitCommandEncoder, buffer: *MTLBuffer, range: NSRange, value: u8) -> ());
}
generateMipmaps :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture) -> () {
	#insert #run METHOD_BODY(__selectors.generateMipmapsForTexture_, #type (self: *MTLBlitCommandEncoder, texture: *MTLTexture) -> ());
}
getTextureAccessCounters :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger, resetCounters: bool, countersBuffer: *MTLBuffer, countersBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.getTextureAccessCounters_region_mipLevel_slice_resetCounters_countersBuffer_countersBufferOffset_, #type (self: *MTLBlitCommandEncoder, texture: *MTLTexture, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger, resetCounters: bool, countersBuffer: *MTLBuffer, countersBufferOffset: NSUInteger) -> ());
}
optimizeContentsForCPUAccess :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture) -> () {
	#insert #run METHOD_BODY(__selectors.optimizeContentsForCPUAccess_, #type (self: *MTLBlitCommandEncoder, texture: *MTLTexture) -> ());
}
optimizeContentsForCPUAccess :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.optimizeContentsForCPUAccess_slice_level_, #type (self: *MTLBlitCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> ());
}
optimizeContentsForGPUAccess :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture) -> () {
	#insert #run METHOD_BODY(__selectors.optimizeContentsForGPUAccess_, #type (self: *MTLBlitCommandEncoder, texture: *MTLTexture) -> ());
}
optimizeContentsForGPUAccess :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.optimizeContentsForGPUAccess_slice_level_, #type (self: *MTLBlitCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> ());
}
optimizeIndirectCommandBuffer :: (self: *MTLBlitCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.optimizeIndirectCommandBuffer_withRange_, #type (self: *MTLBlitCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, range: NSRange) -> ());
}
resetCommandsInBuffer :: (self: *MTLBlitCommandEncoder, buffer: *MTLIndirectCommandBuffer, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.resetCommandsInBuffer_withRange_, #type (self: *MTLBlitCommandEncoder, buffer: *MTLIndirectCommandBuffer, range: NSRange) -> ());
}
resetTextureAccessCounters :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.resetTextureAccessCounters_region_mipLevel_slice_, #type (self: *MTLBlitCommandEncoder, texture: *MTLTexture, region: MTLRegion, mipLevel: NSUInteger, slice: NSUInteger) -> ());
}
resolveCounters :: (self: *MTLBlitCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, range: NSRange, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.resolveCounters_inRange_destinationBuffer_destinationOffset_, #type (self: *MTLBlitCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, range: NSRange, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger) -> ());
}
sampleCountersInBuffer :: (self: *MTLBlitCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: bool) -> () {
	#insert #run METHOD_BODY(__selectors.sampleCountersInBuffer_atSampleIndex_withBarrier_, #type (self: *MTLBlitCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: bool) -> ());
}
synchronizeResource :: (self: *MTLBlitCommandEncoder, resource: *MTLResource) -> () {
	#insert #run METHOD_BODY(__selectors.synchronizeResource_, #type (self: *MTLBlitCommandEncoder, resource: *MTLResource) -> ());
}
synchronizeTexture :: (self: *MTLBlitCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.synchronizeTexture_slice_level_, #type (self: *MTLBlitCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> ());
}
updateFence :: (self: *MTLBlitCommandEncoder, fence: *MTLFence) -> () {
	#insert #run METHOD_BODY(__selectors.updateFence_, #type (self: *MTLBlitCommandEncoder, fence: *MTLFence) -> ());
}
waitForFence :: (self: *MTLBlitCommandEncoder, fence: *MTLFence) -> () {
	#insert #run METHOD_BODY(__selectors.waitForFence_, #type (self: *MTLBlitCommandEncoder, fence: *MTLFence) -> ());
}


MTLCaptureDescriptor :: struct {}
captureObject :: (self: *MTLCaptureDescriptor) -> *NSObject {
	#insert #run METHOD_BODY(__selectors.captureObject, #type (self: *MTLCaptureDescriptor) -> *NSObject);
}
destination :: (self: *MTLCaptureDescriptor) -> MTLCaptureDestination {
	#insert #run METHOD_BODY(__selectors.destination, #type (self: *MTLCaptureDescriptor) -> MTLCaptureDestination);
}
outputURL :: (self: *MTLCaptureDescriptor) -> *NSURL {
	#insert #run METHOD_BODY(__selectors.outputURL, #type (self: *MTLCaptureDescriptor) -> *NSURL);
}
setCaptureObject :: (self: *MTLCaptureDescriptor, captureObject: *NSObject) -> () {
	#insert #run METHOD_BODY(__selectors.setCaptureObject_, #type (self: *MTLCaptureDescriptor, captureObject: *NSObject) -> ());
}
setDestination :: (self: *MTLCaptureDescriptor, destination: MTLCaptureDestination) -> () {
	#insert #run METHOD_BODY(__selectors.setDestination_, #type (self: *MTLCaptureDescriptor, destination: MTLCaptureDestination) -> ());
}
setOutputURL :: (self: *MTLCaptureDescriptor, outputURL: *NSURL) -> () {
	#insert #run METHOD_BODY(__selectors.setOutputURL_, #type (self: *MTLCaptureDescriptor, outputURL: *NSURL) -> ());
}


MTLCaptureManager :: struct {}
defaultCaptureScope :: (self: *MTLCaptureManager) -> *MTLCaptureScope {
	#insert #run METHOD_BODY(__selectors.defaultCaptureScope, #type (self: *MTLCaptureManager) -> *MTLCaptureScope);
}
isCapturing :: (self: *MTLCaptureManager) -> bool {
	#insert #run METHOD_BODY(__selectors.isCapturing, #type (self: *MTLCaptureManager) -> bool);
}
newCaptureScope :: (self: *MTLCaptureManager, device: *MTLDevice) -> *MTLCaptureScope {
	#insert #run METHOD_BODY(__selectors.newCaptureScopeWithDevice_, #type (self: *MTLCaptureManager, device: *MTLDevice) -> *MTLCaptureScope);
}
newCaptureScope :: (self: *MTLCaptureManager, commandQueue: *MTLCommandQueue) -> *MTLCaptureScope {
	#insert #run METHOD_BODY(__selectors.newCaptureScopeWithCommandQueue_, #type (self: *MTLCaptureManager, commandQueue: *MTLCommandQueue) -> *MTLCaptureScope);
}
newCaptureScope :: (self: *MTLCaptureManager, commandQueue: *MTL4CommandQueue) -> *MTLCaptureScope {
	#insert #run METHOD_BODY(__selectors.newCaptureScopeWithMTL4CommandQueue_, #type (self: *MTLCaptureManager, commandQueue: *MTL4CommandQueue) -> *MTLCaptureScope);
}
setDefaultCaptureScope :: (self: *MTLCaptureManager, defaultCaptureScope: *MTLCaptureScope) -> () {
	#insert #run METHOD_BODY(__selectors.setDefaultCaptureScope_, #type (self: *MTLCaptureManager, defaultCaptureScope: *MTLCaptureScope) -> ());
}
sharedCaptureManager :: (self: *MTLCaptureManager) -> *MTLCaptureManager {
	#insert #run METHOD_BODY(__selectors.sharedCaptureManager, #type (self: *MTLCaptureManager) -> *MTLCaptureManager);
}
startCapture :: (self: *MTLCaptureManager, descriptor: *MTLCaptureDescriptor, error: **NSError) -> bool {
	#insert #run METHOD_BODY(__selectors.startCaptureWithDescriptor_error_, #type (self: *MTLCaptureManager, descriptor: *MTLCaptureDescriptor, error: **NSError) -> bool);
}
startCapture :: (self: *MTLCaptureManager, device: *MTLDevice) -> () {
	#insert #run METHOD_BODY(__selectors.startCaptureWithDevice_, #type (self: *MTLCaptureManager, device: *MTLDevice) -> ());
}
startCapture :: (self: *MTLCaptureManager, commandQueue: *MTLCommandQueue) -> () {
	#insert #run METHOD_BODY(__selectors.startCaptureWithCommandQueue_, #type (self: *MTLCaptureManager, commandQueue: *MTLCommandQueue) -> ());
}
startCapture :: (self: *MTLCaptureManager, captureScope: *MTLCaptureScope) -> () {
	#insert #run METHOD_BODY(__selectors.startCaptureWithScope_, #type (self: *MTLCaptureManager, captureScope: *MTLCaptureScope) -> ());
}
stopCapture :: (self: *MTLCaptureManager) -> () {
	#insert #run METHOD_BODY(__selectors.stopCapture, #type (self: *MTLCaptureManager) -> ());
}
supportsDestination :: (self: *MTLCaptureManager, destination: MTLCaptureDestination) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsDestination_, #type (self: *MTLCaptureManager, destination: MTLCaptureDestination) -> bool);
}


MTLCommandEncoder :: struct {}
barrierAfterQueueStages :: (self: *MTLCommandEncoder, afterQueueStages: MTLStages, beforeStages: MTLStages) -> () {
	#insert #run METHOD_BODY(__selectors.barrierAfterQueueStages_beforeStages_, #type (self: *MTLCommandEncoder, afterQueueStages: MTLStages, beforeStages: MTLStages) -> ());
}
device :: (self: *MTLCommandEncoder) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLCommandEncoder) -> *MTLDevice);
}
endEncoding :: (self: *MTLCommandEncoder) -> () {
	#insert #run METHOD_BODY(__selectors.endEncoding, #type (self: *MTLCommandEncoder) -> ());
}
insertDebugSignpost :: (self: *MTLCommandEncoder, _string: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.insertDebugSignpost_, #type (self: *MTLCommandEncoder, _string: *NSString) -> ());
}
label :: (self: *MTLCommandEncoder) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLCommandEncoder) -> *NSString);
}
popDebugGroup :: (self: *MTLCommandEncoder) -> () {
	#insert #run METHOD_BODY(__selectors.popDebugGroup, #type (self: *MTLCommandEncoder) -> ());
}
pushDebugGroup :: (self: *MTLCommandEncoder, _string: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.pushDebugGroup_, #type (self: *MTLCommandEncoder, _string: *NSString) -> ());
}
setLabel :: (self: *MTLCommandEncoder, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLCommandEncoder, label: *NSString) -> ());
}


MTLBufferLayoutDescriptor :: struct {}
setStepFunction :: (self: *MTLBufferLayoutDescriptor, stepFunction: MTLStepFunction) -> () {
	#insert #run METHOD_BODY(__selectors.setStepFunction_, #type (self: *MTLBufferLayoutDescriptor, stepFunction: MTLStepFunction) -> ());
}
setStepRate :: (self: *MTLBufferLayoutDescriptor, stepRate: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setStepRate_, #type (self: *MTLBufferLayoutDescriptor, stepRate: NSUInteger) -> ());
}
setStride :: (self: *MTLBufferLayoutDescriptor, stride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setStride_, #type (self: *MTLBufferLayoutDescriptor, stride: NSUInteger) -> ());
}
stepFunction :: (self: *MTLBufferLayoutDescriptor) -> MTLStepFunction {
	#insert #run METHOD_BODY(__selectors.stepFunction, #type (self: *MTLBufferLayoutDescriptor) -> MTLStepFunction);
}
stepRate :: (self: *MTLBufferLayoutDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.stepRate, #type (self: *MTLBufferLayoutDescriptor) -> NSUInteger);
}
stride :: (self: *MTLBufferLayoutDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.stride, #type (self: *MTLBufferLayoutDescriptor) -> NSUInteger);
}


MTLBufferLayoutDescriptorArray :: struct {}
object :: (self: *MTLBufferLayoutDescriptorArray, index: NSUInteger) -> *MTLBufferLayoutDescriptor {
	#insert #run METHOD_BODY(__selectors.objectAtIndexedSubscript_, #type (self: *MTLBufferLayoutDescriptorArray, index: NSUInteger) -> *MTLBufferLayoutDescriptor);
}
setObject :: (self: *MTLBufferLayoutDescriptorArray, bufferDesc: *MTLBufferLayoutDescriptor, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObject_atIndexedSubscript_, #type (self: *MTLBufferLayoutDescriptorArray, bufferDesc: *MTLBufferLayoutDescriptor, index: NSUInteger) -> ());
}


MTLAttributeDescriptor :: struct {}
bufferIndex :: (self: *MTLAttributeDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.bufferIndex, #type (self: *MTLAttributeDescriptor) -> NSUInteger);
}
format :: (self: *MTLAttributeDescriptor) -> MTLAttributeFormat {
	#insert #run METHOD_BODY(__selectors.format, #type (self: *MTLAttributeDescriptor) -> MTLAttributeFormat);
}
offset :: (self: *MTLAttributeDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.offset, #type (self: *MTLAttributeDescriptor) -> NSUInteger);
}
setBufferIndex :: (self: *MTLAttributeDescriptor, bufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBufferIndex_, #type (self: *MTLAttributeDescriptor, bufferIndex: NSUInteger) -> ());
}
setFormat :: (self: *MTLAttributeDescriptor, format: MTLAttributeFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setFormat_, #type (self: *MTLAttributeDescriptor, format: MTLAttributeFormat) -> ());
}
setOffset :: (self: *MTLAttributeDescriptor, offset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setOffset_, #type (self: *MTLAttributeDescriptor, offset: NSUInteger) -> ());
}


MTLAttributeDescriptorArray :: struct {}
object :: (self: *MTLAttributeDescriptorArray, index: NSUInteger) -> *MTLAttributeDescriptor {
	#insert #run METHOD_BODY(__selectors.objectAtIndexedSubscript_, #type (self: *MTLAttributeDescriptorArray, index: NSUInteger) -> *MTLAttributeDescriptor);
}
setObject :: (self: *MTLAttributeDescriptorArray, attributeDesc: *MTLAttributeDescriptor, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObject_atIndexedSubscript_, #type (self: *MTLAttributeDescriptorArray, attributeDesc: *MTLAttributeDescriptor, index: NSUInteger) -> ());
}


MTLStageInputOutputDescriptor :: struct {}
attributes :: (self: *MTLStageInputOutputDescriptor) -> *MTLAttributeDescriptorArray {
	#insert #run METHOD_BODY(__selectors.attributes, #type (self: *MTLStageInputOutputDescriptor) -> *MTLAttributeDescriptorArray);
}
indexBufferIndex :: (self: *MTLStageInputOutputDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.indexBufferIndex, #type (self: *MTLStageInputOutputDescriptor) -> NSUInteger);
}
indexType :: (self: *MTLStageInputOutputDescriptor) -> MTLIndexType {
	#insert #run METHOD_BODY(__selectors.indexType, #type (self: *MTLStageInputOutputDescriptor) -> MTLIndexType);
}
layouts :: (self: *MTLStageInputOutputDescriptor) -> *MTLBufferLayoutDescriptorArray {
	#insert #run METHOD_BODY(__selectors.layouts, #type (self: *MTLStageInputOutputDescriptor) -> *MTLBufferLayoutDescriptorArray);
}
reset :: (self: *MTLStageInputOutputDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTLStageInputOutputDescriptor) -> ());
}
setIndexBufferIndex :: (self: *MTLStageInputOutputDescriptor, indexBufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexBufferIndex_, #type (self: *MTLStageInputOutputDescriptor, indexBufferIndex: NSUInteger) -> ());
}
setIndexType :: (self: *MTLStageInputOutputDescriptor, indexType: MTLIndexType) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexType_, #type (self: *MTLStageInputOutputDescriptor, indexType: MTLIndexType) -> ());
}
stageInputOutputDescriptor :: (self: *MTLStageInputOutputDescriptor) -> *MTLStageInputOutputDescriptor {
	#insert #run METHOD_BODY(__selectors.stageInputOutputDescriptor, #type (self: *MTLStageInputOutputDescriptor) -> *MTLStageInputOutputDescriptor);
}


MTL4CommandAllocatorDescriptor :: struct {}
label :: (self: *MTL4CommandAllocatorDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTL4CommandAllocatorDescriptor) -> *NSString);
}
setLabel :: (self: *MTL4CommandAllocatorDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTL4CommandAllocatorDescriptor, label: *NSString) -> ());
}


MTL4CommandAllocator :: struct {}
allocatedSize :: (self: *MTL4CommandAllocator) -> u64 {
	#insert #run METHOD_BODY(__selectors.allocatedSize, #type (self: *MTL4CommandAllocator) -> u64);
}
device :: (self: *MTL4CommandAllocator) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTL4CommandAllocator) -> *MTLDevice);
}
label :: (self: *MTL4CommandAllocator) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTL4CommandAllocator) -> *NSString);
}
reset :: (self: *MTL4CommandAllocator) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTL4CommandAllocator) -> ());
}


MTLParallelRenderCommandEncoder :: struct { using #as _: MTLCommandEncoder; }
renderCommandEncoder :: (self: *MTLParallelRenderCommandEncoder) -> *MTLRenderCommandEncoder {
	#insert #run METHOD_BODY(__selectors.renderCommandEncoder, #type (self: *MTLParallelRenderCommandEncoder) -> *MTLRenderCommandEncoder);
}
setColorStoreAction :: (self: *MTLParallelRenderCommandEncoder, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setColorStoreAction_atIndex_, #type (self: *MTLParallelRenderCommandEncoder, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> ());
}
setColorStoreActionOptions :: (self: *MTLParallelRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions, colorAttachmentIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setColorStoreActionOptions_atIndex_, #type (self: *MTLParallelRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions, colorAttachmentIndex: NSUInteger) -> ());
}
setDepthStoreAction :: (self: *MTLParallelRenderCommandEncoder, storeAction: MTLStoreAction) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthStoreAction_, #type (self: *MTLParallelRenderCommandEncoder, storeAction: MTLStoreAction) -> ());
}
setDepthStoreActionOptions :: (self: *MTLParallelRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthStoreActionOptions_, #type (self: *MTLParallelRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> ());
}
setStencilStoreAction :: (self: *MTLParallelRenderCommandEncoder, storeAction: MTLStoreAction) -> () {
	#insert #run METHOD_BODY(__selectors.setStencilStoreAction_, #type (self: *MTLParallelRenderCommandEncoder, storeAction: MTLStoreAction) -> ());
}
setStencilStoreActionOptions :: (self: *MTLParallelRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> () {
	#insert #run METHOD_BODY(__selectors.setStencilStoreActionOptions_, #type (self: *MTLParallelRenderCommandEncoder, storeActionOptions: MTLStoreActionOptions) -> ());
}


MTL4CommitFeedback :: struct {}
GPUEndTime :: (self: *MTL4CommitFeedback) -> CFTimeInterval {
	#insert #run METHOD_BODY(__selectors.GPUEndTime, #type (self: *MTL4CommitFeedback) -> CFTimeInterval);
}
GPUStartTime :: (self: *MTL4CommitFeedback) -> CFTimeInterval {
	#insert #run METHOD_BODY(__selectors.GPUStartTime, #type (self: *MTL4CommitFeedback) -> CFTimeInterval);
}
error :: (self: *MTL4CommitFeedback) -> *NSError {
	#insert #run METHOD_BODY(__selectors.error, #type (self: *MTL4CommitFeedback) -> *NSError);
}


MTL4TileRenderPipelineDescriptor :: struct { using #as _: MTL4PipelineDescriptor; }
colorAttachments :: (self: *MTL4TileRenderPipelineDescriptor) -> *MTLTileRenderPipelineColorAttachmentDescriptorArray {
	#insert #run METHOD_BODY(__selectors.colorAttachments, #type (self: *MTL4TileRenderPipelineDescriptor) -> *MTLTileRenderPipelineColorAttachmentDescriptorArray);
}
maxTotalThreadsPerThreadgroup :: (self: *MTL4TileRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTotalThreadsPerThreadgroup, #type (self: *MTL4TileRenderPipelineDescriptor) -> NSUInteger);
}
rasterSampleCount :: (self: *MTL4TileRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.rasterSampleCount, #type (self: *MTL4TileRenderPipelineDescriptor) -> NSUInteger);
}
requiredThreadsPerThreadgroup :: (self: *MTL4TileRenderPipelineDescriptor) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.requiredThreadsPerThreadgroup, #type (self: *MTL4TileRenderPipelineDescriptor) -> MTLSize);
}
reset :: (self: *MTL4TileRenderPipelineDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTL4TileRenderPipelineDescriptor) -> ());
}
setMaxTotalThreadsPerThreadgroup :: (self: *MTL4TileRenderPipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxTotalThreadsPerThreadgroup_, #type (self: *MTL4TileRenderPipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> ());
}
setRasterSampleCount :: (self: *MTL4TileRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRasterSampleCount_, #type (self: *MTL4TileRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> ());
}
setRequiredThreadsPerThreadgroup :: (self: *MTL4TileRenderPipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.setRequiredThreadsPerThreadgroup_, #type (self: *MTL4TileRenderPipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> ());
}
setStaticLinkingDescriptor :: (self: *MTL4TileRenderPipelineDescriptor, staticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setStaticLinkingDescriptor_, #type (self: *MTL4TileRenderPipelineDescriptor, staticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> ());
}
setSupportBinaryLinking :: (self: *MTL4TileRenderPipelineDescriptor, supportBinaryLinking: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportBinaryLinking_, #type (self: *MTL4TileRenderPipelineDescriptor, supportBinaryLinking: bool) -> ());
}
setThreadgroupSizeMatchesTileSize :: (self: *MTL4TileRenderPipelineDescriptor, threadgroupSizeMatchesTileSize: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setThreadgroupSizeMatchesTileSize_, #type (self: *MTL4TileRenderPipelineDescriptor, threadgroupSizeMatchesTileSize: bool) -> ());
}
setTileFunctionDescriptor :: (self: *MTL4TileRenderPipelineDescriptor, tileFunctionDescriptor: *MTL4FunctionDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setTileFunctionDescriptor_, #type (self: *MTL4TileRenderPipelineDescriptor, tileFunctionDescriptor: *MTL4FunctionDescriptor) -> ());
}
staticLinkingDescriptor :: (self: *MTL4TileRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
	#insert #run METHOD_BODY(__selectors.staticLinkingDescriptor, #type (self: *MTL4TileRenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor);
}
supportBinaryLinking :: (self: *MTL4TileRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportBinaryLinking, #type (self: *MTL4TileRenderPipelineDescriptor) -> bool);
}
threadgroupSizeMatchesTileSize :: (self: *MTL4TileRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.threadgroupSizeMatchesTileSize, #type (self: *MTL4TileRenderPipelineDescriptor) -> bool);
}
tileFunctionDescriptor :: (self: *MTL4TileRenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
	#insert #run METHOD_BODY(__selectors.tileFunctionDescriptor, #type (self: *MTL4TileRenderPipelineDescriptor) -> *MTL4FunctionDescriptor);
}


MTL4BinaryFunction :: struct {}
functionType :: (self: *MTL4BinaryFunction) -> MTLFunctionType {
	#insert #run METHOD_BODY(__selectors.functionType, #type (self: *MTL4BinaryFunction) -> MTLFunctionType);
}
name :: (self: *MTL4BinaryFunction) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTL4BinaryFunction) -> *NSString);
}


MTLRasterizationRateSampleArray :: struct {}
object :: (self: *MTLRasterizationRateSampleArray, index: NSUInteger) -> *NSNumber {
	#insert #run METHOD_BODY(__selectors.objectAtIndexedSubscript_, #type (self: *MTLRasterizationRateSampleArray, index: NSUInteger) -> *NSNumber);
}
setObject :: (self: *MTLRasterizationRateSampleArray, value: *NSNumber, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObject_atIndexedSubscript_, #type (self: *MTLRasterizationRateSampleArray, value: *NSNumber, index: NSUInteger) -> ());
}


MTLRasterizationRateLayerDescriptor :: struct {}
horizontal :: (self: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateSampleArray {
	#insert #run METHOD_BODY(__selectors.horizontal, #type (self: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateSampleArray);
}
horizontalSampleStorage :: (self: *MTLRasterizationRateLayerDescriptor) -> *float {
	#insert #run METHOD_BODY(__selectors.horizontalSampleStorage, #type (self: *MTLRasterizationRateLayerDescriptor) -> *float);
}
init :: (self: *MTLRasterizationRateLayerDescriptor, sampleCount: MTLSize) -> *MTLRasterizationRateLayerDescriptor {
	#insert #run METHOD_BODY(__selectors.initWithSampleCount_, #type (self: *MTLRasterizationRateLayerDescriptor, sampleCount: MTLSize) -> *MTLRasterizationRateLayerDescriptor);
}
init :: (self: *MTLRasterizationRateLayerDescriptor, sampleCount: MTLSize, horizontal: *float, vertical: *float) -> *MTLRasterizationRateLayerDescriptor {
	#insert #run METHOD_BODY(__selectors.initWithSampleCount_horizontal_vertical_, #type (self: *MTLRasterizationRateLayerDescriptor, sampleCount: MTLSize, horizontal: *float, vertical: *float) -> *MTLRasterizationRateLayerDescriptor);
}
maxSampleCount :: (self: *MTLRasterizationRateLayerDescriptor) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.maxSampleCount, #type (self: *MTLRasterizationRateLayerDescriptor) -> MTLSize);
}
sampleCount :: (self: *MTLRasterizationRateLayerDescriptor) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.sampleCount, #type (self: *MTLRasterizationRateLayerDescriptor) -> MTLSize);
}
setSampleCount :: (self: *MTLRasterizationRateLayerDescriptor, sampleCount: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.setSampleCount_, #type (self: *MTLRasterizationRateLayerDescriptor, sampleCount: MTLSize) -> ());
}
vertical :: (self: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateSampleArray {
	#insert #run METHOD_BODY(__selectors.vertical, #type (self: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateSampleArray);
}
verticalSampleStorage :: (self: *MTLRasterizationRateLayerDescriptor) -> *float {
	#insert #run METHOD_BODY(__selectors.verticalSampleStorage, #type (self: *MTLRasterizationRateLayerDescriptor) -> *float);
}


MTLRasterizationRateLayerArray :: struct {}
object :: (self: *MTLRasterizationRateLayerArray, layerIndex: NSUInteger) -> *MTLRasterizationRateLayerDescriptor {
	#insert #run METHOD_BODY(__selectors.objectAtIndexedSubscript_, #type (self: *MTLRasterizationRateLayerArray, layerIndex: NSUInteger) -> *MTLRasterizationRateLayerDescriptor);
}
setObject :: (self: *MTLRasterizationRateLayerArray, layer: *MTLRasterizationRateLayerDescriptor, layerIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObject_atIndexedSubscript_, #type (self: *MTLRasterizationRateLayerArray, layer: *MTLRasterizationRateLayerDescriptor, layerIndex: NSUInteger) -> ());
}


MTLRasterizationRateMapDescriptor :: struct {}
label :: (self: *MTLRasterizationRateMapDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLRasterizationRateMapDescriptor) -> *NSString);
}
layer :: (self: *MTLRasterizationRateMapDescriptor, layerIndex: NSUInteger) -> *MTLRasterizationRateLayerDescriptor {
	#insert #run METHOD_BODY(__selectors.layerAtIndex_, #type (self: *MTLRasterizationRateMapDescriptor, layerIndex: NSUInteger) -> *MTLRasterizationRateLayerDescriptor);
}
layerCount :: (self: *MTLRasterizationRateMapDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.layerCount, #type (self: *MTLRasterizationRateMapDescriptor) -> NSUInteger);
}
layers :: (self: *MTLRasterizationRateMapDescriptor) -> *MTLRasterizationRateLayerArray {
	#insert #run METHOD_BODY(__selectors.layers, #type (self: *MTLRasterizationRateMapDescriptor) -> *MTLRasterizationRateLayerArray);
}
rasterizationRateMapDescriptor :: (self: *MTLRasterizationRateMapDescriptor, screenSize: MTLSize) -> *MTLRasterizationRateMapDescriptor {
	#insert #run METHOD_BODY(__selectors.rasterizationRateMapDescriptorWithScreenSize_, #type (self: *MTLRasterizationRateMapDescriptor, screenSize: MTLSize) -> *MTLRasterizationRateMapDescriptor);
}
rasterizationRateMapDescriptor :: (self: *MTLRasterizationRateMapDescriptor, screenSize: MTLSize, layer: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateMapDescriptor {
	#insert #run METHOD_BODY(__selectors.rasterizationRateMapDescriptorWithScreenSize_layer_, #type (self: *MTLRasterizationRateMapDescriptor, screenSize: MTLSize, layer: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateMapDescriptor);
}
rasterizationRateMapDescriptor :: (self: *MTLRasterizationRateMapDescriptor, screenSize: MTLSize, layerCount: NSUInteger, layers: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateMapDescriptor {
	#insert #run METHOD_BODY(__selectors.rasterizationRateMapDescriptorWithScreenSize_layerCount_layers_, #type (self: *MTLRasterizationRateMapDescriptor, screenSize: MTLSize, layerCount: NSUInteger, layers: *MTLRasterizationRateLayerDescriptor) -> *MTLRasterizationRateMapDescriptor);
}
screenSize :: (self: *MTLRasterizationRateMapDescriptor) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.screenSize, #type (self: *MTLRasterizationRateMapDescriptor) -> MTLSize);
}
setLabel :: (self: *MTLRasterizationRateMapDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLRasterizationRateMapDescriptor, label: *NSString) -> ());
}
setLayer :: (self: *MTLRasterizationRateMapDescriptor, layer: *MTLRasterizationRateLayerDescriptor, layerIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setLayer_atIndex_, #type (self: *MTLRasterizationRateMapDescriptor, layer: *MTLRasterizationRateLayerDescriptor, layerIndex: NSUInteger) -> ());
}
setScreenSize :: (self: *MTLRasterizationRateMapDescriptor, screenSize: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.setScreenSize_, #type (self: *MTLRasterizationRateMapDescriptor, screenSize: MTLSize) -> ());
}


MTLRasterizationRateMap :: struct {}
copyParameterDataToBuffer :: (self: *MTLRasterizationRateMap, buffer: *MTLBuffer, offset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.copyParameterDataToBuffer_offset_, #type (self: *MTLRasterizationRateMap, buffer: *MTLBuffer, offset: NSUInteger) -> ());
}
device :: (self: *MTLRasterizationRateMap) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLRasterizationRateMap) -> *MTLDevice);
}
label :: (self: *MTLRasterizationRateMap) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLRasterizationRateMap) -> *NSString);
}
layerCount :: (self: *MTLRasterizationRateMap) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.layerCount, #type (self: *MTLRasterizationRateMap) -> NSUInteger);
}
mapPhysicalToScreenCoordinates :: (self: *MTLRasterizationRateMap, physicalCoordinates: MTLCoordinate2D, layerIndex: NSUInteger) -> MTLCoordinate2D {
	#insert #run METHOD_BODY(__selectors.mapPhysicalToScreenCoordinates_forLayer_, #type (self: *MTLRasterizationRateMap, physicalCoordinates: MTLCoordinate2D, layerIndex: NSUInteger) -> MTLCoordinate2D);
}
mapScreenToPhysicalCoordinates :: (self: *MTLRasterizationRateMap, screenCoordinates: MTLCoordinate2D, layerIndex: NSUInteger) -> MTLCoordinate2D {
	#insert #run METHOD_BODY(__selectors.mapScreenToPhysicalCoordinates_forLayer_, #type (self: *MTLRasterizationRateMap, screenCoordinates: MTLCoordinate2D, layerIndex: NSUInteger) -> MTLCoordinate2D);
}
parameterBufferSizeAndAlign :: (self: *MTLRasterizationRateMap) -> MTLSizeAndAlign {
	#insert #run METHOD_BODY(__selectors.parameterBufferSizeAndAlign, #type (self: *MTLRasterizationRateMap) -> MTLSizeAndAlign);
}
physicalGranularity :: (self: *MTLRasterizationRateMap) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.physicalGranularity, #type (self: *MTLRasterizationRateMap) -> MTLSize);
}
physicalSize :: (self: *MTLRasterizationRateMap, layerIndex: NSUInteger) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.physicalSizeForLayer_, #type (self: *MTLRasterizationRateMap, layerIndex: NSUInteger) -> MTLSize);
}
screenSize :: (self: *MTLRasterizationRateMap) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.screenSize, #type (self: *MTLRasterizationRateMap) -> MTLSize);
}


MTL4ArgumentTableDescriptor :: struct {}
initializeBindings :: (self: *MTL4ArgumentTableDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.initializeBindings, #type (self: *MTL4ArgumentTableDescriptor) -> bool);
}
label :: (self: *MTL4ArgumentTableDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTL4ArgumentTableDescriptor) -> *NSString);
}
maxBufferBindCount :: (self: *MTL4ArgumentTableDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxBufferBindCount, #type (self: *MTL4ArgumentTableDescriptor) -> NSUInteger);
}
maxSamplerStateBindCount :: (self: *MTL4ArgumentTableDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxSamplerStateBindCount, #type (self: *MTL4ArgumentTableDescriptor) -> NSUInteger);
}
maxTextureBindCount :: (self: *MTL4ArgumentTableDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTextureBindCount, #type (self: *MTL4ArgumentTableDescriptor) -> NSUInteger);
}
setInitializeBindings :: (self: *MTL4ArgumentTableDescriptor, initializeBindings: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setInitializeBindings_, #type (self: *MTL4ArgumentTableDescriptor, initializeBindings: bool) -> ());
}
setLabel :: (self: *MTL4ArgumentTableDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTL4ArgumentTableDescriptor, label: *NSString) -> ());
}
setMaxBufferBindCount :: (self: *MTL4ArgumentTableDescriptor, maxBufferBindCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxBufferBindCount_, #type (self: *MTL4ArgumentTableDescriptor, maxBufferBindCount: NSUInteger) -> ());
}
setMaxSamplerStateBindCount :: (self: *MTL4ArgumentTableDescriptor, maxSamplerStateBindCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxSamplerStateBindCount_, #type (self: *MTL4ArgumentTableDescriptor, maxSamplerStateBindCount: NSUInteger) -> ());
}
setMaxTextureBindCount :: (self: *MTL4ArgumentTableDescriptor, maxTextureBindCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxTextureBindCount_, #type (self: *MTL4ArgumentTableDescriptor, maxTextureBindCount: NSUInteger) -> ());
}
setSupportAttributeStrides :: (self: *MTL4ArgumentTableDescriptor, supportAttributeStrides: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportAttributeStrides_, #type (self: *MTL4ArgumentTableDescriptor, supportAttributeStrides: bool) -> ());
}
supportAttributeStrides :: (self: *MTL4ArgumentTableDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportAttributeStrides, #type (self: *MTL4ArgumentTableDescriptor) -> bool);
}


MTL4ArgumentTable :: struct {}
device :: (self: *MTL4ArgumentTable) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTL4ArgumentTable) -> *MTLDevice);
}
label :: (self: *MTL4ArgumentTable) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTL4ArgumentTable) -> *NSString);
}
setAddress :: (self: *MTL4ArgumentTable, gpuAddress: MTLGPUAddress, bindingIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setAddress_atIndex_, #type (self: *MTL4ArgumentTable, gpuAddress: MTLGPUAddress, bindingIndex: NSUInteger) -> ());
}
setAddress :: (self: *MTL4ArgumentTable, gpuAddress: MTLGPUAddress, stride: NSUInteger, bindingIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setAddress_attributeStride_atIndex_, #type (self: *MTL4ArgumentTable, gpuAddress: MTLGPUAddress, stride: NSUInteger, bindingIndex: NSUInteger) -> ());
}
setResource :: (self: *MTL4ArgumentTable, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setResource_atBufferIndex_, #type (self: *MTL4ArgumentTable, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> ());
}
setSamplerState :: (self: *MTL4ArgumentTable, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSamplerState_atIndex_, #type (self: *MTL4ArgumentTable, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> ());
}
setTexture :: (self: *MTL4ArgumentTable, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTexture_atIndex_, #type (self: *MTL4ArgumentTable, resourceID: MTLResourceID, bindingIndex: NSUInteger) -> ());
}


MTLLinkedFunctions :: struct {}
binaryFunctions :: (self: *MTLLinkedFunctions) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.binaryFunctions, #type (self: *MTLLinkedFunctions) -> *NSArray);
}
functions :: (self: *MTLLinkedFunctions) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.functions, #type (self: *MTLLinkedFunctions) -> *NSArray);
}
groups :: (self: *MTLLinkedFunctions) -> *NSDictionary {
	#insert #run METHOD_BODY(__selectors.groups, #type (self: *MTLLinkedFunctions) -> *NSDictionary);
}
linkedFunctions :: (self: *MTLLinkedFunctions) -> *MTLLinkedFunctions {
	#insert #run METHOD_BODY(__selectors.linkedFunctions, #type (self: *MTLLinkedFunctions) -> *MTLLinkedFunctions);
}
privateFunctions :: (self: *MTLLinkedFunctions) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.privateFunctions, #type (self: *MTLLinkedFunctions) -> *NSArray);
}
setBinaryFunctions :: (self: *MTLLinkedFunctions, binaryFunctions: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setBinaryFunctions_, #type (self: *MTLLinkedFunctions, binaryFunctions: *NSArray) -> ());
}
setFunctions :: (self: *MTLLinkedFunctions, functions: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setFunctions_, #type (self: *MTLLinkedFunctions, functions: *NSArray) -> ());
}
setGroups :: (self: *MTLLinkedFunctions, groups: *NSDictionary) -> () {
	#insert #run METHOD_BODY(__selectors.setGroups_, #type (self: *MTLLinkedFunctions, groups: *NSDictionary) -> ());
}
setPrivateFunctions :: (self: *MTLLinkedFunctions, privateFunctions: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setPrivateFunctions_, #type (self: *MTLLinkedFunctions, privateFunctions: *NSArray) -> ());
}


MTLSharedTextureHandle :: struct {}
device :: (self: *MTLSharedTextureHandle) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLSharedTextureHandle) -> *MTLDevice);
}
label :: (self: *MTLSharedTextureHandle) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLSharedTextureHandle) -> *NSString);
}


MTLTextureDescriptor :: struct {}
allowGPUOptimizedContents :: (self: *MTLTextureDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.allowGPUOptimizedContents, #type (self: *MTLTextureDescriptor) -> bool);
}
arrayLength :: (self: *MTLTextureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.arrayLength, #type (self: *MTLTextureDescriptor) -> NSUInteger);
}
compressionType :: (self: *MTLTextureDescriptor) -> MTLTextureCompressionType {
	#insert #run METHOD_BODY(__selectors.compressionType, #type (self: *MTLTextureDescriptor) -> MTLTextureCompressionType);
}
cpuCacheMode :: (self: *MTLTextureDescriptor) -> MTLCPUCacheMode {
	#insert #run METHOD_BODY(__selectors.cpuCacheMode, #type (self: *MTLTextureDescriptor) -> MTLCPUCacheMode);
}
depth :: (self: *MTLTextureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.depth, #type (self: *MTLTextureDescriptor) -> NSUInteger);
}
hazardTrackingMode :: (self: *MTLTextureDescriptor) -> MTLHazardTrackingMode {
	#insert #run METHOD_BODY(__selectors.hazardTrackingMode, #type (self: *MTLTextureDescriptor) -> MTLHazardTrackingMode);
}
height :: (self: *MTLTextureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.height, #type (self: *MTLTextureDescriptor) -> NSUInteger);
}
mipmapLevelCount :: (self: *MTLTextureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.mipmapLevelCount, #type (self: *MTLTextureDescriptor) -> NSUInteger);
}
pixelFormat :: (self: *MTLTextureDescriptor) -> MTLPixelFormat {
	#insert #run METHOD_BODY(__selectors.pixelFormat, #type (self: *MTLTextureDescriptor) -> MTLPixelFormat);
}
placementSparsePageSize :: (self: *MTLTextureDescriptor) -> MTLSparsePageSize {
	#insert #run METHOD_BODY(__selectors.placementSparsePageSize, #type (self: *MTLTextureDescriptor) -> MTLSparsePageSize);
}
resourceOptions :: (self: *MTLTextureDescriptor) -> MTLResourceOptions {
	#insert #run METHOD_BODY(__selectors.resourceOptions, #type (self: *MTLTextureDescriptor) -> MTLResourceOptions);
}
sampleCount :: (self: *MTLTextureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.sampleCount, #type (self: *MTLTextureDescriptor) -> NSUInteger);
}
setAllowGPUOptimizedContents :: (self: *MTLTextureDescriptor, allowGPUOptimizedContents: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setAllowGPUOptimizedContents_, #type (self: *MTLTextureDescriptor, allowGPUOptimizedContents: bool) -> ());
}
setArrayLength :: (self: *MTLTextureDescriptor, arrayLength: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setArrayLength_, #type (self: *MTLTextureDescriptor, arrayLength: NSUInteger) -> ());
}
setCompressionType :: (self: *MTLTextureDescriptor, compressionType: MTLTextureCompressionType) -> () {
	#insert #run METHOD_BODY(__selectors.setCompressionType_, #type (self: *MTLTextureDescriptor, compressionType: MTLTextureCompressionType) -> ());
}
setCpuCacheMode :: (self: *MTLTextureDescriptor, cpuCacheMode: MTLCPUCacheMode) -> () {
	#insert #run METHOD_BODY(__selectors.setCpuCacheMode_, #type (self: *MTLTextureDescriptor, cpuCacheMode: MTLCPUCacheMode) -> ());
}
setDepth :: (self: *MTLTextureDescriptor, depth: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setDepth_, #type (self: *MTLTextureDescriptor, depth: NSUInteger) -> ());
}
setHazardTrackingMode :: (self: *MTLTextureDescriptor, hazardTrackingMode: MTLHazardTrackingMode) -> () {
	#insert #run METHOD_BODY(__selectors.setHazardTrackingMode_, #type (self: *MTLTextureDescriptor, hazardTrackingMode: MTLHazardTrackingMode) -> ());
}
setHeight :: (self: *MTLTextureDescriptor, height: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setHeight_, #type (self: *MTLTextureDescriptor, height: NSUInteger) -> ());
}
setMipmapLevelCount :: (self: *MTLTextureDescriptor, mipmapLevelCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMipmapLevelCount_, #type (self: *MTLTextureDescriptor, mipmapLevelCount: NSUInteger) -> ());
}
setPixelFormat :: (self: *MTLTextureDescriptor, pixelFormat: MTLPixelFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setPixelFormat_, #type (self: *MTLTextureDescriptor, pixelFormat: MTLPixelFormat) -> ());
}
setPlacementSparsePageSize :: (self: *MTLTextureDescriptor, placementSparsePageSize: MTLSparsePageSize) -> () {
	#insert #run METHOD_BODY(__selectors.setPlacementSparsePageSize_, #type (self: *MTLTextureDescriptor, placementSparsePageSize: MTLSparsePageSize) -> ());
}
setResourceOptions :: (self: *MTLTextureDescriptor, resourceOptions: MTLResourceOptions) -> () {
	#insert #run METHOD_BODY(__selectors.setResourceOptions_, #type (self: *MTLTextureDescriptor, resourceOptions: MTLResourceOptions) -> ());
}
setSampleCount :: (self: *MTLTextureDescriptor, sampleCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSampleCount_, #type (self: *MTLTextureDescriptor, sampleCount: NSUInteger) -> ());
}
setStorageMode :: (self: *MTLTextureDescriptor, storageMode: MTLStorageMode) -> () {
	#insert #run METHOD_BODY(__selectors.setStorageMode_, #type (self: *MTLTextureDescriptor, storageMode: MTLStorageMode) -> ());
}
setSwizzle :: (self: *MTLTextureDescriptor, swizzle: MTLTextureSwizzleChannels) -> () {
	#insert #run METHOD_BODY(__selectors.setSwizzle_, #type (self: *MTLTextureDescriptor, swizzle: MTLTextureSwizzleChannels) -> ());
}
setTextureType :: (self: *MTLTextureDescriptor, textureType: MTLTextureType) -> () {
	#insert #run METHOD_BODY(__selectors.setTextureType_, #type (self: *MTLTextureDescriptor, textureType: MTLTextureType) -> ());
}
setUsage :: (self: *MTLTextureDescriptor, usage: MTLTextureUsage) -> () {
	#insert #run METHOD_BODY(__selectors.setUsage_, #type (self: *MTLTextureDescriptor, usage: MTLTextureUsage) -> ());
}
setWidth :: (self: *MTLTextureDescriptor, width: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setWidth_, #type (self: *MTLTextureDescriptor, width: NSUInteger) -> ());
}
storageMode :: (self: *MTLTextureDescriptor) -> MTLStorageMode {
	#insert #run METHOD_BODY(__selectors.storageMode, #type (self: *MTLTextureDescriptor) -> MTLStorageMode);
}
swizzle :: (self: *MTLTextureDescriptor) -> MTLTextureSwizzleChannels {
	#insert #run METHOD_BODY(__selectors.swizzle, #type (self: *MTLTextureDescriptor) -> MTLTextureSwizzleChannels);
}
texture2DDescriptor :: (self: *MTLTextureDescriptor, pixelFormat: MTLPixelFormat, width: NSUInteger, height: NSUInteger, mipmapped: bool) -> *MTLTextureDescriptor {
	#insert #run METHOD_BODY(__selectors.texture2DDescriptorWithPixelFormat_width_height_mipmapped_, #type (self: *MTLTextureDescriptor, pixelFormat: MTLPixelFormat, width: NSUInteger, height: NSUInteger, mipmapped: bool) -> *MTLTextureDescriptor);
}
textureBufferDescriptor :: (self: *MTLTextureDescriptor, pixelFormat: MTLPixelFormat, width: NSUInteger, resourceOptions: MTLResourceOptions, usage: MTLTextureUsage) -> *MTLTextureDescriptor {
	#insert #run METHOD_BODY(__selectors.textureBufferDescriptorWithPixelFormat_width_resourceOptions_usage_, #type (self: *MTLTextureDescriptor, pixelFormat: MTLPixelFormat, width: NSUInteger, resourceOptions: MTLResourceOptions, usage: MTLTextureUsage) -> *MTLTextureDescriptor);
}
textureCubeDescriptor :: (self: *MTLTextureDescriptor, pixelFormat: MTLPixelFormat, size: NSUInteger, mipmapped: bool) -> *MTLTextureDescriptor {
	#insert #run METHOD_BODY(__selectors.textureCubeDescriptorWithPixelFormat_size_mipmapped_, #type (self: *MTLTextureDescriptor, pixelFormat: MTLPixelFormat, size: NSUInteger, mipmapped: bool) -> *MTLTextureDescriptor);
}
textureType :: (self: *MTLTextureDescriptor) -> MTLTextureType {
	#insert #run METHOD_BODY(__selectors.textureType, #type (self: *MTLTextureDescriptor) -> MTLTextureType);
}
usage :: (self: *MTLTextureDescriptor) -> MTLTextureUsage {
	#insert #run METHOD_BODY(__selectors.usage, #type (self: *MTLTextureDescriptor) -> MTLTextureUsage);
}
width :: (self: *MTLTextureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.width, #type (self: *MTLTextureDescriptor) -> NSUInteger);
}


MTLTextureViewDescriptor :: struct {}
levelRange :: (self: *MTLTextureViewDescriptor) -> NSRange {
	#insert #run METHOD_BODY(__selectors.levelRange, #type (self: *MTLTextureViewDescriptor) -> NSRange);
}
pixelFormat :: (self: *MTLTextureViewDescriptor) -> MTLPixelFormat {
	#insert #run METHOD_BODY(__selectors.pixelFormat, #type (self: *MTLTextureViewDescriptor) -> MTLPixelFormat);
}
setLevelRange :: (self: *MTLTextureViewDescriptor, levelRange: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setLevelRange_, #type (self: *MTLTextureViewDescriptor, levelRange: NSRange) -> ());
}
setPixelFormat :: (self: *MTLTextureViewDescriptor, pixelFormat: MTLPixelFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setPixelFormat_, #type (self: *MTLTextureViewDescriptor, pixelFormat: MTLPixelFormat) -> ());
}
setSliceRange :: (self: *MTLTextureViewDescriptor, sliceRange: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setSliceRange_, #type (self: *MTLTextureViewDescriptor, sliceRange: NSRange) -> ());
}
setSwizzle :: (self: *MTLTextureViewDescriptor, swizzle: MTLTextureSwizzleChannels) -> () {
	#insert #run METHOD_BODY(__selectors.setSwizzle_, #type (self: *MTLTextureViewDescriptor, swizzle: MTLTextureSwizzleChannels) -> ());
}
setTextureType :: (self: *MTLTextureViewDescriptor, textureType: MTLTextureType) -> () {
	#insert #run METHOD_BODY(__selectors.setTextureType_, #type (self: *MTLTextureViewDescriptor, textureType: MTLTextureType) -> ());
}
sliceRange :: (self: *MTLTextureViewDescriptor) -> NSRange {
	#insert #run METHOD_BODY(__selectors.sliceRange, #type (self: *MTLTextureViewDescriptor) -> NSRange);
}
swizzle :: (self: *MTLTextureViewDescriptor) -> MTLTextureSwizzleChannels {
	#insert #run METHOD_BODY(__selectors.swizzle, #type (self: *MTLTextureViewDescriptor) -> MTLTextureSwizzleChannels);
}
textureType :: (self: *MTLTextureViewDescriptor) -> MTLTextureType {
	#insert #run METHOD_BODY(__selectors.textureType, #type (self: *MTLTextureViewDescriptor) -> MTLTextureType);
}


MTLTexture :: struct { using #as _: MTLResource; }
allowGPUOptimizedContents :: (self: *MTLTexture) -> bool {
	#insert #run METHOD_BODY(__selectors.allowGPUOptimizedContents, #type (self: *MTLTexture) -> bool);
}
arrayLength :: (self: *MTLTexture) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.arrayLength, #type (self: *MTLTexture) -> NSUInteger);
}
buffer :: (self: *MTLTexture) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.buffer, #type (self: *MTLTexture) -> *MTLBuffer);
}
bufferBytesPerRow :: (self: *MTLTexture) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.bufferBytesPerRow, #type (self: *MTLTexture) -> NSUInteger);
}
bufferOffset :: (self: *MTLTexture) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.bufferOffset, #type (self: *MTLTexture) -> NSUInteger);
}
compressionType :: (self: *MTLTexture) -> MTLTextureCompressionType {
	#insert #run METHOD_BODY(__selectors.compressionType, #type (self: *MTLTexture) -> MTLTextureCompressionType);
}
depth :: (self: *MTLTexture) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.depth, #type (self: *MTLTexture) -> NSUInteger);
}
firstMipmapInTail :: (self: *MTLTexture) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.firstMipmapInTail, #type (self: *MTLTexture) -> NSUInteger);
}
framebufferOnly :: (self: *MTLTexture) -> bool {
	#insert #run METHOD_BODY(__selectors.isFramebufferOnly, #type (self: *MTLTexture) -> bool);
}
getBytes :: (self: *MTLTexture, pixelBytes: *void, bytesPerRow: NSUInteger, bytesPerImage: NSUInteger, region: MTLRegion, level: NSUInteger, slice: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice_, #type (self: *MTLTexture, pixelBytes: *void, bytesPerRow: NSUInteger, bytesPerImage: NSUInteger, region: MTLRegion, level: NSUInteger, slice: NSUInteger) -> ());
}
getBytes :: (self: *MTLTexture, pixelBytes: *void, bytesPerRow: NSUInteger, region: MTLRegion, level: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.getBytes_bytesPerRow_fromRegion_mipmapLevel_, #type (self: *MTLTexture, pixelBytes: *void, bytesPerRow: NSUInteger, region: MTLRegion, level: NSUInteger) -> ());
}
gpuResourceID :: (self: *MTLTexture) -> MTLResourceID {
	#insert #run METHOD_BODY(__selectors.gpuResourceID, #type (self: *MTLTexture) -> MTLResourceID);
}
height :: (self: *MTLTexture) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.height, #type (self: *MTLTexture) -> NSUInteger);
}
iosurface :: (self: *MTLTexture) -> IOSurfaceRef {
	#insert #run METHOD_BODY(__selectors.iosurface, #type (self: *MTLTexture) -> IOSurfaceRef);
}
iosurfacePlane :: (self: *MTLTexture) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.iosurfacePlane, #type (self: *MTLTexture) -> NSUInteger);
}
isFramebufferOnly :: (self: *MTLTexture) -> bool {
	#insert #run METHOD_BODY(__selectors.isFramebufferOnly, #type (self: *MTLTexture) -> bool);
}
isShareable :: (self: *MTLTexture) -> bool {
	#insert #run METHOD_BODY(__selectors.isShareable, #type (self: *MTLTexture) -> bool);
}
isSparse :: (self: *MTLTexture) -> bool {
	#insert #run METHOD_BODY(__selectors.isSparse, #type (self: *MTLTexture) -> bool);
}
mipmapLevelCount :: (self: *MTLTexture) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.mipmapLevelCount, #type (self: *MTLTexture) -> NSUInteger);
}
newRemoteTextureViewForDevice :: (self: *MTLTexture, device: *MTLDevice) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.newRemoteTextureViewForDevice_, #type (self: *MTLTexture, device: *MTLDevice) -> *MTLTexture);
}
newSharedTextureHandle :: (self: *MTLTexture) -> *MTLSharedTextureHandle {
	#insert #run METHOD_BODY(__selectors.newSharedTextureHandle, #type (self: *MTLTexture) -> *MTLSharedTextureHandle);
}
newTextureView :: (self: *MTLTexture, pixelFormat: MTLPixelFormat) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.newTextureViewWithPixelFormat_, #type (self: *MTLTexture, pixelFormat: MTLPixelFormat) -> *MTLTexture);
}
newTextureView :: (self: *MTLTexture, pixelFormat: MTLPixelFormat, textureType: MTLTextureType, levelRange: NSRange, sliceRange: NSRange) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.newTextureViewWithPixelFormat_textureType_levels_slices_, #type (self: *MTLTexture, pixelFormat: MTLPixelFormat, textureType: MTLTextureType, levelRange: NSRange, sliceRange: NSRange) -> *MTLTexture);
}
newTextureView :: (self: *MTLTexture, descriptor: *MTLTextureViewDescriptor) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.newTextureViewWithDescriptor_, #type (self: *MTLTexture, descriptor: *MTLTextureViewDescriptor) -> *MTLTexture);
}
newTextureView :: (self: *MTLTexture, pixelFormat: MTLPixelFormat, textureType: MTLTextureType, levelRange: NSRange, sliceRange: NSRange, swizzle: MTLTextureSwizzleChannels) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.newTextureViewWithPixelFormat_textureType_levels_slices_swizzle_, #type (self: *MTLTexture, pixelFormat: MTLPixelFormat, textureType: MTLTextureType, levelRange: NSRange, sliceRange: NSRange, swizzle: MTLTextureSwizzleChannels) -> *MTLTexture);
}
parentRelativeLevel :: (self: *MTLTexture) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.parentRelativeLevel, #type (self: *MTLTexture) -> NSUInteger);
}
parentRelativeSlice :: (self: *MTLTexture) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.parentRelativeSlice, #type (self: *MTLTexture) -> NSUInteger);
}
parentTexture :: (self: *MTLTexture) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.parentTexture, #type (self: *MTLTexture) -> *MTLTexture);
}
pixelFormat :: (self: *MTLTexture) -> MTLPixelFormat {
	#insert #run METHOD_BODY(__selectors.pixelFormat, #type (self: *MTLTexture) -> MTLPixelFormat);
}
remoteStorageTexture :: (self: *MTLTexture) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.remoteStorageTexture, #type (self: *MTLTexture) -> *MTLTexture);
}
replaceRegion :: (self: *MTLTexture, region: MTLRegion, level: NSUInteger, slice: NSUInteger, pixelBytes: *void, bytesPerRow: NSUInteger, bytesPerImage: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_, #type (self: *MTLTexture, region: MTLRegion, level: NSUInteger, slice: NSUInteger, pixelBytes: *void, bytesPerRow: NSUInteger, bytesPerImage: NSUInteger) -> ());
}
replaceRegion :: (self: *MTLTexture, region: MTLRegion, level: NSUInteger, pixelBytes: *void, bytesPerRow: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.replaceRegion_mipmapLevel_withBytes_bytesPerRow_, #type (self: *MTLTexture, region: MTLRegion, level: NSUInteger, pixelBytes: *void, bytesPerRow: NSUInteger) -> ());
}
rootResource :: (self: *MTLTexture) -> *MTLResource {
	#insert #run METHOD_BODY(__selectors.rootResource, #type (self: *MTLTexture) -> *MTLResource);
}
sampleCount :: (self: *MTLTexture) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.sampleCount, #type (self: *MTLTexture) -> NSUInteger);
}
shareable :: (self: *MTLTexture) -> bool {
	#insert #run METHOD_BODY(__selectors.isShareable, #type (self: *MTLTexture) -> bool);
}
sparseTextureTier :: (self: *MTLTexture) -> MTLTextureSparseTier {
	#insert #run METHOD_BODY(__selectors.sparseTextureTier, #type (self: *MTLTexture) -> MTLTextureSparseTier);
}
swizzle :: (self: *MTLTexture) -> MTLTextureSwizzleChannels {
	#insert #run METHOD_BODY(__selectors.swizzle, #type (self: *MTLTexture) -> MTLTextureSwizzleChannels);
}
tailSizeInBytes :: (self: *MTLTexture) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.tailSizeInBytes, #type (self: *MTLTexture) -> NSUInteger);
}
textureType :: (self: *MTLTexture) -> MTLTextureType {
	#insert #run METHOD_BODY(__selectors.textureType, #type (self: *MTLTexture) -> MTLTextureType);
}
usage :: (self: *MTLTexture) -> MTLTextureUsage {
	#insert #run METHOD_BODY(__selectors.usage, #type (self: *MTLTexture) -> MTLTextureUsage);
}
width :: (self: *MTLTexture) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.width, #type (self: *MTLTexture) -> NSUInteger);
}


MTL4SpecializedFunctionDescriptor :: struct { using #as _: MTL4FunctionDescriptor; }
constantValues :: (self: *MTL4SpecializedFunctionDescriptor) -> *MTLFunctionConstantValues {
	#insert #run METHOD_BODY(__selectors.constantValues, #type (self: *MTL4SpecializedFunctionDescriptor) -> *MTLFunctionConstantValues);
}
functionDescriptor :: (self: *MTL4SpecializedFunctionDescriptor) -> *MTL4FunctionDescriptor {
	#insert #run METHOD_BODY(__selectors.functionDescriptor, #type (self: *MTL4SpecializedFunctionDescriptor) -> *MTL4FunctionDescriptor);
}
setConstantValues :: (self: *MTL4SpecializedFunctionDescriptor, constantValues: *MTLFunctionConstantValues) -> () {
	#insert #run METHOD_BODY(__selectors.setConstantValues_, #type (self: *MTL4SpecializedFunctionDescriptor, constantValues: *MTLFunctionConstantValues) -> ());
}
setFunctionDescriptor :: (self: *MTL4SpecializedFunctionDescriptor, functionDescriptor: *MTL4FunctionDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setFunctionDescriptor_, #type (self: *MTL4SpecializedFunctionDescriptor, functionDescriptor: *MTL4FunctionDescriptor) -> ());
}
setSpecializedName :: (self: *MTL4SpecializedFunctionDescriptor, specializedName: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setSpecializedName_, #type (self: *MTL4SpecializedFunctionDescriptor, specializedName: *NSString) -> ());
}
specializedName :: (self: *MTL4SpecializedFunctionDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.specializedName, #type (self: *MTL4SpecializedFunctionDescriptor) -> *NSString);
}


MTLSamplerDescriptor :: struct {}
borderColor :: (self: *MTLSamplerDescriptor) -> MTLSamplerBorderColor {
	#insert #run METHOD_BODY(__selectors.borderColor, #type (self: *MTLSamplerDescriptor) -> MTLSamplerBorderColor);
}
compareFunction :: (self: *MTLSamplerDescriptor) -> MTLCompareFunction {
	#insert #run METHOD_BODY(__selectors.compareFunction, #type (self: *MTLSamplerDescriptor) -> MTLCompareFunction);
}
label :: (self: *MTLSamplerDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLSamplerDescriptor) -> *NSString);
}
lodAverage :: (self: *MTLSamplerDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.lodAverage, #type (self: *MTLSamplerDescriptor) -> bool);
}
lodBias :: (self: *MTLSamplerDescriptor) -> float {
	#insert #run METHOD_BODY(__selectors.lodBias, #type (self: *MTLSamplerDescriptor) -> float);
}
lodMaxClamp :: (self: *MTLSamplerDescriptor) -> float {
	#insert #run METHOD_BODY(__selectors.lodMaxClamp, #type (self: *MTLSamplerDescriptor) -> float);
}
lodMinClamp :: (self: *MTLSamplerDescriptor) -> float {
	#insert #run METHOD_BODY(__selectors.lodMinClamp, #type (self: *MTLSamplerDescriptor) -> float);
}
magFilter :: (self: *MTLSamplerDescriptor) -> MTLSamplerMinMagFilter {
	#insert #run METHOD_BODY(__selectors.magFilter, #type (self: *MTLSamplerDescriptor) -> MTLSamplerMinMagFilter);
}
maxAnisotropy :: (self: *MTLSamplerDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxAnisotropy, #type (self: *MTLSamplerDescriptor) -> NSUInteger);
}
minFilter :: (self: *MTLSamplerDescriptor) -> MTLSamplerMinMagFilter {
	#insert #run METHOD_BODY(__selectors.minFilter, #type (self: *MTLSamplerDescriptor) -> MTLSamplerMinMagFilter);
}
mipFilter :: (self: *MTLSamplerDescriptor) -> MTLSamplerMipFilter {
	#insert #run METHOD_BODY(__selectors.mipFilter, #type (self: *MTLSamplerDescriptor) -> MTLSamplerMipFilter);
}
normalizedCoordinates :: (self: *MTLSamplerDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.normalizedCoordinates, #type (self: *MTLSamplerDescriptor) -> bool);
}
rAddressMode :: (self: *MTLSamplerDescriptor) -> MTLSamplerAddressMode {
	#insert #run METHOD_BODY(__selectors.rAddressMode, #type (self: *MTLSamplerDescriptor) -> MTLSamplerAddressMode);
}
reductionMode :: (self: *MTLSamplerDescriptor) -> MTLSamplerReductionMode {
	#insert #run METHOD_BODY(__selectors.reductionMode, #type (self: *MTLSamplerDescriptor) -> MTLSamplerReductionMode);
}
sAddressMode :: (self: *MTLSamplerDescriptor) -> MTLSamplerAddressMode {
	#insert #run METHOD_BODY(__selectors.sAddressMode, #type (self: *MTLSamplerDescriptor) -> MTLSamplerAddressMode);
}
setBorderColor :: (self: *MTLSamplerDescriptor, borderColor: MTLSamplerBorderColor) -> () {
	#insert #run METHOD_BODY(__selectors.setBorderColor_, #type (self: *MTLSamplerDescriptor, borderColor: MTLSamplerBorderColor) -> ());
}
setCompareFunction :: (self: *MTLSamplerDescriptor, compareFunction: MTLCompareFunction) -> () {
	#insert #run METHOD_BODY(__selectors.setCompareFunction_, #type (self: *MTLSamplerDescriptor, compareFunction: MTLCompareFunction) -> ());
}
setLabel :: (self: *MTLSamplerDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLSamplerDescriptor, label: *NSString) -> ());
}
setLodAverage :: (self: *MTLSamplerDescriptor, lodAverage: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setLodAverage_, #type (self: *MTLSamplerDescriptor, lodAverage: bool) -> ());
}
setLodBias :: (self: *MTLSamplerDescriptor, lodBias: float) -> () {
	#insert #run METHOD_BODY(__selectors.setLodBias_, #type (self: *MTLSamplerDescriptor, lodBias: float) -> ());
}
setLodMaxClamp :: (self: *MTLSamplerDescriptor, lodMaxClamp: float) -> () {
	#insert #run METHOD_BODY(__selectors.setLodMaxClamp_, #type (self: *MTLSamplerDescriptor, lodMaxClamp: float) -> ());
}
setLodMinClamp :: (self: *MTLSamplerDescriptor, lodMinClamp: float) -> () {
	#insert #run METHOD_BODY(__selectors.setLodMinClamp_, #type (self: *MTLSamplerDescriptor, lodMinClamp: float) -> ());
}
setMagFilter :: (self: *MTLSamplerDescriptor, magFilter: MTLSamplerMinMagFilter) -> () {
	#insert #run METHOD_BODY(__selectors.setMagFilter_, #type (self: *MTLSamplerDescriptor, magFilter: MTLSamplerMinMagFilter) -> ());
}
setMaxAnisotropy :: (self: *MTLSamplerDescriptor, maxAnisotropy: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxAnisotropy_, #type (self: *MTLSamplerDescriptor, maxAnisotropy: NSUInteger) -> ());
}
setMinFilter :: (self: *MTLSamplerDescriptor, minFilter: MTLSamplerMinMagFilter) -> () {
	#insert #run METHOD_BODY(__selectors.setMinFilter_, #type (self: *MTLSamplerDescriptor, minFilter: MTLSamplerMinMagFilter) -> ());
}
setMipFilter :: (self: *MTLSamplerDescriptor, mipFilter: MTLSamplerMipFilter) -> () {
	#insert #run METHOD_BODY(__selectors.setMipFilter_, #type (self: *MTLSamplerDescriptor, mipFilter: MTLSamplerMipFilter) -> ());
}
setNormalizedCoordinates :: (self: *MTLSamplerDescriptor, normalizedCoordinates: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setNormalizedCoordinates_, #type (self: *MTLSamplerDescriptor, normalizedCoordinates: bool) -> ());
}
setRAddressMode :: (self: *MTLSamplerDescriptor, rAddressMode: MTLSamplerAddressMode) -> () {
	#insert #run METHOD_BODY(__selectors.setRAddressMode_, #type (self: *MTLSamplerDescriptor, rAddressMode: MTLSamplerAddressMode) -> ());
}
setReductionMode :: (self: *MTLSamplerDescriptor, reductionMode: MTLSamplerReductionMode) -> () {
	#insert #run METHOD_BODY(__selectors.setReductionMode_, #type (self: *MTLSamplerDescriptor, reductionMode: MTLSamplerReductionMode) -> ());
}
setSAddressMode :: (self: *MTLSamplerDescriptor, sAddressMode: MTLSamplerAddressMode) -> () {
	#insert #run METHOD_BODY(__selectors.setSAddressMode_, #type (self: *MTLSamplerDescriptor, sAddressMode: MTLSamplerAddressMode) -> ());
}
setSupportArgumentBuffers :: (self: *MTLSamplerDescriptor, supportArgumentBuffers: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportArgumentBuffers_, #type (self: *MTLSamplerDescriptor, supportArgumentBuffers: bool) -> ());
}
setTAddressMode :: (self: *MTLSamplerDescriptor, tAddressMode: MTLSamplerAddressMode) -> () {
	#insert #run METHOD_BODY(__selectors.setTAddressMode_, #type (self: *MTLSamplerDescriptor, tAddressMode: MTLSamplerAddressMode) -> ());
}
supportArgumentBuffers :: (self: *MTLSamplerDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportArgumentBuffers, #type (self: *MTLSamplerDescriptor) -> bool);
}
tAddressMode :: (self: *MTLSamplerDescriptor) -> MTLSamplerAddressMode {
	#insert #run METHOD_BODY(__selectors.tAddressMode, #type (self: *MTLSamplerDescriptor) -> MTLSamplerAddressMode);
}


MTLSamplerState :: struct {}
device :: (self: *MTLSamplerState) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLSamplerState) -> *MTLDevice);
}
gpuResourceID :: (self: *MTLSamplerState) -> MTLResourceID {
	#insert #run METHOD_BODY(__selectors.gpuResourceID, #type (self: *MTLSamplerState) -> MTLResourceID);
}
label :: (self: *MTLSamplerState) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLSamplerState) -> *NSString);
}


MTLStencilDescriptor :: struct {}
depthFailureOperation :: (self: *MTLStencilDescriptor) -> MTLStencilOperation {
	#insert #run METHOD_BODY(__selectors.depthFailureOperation, #type (self: *MTLStencilDescriptor) -> MTLStencilOperation);
}
depthStencilPassOperation :: (self: *MTLStencilDescriptor) -> MTLStencilOperation {
	#insert #run METHOD_BODY(__selectors.depthStencilPassOperation, #type (self: *MTLStencilDescriptor) -> MTLStencilOperation);
}
readMask :: (self: *MTLStencilDescriptor) -> u32 {
	#insert #run METHOD_BODY(__selectors.readMask, #type (self: *MTLStencilDescriptor) -> u32);
}
setDepthFailureOperation :: (self: *MTLStencilDescriptor, depthFailureOperation: MTLStencilOperation) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthFailureOperation_, #type (self: *MTLStencilDescriptor, depthFailureOperation: MTLStencilOperation) -> ());
}
setDepthStencilPassOperation :: (self: *MTLStencilDescriptor, depthStencilPassOperation: MTLStencilOperation) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthStencilPassOperation_, #type (self: *MTLStencilDescriptor, depthStencilPassOperation: MTLStencilOperation) -> ());
}
setReadMask :: (self: *MTLStencilDescriptor, readMask: u32) -> () {
	#insert #run METHOD_BODY(__selectors.setReadMask_, #type (self: *MTLStencilDescriptor, readMask: u32) -> ());
}
setStencilCompareFunction :: (self: *MTLStencilDescriptor, stencilCompareFunction: MTLCompareFunction) -> () {
	#insert #run METHOD_BODY(__selectors.setStencilCompareFunction_, #type (self: *MTLStencilDescriptor, stencilCompareFunction: MTLCompareFunction) -> ());
}
setStencilFailureOperation :: (self: *MTLStencilDescriptor, stencilFailureOperation: MTLStencilOperation) -> () {
	#insert #run METHOD_BODY(__selectors.setStencilFailureOperation_, #type (self: *MTLStencilDescriptor, stencilFailureOperation: MTLStencilOperation) -> ());
}
setWriteMask :: (self: *MTLStencilDescriptor, writeMask: u32) -> () {
	#insert #run METHOD_BODY(__selectors.setWriteMask_, #type (self: *MTLStencilDescriptor, writeMask: u32) -> ());
}
stencilCompareFunction :: (self: *MTLStencilDescriptor) -> MTLCompareFunction {
	#insert #run METHOD_BODY(__selectors.stencilCompareFunction, #type (self: *MTLStencilDescriptor) -> MTLCompareFunction);
}
stencilFailureOperation :: (self: *MTLStencilDescriptor) -> MTLStencilOperation {
	#insert #run METHOD_BODY(__selectors.stencilFailureOperation, #type (self: *MTLStencilDescriptor) -> MTLStencilOperation);
}
writeMask :: (self: *MTLStencilDescriptor) -> u32 {
	#insert #run METHOD_BODY(__selectors.writeMask, #type (self: *MTLStencilDescriptor) -> u32);
}


MTLDepthStencilDescriptor :: struct {}
backFaceStencil :: (self: *MTLDepthStencilDescriptor) -> *MTLStencilDescriptor {
	#insert #run METHOD_BODY(__selectors.backFaceStencil, #type (self: *MTLDepthStencilDescriptor) -> *MTLStencilDescriptor);
}
depthCompareFunction :: (self: *MTLDepthStencilDescriptor) -> MTLCompareFunction {
	#insert #run METHOD_BODY(__selectors.depthCompareFunction, #type (self: *MTLDepthStencilDescriptor) -> MTLCompareFunction);
}
depthWriteEnabled :: (self: *MTLDepthStencilDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isDepthWriteEnabled, #type (self: *MTLDepthStencilDescriptor) -> bool);
}
frontFaceStencil :: (self: *MTLDepthStencilDescriptor) -> *MTLStencilDescriptor {
	#insert #run METHOD_BODY(__selectors.frontFaceStencil, #type (self: *MTLDepthStencilDescriptor) -> *MTLStencilDescriptor);
}
isDepthWriteEnabled :: (self: *MTLDepthStencilDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isDepthWriteEnabled, #type (self: *MTLDepthStencilDescriptor) -> bool);
}
label :: (self: *MTLDepthStencilDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLDepthStencilDescriptor) -> *NSString);
}
setBackFaceStencil :: (self: *MTLDepthStencilDescriptor, backFaceStencil: *MTLStencilDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setBackFaceStencil_, #type (self: *MTLDepthStencilDescriptor, backFaceStencil: *MTLStencilDescriptor) -> ());
}
setDepthCompareFunction :: (self: *MTLDepthStencilDescriptor, depthCompareFunction: MTLCompareFunction) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthCompareFunction_, #type (self: *MTLDepthStencilDescriptor, depthCompareFunction: MTLCompareFunction) -> ());
}
setDepthWriteEnabled :: (self: *MTLDepthStencilDescriptor, depthWriteEnabled: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthWriteEnabled_, #type (self: *MTLDepthStencilDescriptor, depthWriteEnabled: bool) -> ());
}
setFrontFaceStencil :: (self: *MTLDepthStencilDescriptor, frontFaceStencil: *MTLStencilDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setFrontFaceStencil_, #type (self: *MTLDepthStencilDescriptor, frontFaceStencil: *MTLStencilDescriptor) -> ());
}
setLabel :: (self: *MTLDepthStencilDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLDepthStencilDescriptor, label: *NSString) -> ());
}


MTLDepthStencilState :: struct {}
device :: (self: *MTLDepthStencilState) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLDepthStencilState) -> *MTLDevice);
}
gpuResourceID :: (self: *MTLDepthStencilState) -> MTLResourceID {
	#insert #run METHOD_BODY(__selectors.gpuResourceID, #type (self: *MTLDepthStencilState) -> MTLResourceID);
}
label :: (self: *MTLDepthStencilState) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLDepthStencilState) -> *NSString);
}


MTL4CommandBufferOptions :: struct {}
logState :: (self: *MTL4CommandBufferOptions) -> *MTLLogState {
	#insert #run METHOD_BODY(__selectors.logState, #type (self: *MTL4CommandBufferOptions) -> *MTLLogState);
}
setLogState :: (self: *MTL4CommandBufferOptions, logState: *MTLLogState) -> () {
	#insert #run METHOD_BODY(__selectors.setLogState_, #type (self: *MTL4CommandBufferOptions, logState: *MTLLogState) -> ());
}


MTL4CommandBuffer :: struct {}
beginCommandBuffer :: (self: *MTL4CommandBuffer, allocator: *MTL4CommandAllocator) -> () {
	#insert #run METHOD_BODY(__selectors.beginCommandBufferWithAllocator_, #type (self: *MTL4CommandBuffer, allocator: *MTL4CommandAllocator) -> ());
}
beginCommandBuffer :: (self: *MTL4CommandBuffer, allocator: *MTL4CommandAllocator, options: *MTL4CommandBufferOptions) -> () {
	#insert #run METHOD_BODY(__selectors.beginCommandBufferWithAllocator_options_, #type (self: *MTL4CommandBuffer, allocator: *MTL4CommandAllocator, options: *MTL4CommandBufferOptions) -> ());
}
computeCommandEncoder :: (self: *MTL4CommandBuffer) -> *MTL4ComputeCommandEncoder {
	#insert #run METHOD_BODY(__selectors.computeCommandEncoder, #type (self: *MTL4CommandBuffer) -> *MTL4ComputeCommandEncoder);
}
device :: (self: *MTL4CommandBuffer) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTL4CommandBuffer) -> *MTLDevice);
}
endCommandBuffer :: (self: *MTL4CommandBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.endCommandBuffer, #type (self: *MTL4CommandBuffer) -> ());
}
label :: (self: *MTL4CommandBuffer) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTL4CommandBuffer) -> *NSString);
}
machineLearningCommandEncoder :: (self: *MTL4CommandBuffer) -> *MTL4MachineLearningCommandEncoder {
	#insert #run METHOD_BODY(__selectors.machineLearningCommandEncoder, #type (self: *MTL4CommandBuffer) -> *MTL4MachineLearningCommandEncoder);
}
popDebugGroup :: (self: *MTL4CommandBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.popDebugGroup, #type (self: *MTL4CommandBuffer) -> ());
}
pushDebugGroup :: (self: *MTL4CommandBuffer, _string: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.pushDebugGroup_, #type (self: *MTL4CommandBuffer, _string: *NSString) -> ());
}
renderCommandEncoder :: (self: *MTL4CommandBuffer, descriptor: *MTL4RenderPassDescriptor) -> *MTL4RenderCommandEncoder {
	#insert #run METHOD_BODY(__selectors.renderCommandEncoderWithDescriptor_, #type (self: *MTL4CommandBuffer, descriptor: *MTL4RenderPassDescriptor) -> *MTL4RenderCommandEncoder);
}
renderCommandEncoder :: (self: *MTL4CommandBuffer, descriptor: *MTL4RenderPassDescriptor, options: MTL4RenderEncoderOptions) -> *MTL4RenderCommandEncoder {
	#insert #run METHOD_BODY(__selectors.renderCommandEncoderWithDescriptor_options_, #type (self: *MTL4CommandBuffer, descriptor: *MTL4RenderPassDescriptor, options: MTL4RenderEncoderOptions) -> *MTL4RenderCommandEncoder);
}
resolveCounterHeap :: (self: *MTL4CommandBuffer, counterHeap: *MTL4CounterHeap, range: NSRange, bufferRange: MTL4BufferRange, fenceToWait: *MTLFence, fenceToUpdate: *MTLFence) -> () {
	#insert #run METHOD_BODY(__selectors.resolveCounterHeap_withRange_intoBuffer_waitFence_updateFence_, #type (self: *MTL4CommandBuffer, counterHeap: *MTL4CounterHeap, range: NSRange, bufferRange: MTL4BufferRange, fenceToWait: *MTLFence, fenceToUpdate: *MTLFence) -> ());
}
setLabel :: (self: *MTL4CommandBuffer, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTL4CommandBuffer, label: *NSString) -> ());
}
useResidencySet :: (self: *MTL4CommandBuffer, residencySet: *MTLResidencySet) -> () {
	#insert #run METHOD_BODY(__selectors.useResidencySet_, #type (self: *MTL4CommandBuffer, residencySet: *MTLResidencySet) -> ());
}
useResidencySets :: (self: *MTL4CommandBuffer, residencySets: **MTLResidencySet, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.useResidencySets_count_, #type (self: *MTL4CommandBuffer, residencySets: **MTLResidencySet, count: NSUInteger) -> ());
}
writeTimestampIntoHeap :: (self: *MTL4CommandBuffer, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.writeTimestampIntoHeap_atIndex_, #type (self: *MTL4CommandBuffer, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> ());
}


MTL4CounterHeapDescriptor :: struct {}
count :: (self: *MTL4CounterHeapDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.count, #type (self: *MTL4CounterHeapDescriptor) -> NSUInteger);
}
setCount :: (self: *MTL4CounterHeapDescriptor, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setCount_, #type (self: *MTL4CounterHeapDescriptor, count: NSUInteger) -> ());
}
setType :: (self: *MTL4CounterHeapDescriptor, type: MTL4CounterHeapType) -> () {
	#insert #run METHOD_BODY(__selectors.setType_, #type (self: *MTL4CounterHeapDescriptor, type: MTL4CounterHeapType) -> ());
}
type :: (self: *MTL4CounterHeapDescriptor) -> MTL4CounterHeapType {
	#insert #run METHOD_BODY(__selectors.type, #type (self: *MTL4CounterHeapDescriptor) -> MTL4CounterHeapType);
}


MTL4CounterHeap :: struct {}
count :: (self: *MTL4CounterHeap) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.count, #type (self: *MTL4CounterHeap) -> NSUInteger);
}
invalidateCounterRange :: (self: *MTL4CounterHeap, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.invalidateCounterRange_, #type (self: *MTL4CounterHeap, range: NSRange) -> ());
}
label :: (self: *MTL4CounterHeap) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTL4CounterHeap) -> *NSString);
}
resolveCounterRange :: (self: *MTL4CounterHeap, range: NSRange) -> *NSData {
	#insert #run METHOD_BODY(__selectors.resolveCounterRange_, #type (self: *MTL4CounterHeap, range: NSRange) -> *NSData);
}
setLabel :: (self: *MTL4CounterHeap, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTL4CounterHeap, label: *NSString) -> ());
}
type :: (self: *MTL4CounterHeap) -> MTL4CounterHeapType {
	#insert #run METHOD_BODY(__selectors.type, #type (self: *MTL4CounterHeap) -> MTL4CounterHeapType);
}


MTLArgumentEncoder :: struct {}
alignment :: (self: *MTLArgumentEncoder) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.alignment, #type (self: *MTLArgumentEncoder) -> NSUInteger);
}
constantData :: (self: *MTLArgumentEncoder, index: NSUInteger) -> *void {
	#insert #run METHOD_BODY(__selectors.constantDataAtIndex_, #type (self: *MTLArgumentEncoder, index: NSUInteger) -> *void);
}
device :: (self: *MTLArgumentEncoder) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLArgumentEncoder) -> *MTLDevice);
}
encodedLength :: (self: *MTLArgumentEncoder) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.encodedLength, #type (self: *MTLArgumentEncoder) -> NSUInteger);
}
label :: (self: *MTLArgumentEncoder) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLArgumentEncoder) -> *NSString);
}
newArgumentEncoder :: (self: *MTLArgumentEncoder, index: NSUInteger) -> *MTLArgumentEncoder {
	#insert #run METHOD_BODY(__selectors.newArgumentEncoderForBufferAtIndex_, #type (self: *MTLArgumentEncoder, index: NSUInteger) -> *MTLArgumentEncoder);
}
setAccelerationStructure :: (self: *MTLArgumentEncoder, accelerationStructure: *MTLAccelerationStructure, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setAccelerationStructure_atIndex_, #type (self: *MTLArgumentEncoder, accelerationStructure: *MTLAccelerationStructure, index: NSUInteger) -> ());
}
setArgumentBuffer :: (self: *MTLArgumentEncoder, argumentBuffer: *MTLBuffer, offset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setArgumentBuffer_offset_, #type (self: *MTLArgumentEncoder, argumentBuffer: *MTLBuffer, offset: NSUInteger) -> ());
}
setArgumentBuffer :: (self: *MTLArgumentEncoder, argumentBuffer: *MTLBuffer, startOffset: NSUInteger, arrayElement: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setArgumentBuffer_startOffset_arrayElement_, #type (self: *MTLArgumentEncoder, argumentBuffer: *MTLBuffer, startOffset: NSUInteger, arrayElement: NSUInteger) -> ());
}
setBuffer :: (self: *MTLArgumentEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBuffer_offset_atIndex_, #type (self: *MTLArgumentEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> ());
}
setBuffers :: (self: *MTLArgumentEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setBuffers_offsets_withRange_, #type (self: *MTLArgumentEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> ());
}
setComputePipelineState :: (self: *MTLArgumentEncoder, pipeline: *MTLComputePipelineState, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setComputePipelineState_atIndex_, #type (self: *MTLArgumentEncoder, pipeline: *MTLComputePipelineState, index: NSUInteger) -> ());
}
setComputePipelineStates :: (self: *MTLArgumentEncoder, pipelines: **MTLComputePipelineState, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setComputePipelineStates_withRange_, #type (self: *MTLArgumentEncoder, pipelines: **MTLComputePipelineState, range: NSRange) -> ());
}
setDepthStencilState :: (self: *MTLArgumentEncoder, depthStencilState: *MTLDepthStencilState, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthStencilState_atIndex_, #type (self: *MTLArgumentEncoder, depthStencilState: *MTLDepthStencilState, index: NSUInteger) -> ());
}
setDepthStencilStates :: (self: *MTLArgumentEncoder, depthStencilStates: **MTLDepthStencilState, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthStencilStates_withRange_, #type (self: *MTLArgumentEncoder, depthStencilStates: **MTLDepthStencilState, range: NSRange) -> ());
}
setIndirectCommandBuffer :: (self: *MTLArgumentEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setIndirectCommandBuffer_atIndex_, #type (self: *MTLArgumentEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, index: NSUInteger) -> ());
}
setIndirectCommandBuffers :: (self: *MTLArgumentEncoder, buffers: **MTLIndirectCommandBuffer, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setIndirectCommandBuffers_withRange_, #type (self: *MTLArgumentEncoder, buffers: **MTLIndirectCommandBuffer, range: NSRange) -> ());
}
setIntersectionFunctionTable :: (self: *MTLArgumentEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setIntersectionFunctionTable_atIndex_, #type (self: *MTLArgumentEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, index: NSUInteger) -> ());
}
setIntersectionFunctionTables :: (self: *MTLArgumentEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setIntersectionFunctionTables_withRange_, #type (self: *MTLArgumentEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> ());
}
setLabel :: (self: *MTLArgumentEncoder, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLArgumentEncoder, label: *NSString) -> ());
}
setRenderPipelineState :: (self: *MTLArgumentEncoder, pipeline: *MTLRenderPipelineState, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRenderPipelineState_atIndex_, #type (self: *MTLArgumentEncoder, pipeline: *MTLRenderPipelineState, index: NSUInteger) -> ());
}
setRenderPipelineStates :: (self: *MTLArgumentEncoder, pipelines: **MTLRenderPipelineState, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setRenderPipelineStates_withRange_, #type (self: *MTLArgumentEncoder, pipelines: **MTLRenderPipelineState, range: NSRange) -> ());
}
setSamplerState :: (self: *MTLArgumentEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSamplerState_atIndex_, #type (self: *MTLArgumentEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> ());
}
setSamplerStates :: (self: *MTLArgumentEncoder, samplers: **MTLSamplerState, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setSamplerStates_withRange_, #type (self: *MTLArgumentEncoder, samplers: **MTLSamplerState, range: NSRange) -> ());
}
setTexture :: (self: *MTLArgumentEncoder, texture: *MTLTexture, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTexture_atIndex_, #type (self: *MTLArgumentEncoder, texture: *MTLTexture, index: NSUInteger) -> ());
}
setTextures :: (self: *MTLArgumentEncoder, textures: **MTLTexture, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setTextures_withRange_, #type (self: *MTLArgumentEncoder, textures: **MTLTexture, range: NSRange) -> ());
}
setVisibleFunctionTable :: (self: *MTLArgumentEncoder, visibleFunctionTable: *MTLVisibleFunctionTable, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVisibleFunctionTable_atIndex_, #type (self: *MTLArgumentEncoder, visibleFunctionTable: *MTLVisibleFunctionTable, index: NSUInteger) -> ());
}
setVisibleFunctionTables :: (self: *MTLArgumentEncoder, visibleFunctionTables: **MTLVisibleFunctionTable, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setVisibleFunctionTables_withRange_, #type (self: *MTLArgumentEncoder, visibleFunctionTables: **MTLVisibleFunctionTable, range: NSRange) -> ());
}


MTLIntersectionFunctionTableDescriptor :: struct {}
functionCount :: (self: *MTLIntersectionFunctionTableDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.functionCount, #type (self: *MTLIntersectionFunctionTableDescriptor) -> NSUInteger);
}
intersectionFunctionTableDescriptor :: (self: *MTLIntersectionFunctionTableDescriptor) -> *MTLIntersectionFunctionTableDescriptor {
	#insert #run METHOD_BODY(__selectors.intersectionFunctionTableDescriptor, #type (self: *MTLIntersectionFunctionTableDescriptor) -> *MTLIntersectionFunctionTableDescriptor);
}
setFunctionCount :: (self: *MTLIntersectionFunctionTableDescriptor, functionCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setFunctionCount_, #type (self: *MTLIntersectionFunctionTableDescriptor, functionCount: NSUInteger) -> ());
}


MTLIntersectionFunctionTable :: struct { using #as _: MTLResource; }
gpuResourceID :: (self: *MTLIntersectionFunctionTable) -> MTLResourceID {
	#insert #run METHOD_BODY(__selectors.gpuResourceID, #type (self: *MTLIntersectionFunctionTable) -> MTLResourceID);
}
setBuffer :: (self: *MTLIntersectionFunctionTable, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBuffer_offset_atIndex_, #type (self: *MTLIntersectionFunctionTable, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> ());
}
setBuffers :: (self: *MTLIntersectionFunctionTable, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setBuffers_offsets_withRange_, #type (self: *MTLIntersectionFunctionTable, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> ());
}
setFunction :: (self: *MTLIntersectionFunctionTable, function: *MTLFunctionHandle, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setFunction_atIndex_, #type (self: *MTLIntersectionFunctionTable, function: *MTLFunctionHandle, index: NSUInteger) -> ());
}
setFunctions :: (self: *MTLIntersectionFunctionTable, functions: **MTLFunctionHandle, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setFunctions_withRange_, #type (self: *MTLIntersectionFunctionTable, functions: **MTLFunctionHandle, range: NSRange) -> ());
}
setOpaqueCurveIntersectionFunction :: (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setOpaqueCurveIntersectionFunctionWithSignature_atIndex_, #type (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, index: NSUInteger) -> ());
}
setOpaqueCurveIntersectionFunction :: (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setOpaqueCurveIntersectionFunctionWithSignature_withRange_, #type (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, range: NSRange) -> ());
}
setOpaqueTriangleIntersectionFunction :: (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setOpaqueTriangleIntersectionFunctionWithSignature_atIndex_, #type (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, index: NSUInteger) -> ());
}
setOpaqueTriangleIntersectionFunction :: (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setOpaqueTriangleIntersectionFunctionWithSignature_withRange_, #type (self: *MTLIntersectionFunctionTable, signature: MTLIntersectionFunctionSignature, range: NSRange) -> ());
}
setVisibleFunctionTable :: (self: *MTLIntersectionFunctionTable, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVisibleFunctionTable_atBufferIndex_, #type (self: *MTLIntersectionFunctionTable, functionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> ());
}
setVisibleFunctionTables :: (self: *MTLIntersectionFunctionTable, functionTables: **MTLVisibleFunctionTable, bufferRange: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setVisibleFunctionTables_withBufferRange_, #type (self: *MTLIntersectionFunctionTable, functionTables: **MTLVisibleFunctionTable, bufferRange: NSRange) -> ());
}


MTLVisibleFunctionTableDescriptor :: struct {}
functionCount :: (self: *MTLVisibleFunctionTableDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.functionCount, #type (self: *MTLVisibleFunctionTableDescriptor) -> NSUInteger);
}
setFunctionCount :: (self: *MTLVisibleFunctionTableDescriptor, functionCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setFunctionCount_, #type (self: *MTLVisibleFunctionTableDescriptor, functionCount: NSUInteger) -> ());
}
visibleFunctionTableDescriptor :: (self: *MTLVisibleFunctionTableDescriptor) -> *MTLVisibleFunctionTableDescriptor {
	#insert #run METHOD_BODY(__selectors.visibleFunctionTableDescriptor, #type (self: *MTLVisibleFunctionTableDescriptor) -> *MTLVisibleFunctionTableDescriptor);
}


MTLVisibleFunctionTable :: struct { using #as _: MTLResource; }
gpuResourceID :: (self: *MTLVisibleFunctionTable) -> MTLResourceID {
	#insert #run METHOD_BODY(__selectors.gpuResourceID, #type (self: *MTLVisibleFunctionTable) -> MTLResourceID);
}
setFunction :: (self: *MTLVisibleFunctionTable, function: *MTLFunctionHandle, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setFunction_atIndex_, #type (self: *MTLVisibleFunctionTable, function: *MTLFunctionHandle, index: NSUInteger) -> ());
}
setFunctions :: (self: *MTLVisibleFunctionTable, functions: **MTLFunctionHandle, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setFunctions_withRange_, #type (self: *MTLVisibleFunctionTable, functions: **MTLFunctionHandle, range: NSRange) -> ());
}


MTL4CommandEncoder :: struct {}
barrierAfterEncoderStages :: (self: *MTL4CommandEncoder, afterEncoderStages: MTLStages, beforeEncoderStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> () {
	#insert #run METHOD_BODY(__selectors.barrierAfterEncoderStages_beforeEncoderStages_visibilityOptions_, #type (self: *MTL4CommandEncoder, afterEncoderStages: MTLStages, beforeEncoderStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> ());
}
barrierAfterQueueStages :: (self: *MTL4CommandEncoder, afterQueueStages: MTLStages, beforeStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> () {
	#insert #run METHOD_BODY(__selectors.barrierAfterQueueStages_beforeStages_visibilityOptions_, #type (self: *MTL4CommandEncoder, afterQueueStages: MTLStages, beforeStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> ());
}
barrierAfterStages :: (self: *MTL4CommandEncoder, afterStages: MTLStages, beforeQueueStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> () {
	#insert #run METHOD_BODY(__selectors.barrierAfterStages_beforeQueueStages_visibilityOptions_, #type (self: *MTL4CommandEncoder, afterStages: MTLStages, beforeQueueStages: MTLStages, visibilityOptions: MTL4VisibilityOptions) -> ());
}
commandBuffer :: (self: *MTL4CommandEncoder) -> *MTL4CommandBuffer {
	#insert #run METHOD_BODY(__selectors.commandBuffer, #type (self: *MTL4CommandEncoder) -> *MTL4CommandBuffer);
}
endEncoding :: (self: *MTL4CommandEncoder) -> () {
	#insert #run METHOD_BODY(__selectors.endEncoding, #type (self: *MTL4CommandEncoder) -> ());
}
insertDebugSignpost :: (self: *MTL4CommandEncoder, _string: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.insertDebugSignpost_, #type (self: *MTL4CommandEncoder, _string: *NSString) -> ());
}
label :: (self: *MTL4CommandEncoder) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTL4CommandEncoder) -> *NSString);
}
popDebugGroup :: (self: *MTL4CommandEncoder) -> () {
	#insert #run METHOD_BODY(__selectors.popDebugGroup, #type (self: *MTL4CommandEncoder) -> ());
}
pushDebugGroup :: (self: *MTL4CommandEncoder, _string: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.pushDebugGroup_, #type (self: *MTL4CommandEncoder, _string: *NSString) -> ());
}
setLabel :: (self: *MTL4CommandEncoder, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTL4CommandEncoder, label: *NSString) -> ());
}
updateFence :: (self: *MTL4CommandEncoder, fence: *MTLFence, afterEncoderStages: MTLStages) -> () {
	#insert #run METHOD_BODY(__selectors.updateFence_afterEncoderStages_, #type (self: *MTL4CommandEncoder, fence: *MTLFence, afterEncoderStages: MTLStages) -> ());
}
waitForFence :: (self: *MTL4CommandEncoder, fence: *MTLFence, beforeEncoderStages: MTLStages) -> () {
	#insert #run METHOD_BODY(__selectors.waitForFence_beforeEncoderStages_, #type (self: *MTL4CommandEncoder, fence: *MTLFence, beforeEncoderStages: MTLStages) -> ());
}


MTLResource :: struct { using #as _: MTLAllocation; }
allocatedSize :: (self: *MTLResource) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.allocatedSize, #type (self: *MTLResource) -> NSUInteger);
}
cpuCacheMode :: (self: *MTLResource) -> MTLCPUCacheMode {
	#insert #run METHOD_BODY(__selectors.cpuCacheMode, #type (self: *MTLResource) -> MTLCPUCacheMode);
}
device :: (self: *MTLResource) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLResource) -> *MTLDevice);
}
hazardTrackingMode :: (self: *MTLResource) -> MTLHazardTrackingMode {
	#insert #run METHOD_BODY(__selectors.hazardTrackingMode, #type (self: *MTLResource) -> MTLHazardTrackingMode);
}
heap :: (self: *MTLResource) -> *MTLHeap {
	#insert #run METHOD_BODY(__selectors.heap, #type (self: *MTLResource) -> *MTLHeap);
}
heapOffset :: (self: *MTLResource) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.heapOffset, #type (self: *MTLResource) -> NSUInteger);
}
isAliasable :: (self: *MTLResource) -> bool {
	#insert #run METHOD_BODY(__selectors.isAliasable, #type (self: *MTLResource) -> bool);
}
label :: (self: *MTLResource) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLResource) -> *NSString);
}
makeAliasable :: (self: *MTLResource) -> () {
	#insert #run METHOD_BODY(__selectors.makeAliasable, #type (self: *MTLResource) -> ());
}
resourceOptions :: (self: *MTLResource) -> MTLResourceOptions {
	#insert #run METHOD_BODY(__selectors.resourceOptions, #type (self: *MTLResource) -> MTLResourceOptions);
}
setLabel :: (self: *MTLResource, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLResource, label: *NSString) -> ());
}
setOwner :: (self: *MTLResource, task_id_token: task_id_token_t) -> kern_return_t {
	#insert #run METHOD_BODY(__selectors.setOwnerWithIdentity_, #type (self: *MTLResource, task_id_token: task_id_token_t) -> kern_return_t);
}
setPurgeableState :: (self: *MTLResource, state: MTLPurgeableState) -> MTLPurgeableState {
	#insert #run METHOD_BODY(__selectors.setPurgeableState_, #type (self: *MTLResource, state: MTLPurgeableState) -> MTLPurgeableState);
}
storageMode :: (self: *MTLResource) -> MTLStorageMode {
	#insert #run METHOD_BODY(__selectors.storageMode, #type (self: *MTLResource) -> MTLStorageMode);
}


MTLAccelerationStructureDescriptor :: struct {}
setUsage :: (self: *MTLAccelerationStructureDescriptor, usage: MTLAccelerationStructureUsage) -> () {
	#insert #run METHOD_BODY(__selectors.setUsage_, #type (self: *MTLAccelerationStructureDescriptor, usage: MTLAccelerationStructureUsage) -> ());
}
usage :: (self: *MTLAccelerationStructureDescriptor) -> MTLAccelerationStructureUsage {
	#insert #run METHOD_BODY(__selectors.usage, #type (self: *MTLAccelerationStructureDescriptor) -> MTLAccelerationStructureUsage);
}


MTLAccelerationStructureGeometryDescriptor :: struct {}
allowDuplicateIntersectionFunctionInvocation :: (self: *MTLAccelerationStructureGeometryDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.allowDuplicateIntersectionFunctionInvocation, #type (self: *MTLAccelerationStructureGeometryDescriptor) -> bool);
}
intersectionFunctionTableOffset :: (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.intersectionFunctionTableOffset, #type (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger);
}
label :: (self: *MTLAccelerationStructureGeometryDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLAccelerationStructureGeometryDescriptor) -> *NSString);
}
opaque :: (self: *MTLAccelerationStructureGeometryDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.opaque, #type (self: *MTLAccelerationStructureGeometryDescriptor) -> bool);
}
primitiveDataBuffer :: (self: *MTLAccelerationStructureGeometryDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.primitiveDataBuffer, #type (self: *MTLAccelerationStructureGeometryDescriptor) -> *MTLBuffer);
}
primitiveDataBufferOffset :: (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.primitiveDataBufferOffset, #type (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger);
}
primitiveDataElementSize :: (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.primitiveDataElementSize, #type (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger);
}
primitiveDataStride :: (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.primitiveDataStride, #type (self: *MTLAccelerationStructureGeometryDescriptor) -> NSUInteger);
}
setAllowDuplicateIntersectionFunctionInvocation :: (self: *MTLAccelerationStructureGeometryDescriptor, allowDuplicateIntersectionFunctionInvocation: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setAllowDuplicateIntersectionFunctionInvocation_, #type (self: *MTLAccelerationStructureGeometryDescriptor, allowDuplicateIntersectionFunctionInvocation: bool) -> ());
}
setIntersectionFunctionTableOffset :: (self: *MTLAccelerationStructureGeometryDescriptor, intersectionFunctionTableOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setIntersectionFunctionTableOffset_, #type (self: *MTLAccelerationStructureGeometryDescriptor, intersectionFunctionTableOffset: NSUInteger) -> ());
}
setLabel :: (self: *MTLAccelerationStructureGeometryDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLAccelerationStructureGeometryDescriptor, label: *NSString) -> ());
}
setOpaque :: (self: *MTLAccelerationStructureGeometryDescriptor, opaque: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setOpaque_, #type (self: *MTLAccelerationStructureGeometryDescriptor, opaque: bool) -> ());
}
setPrimitiveDataBuffer :: (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setPrimitiveDataBuffer_, #type (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataBuffer: *MTLBuffer) -> ());
}
setPrimitiveDataBufferOffset :: (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setPrimitiveDataBufferOffset_, #type (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataBufferOffset: NSUInteger) -> ());
}
setPrimitiveDataElementSize :: (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataElementSize: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setPrimitiveDataElementSize_, #type (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataElementSize: NSUInteger) -> ());
}
setPrimitiveDataStride :: (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setPrimitiveDataStride_, #type (self: *MTLAccelerationStructureGeometryDescriptor, primitiveDataStride: NSUInteger) -> ());
}


MTLPrimitiveAccelerationStructureDescriptor :: struct { using #as _: MTLAccelerationStructureDescriptor; }
descriptor :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> *MTLPrimitiveAccelerationStructureDescriptor {
	#insert #run METHOD_BODY(__selectors.descriptor, #type (self: *MTLPrimitiveAccelerationStructureDescriptor) -> *MTLPrimitiveAccelerationStructureDescriptor);
}
geometryDescriptors :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.geometryDescriptors, #type (self: *MTLPrimitiveAccelerationStructureDescriptor) -> *NSArray);
}
motionEndBorderMode :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode {
	#insert #run METHOD_BODY(__selectors.motionEndBorderMode, #type (self: *MTLPrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode);
}
motionEndTime :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> float {
	#insert #run METHOD_BODY(__selectors.motionEndTime, #type (self: *MTLPrimitiveAccelerationStructureDescriptor) -> float);
}
motionKeyframeCount :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.motionKeyframeCount, #type (self: *MTLPrimitiveAccelerationStructureDescriptor) -> NSUInteger);
}
motionStartBorderMode :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode {
	#insert #run METHOD_BODY(__selectors.motionStartBorderMode, #type (self: *MTLPrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode);
}
motionStartTime :: (self: *MTLPrimitiveAccelerationStructureDescriptor) -> float {
	#insert #run METHOD_BODY(__selectors.motionStartTime, #type (self: *MTLPrimitiveAccelerationStructureDescriptor) -> float);
}
setGeometryDescriptors :: (self: *MTLPrimitiveAccelerationStructureDescriptor, geometryDescriptors: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setGeometryDescriptors_, #type (self: *MTLPrimitiveAccelerationStructureDescriptor, geometryDescriptors: *NSArray) -> ());
}
setMotionEndBorderMode :: (self: *MTLPrimitiveAccelerationStructureDescriptor, motionEndBorderMode: MTLMotionBorderMode) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionEndBorderMode_, #type (self: *MTLPrimitiveAccelerationStructureDescriptor, motionEndBorderMode: MTLMotionBorderMode) -> ());
}
setMotionEndTime :: (self: *MTLPrimitiveAccelerationStructureDescriptor, motionEndTime: float) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionEndTime_, #type (self: *MTLPrimitiveAccelerationStructureDescriptor, motionEndTime: float) -> ());
}
setMotionKeyframeCount :: (self: *MTLPrimitiveAccelerationStructureDescriptor, motionKeyframeCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionKeyframeCount_, #type (self: *MTLPrimitiveAccelerationStructureDescriptor, motionKeyframeCount: NSUInteger) -> ());
}
setMotionStartBorderMode :: (self: *MTLPrimitiveAccelerationStructureDescriptor, motionStartBorderMode: MTLMotionBorderMode) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionStartBorderMode_, #type (self: *MTLPrimitiveAccelerationStructureDescriptor, motionStartBorderMode: MTLMotionBorderMode) -> ());
}
setMotionStartTime :: (self: *MTLPrimitiveAccelerationStructureDescriptor, motionStartTime: float) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionStartTime_, #type (self: *MTLPrimitiveAccelerationStructureDescriptor, motionStartTime: float) -> ());
}


MTLAccelerationStructureTriangleGeometryDescriptor :: struct { using #as _: MTLAccelerationStructureGeometryDescriptor; }
descriptor :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLAccelerationStructureTriangleGeometryDescriptor {
	#insert #run METHOD_BODY(__selectors.descriptor, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLAccelerationStructureTriangleGeometryDescriptor);
}
indexBuffer :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.indexBuffer, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLBuffer);
}
indexBufferOffset :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.indexBufferOffset, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger);
}
indexType :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> MTLIndexType {
	#insert #run METHOD_BODY(__selectors.indexType, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> MTLIndexType);
}
setIndexBuffer :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, indexBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexBuffer_, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor, indexBuffer: *MTLBuffer) -> ());
}
setIndexBufferOffset :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, indexBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexBufferOffset_, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor, indexBufferOffset: NSUInteger) -> ());
}
setIndexType :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, indexType: MTLIndexType) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexType_, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor, indexType: MTLIndexType) -> ());
}
setTransformationMatrixBuffer :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, transformationMatrixBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setTransformationMatrixBuffer_, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor, transformationMatrixBuffer: *MTLBuffer) -> ());
}
setTransformationMatrixBufferOffset :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, transformationMatrixBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTransformationMatrixBufferOffset_, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor, transformationMatrixBufferOffset: NSUInteger) -> ());
}
setTransformationMatrixLayout :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> () {
	#insert #run METHOD_BODY(__selectors.setTransformationMatrixLayout_, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> ());
}
setTriangleCount :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, triangleCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTriangleCount_, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor, triangleCount: NSUInteger) -> ());
}
setVertexBuffer :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexBuffer_, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexBuffer: *MTLBuffer) -> ());
}
setVertexBufferOffset :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexBufferOffset_, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexBufferOffset: NSUInteger) -> ());
}
setVertexFormat :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexFormat_, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> ());
}
setVertexStride :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexStride_, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor, vertexStride: NSUInteger) -> ());
}
transformationMatrixBuffer :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.transformationMatrixBuffer, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLBuffer);
}
transformationMatrixBufferOffset :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.transformationMatrixBufferOffset, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger);
}
transformationMatrixLayout :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> MTLMatrixLayout {
	#insert #run METHOD_BODY(__selectors.transformationMatrixLayout, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> MTLMatrixLayout);
}
triangleCount :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.triangleCount, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger);
}
vertexBuffer :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.vertexBuffer, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> *MTLBuffer);
}
vertexBufferOffset :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.vertexBufferOffset, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger);
}
vertexFormat :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> MTLAttributeFormat {
	#insert #run METHOD_BODY(__selectors.vertexFormat, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> MTLAttributeFormat);
}
vertexStride :: (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.vertexStride, #type (self: *MTLAccelerationStructureTriangleGeometryDescriptor) -> NSUInteger);
}


MTLAccelerationStructureBoundingBoxGeometryDescriptor :: struct { using #as _: MTLAccelerationStructureGeometryDescriptor; }
boundingBoxBuffer :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.boundingBoxBuffer, #type (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> *MTLBuffer);
}
boundingBoxBufferOffset :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.boundingBoxBufferOffset, #type (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger);
}
boundingBoxCount :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.boundingBoxCount, #type (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger);
}
boundingBoxStride :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.boundingBoxStride, #type (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger);
}
descriptor :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> *MTLAccelerationStructureBoundingBoxGeometryDescriptor {
	#insert #run METHOD_BODY(__selectors.descriptor, #type (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor) -> *MTLAccelerationStructureBoundingBoxGeometryDescriptor);
}
setBoundingBoxBuffer :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setBoundingBoxBuffer_, #type (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxBuffer: *MTLBuffer) -> ());
}
setBoundingBoxBufferOffset :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBoundingBoxBufferOffset_, #type (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxBufferOffset: NSUInteger) -> ());
}
setBoundingBoxCount :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBoundingBoxCount_, #type (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> ());
}
setBoundingBoxStride :: (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBoundingBoxStride_, #type (self: *MTLAccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> ());
}


MTLMotionKeyframeData :: struct {}
buffer :: (self: *MTLMotionKeyframeData) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.buffer, #type (self: *MTLMotionKeyframeData) -> *MTLBuffer);
}
data :: (self: *MTLMotionKeyframeData) -> *MTLMotionKeyframeData {
	#insert #run METHOD_BODY(__selectors.data, #type (self: *MTLMotionKeyframeData) -> *MTLMotionKeyframeData);
}
offset :: (self: *MTLMotionKeyframeData) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.offset, #type (self: *MTLMotionKeyframeData) -> NSUInteger);
}
setBuffer :: (self: *MTLMotionKeyframeData, buffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setBuffer_, #type (self: *MTLMotionKeyframeData, buffer: *MTLBuffer) -> ());
}
setOffset :: (self: *MTLMotionKeyframeData, offset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setOffset_, #type (self: *MTLMotionKeyframeData, offset: NSUInteger) -> ());
}


MTLAccelerationStructureMotionTriangleGeometryDescriptor :: struct { using #as _: MTLAccelerationStructureGeometryDescriptor; }
descriptor :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *MTLAccelerationStructureMotionTriangleGeometryDescriptor {
	#insert #run METHOD_BODY(__selectors.descriptor, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *MTLAccelerationStructureMotionTriangleGeometryDescriptor);
}
indexBuffer :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.indexBuffer, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *MTLBuffer);
}
indexBufferOffset :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.indexBufferOffset, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger);
}
indexType :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> MTLIndexType {
	#insert #run METHOD_BODY(__selectors.indexType, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> MTLIndexType);
}
setIndexBuffer :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, indexBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexBuffer_, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, indexBuffer: *MTLBuffer) -> ());
}
setIndexBufferOffset :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, indexBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexBufferOffset_, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, indexBufferOffset: NSUInteger) -> ());
}
setIndexType :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, indexType: MTLIndexType) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexType_, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, indexType: MTLIndexType) -> ());
}
setTransformationMatrixBuffer :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setTransformationMatrixBuffer_, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixBuffer: *MTLBuffer) -> ());
}
setTransformationMatrixBufferOffset :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTransformationMatrixBufferOffset_, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixBufferOffset: NSUInteger) -> ());
}
setTransformationMatrixLayout :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> () {
	#insert #run METHOD_BODY(__selectors.setTransformationMatrixLayout_, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> ());
}
setTriangleCount :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, triangleCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTriangleCount_, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, triangleCount: NSUInteger) -> ());
}
setVertexBuffers :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, vertexBuffers: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexBuffers_, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, vertexBuffers: *NSArray) -> ());
}
setVertexFormat :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexFormat_, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> ());
}
setVertexStride :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, vertexStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexStride_, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor, vertexStride: NSUInteger) -> ());
}
transformationMatrixBuffer :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.transformationMatrixBuffer, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *MTLBuffer);
}
transformationMatrixBufferOffset :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.transformationMatrixBufferOffset, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger);
}
transformationMatrixLayout :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> MTLMatrixLayout {
	#insert #run METHOD_BODY(__selectors.transformationMatrixLayout, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> MTLMatrixLayout);
}
triangleCount :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.triangleCount, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger);
}
vertexBuffers :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.vertexBuffers, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> *NSArray);
}
vertexFormat :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> MTLAttributeFormat {
	#insert #run METHOD_BODY(__selectors.vertexFormat, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> MTLAttributeFormat);
}
vertexStride :: (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.vertexStride, #type (self: *MTLAccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger);
}


MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor :: struct { using #as _: MTLAccelerationStructureGeometryDescriptor; }
boundingBoxBuffers :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.boundingBoxBuffers, #type (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> *NSArray);
}
boundingBoxCount :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.boundingBoxCount, #type (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger);
}
boundingBoxStride :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.boundingBoxStride, #type (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger);
}
descriptor :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor {
	#insert #run METHOD_BODY(__selectors.descriptor, #type (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor) -> *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor);
}
setBoundingBoxBuffers :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxBuffers: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setBoundingBoxBuffers_, #type (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxBuffers: *NSArray) -> ());
}
setBoundingBoxCount :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBoundingBoxCount_, #type (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> ());
}
setBoundingBoxStride :: (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBoundingBoxStride_, #type (self: *MTLAccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> ());
}


MTLAccelerationStructureCurveGeometryDescriptor :: struct { using #as _: MTLAccelerationStructureGeometryDescriptor; }
controlPointBuffer :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.controlPointBuffer, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLBuffer);
}
controlPointBufferOffset :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.controlPointBufferOffset, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger);
}
controlPointCount :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.controlPointCount, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger);
}
controlPointFormat :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat {
	#insert #run METHOD_BODY(__selectors.controlPointFormat, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat);
}
controlPointStride :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.controlPointStride, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger);
}
curveBasis :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLCurveBasis {
	#insert #run METHOD_BODY(__selectors.curveBasis, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLCurveBasis);
}
curveEndCaps :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLCurveEndCaps {
	#insert #run METHOD_BODY(__selectors.curveEndCaps, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLCurveEndCaps);
}
curveType :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLCurveType {
	#insert #run METHOD_BODY(__selectors.curveType, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLCurveType);
}
descriptor :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLAccelerationStructureCurveGeometryDescriptor {
	#insert #run METHOD_BODY(__selectors.descriptor, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLAccelerationStructureCurveGeometryDescriptor);
}
indexBuffer :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.indexBuffer, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLBuffer);
}
indexBufferOffset :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.indexBufferOffset, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger);
}
indexType :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLIndexType {
	#insert #run METHOD_BODY(__selectors.indexType, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLIndexType);
}
radiusBuffer :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.radiusBuffer, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> *MTLBuffer);
}
radiusBufferOffset :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.radiusBufferOffset, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger);
}
radiusFormat :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat {
	#insert #run METHOD_BODY(__selectors.radiusFormat, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat);
}
radiusStride :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.radiusStride, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger);
}
segmentControlPointCount :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.segmentControlPointCount, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger);
}
segmentCount :: (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.segmentCount, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor) -> NSUInteger);
}
setControlPointBuffer :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointBuffer_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointBuffer: *MTLBuffer) -> ());
}
setControlPointBufferOffset :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointBufferOffset_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointBufferOffset: NSUInteger) -> ());
}
setControlPointCount :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointCount_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointCount: NSUInteger) -> ());
}
setControlPointFormat :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointFormat_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> ());
}
setControlPointStride :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointStride_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, controlPointStride: NSUInteger) -> ());
}
setCurveBasis :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> () {
	#insert #run METHOD_BODY(__selectors.setCurveBasis_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> ());
}
setCurveEndCaps :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> () {
	#insert #run METHOD_BODY(__selectors.setCurveEndCaps_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> ());
}
setCurveType :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, curveType: MTLCurveType) -> () {
	#insert #run METHOD_BODY(__selectors.setCurveType_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, curveType: MTLCurveType) -> ());
}
setIndexBuffer :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, indexBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexBuffer_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, indexBuffer: *MTLBuffer) -> ());
}
setIndexBufferOffset :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, indexBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexBufferOffset_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, indexBufferOffset: NSUInteger) -> ());
}
setIndexType :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, indexType: MTLIndexType) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexType_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, indexType: MTLIndexType) -> ());
}
setRadiusBuffer :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setRadiusBuffer_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusBuffer: *MTLBuffer) -> ());
}
setRadiusBufferOffset :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRadiusBufferOffset_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusBufferOffset: NSUInteger) -> ());
}
setRadiusFormat :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setRadiusFormat_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> ());
}
setRadiusStride :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRadiusStride_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, radiusStride: NSUInteger) -> ());
}
setSegmentControlPointCount :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSegmentControlPointCount_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> ());
}
setSegmentCount :: (self: *MTLAccelerationStructureCurveGeometryDescriptor, segmentCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSegmentCount_, #type (self: *MTLAccelerationStructureCurveGeometryDescriptor, segmentCount: NSUInteger) -> ());
}


MTLAccelerationStructureMotionCurveGeometryDescriptor :: struct { using #as _: MTLAccelerationStructureGeometryDescriptor; }
controlPointBuffers :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.controlPointBuffers, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *NSArray);
}
controlPointCount :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.controlPointCount, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger);
}
controlPointFormat :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat {
	#insert #run METHOD_BODY(__selectors.controlPointFormat, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat);
}
controlPointStride :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.controlPointStride, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger);
}
curveBasis :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveBasis {
	#insert #run METHOD_BODY(__selectors.curveBasis, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveBasis);
}
curveEndCaps :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveEndCaps {
	#insert #run METHOD_BODY(__selectors.curveEndCaps, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveEndCaps);
}
curveType :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveType {
	#insert #run METHOD_BODY(__selectors.curveType, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveType);
}
descriptor :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *MTLAccelerationStructureMotionCurveGeometryDescriptor {
	#insert #run METHOD_BODY(__selectors.descriptor, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *MTLAccelerationStructureMotionCurveGeometryDescriptor);
}
indexBuffer :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.indexBuffer, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *MTLBuffer);
}
indexBufferOffset :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.indexBufferOffset, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger);
}
indexType :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLIndexType {
	#insert #run METHOD_BODY(__selectors.indexType, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLIndexType);
}
radiusBuffers :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.radiusBuffers, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> *NSArray);
}
radiusFormat :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat {
	#insert #run METHOD_BODY(__selectors.radiusFormat, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat);
}
radiusStride :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.radiusStride, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger);
}
segmentControlPointCount :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.segmentControlPointCount, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger);
}
segmentCount :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.segmentCount, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger);
}
setControlPointBuffers :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointBuffers: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointBuffers_, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointBuffers: *NSArray) -> ());
}
setControlPointCount :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointCount_, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointCount: NSUInteger) -> ());
}
setControlPointFormat :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointFormat_, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> ());
}
setControlPointStride :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointStride_, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, controlPointStride: NSUInteger) -> ());
}
setCurveBasis :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> () {
	#insert #run METHOD_BODY(__selectors.setCurveBasis_, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> ());
}
setCurveEndCaps :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> () {
	#insert #run METHOD_BODY(__selectors.setCurveEndCaps_, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> ());
}
setCurveType :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, curveType: MTLCurveType) -> () {
	#insert #run METHOD_BODY(__selectors.setCurveType_, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, curveType: MTLCurveType) -> ());
}
setIndexBuffer :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, indexBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexBuffer_, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, indexBuffer: *MTLBuffer) -> ());
}
setIndexBufferOffset :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, indexBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexBufferOffset_, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, indexBufferOffset: NSUInteger) -> ());
}
setIndexType :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, indexType: MTLIndexType) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexType_, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, indexType: MTLIndexType) -> ());
}
setRadiusBuffers :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, radiusBuffers: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setRadiusBuffers_, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, radiusBuffers: *NSArray) -> ());
}
setRadiusFormat :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setRadiusFormat_, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> ());
}
setRadiusStride :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, radiusStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRadiusStride_, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, radiusStride: NSUInteger) -> ());
}
setSegmentControlPointCount :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSegmentControlPointCount_, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> ());
}
setSegmentCount :: (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, segmentCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSegmentCount_, #type (self: *MTLAccelerationStructureMotionCurveGeometryDescriptor, segmentCount: NSUInteger) -> ());
}


MTLInstanceAccelerationStructureDescriptor :: struct { using #as _: MTLAccelerationStructureDescriptor; }
descriptor :: (self: *MTLInstanceAccelerationStructureDescriptor) -> *MTLInstanceAccelerationStructureDescriptor {
	#insert #run METHOD_BODY(__selectors.descriptor, #type (self: *MTLInstanceAccelerationStructureDescriptor) -> *MTLInstanceAccelerationStructureDescriptor);
}
instanceCount :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.instanceCount, #type (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
instanceDescriptorBuffer :: (self: *MTLInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.instanceDescriptorBuffer, #type (self: *MTLInstanceAccelerationStructureDescriptor) -> *MTLBuffer);
}
instanceDescriptorBufferOffset :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.instanceDescriptorBufferOffset, #type (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
instanceDescriptorStride :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.instanceDescriptorStride, #type (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
instanceDescriptorType :: (self: *MTLInstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType {
	#insert #run METHOD_BODY(__selectors.instanceDescriptorType, #type (self: *MTLInstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType);
}
instanceTransformationMatrixLayout :: (self: *MTLInstanceAccelerationStructureDescriptor) -> MTLMatrixLayout {
	#insert #run METHOD_BODY(__selectors.instanceTransformationMatrixLayout, #type (self: *MTLInstanceAccelerationStructureDescriptor) -> MTLMatrixLayout);
}
instancedAccelerationStructures :: (self: *MTLInstanceAccelerationStructureDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.instancedAccelerationStructures, #type (self: *MTLInstanceAccelerationStructureDescriptor) -> *NSArray);
}
motionTransformBuffer :: (self: *MTLInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.motionTransformBuffer, #type (self: *MTLInstanceAccelerationStructureDescriptor) -> *MTLBuffer);
}
motionTransformBufferOffset :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.motionTransformBufferOffset, #type (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
motionTransformCount :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.motionTransformCount, #type (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
motionTransformStride :: (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.motionTransformStride, #type (self: *MTLInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
motionTransformType :: (self: *MTLInstanceAccelerationStructureDescriptor) -> MTLTransformType {
	#insert #run METHOD_BODY(__selectors.motionTransformType, #type (self: *MTLInstanceAccelerationStructureDescriptor) -> MTLTransformType);
}
setInstanceCount :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceCount_, #type (self: *MTLInstanceAccelerationStructureDescriptor, instanceCount: NSUInteger) -> ());
}
setInstanceDescriptorBuffer :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceDescriptorBuffer_, #type (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: *MTLBuffer) -> ());
}
setInstanceDescriptorBufferOffset :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceDescriptorBufferOffset_, #type (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorBufferOffset: NSUInteger) -> ());
}
setInstanceDescriptorStride :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceDescriptorStride_, #type (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> ());
}
setInstanceDescriptorType :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceDescriptorType_, #type (self: *MTLInstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> ());
}
setInstanceTransformationMatrixLayout :: (self: *MTLInstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceTransformationMatrixLayout_, #type (self: *MTLInstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> ());
}
setInstancedAccelerationStructures :: (self: *MTLInstanceAccelerationStructureDescriptor, instancedAccelerationStructures: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setInstancedAccelerationStructures_, #type (self: *MTLInstanceAccelerationStructureDescriptor, instancedAccelerationStructures: *NSArray) -> ());
}
setMotionTransformBuffer :: (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformBuffer_, #type (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformBuffer: *MTLBuffer) -> ());
}
setMotionTransformBufferOffset :: (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformBufferOffset_, #type (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformBufferOffset: NSUInteger) -> ());
}
setMotionTransformCount :: (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformCount_, #type (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformCount: NSUInteger) -> ());
}
setMotionTransformStride :: (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformStride_, #type (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> ());
}
setMotionTransformType :: (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformType_, #type (self: *MTLInstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> ());
}


MTLIndirectInstanceAccelerationStructureDescriptor :: struct { using #as _: MTLAccelerationStructureDescriptor; }
descriptor :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLIndirectInstanceAccelerationStructureDescriptor {
	#insert #run METHOD_BODY(__selectors.descriptor, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLIndirectInstanceAccelerationStructureDescriptor);
}
instanceCountBuffer :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.instanceCountBuffer, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer);
}
instanceCountBufferOffset :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.instanceCountBufferOffset, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
instanceDescriptorBuffer :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.instanceDescriptorBuffer, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer);
}
instanceDescriptorBufferOffset :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.instanceDescriptorBufferOffset, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
instanceDescriptorStride :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.instanceDescriptorStride, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
instanceDescriptorType :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType {
	#insert #run METHOD_BODY(__selectors.instanceDescriptorType, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType);
}
instanceTransformationMatrixLayout :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> MTLMatrixLayout {
	#insert #run METHOD_BODY(__selectors.instanceTransformationMatrixLayout, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> MTLMatrixLayout);
}
maxInstanceCount :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxInstanceCount, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
maxMotionTransformCount :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxMotionTransformCount, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
motionTransformBuffer :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.motionTransformBuffer, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer);
}
motionTransformBufferOffset :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.motionTransformBufferOffset, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
motionTransformCountBuffer :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.motionTransformCountBuffer, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> *MTLBuffer);
}
motionTransformCountBufferOffset :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.motionTransformCountBufferOffset, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
motionTransformStride :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.motionTransformStride, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
motionTransformType :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> MTLTransformType {
	#insert #run METHOD_BODY(__selectors.motionTransformType, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor) -> MTLTransformType);
}
setInstanceCountBuffer :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceCountBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceCountBuffer_, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceCountBuffer: *MTLBuffer) -> ());
}
setInstanceCountBufferOffset :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceCountBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceCountBufferOffset_, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceCountBufferOffset: NSUInteger) -> ());
}
setInstanceDescriptorBuffer :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceDescriptorBuffer_, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: *MTLBuffer) -> ());
}
setInstanceDescriptorBufferOffset :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceDescriptorBufferOffset_, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorBufferOffset: NSUInteger) -> ());
}
setInstanceDescriptorStride :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceDescriptorStride_, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> ());
}
setInstanceDescriptorType :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceDescriptorType_, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> ());
}
setInstanceTransformationMatrixLayout :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceTransformationMatrixLayout_, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> ());
}
setMaxInstanceCount :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, maxInstanceCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxInstanceCount_, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor, maxInstanceCount: NSUInteger) -> ());
}
setMaxMotionTransformCount :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, maxMotionTransformCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxMotionTransformCount_, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor, maxMotionTransformCount: NSUInteger) -> ());
}
setMotionTransformBuffer :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformBuffer_, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformBuffer: *MTLBuffer) -> ());
}
setMotionTransformBufferOffset :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformBufferOffset_, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformBufferOffset: NSUInteger) -> ());
}
setMotionTransformCountBuffer :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformCountBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformCountBuffer_, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformCountBuffer: *MTLBuffer) -> ());
}
setMotionTransformCountBufferOffset :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformCountBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformCountBufferOffset_, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformCountBufferOffset: NSUInteger) -> ());
}
setMotionTransformStride :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformStride_, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> ());
}
setMotionTransformType :: (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformType_, #type (self: *MTLIndirectInstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> ());
}


MTLAccelerationStructure :: struct { using #as _: MTLResource; }
gpuResourceID :: (self: *MTLAccelerationStructure) -> MTLResourceID {
	#insert #run METHOD_BODY(__selectors.gpuResourceID, #type (self: *MTLAccelerationStructure) -> MTLResourceID);
}
size :: (self: *MTLAccelerationStructure) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.size, #type (self: *MTLAccelerationStructure) -> NSUInteger);
}


MTLArgumentDescriptor :: struct {}
access :: (self: *MTLArgumentDescriptor) -> MTLBindingAccess {
	#insert #run METHOD_BODY(__selectors.access, #type (self: *MTLArgumentDescriptor) -> MTLBindingAccess);
}
argumentDescriptor :: (self: *MTLArgumentDescriptor) -> *MTLArgumentDescriptor {
	#insert #run METHOD_BODY(__selectors.argumentDescriptor, #type (self: *MTLArgumentDescriptor) -> *MTLArgumentDescriptor);
}
arrayLength :: (self: *MTLArgumentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.arrayLength, #type (self: *MTLArgumentDescriptor) -> NSUInteger);
}
constantBlockAlignment :: (self: *MTLArgumentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.constantBlockAlignment, #type (self: *MTLArgumentDescriptor) -> NSUInteger);
}
dataType :: (self: *MTLArgumentDescriptor) -> MTLDataType {
	#insert #run METHOD_BODY(__selectors.dataType, #type (self: *MTLArgumentDescriptor) -> MTLDataType);
}
index :: (self: *MTLArgumentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.index, #type (self: *MTLArgumentDescriptor) -> NSUInteger);
}
setAccess :: (self: *MTLArgumentDescriptor, access: MTLBindingAccess) -> () {
	#insert #run METHOD_BODY(__selectors.setAccess_, #type (self: *MTLArgumentDescriptor, access: MTLBindingAccess) -> ());
}
setArrayLength :: (self: *MTLArgumentDescriptor, arrayLength: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setArrayLength_, #type (self: *MTLArgumentDescriptor, arrayLength: NSUInteger) -> ());
}
setConstantBlockAlignment :: (self: *MTLArgumentDescriptor, constantBlockAlignment: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setConstantBlockAlignment_, #type (self: *MTLArgumentDescriptor, constantBlockAlignment: NSUInteger) -> ());
}
setDataType :: (self: *MTLArgumentDescriptor, dataType: MTLDataType) -> () {
	#insert #run METHOD_BODY(__selectors.setDataType_, #type (self: *MTLArgumentDescriptor, dataType: MTLDataType) -> ());
}
setIndex :: (self: *MTLArgumentDescriptor, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setIndex_, #type (self: *MTLArgumentDescriptor, index: NSUInteger) -> ());
}
setTextureType :: (self: *MTLArgumentDescriptor, textureType: MTLTextureType) -> () {
	#insert #run METHOD_BODY(__selectors.setTextureType_, #type (self: *MTLArgumentDescriptor, textureType: MTLTextureType) -> ());
}
textureType :: (self: *MTLArgumentDescriptor) -> MTLTextureType {
	#insert #run METHOD_BODY(__selectors.textureType, #type (self: *MTLArgumentDescriptor) -> MTLTextureType);
}


MTLArchitecture :: struct {}
name :: (self: *MTLArchitecture) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTLArchitecture) -> *NSString);
}


MTLDevice :: struct {}
accelerationStructureSizes :: (self: *MTLDevice, descriptor: *MTLAccelerationStructureDescriptor) -> MTLAccelerationStructureSizes {
	#insert #run METHOD_BODY(__selectors.accelerationStructureSizesWithDescriptor_, #type (self: *MTLDevice, descriptor: *MTLAccelerationStructureDescriptor) -> MTLAccelerationStructureSizes);
}
architecture :: (self: *MTLDevice) -> *MTLArchitecture {
	#insert #run METHOD_BODY(__selectors.architecture, #type (self: *MTLDevice) -> *MTLArchitecture);
}
areBarycentricCoordsSupported :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.areBarycentricCoordsSupported, #type (self: *MTLDevice) -> bool);
}
areProgrammableSamplePositionsSupported :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.areProgrammableSamplePositionsSupported, #type (self: *MTLDevice) -> bool);
}
areRasterOrderGroupsSupported :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.areRasterOrderGroupsSupported, #type (self: *MTLDevice) -> bool);
}
argumentBuffersSupport :: (self: *MTLDevice) -> MTLArgumentBuffersTier {
	#insert #run METHOD_BODY(__selectors.argumentBuffersSupport, #type (self: *MTLDevice) -> MTLArgumentBuffersTier);
}
barycentricCoordsSupported :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.areBarycentricCoordsSupported, #type (self: *MTLDevice) -> bool);
}
convertSparsePixelRegions :: (self: *MTLDevice, pixelRegions: *MTLRegion, tileRegions: *MTLRegion, tileSize: MTLSize, mode: MTLSparseTextureRegionAlignmentMode, numRegions: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.convertSparsePixelRegions_toTileRegions_withTileSize_alignmentMode_numRegions_, #type (self: *MTLDevice, pixelRegions: *MTLRegion, tileRegions: *MTLRegion, tileSize: MTLSize, mode: MTLSparseTextureRegionAlignmentMode, numRegions: NSUInteger) -> ());
}
convertSparseTileRegions :: (self: *MTLDevice, tileRegions: *MTLRegion, pixelRegions: *MTLRegion, tileSize: MTLSize, numRegions: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.convertSparseTileRegions_toPixelRegions_withTileSize_numRegions_, #type (self: *MTLDevice, tileRegions: *MTLRegion, pixelRegions: *MTLRegion, tileSize: MTLSize, numRegions: NSUInteger) -> ());
}
counterSets :: (self: *MTLDevice) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.counterSets, #type (self: *MTLDevice) -> *NSArray);
}
currentAllocatedSize :: (self: *MTLDevice) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.currentAllocatedSize, #type (self: *MTLDevice) -> NSUInteger);
}
depth24Stencil8PixelFormatSupported :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.isDepth24Stencil8PixelFormatSupported, #type (self: *MTLDevice) -> bool);
}
functionHandle :: (self: *MTLDevice, function: *MTLFunction) -> *MTLFunctionHandle {
	#insert #run METHOD_BODY(__selectors.functionHandleWithFunction_, #type (self: *MTLDevice, function: *MTLFunction) -> *MTLFunctionHandle);
}
functionHandle :: (self: *MTLDevice, function: *MTL4BinaryFunction) -> *MTLFunctionHandle {
	#insert #run METHOD_BODY(__selectors.functionHandleWithBinaryFunction_, #type (self: *MTLDevice, function: *MTL4BinaryFunction) -> *MTLFunctionHandle);
}
getDefaultSamplePositions :: (self: *MTLDevice, positions: *MTLSamplePosition, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.getDefaultSamplePositions_count_, #type (self: *MTLDevice, positions: *MTLSamplePosition, count: NSUInteger) -> ());
}
hasUnifiedMemory :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.hasUnifiedMemory, #type (self: *MTLDevice) -> bool);
}
headless :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.isHeadless, #type (self: *MTLDevice) -> bool);
}
heapAccelerationStructureSizeAndAlign :: (self: *MTLDevice, size: NSUInteger) -> MTLSizeAndAlign {
	#insert #run METHOD_BODY(__selectors.heapAccelerationStructureSizeAndAlignWithSize_, #type (self: *MTLDevice, size: NSUInteger) -> MTLSizeAndAlign);
}
heapAccelerationStructureSizeAndAlign :: (self: *MTLDevice, descriptor: *MTLAccelerationStructureDescriptor) -> MTLSizeAndAlign {
	#insert #run METHOD_BODY(__selectors.heapAccelerationStructureSizeAndAlignWithDescriptor_, #type (self: *MTLDevice, descriptor: *MTLAccelerationStructureDescriptor) -> MTLSizeAndAlign);
}
heapBufferSizeAndAlign :: (self: *MTLDevice, length: NSUInteger, options: MTLResourceOptions) -> MTLSizeAndAlign {
	#insert #run METHOD_BODY(__selectors.heapBufferSizeAndAlignWithLength_options_, #type (self: *MTLDevice, length: NSUInteger, options: MTLResourceOptions) -> MTLSizeAndAlign);
}
heapTextureSizeAndAlign :: (self: *MTLDevice, desc: *MTLTextureDescriptor) -> MTLSizeAndAlign {
	#insert #run METHOD_BODY(__selectors.heapTextureSizeAndAlignWithDescriptor_, #type (self: *MTLDevice, desc: *MTLTextureDescriptor) -> MTLSizeAndAlign);
}
isDepth24Stencil8PixelFormatSupported :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.isDepth24Stencil8PixelFormatSupported, #type (self: *MTLDevice) -> bool);
}
isHeadless :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.isHeadless, #type (self: *MTLDevice) -> bool);
}
isLowPower :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.isLowPower, #type (self: *MTLDevice) -> bool);
}
isRemovable :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.isRemovable, #type (self: *MTLDevice) -> bool);
}
location :: (self: *MTLDevice) -> MTLDeviceLocation {
	#insert #run METHOD_BODY(__selectors.location, #type (self: *MTLDevice) -> MTLDeviceLocation);
}
locationNumber :: (self: *MTLDevice) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.locationNumber, #type (self: *MTLDevice) -> NSUInteger);
}
lowPower :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.isLowPower, #type (self: *MTLDevice) -> bool);
}
maxArgumentBufferSamplerCount :: (self: *MTLDevice) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxArgumentBufferSamplerCount, #type (self: *MTLDevice) -> NSUInteger);
}
maxBufferLength :: (self: *MTLDevice) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxBufferLength, #type (self: *MTLDevice) -> NSUInteger);
}
maxThreadgroupMemoryLength :: (self: *MTLDevice) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxThreadgroupMemoryLength, #type (self: *MTLDevice) -> NSUInteger);
}
maxThreadsPerThreadgroup :: (self: *MTLDevice) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.maxThreadsPerThreadgroup, #type (self: *MTLDevice) -> MTLSize);
}
maxTransferRate :: (self: *MTLDevice) -> u64 {
	#insert #run METHOD_BODY(__selectors.maxTransferRate, #type (self: *MTLDevice) -> u64);
}
maximumConcurrentCompilationTaskCount :: (self: *MTLDevice) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maximumConcurrentCompilationTaskCount, #type (self: *MTLDevice) -> NSUInteger);
}
minimumLinearTextureAlignmentForPixelFormat :: (self: *MTLDevice, format: MTLPixelFormat) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.minimumLinearTextureAlignmentForPixelFormat_, #type (self: *MTLDevice, format: MTLPixelFormat) -> NSUInteger);
}
minimumTextureBufferAlignmentForPixelFormat :: (self: *MTLDevice, format: MTLPixelFormat) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.minimumTextureBufferAlignmentForPixelFormat_, #type (self: *MTLDevice, format: MTLPixelFormat) -> NSUInteger);
}
name :: (self: *MTLDevice) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTLDevice) -> *NSString);
}
newAccelerationStructure :: (self: *MTLDevice, size: NSUInteger) -> *MTLAccelerationStructure {
	#insert #run METHOD_BODY(__selectors.newAccelerationStructureWithSize_, #type (self: *MTLDevice, size: NSUInteger) -> *MTLAccelerationStructure);
}
newAccelerationStructure :: (self: *MTLDevice, descriptor: *MTLAccelerationStructureDescriptor) -> *MTLAccelerationStructure {
	#insert #run METHOD_BODY(__selectors.newAccelerationStructureWithDescriptor_, #type (self: *MTLDevice, descriptor: *MTLAccelerationStructureDescriptor) -> *MTLAccelerationStructure);
}
newArchive :: (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTL4Archive {
	#insert #run METHOD_BODY(__selectors.newArchiveWithURL_error_, #type (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTL4Archive);
}
newArgumentEncoder :: (self: *MTLDevice, arguments: *NSArray) -> *MTLArgumentEncoder {
	#insert #run METHOD_BODY(__selectors.newArgumentEncoderWithArguments_, #type (self: *MTLDevice, arguments: *NSArray) -> *MTLArgumentEncoder);
}
newArgumentEncoder :: (self: *MTLDevice, bufferBinding: *MTLBufferBinding) -> *MTLArgumentEncoder {
	#insert #run METHOD_BODY(__selectors.newArgumentEncoderWithBufferBinding_, #type (self: *MTLDevice, bufferBinding: *MTLBufferBinding) -> *MTLArgumentEncoder);
}
newArgumentTable :: (self: *MTLDevice, descriptor: *MTL4ArgumentTableDescriptor, error: **NSError) -> *MTL4ArgumentTable {
	#insert #run METHOD_BODY(__selectors.newArgumentTableWithDescriptor_error_, #type (self: *MTLDevice, descriptor: *MTL4ArgumentTableDescriptor, error: **NSError) -> *MTL4ArgumentTable);
}
newBinaryArchive :: (self: *MTLDevice, descriptor: *MTLBinaryArchiveDescriptor, error: **NSError) -> *MTLBinaryArchive {
	#insert #run METHOD_BODY(__selectors.newBinaryArchiveWithDescriptor_error_, #type (self: *MTLDevice, descriptor: *MTLBinaryArchiveDescriptor, error: **NSError) -> *MTLBinaryArchive);
}
newBuffer :: (self: *MTLDevice, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.newBufferWithLength_options_, #type (self: *MTLDevice, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer);
}
newBuffer :: (self: *MTLDevice, pointer: *void, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.newBufferWithBytes_length_options_, #type (self: *MTLDevice, pointer: *void, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer);
}
newBuffer :: (self: *MTLDevice, length: NSUInteger, options: MTLResourceOptions, placementSparsePageSize: MTLSparsePageSize) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.newBufferWithLength_options_placementSparsePageSize_, #type (self: *MTLDevice, length: NSUInteger, options: MTLResourceOptions, placementSparsePageSize: MTLSparsePageSize) -> *MTLBuffer);
}
newCommandAllocator :: (self: *MTLDevice) -> *MTL4CommandAllocator {
	#insert #run METHOD_BODY(__selectors.newCommandAllocator, #type (self: *MTLDevice) -> *MTL4CommandAllocator);
}
newCommandAllocator :: (self: *MTLDevice, descriptor: *MTL4CommandAllocatorDescriptor, error: **NSError) -> *MTL4CommandAllocator {
	#insert #run METHOD_BODY(__selectors.newCommandAllocatorWithDescriptor_error_, #type (self: *MTLDevice, descriptor: *MTL4CommandAllocatorDescriptor, error: **NSError) -> *MTL4CommandAllocator);
}
newCommandBuffer :: (self: *MTLDevice) -> *MTL4CommandBuffer {
	#insert #run METHOD_BODY(__selectors.newCommandBuffer, #type (self: *MTLDevice) -> *MTL4CommandBuffer);
}
newCommandQueue :: (self: *MTLDevice) -> *MTLCommandQueue {
	#insert #run METHOD_BODY(__selectors.newCommandQueue, #type (self: *MTLDevice) -> *MTLCommandQueue);
}
newCommandQueue :: (self: *MTLDevice, maxCommandBufferCount: NSUInteger) -> *MTLCommandQueue {
	#insert #run METHOD_BODY(__selectors.newCommandQueueWithMaxCommandBufferCount_, #type (self: *MTLDevice, maxCommandBufferCount: NSUInteger) -> *MTLCommandQueue);
}
newCommandQueue :: (self: *MTLDevice, descriptor: *MTLCommandQueueDescriptor) -> *MTLCommandQueue {
	#insert #run METHOD_BODY(__selectors.newCommandQueueWithDescriptor_, #type (self: *MTLDevice, descriptor: *MTLCommandQueueDescriptor) -> *MTLCommandQueue);
}
newCompiler :: (self: *MTLDevice, descriptor: *MTL4CompilerDescriptor, error: **NSError) -> *MTL4Compiler {
	#insert #run METHOD_BODY(__selectors.newCompilerWithDescriptor_error_, #type (self: *MTLDevice, descriptor: *MTL4CompilerDescriptor, error: **NSError) -> *MTL4Compiler);
}
newComputePipelineState :: (self: *MTLDevice, computeFunction: *MTLFunction, error: **NSError) -> *MTLComputePipelineState {
	#insert #run METHOD_BODY(__selectors.newComputePipelineStateWithFunction_error_, #type (self: *MTLDevice, computeFunction: *MTLFunction, error: **NSError) -> *MTLComputePipelineState);
}
newComputePipelineState :: (self: *MTLDevice, computeFunction: *MTLFunction, options: MTLPipelineOption, reflection: *MTLAutoreleasedComputePipelineReflection, error: **NSError) -> *MTLComputePipelineState {
	#insert #run METHOD_BODY(__selectors.newComputePipelineStateWithFunction_options_reflection_error_, #type (self: *MTLDevice, computeFunction: *MTLFunction, options: MTLPipelineOption, reflection: *MTLAutoreleasedComputePipelineReflection, error: **NSError) -> *MTLComputePipelineState);
}
newComputePipelineState :: (self: *MTLDevice, computeFunction: *MTLFunction, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> () {
	#insert #run METHOD_BODY(__selectors.newComputePipelineStateWithFunction_completionHandler_, #type (self: *MTLDevice, computeFunction: *MTLFunction, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> ());
}
newComputePipelineState :: (self: *MTLDevice, computeFunction: *MTLFunction, options: MTLPipelineOption, completionHandler: MTLNewComputePipelineStateWithReflectionCompletionHandler) -> () {
	#insert #run METHOD_BODY(__selectors.newComputePipelineStateWithFunction_options_completionHandler_, #type (self: *MTLDevice, computeFunction: *MTLFunction, options: MTLPipelineOption, completionHandler: MTLNewComputePipelineStateWithReflectionCompletionHandler) -> ());
}
newComputePipelineState :: (self: *MTLDevice, descriptor: *MTLComputePipelineDescriptor, options: MTLPipelineOption, reflection: *MTLAutoreleasedComputePipelineReflection, error: **NSError) -> *MTLComputePipelineState {
	#insert #run METHOD_BODY(__selectors.newComputePipelineStateWithDescriptor_options_reflection_error_, #type (self: *MTLDevice, descriptor: *MTLComputePipelineDescriptor, options: MTLPipelineOption, reflection: *MTLAutoreleasedComputePipelineReflection, error: **NSError) -> *MTLComputePipelineState);
}
newComputePipelineState :: (self: *MTLDevice, descriptor: *MTLComputePipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewComputePipelineStateWithReflectionCompletionHandler) -> () {
	#insert #run METHOD_BODY(__selectors.newComputePipelineStateWithDescriptor_options_completionHandler_, #type (self: *MTLDevice, descriptor: *MTLComputePipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewComputePipelineStateWithReflectionCompletionHandler) -> ());
}
tensorSizeAndAlign :: (self: *MTLDevice, descriptor: *MTLTensorDescriptor) -> MTLSizeAndAlign {
	#insert #run METHOD_BODY(__selectors.tensorSizeAndAlignWithDescriptor_, #type (self: *MTLDevice, descriptor: *MTLTensorDescriptor) -> MTLSizeAndAlign);
}
supportsVertexAmplificationCount :: (self: *MTLDevice, count: NSUInteger) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsVertexAmplificationCount_, #type (self: *MTLDevice, count: NSUInteger) -> bool);
}
supportsTextureSampleCount :: (self: *MTLDevice, sampleCount: NSUInteger) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsTextureSampleCount_, #type (self: *MTLDevice, sampleCount: NSUInteger) -> bool);
}
newCounterHeap :: (self: *MTLDevice, descriptor: *MTL4CounterHeapDescriptor, error: **NSError) -> *MTL4CounterHeap {
	#insert #run METHOD_BODY(__selectors.newCounterHeapWithDescriptor_error_, #type (self: *MTLDevice, descriptor: *MTL4CounterHeapDescriptor, error: **NSError) -> *MTL4CounterHeap);
}
newCounterSampleBuffer :: (self: *MTLDevice, descriptor: *MTLCounterSampleBufferDescriptor, error: **NSError) -> *MTLCounterSampleBuffer {
	#insert #run METHOD_BODY(__selectors.newCounterSampleBufferWithDescriptor_error_, #type (self: *MTLDevice, descriptor: *MTLCounterSampleBufferDescriptor, error: **NSError) -> *MTLCounterSampleBuffer);
}
newDefaultLibrary :: (self: *MTLDevice) -> *MTLLibrary {
	#insert #run METHOD_BODY(__selectors.newDefaultLibrary, #type (self: *MTLDevice) -> *MTLLibrary);
}
newDefaultLibrary :: (self: *MTLDevice, bundle: *NSBundle, error: **NSError) -> *MTLLibrary {
	#insert #run METHOD_BODY(__selectors.newDefaultLibraryWithBundle_error_, #type (self: *MTLDevice, bundle: *NSBundle, error: **NSError) -> *MTLLibrary);
}
newDepthStencilState :: (self: *MTLDevice, descriptor: *MTLDepthStencilDescriptor) -> *MTLDepthStencilState {
	#insert #run METHOD_BODY(__selectors.newDepthStencilStateWithDescriptor_, #type (self: *MTLDevice, descriptor: *MTLDepthStencilDescriptor) -> *MTLDepthStencilState);
}
newDynamicLibrary :: (self: *MTLDevice, library: *MTLLibrary, error: **NSError) -> *MTLDynamicLibrary {
	#insert #run METHOD_BODY(__selectors.newDynamicLibrary_error_, #type (self: *MTLDevice, library: *MTLLibrary, error: **NSError) -> *MTLDynamicLibrary);
}
newDynamicLibrary :: (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLDynamicLibrary {
	#insert #run METHOD_BODY(__selectors.newDynamicLibraryWithURL_error_, #type (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLDynamicLibrary);
}
newEvent :: (self: *MTLDevice) -> *MTLEvent {
	#insert #run METHOD_BODY(__selectors.newEvent, #type (self: *MTLDevice) -> *MTLEvent);
}
newFence :: (self: *MTLDevice) -> *MTLFence {
	#insert #run METHOD_BODY(__selectors.newFence, #type (self: *MTLDevice) -> *MTLFence);
}
newHeap :: (self: *MTLDevice, descriptor: *MTLHeapDescriptor) -> *MTLHeap {
	#insert #run METHOD_BODY(__selectors.newHeapWithDescriptor_, #type (self: *MTLDevice, descriptor: *MTLHeapDescriptor) -> *MTLHeap);
}
newIOCommandQueue :: (self: *MTLDevice, descriptor: *MTLIOCommandQueueDescriptor, error: **NSError) -> *MTLIOCommandQueue {
	#insert #run METHOD_BODY(__selectors.newIOCommandQueueWithDescriptor_error_, #type (self: *MTLDevice, descriptor: *MTLIOCommandQueueDescriptor, error: **NSError) -> *MTLIOCommandQueue);
}
newIOFileHandle :: (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLIOFileHandle {
	#insert #run METHOD_BODY(__selectors.newIOFileHandleWithURL_error_, #type (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLIOFileHandle);
}
newIOFileHandle :: (self: *MTLDevice, url: *NSURL, compressionMethod: MTLIOCompressionMethod, error: **NSError) -> *MTLIOFileHandle {
	#insert #run METHOD_BODY(__selectors.newIOFileHandleWithURL_compressionMethod_error_, #type (self: *MTLDevice, url: *NSURL, compressionMethod: MTLIOCompressionMethod, error: **NSError) -> *MTLIOFileHandle);
}
newIOHandle :: (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLIOFileHandle {
	#insert #run METHOD_BODY(__selectors.newIOHandleWithURL_error_, #type (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLIOFileHandle);
}
newIOHandle :: (self: *MTLDevice, url: *NSURL, compressionMethod: MTLIOCompressionMethod, error: **NSError) -> *MTLIOFileHandle {
	#insert #run METHOD_BODY(__selectors.newIOHandleWithURL_compressionMethod_error_, #type (self: *MTLDevice, url: *NSURL, compressionMethod: MTLIOCompressionMethod, error: **NSError) -> *MTLIOFileHandle);
}
newIndirectCommandBuffer :: (self: *MTLDevice, descriptor: *MTLIndirectCommandBufferDescriptor, maxCount: NSUInteger, options: MTLResourceOptions) -> *MTLIndirectCommandBuffer {
	#insert #run METHOD_BODY(__selectors.newIndirectCommandBufferWithDescriptor_maxCommandCount_options_, #type (self: *MTLDevice, descriptor: *MTLIndirectCommandBufferDescriptor, maxCount: NSUInteger, options: MTLResourceOptions) -> *MTLIndirectCommandBuffer);
}
newLibrary :: (self: *MTLDevice, filepath: *NSString, error: **NSError) -> *MTLLibrary {
	#insert #run METHOD_BODY(__selectors.newLibraryWithFile_error_, #type (self: *MTLDevice, filepath: *NSString, error: **NSError) -> *MTLLibrary);
}
newLibrary :: (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLLibrary {
	#insert #run METHOD_BODY(__selectors.newLibraryWithURL_error_, #type (self: *MTLDevice, url: *NSURL, error: **NSError) -> *MTLLibrary);
}
newLibrary :: (self: *MTLDevice, data: dispatch_data_t, error: **NSError) -> *MTLLibrary {
	#insert #run METHOD_BODY(__selectors.newLibraryWithData_error_, #type (self: *MTLDevice, data: dispatch_data_t, error: **NSError) -> *MTLLibrary);
}
newLibrary :: (self: *MTLDevice, source: *NSString, options: *MTLCompileOptions, error: **NSError) -> *MTLLibrary {
	#insert #run METHOD_BODY(__selectors.newLibraryWithSource_options_error_, #type (self: *MTLDevice, source: *NSString, options: *MTLCompileOptions, error: **NSError) -> *MTLLibrary);
}
newLibrary :: (self: *MTLDevice, source: *NSString, options: *MTLCompileOptions, completionHandler: MTLNewLibraryCompletionHandler) -> () {
	#insert #run METHOD_BODY(__selectors.newLibraryWithSource_options_completionHandler_, #type (self: *MTLDevice, source: *NSString, options: *MTLCompileOptions, completionHandler: MTLNewLibraryCompletionHandler) -> ());
}
newLibrary :: (self: *MTLDevice, descriptor: *MTLStitchedLibraryDescriptor, error: **NSError) -> *MTLLibrary {
	#insert #run METHOD_BODY(__selectors.newLibraryWithStitchedDescriptor_error_, #type (self: *MTLDevice, descriptor: *MTLStitchedLibraryDescriptor, error: **NSError) -> *MTLLibrary);
}
newLibrary :: (self: *MTLDevice, descriptor: *MTLStitchedLibraryDescriptor, completionHandler: MTLNewLibraryCompletionHandler) -> () {
	#insert #run METHOD_BODY(__selectors.newLibraryWithStitchedDescriptor_completionHandler_, #type (self: *MTLDevice, descriptor: *MTLStitchedLibraryDescriptor, completionHandler: MTLNewLibraryCompletionHandler) -> ());
}
supportsShaderBarycentricCoordinates :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsShaderBarycentricCoordinates, #type (self: *MTLDevice) -> bool);
}
supportsRenderDynamicLibraries :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsRenderDynamicLibraries, #type (self: *MTLDevice) -> bool);
}
newLogState :: (self: *MTLDevice, descriptor: *MTLLogStateDescriptor, error: **NSError) -> *MTLLogState {
	#insert #run METHOD_BODY(__selectors.newLogStateWithDescriptor_error_, #type (self: *MTLDevice, descriptor: *MTLLogStateDescriptor, error: **NSError) -> *MTLLogState);
}
newMTL4CommandQueue :: (self: *MTLDevice) -> *MTL4CommandQueue {
	#insert #run METHOD_BODY(__selectors.newMTL4CommandQueue, #type (self: *MTLDevice) -> *MTL4CommandQueue);
}
newMTL4CommandQueue :: (self: *MTLDevice, descriptor: *MTL4CommandQueueDescriptor, error: **NSError) -> *MTL4CommandQueue {
	#insert #run METHOD_BODY(__selectors.newMTL4CommandQueueWithDescriptor_error_, #type (self: *MTLDevice, descriptor: *MTL4CommandQueueDescriptor, error: **NSError) -> *MTL4CommandQueue);
}
newPipelineDataSetSerializer :: (self: *MTLDevice, descriptor: *MTL4PipelineDataSetSerializerDescriptor) -> *MTL4PipelineDataSetSerializer {
	#insert #run METHOD_BODY(__selectors.newPipelineDataSetSerializerWithDescriptor_, #type (self: *MTLDevice, descriptor: *MTL4PipelineDataSetSerializerDescriptor) -> *MTL4PipelineDataSetSerializer);
}
newRasterizationRateMap :: (self: *MTLDevice, descriptor: *MTLRasterizationRateMapDescriptor) -> *MTLRasterizationRateMap {
	#insert #run METHOD_BODY(__selectors.newRasterizationRateMapWithDescriptor_, #type (self: *MTLDevice, descriptor: *MTLRasterizationRateMapDescriptor) -> *MTLRasterizationRateMap);
}
newRenderPipelineState :: (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, error: **NSError) -> *MTLRenderPipelineState {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateWithDescriptor_error_, #type (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, error: **NSError) -> *MTLRenderPipelineState);
}
newRenderPipelineState :: (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, options: MTLPipelineOption, reflection: *MTLAutoreleasedRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateWithDescriptor_options_reflection_error_, #type (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, options: MTLPipelineOption, reflection: *MTLAutoreleasedRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState);
}
newRenderPipelineState :: (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> () {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateWithDescriptor_completionHandler_, #type (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> ());
}
newRenderPipelineState :: (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> () {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateWithDescriptor_options_completionHandler_, #type (self: *MTLDevice, descriptor: *MTLRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> ());
}
newRenderPipelineState :: (self: *MTLDevice, descriptor: *MTLTileRenderPipelineDescriptor, options: MTLPipelineOption, reflection: *MTLAutoreleasedRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateWithTileDescriptor_options_reflection_error_, #type (self: *MTLDevice, descriptor: *MTLTileRenderPipelineDescriptor, options: MTLPipelineOption, reflection: *MTLAutoreleasedRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState);
}
newRenderPipelineState :: (self: *MTLDevice, descriptor: *MTLTileRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> () {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateWithTileDescriptor_options_completionHandler_, #type (self: *MTLDevice, descriptor: *MTLTileRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> ());
}
newRenderPipelineState :: (self: *MTLDevice, descriptor: *MTLMeshRenderPipelineDescriptor, options: MTLPipelineOption, reflection: *MTLAutoreleasedRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateWithMeshDescriptor_options_reflection_error_, #type (self: *MTLDevice, descriptor: *MTLMeshRenderPipelineDescriptor, options: MTLPipelineOption, reflection: *MTLAutoreleasedRenderPipelineReflection, error: **NSError) -> *MTLRenderPipelineState);
}
newRenderPipelineState :: (self: *MTLDevice, descriptor: *MTLMeshRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> () {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateWithMeshDescriptor_options_completionHandler_, #type (self: *MTLDevice, descriptor: *MTLMeshRenderPipelineDescriptor, options: MTLPipelineOption, completionHandler: MTLNewRenderPipelineStateWithReflectionCompletionHandler) -> ());
}
supportsRaytracingFromRender :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsRaytracingFromRender, #type (self: *MTLDevice) -> bool);
}
supportsRaytracing :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsRaytracing, #type (self: *MTLDevice) -> bool);
}
supportsRasterizationRateMap :: (self: *MTLDevice, layerCount: NSUInteger) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsRasterizationRateMapWithLayerCount_, #type (self: *MTLDevice, layerCount: NSUInteger) -> bool);
}
newResidencySet :: (self: *MTLDevice, desc: *MTLResidencySetDescriptor, error: **NSError) -> *MTLResidencySet {
	#insert #run METHOD_BODY(__selectors.newResidencySetWithDescriptor_error_, #type (self: *MTLDevice, desc: *MTLResidencySetDescriptor, error: **NSError) -> *MTLResidencySet);
}
newSamplerState :: (self: *MTLDevice, descriptor: *MTLSamplerDescriptor) -> *MTLSamplerState {
	#insert #run METHOD_BODY(__selectors.newSamplerStateWithDescriptor_, #type (self: *MTLDevice, descriptor: *MTLSamplerDescriptor) -> *MTLSamplerState);
}
newSharedEvent :: (self: *MTLDevice) -> *MTLSharedEvent {
	#insert #run METHOD_BODY(__selectors.newSharedEvent, #type (self: *MTLDevice) -> *MTLSharedEvent);
}
newSharedEvent :: (self: *MTLDevice, sharedEventHandle: *MTLSharedEventHandle) -> *MTLSharedEvent {
	#insert #run METHOD_BODY(__selectors.newSharedEventWithHandle_, #type (self: *MTLDevice, sharedEventHandle: *MTLSharedEventHandle) -> *MTLSharedEvent);
}
newSharedTexture :: (self: *MTLDevice, descriptor: *MTLTextureDescriptor) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.newSharedTextureWithDescriptor_, #type (self: *MTLDevice, descriptor: *MTLTextureDescriptor) -> *MTLTexture);
}
newSharedTexture :: (self: *MTLDevice, sharedHandle: *MTLSharedTextureHandle) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.newSharedTextureWithHandle_, #type (self: *MTLDevice, sharedHandle: *MTLSharedTextureHandle) -> *MTLTexture);
}
newTensor :: (self: *MTLDevice, descriptor: *MTLTensorDescriptor, error: **NSError) -> *MTLTensor {
	#insert #run METHOD_BODY(__selectors.newTensorWithDescriptor_error_, #type (self: *MTLDevice, descriptor: *MTLTensorDescriptor, error: **NSError) -> *MTLTensor);
}
newTexture :: (self: *MTLDevice, descriptor: *MTLTextureDescriptor) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.newTextureWithDescriptor_, #type (self: *MTLDevice, descriptor: *MTLTextureDescriptor) -> *MTLTexture);
}
newTexture :: (self: *MTLDevice, descriptor: *MTLTextureDescriptor, iosurface: IOSurfaceRef, plane: NSUInteger) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.newTextureWithDescriptor_iosurface_plane_, #type (self: *MTLDevice, descriptor: *MTLTextureDescriptor, iosurface: IOSurfaceRef, plane: NSUInteger) -> *MTLTexture);
}
newTextureViewPool :: (self: *MTLDevice, descriptor: *MTLResourceViewPoolDescriptor, error: **NSError) -> *MTLTextureViewPool {
	#insert #run METHOD_BODY(__selectors.newTextureViewPoolWithDescriptor_error_, #type (self: *MTLDevice, descriptor: *MTLResourceViewPoolDescriptor, error: **NSError) -> *MTLTextureViewPool);
}
peerCount :: (self: *MTLDevice) -> u32 {
	#insert #run METHOD_BODY(__selectors.peerCount, #type (self: *MTLDevice) -> u32);
}
peerGroupID :: (self: *MTLDevice) -> u64 {
	#insert #run METHOD_BODY(__selectors.peerGroupID, #type (self: *MTLDevice) -> u64);
}
peerIndex :: (self: *MTLDevice) -> u32 {
	#insert #run METHOD_BODY(__selectors.peerIndex, #type (self: *MTLDevice) -> u32);
}
programmableSamplePositionsSupported :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.areProgrammableSamplePositionsSupported, #type (self: *MTLDevice) -> bool);
}
queryTimestampFrequency :: (self: *MTLDevice) -> u64 {
	#insert #run METHOD_BODY(__selectors.queryTimestampFrequency, #type (self: *MTLDevice) -> u64);
}
rasterOrderGroupsSupported :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.areRasterOrderGroupsSupported, #type (self: *MTLDevice) -> bool);
}
readWriteTextureSupport :: (self: *MTLDevice) -> MTLReadWriteTextureTier {
	#insert #run METHOD_BODY(__selectors.readWriteTextureSupport, #type (self: *MTLDevice) -> MTLReadWriteTextureTier);
}
recommendedMaxWorkingSetSize :: (self: *MTLDevice) -> u64 {
	#insert #run METHOD_BODY(__selectors.recommendedMaxWorkingSetSize, #type (self: *MTLDevice) -> u64);
}
registryID :: (self: *MTLDevice) -> u64 {
	#insert #run METHOD_BODY(__selectors.registryID, #type (self: *MTLDevice) -> u64);
}
removable :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.isRemovable, #type (self: *MTLDevice) -> bool);
}
sampleTimestamps :: (self: *MTLDevice, cpuTimestamp: *MTLTimestamp, gpuTimestamp: *MTLTimestamp) -> () {
	#insert #run METHOD_BODY(__selectors.sampleTimestamps_gpuTimestamp_, #type (self: *MTLDevice, cpuTimestamp: *MTLTimestamp, gpuTimestamp: *MTLTimestamp) -> ());
}
setShouldMaximizeConcurrentCompilation :: (self: *MTLDevice, shouldMaximizeConcurrentCompilation: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setShouldMaximizeConcurrentCompilation_, #type (self: *MTLDevice, shouldMaximizeConcurrentCompilation: bool) -> ());
}
shouldMaximizeConcurrentCompilation :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.shouldMaximizeConcurrentCompilation, #type (self: *MTLDevice) -> bool);
}
sizeOfCounterHeapEntry :: (self: *MTLDevice, type: MTL4CounterHeapType) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.sizeOfCounterHeapEntry_, #type (self: *MTLDevice, type: MTL4CounterHeapType) -> NSUInteger);
}
sparseTileSize :: (self: *MTLDevice, textureType: MTLTextureType, pixelFormat: MTLPixelFormat, sampleCount: NSUInteger) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.sparseTileSizeWithTextureType_pixelFormat_sampleCount_, #type (self: *MTLDevice, textureType: MTLTextureType, pixelFormat: MTLPixelFormat, sampleCount: NSUInteger) -> MTLSize);
}
sparseTileSize :: (self: *MTLDevice, textureType: MTLTextureType, pixelFormat: MTLPixelFormat, sampleCount: NSUInteger, sparsePageSize: MTLSparsePageSize) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.sparseTileSizeWithTextureType_pixelFormat_sampleCount_sparsePageSize_, #type (self: *MTLDevice, textureType: MTLTextureType, pixelFormat: MTLPixelFormat, sampleCount: NSUInteger, sparsePageSize: MTLSparsePageSize) -> MTLSize);
}
sparseTileSizeInBytes :: (self: *MTLDevice) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.sparseTileSizeInBytes, #type (self: *MTLDevice) -> NSUInteger);
}
sparseTileSizeInBytes :: (self: *MTLDevice, sparsePageSize: MTLSparsePageSize) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.sparseTileSizeInBytesForSparsePageSize_, #type (self: *MTLDevice, sparsePageSize: MTLSparsePageSize) -> NSUInteger);
}
supports32BitFloatFiltering :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.supports32BitFloatFiltering, #type (self: *MTLDevice) -> bool);
}
supports32BitMSAA :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.supports32BitMSAA, #type (self: *MTLDevice) -> bool);
}
supportsBCTextureCompression :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsBCTextureCompression, #type (self: *MTLDevice) -> bool);
}
supportsCounterSampling :: (self: *MTLDevice, samplingPoint: MTLCounterSamplingPoint) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsCounterSampling_, #type (self: *MTLDevice, samplingPoint: MTLCounterSamplingPoint) -> bool);
}
supportsDynamicLibraries :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsDynamicLibraries, #type (self: *MTLDevice) -> bool);
}
supportsFamily :: (self: *MTLDevice, gpuFamily: MTLGPUFamily) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsFamily_, #type (self: *MTLDevice, gpuFamily: MTLGPUFamily) -> bool);
}
supportsFeatureSet :: (self: *MTLDevice, featureSet: MTLFeatureSet) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsFeatureSet_, #type (self: *MTLDevice, featureSet: MTLFeatureSet) -> bool);
}
supportsFunctionPointers :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsFunctionPointers, #type (self: *MTLDevice) -> bool);
}
supportsFunctionPointersFromRender :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsFunctionPointersFromRender, #type (self: *MTLDevice) -> bool);
}
supportsPrimitiveMotionBlur :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsPrimitiveMotionBlur, #type (self: *MTLDevice) -> bool);
}
supportsPullModelInterpolation :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsPullModelInterpolation, #type (self: *MTLDevice) -> bool);
}
supportsQueryTextureLOD :: (self: *MTLDevice) -> bool {
	#insert #run METHOD_BODY(__selectors.supportsQueryTextureLOD, #type (self: *MTLDevice) -> bool);
}


MTLType :: struct {}
dataType :: (self: *MTLType) -> MTLDataType {
	#insert #run METHOD_BODY(__selectors.dataType, #type (self: *MTLType) -> MTLDataType);
}


MTLStructMember :: struct {}
argumentIndex :: (self: *MTLStructMember) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.argumentIndex, #type (self: *MTLStructMember) -> NSUInteger);
}
arrayType :: (self: *MTLStructMember) -> *MTLArrayType {
	#insert #run METHOD_BODY(__selectors.arrayType, #type (self: *MTLStructMember) -> *MTLArrayType);
}
dataType :: (self: *MTLStructMember) -> MTLDataType {
	#insert #run METHOD_BODY(__selectors.dataType, #type (self: *MTLStructMember) -> MTLDataType);
}
name :: (self: *MTLStructMember) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTLStructMember) -> *NSString);
}
offset :: (self: *MTLStructMember) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.offset, #type (self: *MTLStructMember) -> NSUInteger);
}
pointerType :: (self: *MTLStructMember) -> *MTLPointerType {
	#insert #run METHOD_BODY(__selectors.pointerType, #type (self: *MTLStructMember) -> *MTLPointerType);
}
structType :: (self: *MTLStructMember) -> *MTLStructType {
	#insert #run METHOD_BODY(__selectors.structType, #type (self: *MTLStructMember) -> *MTLStructType);
}
tensorReferenceType :: (self: *MTLStructMember) -> *MTLTensorReferenceType {
	#insert #run METHOD_BODY(__selectors.tensorReferenceType, #type (self: *MTLStructMember) -> *MTLTensorReferenceType);
}
textureReferenceType :: (self: *MTLStructMember) -> *MTLTextureReferenceType {
	#insert #run METHOD_BODY(__selectors.textureReferenceType, #type (self: *MTLStructMember) -> *MTLTextureReferenceType);
}


MTLStructType :: struct { using #as _: MTLType; }
memberByName :: (self: *MTLStructType, name: *NSString) -> *MTLStructMember {
	#insert #run METHOD_BODY(__selectors.memberByName_, #type (self: *MTLStructType, name: *NSString) -> *MTLStructMember);
}
members :: (self: *MTLStructType) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.members, #type (self: *MTLStructType) -> *NSArray);
}


MTLArrayType :: struct { using #as _: MTLType; }
argumentIndexStride :: (self: *MTLArrayType) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.argumentIndexStride, #type (self: *MTLArrayType) -> NSUInteger);
}
arrayLength :: (self: *MTLArrayType) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.arrayLength, #type (self: *MTLArrayType) -> NSUInteger);
}
elementArrayType :: (self: *MTLArrayType) -> *MTLArrayType {
	#insert #run METHOD_BODY(__selectors.elementArrayType, #type (self: *MTLArrayType) -> *MTLArrayType);
}
elementPointerType :: (self: *MTLArrayType) -> *MTLPointerType {
	#insert #run METHOD_BODY(__selectors.elementPointerType, #type (self: *MTLArrayType) -> *MTLPointerType);
}
elementStructType :: (self: *MTLArrayType) -> *MTLStructType {
	#insert #run METHOD_BODY(__selectors.elementStructType, #type (self: *MTLArrayType) -> *MTLStructType);
}
elementTensorReferenceType :: (self: *MTLArrayType) -> *MTLTensorReferenceType {
	#insert #run METHOD_BODY(__selectors.elementTensorReferenceType, #type (self: *MTLArrayType) -> *MTLTensorReferenceType);
}
elementTextureReferenceType :: (self: *MTLArrayType) -> *MTLTextureReferenceType {
	#insert #run METHOD_BODY(__selectors.elementTextureReferenceType, #type (self: *MTLArrayType) -> *MTLTextureReferenceType);
}
elementType :: (self: *MTLArrayType) -> MTLDataType {
	#insert #run METHOD_BODY(__selectors.elementType, #type (self: *MTLArrayType) -> MTLDataType);
}
stride :: (self: *MTLArrayType) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.stride, #type (self: *MTLArrayType) -> NSUInteger);
}


MTLPointerType :: struct { using #as _: MTLType; }
access :: (self: *MTLPointerType) -> MTLBindingAccess {
	#insert #run METHOD_BODY(__selectors.access, #type (self: *MTLPointerType) -> MTLBindingAccess);
}
alignment :: (self: *MTLPointerType) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.alignment, #type (self: *MTLPointerType) -> NSUInteger);
}
dataSize :: (self: *MTLPointerType) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.dataSize, #type (self: *MTLPointerType) -> NSUInteger);
}
elementArrayType :: (self: *MTLPointerType) -> *MTLArrayType {
	#insert #run METHOD_BODY(__selectors.elementArrayType, #type (self: *MTLPointerType) -> *MTLArrayType);
}
elementIsArgumentBuffer :: (self: *MTLPointerType) -> bool {
	#insert #run METHOD_BODY(__selectors.elementIsArgumentBuffer, #type (self: *MTLPointerType) -> bool);
}
elementStructType :: (self: *MTLPointerType) -> *MTLStructType {
	#insert #run METHOD_BODY(__selectors.elementStructType, #type (self: *MTLPointerType) -> *MTLStructType);
}
elementType :: (self: *MTLPointerType) -> MTLDataType {
	#insert #run METHOD_BODY(__selectors.elementType, #type (self: *MTLPointerType) -> MTLDataType);
}


MTLTextureReferenceType :: struct { using #as _: MTLType; }
access :: (self: *MTLTextureReferenceType) -> MTLBindingAccess {
	#insert #run METHOD_BODY(__selectors.access, #type (self: *MTLTextureReferenceType) -> MTLBindingAccess);
}
isDepthTexture :: (self: *MTLTextureReferenceType) -> bool {
	#insert #run METHOD_BODY(__selectors.isDepthTexture, #type (self: *MTLTextureReferenceType) -> bool);
}
textureDataType :: (self: *MTLTextureReferenceType) -> MTLDataType {
	#insert #run METHOD_BODY(__selectors.textureDataType, #type (self: *MTLTextureReferenceType) -> MTLDataType);
}
textureType :: (self: *MTLTextureReferenceType) -> MTLTextureType {
	#insert #run METHOD_BODY(__selectors.textureType, #type (self: *MTLTextureReferenceType) -> MTLTextureType);
}


MTLTensorReferenceType :: struct { using #as _: MTLType; }
access :: (self: *MTLTensorReferenceType) -> MTLBindingAccess {
	#insert #run METHOD_BODY(__selectors.access, #type (self: *MTLTensorReferenceType) -> MTLBindingAccess);
}
dimensions :: (self: *MTLTensorReferenceType) -> *MTLTensorExtents {
	#insert #run METHOD_BODY(__selectors.dimensions, #type (self: *MTLTensorReferenceType) -> *MTLTensorExtents);
}
indexType :: (self: *MTLTensorReferenceType) -> MTLDataType {
	#insert #run METHOD_BODY(__selectors.indexType, #type (self: *MTLTensorReferenceType) -> MTLDataType);
}
tensorDataType :: (self: *MTLTensorReferenceType) -> MTLTensorDataType {
	#insert #run METHOD_BODY(__selectors.tensorDataType, #type (self: *MTLTensorReferenceType) -> MTLTensorDataType);
}


MTLArgument :: struct {}
access :: (self: *MTLArgument) -> MTLBindingAccess {
	#insert #run METHOD_BODY(__selectors.access, #type (self: *MTLArgument) -> MTLBindingAccess);
}
active :: (self: *MTLArgument) -> bool {
	#insert #run METHOD_BODY(__selectors.isActive, #type (self: *MTLArgument) -> bool);
}
arrayLength :: (self: *MTLArgument) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.arrayLength, #type (self: *MTLArgument) -> NSUInteger);
}
bufferAlignment :: (self: *MTLArgument) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.bufferAlignment, #type (self: *MTLArgument) -> NSUInteger);
}
bufferDataSize :: (self: *MTLArgument) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.bufferDataSize, #type (self: *MTLArgument) -> NSUInteger);
}
bufferDataType :: (self: *MTLArgument) -> MTLDataType {
	#insert #run METHOD_BODY(__selectors.bufferDataType, #type (self: *MTLArgument) -> MTLDataType);
}
bufferPointerType :: (self: *MTLArgument) -> *MTLPointerType {
	#insert #run METHOD_BODY(__selectors.bufferPointerType, #type (self: *MTLArgument) -> *MTLPointerType);
}
bufferStructType :: (self: *MTLArgument) -> *MTLStructType {
	#insert #run METHOD_BODY(__selectors.bufferStructType, #type (self: *MTLArgument) -> *MTLStructType);
}
index :: (self: *MTLArgument) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.index, #type (self: *MTLArgument) -> NSUInteger);
}
isActive :: (self: *MTLArgument) -> bool {
	#insert #run METHOD_BODY(__selectors.isActive, #type (self: *MTLArgument) -> bool);
}
isDepthTexture :: (self: *MTLArgument) -> bool {
	#insert #run METHOD_BODY(__selectors.isDepthTexture, #type (self: *MTLArgument) -> bool);
}
name :: (self: *MTLArgument) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTLArgument) -> *NSString);
}
textureDataType :: (self: *MTLArgument) -> MTLDataType {
	#insert #run METHOD_BODY(__selectors.textureDataType, #type (self: *MTLArgument) -> MTLDataType);
}
textureType :: (self: *MTLArgument) -> MTLTextureType {
	#insert #run METHOD_BODY(__selectors.textureType, #type (self: *MTLArgument) -> MTLTextureType);
}
threadgroupMemoryAlignment :: (self: *MTLArgument) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.threadgroupMemoryAlignment, #type (self: *MTLArgument) -> NSUInteger);
}
threadgroupMemoryDataSize :: (self: *MTLArgument) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.threadgroupMemoryDataSize, #type (self: *MTLArgument) -> NSUInteger);
}
type :: (self: *MTLArgument) -> MTLArgumentType {
	#insert #run METHOD_BODY(__selectors.type, #type (self: *MTLArgument) -> MTLArgumentType);
}


MTLBinding :: struct {}
access :: (self: *MTLBinding) -> MTLBindingAccess {
	#insert #run METHOD_BODY(__selectors.access, #type (self: *MTLBinding) -> MTLBindingAccess);
}
argument :: (self: *MTLBinding) -> bool {
	#insert #run METHOD_BODY(__selectors.isArgument, #type (self: *MTLBinding) -> bool);
}
index :: (self: *MTLBinding) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.index, #type (self: *MTLBinding) -> NSUInteger);
}
isArgument :: (self: *MTLBinding) -> bool {
	#insert #run METHOD_BODY(__selectors.isArgument, #type (self: *MTLBinding) -> bool);
}
isUsed :: (self: *MTLBinding) -> bool {
	#insert #run METHOD_BODY(__selectors.isUsed, #type (self: *MTLBinding) -> bool);
}
name :: (self: *MTLBinding) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTLBinding) -> *NSString);
}
type :: (self: *MTLBinding) -> MTLBindingType {
	#insert #run METHOD_BODY(__selectors.type, #type (self: *MTLBinding) -> MTLBindingType);
}
used :: (self: *MTLBinding) -> bool {
	#insert #run METHOD_BODY(__selectors.isUsed, #type (self: *MTLBinding) -> bool);
}


MTLBufferBinding :: struct { using #as _: MTLBinding; }
bufferAlignment :: (self: *MTLBufferBinding) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.bufferAlignment, #type (self: *MTLBufferBinding) -> NSUInteger);
}
bufferDataSize :: (self: *MTLBufferBinding) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.bufferDataSize, #type (self: *MTLBufferBinding) -> NSUInteger);
}
bufferDataType :: (self: *MTLBufferBinding) -> MTLDataType {
	#insert #run METHOD_BODY(__selectors.bufferDataType, #type (self: *MTLBufferBinding) -> MTLDataType);
}
bufferPointerType :: (self: *MTLBufferBinding) -> *MTLPointerType {
	#insert #run METHOD_BODY(__selectors.bufferPointerType, #type (self: *MTLBufferBinding) -> *MTLPointerType);
}
bufferStructType :: (self: *MTLBufferBinding) -> *MTLStructType {
	#insert #run METHOD_BODY(__selectors.bufferStructType, #type (self: *MTLBufferBinding) -> *MTLStructType);
}


MTLThreadgroupBinding :: struct { using #as _: MTLBinding; }
threadgroupMemoryAlignment :: (self: *MTLThreadgroupBinding) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.threadgroupMemoryAlignment, #type (self: *MTLThreadgroupBinding) -> NSUInteger);
}
threadgroupMemoryDataSize :: (self: *MTLThreadgroupBinding) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.threadgroupMemoryDataSize, #type (self: *MTLThreadgroupBinding) -> NSUInteger);
}


MTLTextureBinding :: struct { using #as _: MTLBinding; }
arrayLength :: (self: *MTLTextureBinding) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.arrayLength, #type (self: *MTLTextureBinding) -> NSUInteger);
}
depthTexture :: (self: *MTLTextureBinding) -> bool {
	#insert #run METHOD_BODY(__selectors.isDepthTexture, #type (self: *MTLTextureBinding) -> bool);
}
isDepthTexture :: (self: *MTLTextureBinding) -> bool {
	#insert #run METHOD_BODY(__selectors.isDepthTexture, #type (self: *MTLTextureBinding) -> bool);
}
textureDataType :: (self: *MTLTextureBinding) -> MTLDataType {
	#insert #run METHOD_BODY(__selectors.textureDataType, #type (self: *MTLTextureBinding) -> MTLDataType);
}
textureType :: (self: *MTLTextureBinding) -> MTLTextureType {
	#insert #run METHOD_BODY(__selectors.textureType, #type (self: *MTLTextureBinding) -> MTLTextureType);
}


MTLObjectPayloadBinding :: struct { using #as _: MTLBinding; }
objectPayloadAlignment :: (self: *MTLObjectPayloadBinding) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.objectPayloadAlignment, #type (self: *MTLObjectPayloadBinding) -> NSUInteger);
}
objectPayloadDataSize :: (self: *MTLObjectPayloadBinding) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.objectPayloadDataSize, #type (self: *MTLObjectPayloadBinding) -> NSUInteger);
}


MTLTensorBinding :: struct { using #as _: MTLBinding; }
dimensions :: (self: *MTLTensorBinding) -> *MTLTensorExtents {
	#insert #run METHOD_BODY(__selectors.dimensions, #type (self: *MTLTensorBinding) -> *MTLTensorExtents);
}
indexType :: (self: *MTLTensorBinding) -> MTLDataType {
	#insert #run METHOD_BODY(__selectors.indexType, #type (self: *MTLTensorBinding) -> MTLDataType);
}
tensorDataType :: (self: *MTLTensorBinding) -> MTLTensorDataType {
	#insert #run METHOD_BODY(__selectors.tensorDataType, #type (self: *MTLTensorBinding) -> MTLTensorDataType);
}


MTLLogContainer :: struct { using #as _: NSFastEnumeration; }


MTLFunctionLogDebugLocation :: struct {}
URL :: (self: *MTLFunctionLogDebugLocation) -> *NSURL {
	#insert #run METHOD_BODY(__selectors.URL, #type (self: *MTLFunctionLogDebugLocation) -> *NSURL);
}
column :: (self: *MTLFunctionLogDebugLocation) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.column, #type (self: *MTLFunctionLogDebugLocation) -> NSUInteger);
}
functionName :: (self: *MTLFunctionLogDebugLocation) -> *NSString {
	#insert #run METHOD_BODY(__selectors.functionName, #type (self: *MTLFunctionLogDebugLocation) -> *NSString);
}
line :: (self: *MTLFunctionLogDebugLocation) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.line, #type (self: *MTLFunctionLogDebugLocation) -> NSUInteger);
}


MTLFunctionLog :: struct {}
debugLocation :: (self: *MTLFunctionLog) -> *MTLFunctionLogDebugLocation {
	#insert #run METHOD_BODY(__selectors.debugLocation, #type (self: *MTLFunctionLog) -> *MTLFunctionLogDebugLocation);
}
encoderLabel :: (self: *MTLFunctionLog) -> *NSString {
	#insert #run METHOD_BODY(__selectors.encoderLabel, #type (self: *MTLFunctionLog) -> *NSString);
}
function :: (self: *MTLFunctionLog) -> *MTLFunction {
	#insert #run METHOD_BODY(__selectors.function, #type (self: *MTLFunctionLog) -> *MTLFunction);
}
type :: (self: *MTLFunctionLog) -> MTLFunctionLogType {
	#insert #run METHOD_BODY(__selectors.type, #type (self: *MTLFunctionLog) -> MTLFunctionLogType);
}


MTL4RenderPipelineColorAttachmentDescriptor :: struct {}
alphaBlendOperation :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation {
	#insert #run METHOD_BODY(__selectors.alphaBlendOperation, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation);
}
blendingState :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTL4BlendState {
	#insert #run METHOD_BODY(__selectors.blendingState, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTL4BlendState);
}
destinationAlphaBlendFactor :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
	#insert #run METHOD_BODY(__selectors.destinationAlphaBlendFactor, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor);
}
destinationRGBBlendFactor :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
	#insert #run METHOD_BODY(__selectors.destinationRGBBlendFactor, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor);
}
pixelFormat :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLPixelFormat {
	#insert #run METHOD_BODY(__selectors.pixelFormat, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLPixelFormat);
}
reset :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> ());
}
rgbBlendOperation :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation {
	#insert #run METHOD_BODY(__selectors.rgbBlendOperation, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation);
}
setAlphaBlendOperation :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, alphaBlendOperation: MTLBlendOperation) -> () {
	#insert #run METHOD_BODY(__selectors.setAlphaBlendOperation_, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor, alphaBlendOperation: MTLBlendOperation) -> ());
}
setBlendingState :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, blendingState: MTL4BlendState) -> () {
	#insert #run METHOD_BODY(__selectors.setBlendingState_, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor, blendingState: MTL4BlendState) -> ());
}
setDestinationAlphaBlendFactor :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, destinationAlphaBlendFactor: MTLBlendFactor) -> () {
	#insert #run METHOD_BODY(__selectors.setDestinationAlphaBlendFactor_, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor, destinationAlphaBlendFactor: MTLBlendFactor) -> ());
}
setDestinationRGBBlendFactor :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, destinationRGBBlendFactor: MTLBlendFactor) -> () {
	#insert #run METHOD_BODY(__selectors.setDestinationRGBBlendFactor_, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor, destinationRGBBlendFactor: MTLBlendFactor) -> ());
}
setPixelFormat :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, pixelFormat: MTLPixelFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setPixelFormat_, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor, pixelFormat: MTLPixelFormat) -> ());
}
setRgbBlendOperation :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, rgbBlendOperation: MTLBlendOperation) -> () {
	#insert #run METHOD_BODY(__selectors.setRgbBlendOperation_, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor, rgbBlendOperation: MTLBlendOperation) -> ());
}
setSourceAlphaBlendFactor :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, sourceAlphaBlendFactor: MTLBlendFactor) -> () {
	#insert #run METHOD_BODY(__selectors.setSourceAlphaBlendFactor_, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor, sourceAlphaBlendFactor: MTLBlendFactor) -> ());
}
setSourceRGBBlendFactor :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, sourceRGBBlendFactor: MTLBlendFactor) -> () {
	#insert #run METHOD_BODY(__selectors.setSourceRGBBlendFactor_, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor, sourceRGBBlendFactor: MTLBlendFactor) -> ());
}
setWriteMask :: (self: *MTL4RenderPipelineColorAttachmentDescriptor, writeMask: MTLColorWriteMask) -> () {
	#insert #run METHOD_BODY(__selectors.setWriteMask_, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor, writeMask: MTLColorWriteMask) -> ());
}
sourceAlphaBlendFactor :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
	#insert #run METHOD_BODY(__selectors.sourceAlphaBlendFactor, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor);
}
sourceRGBBlendFactor :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
	#insert #run METHOD_BODY(__selectors.sourceRGBBlendFactor, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor);
}
writeMask :: (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLColorWriteMask {
	#insert #run METHOD_BODY(__selectors.writeMask, #type (self: *MTL4RenderPipelineColorAttachmentDescriptor) -> MTLColorWriteMask);
}


MTL4RenderPipelineColorAttachmentDescriptorArray :: struct {}
object :: (self: *MTL4RenderPipelineColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTL4RenderPipelineColorAttachmentDescriptor {
	#insert #run METHOD_BODY(__selectors.objectAtIndexedSubscript_, #type (self: *MTL4RenderPipelineColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTL4RenderPipelineColorAttachmentDescriptor);
}
reset :: (self: *MTL4RenderPipelineColorAttachmentDescriptorArray) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTL4RenderPipelineColorAttachmentDescriptorArray) -> ());
}
setObject :: (self: *MTL4RenderPipelineColorAttachmentDescriptorArray, attachment: *MTL4RenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObject_atIndexedSubscript_, #type (self: *MTL4RenderPipelineColorAttachmentDescriptorArray, attachment: *MTL4RenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> ());
}


MTL4RenderPipelineBinaryFunctionsDescriptor :: struct {}
fragmentAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.fragmentAdditionalBinaryFunctions, #type (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray);
}
meshAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.meshAdditionalBinaryFunctions, #type (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray);
}
objectAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.objectAdditionalBinaryFunctions, #type (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray);
}
reset :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> ());
}
setFragmentAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, fragmentAdditionalBinaryFunctions: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentAdditionalBinaryFunctions_, #type (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, fragmentAdditionalBinaryFunctions: *NSArray) -> ());
}
setMeshAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, meshAdditionalBinaryFunctions: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshAdditionalBinaryFunctions_, #type (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, meshAdditionalBinaryFunctions: *NSArray) -> ());
}
setObjectAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, objectAdditionalBinaryFunctions: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectAdditionalBinaryFunctions_, #type (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, objectAdditionalBinaryFunctions: *NSArray) -> ());
}
setTileAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, tileAdditionalBinaryFunctions: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setTileAdditionalBinaryFunctions_, #type (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, tileAdditionalBinaryFunctions: *NSArray) -> ());
}
setVertexAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, vertexAdditionalBinaryFunctions: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexAdditionalBinaryFunctions_, #type (self: *MTL4RenderPipelineBinaryFunctionsDescriptor, vertexAdditionalBinaryFunctions: *NSArray) -> ());
}
tileAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.tileAdditionalBinaryFunctions, #type (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray);
}
vertexAdditionalBinaryFunctions :: (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.vertexAdditionalBinaryFunctions, #type (self: *MTL4RenderPipelineBinaryFunctionsDescriptor) -> *NSArray);
}


MTL4RenderPipelineDescriptor :: struct { using #as _: MTL4PipelineDescriptor; }
alphaToCoverageState :: (self: *MTL4RenderPipelineDescriptor) -> MTL4AlphaToCoverageState {
	#insert #run METHOD_BODY(__selectors.alphaToCoverageState, #type (self: *MTL4RenderPipelineDescriptor) -> MTL4AlphaToCoverageState);
}
alphaToOneState :: (self: *MTL4RenderPipelineDescriptor) -> MTL4AlphaToOneState {
	#insert #run METHOD_BODY(__selectors.alphaToOneState, #type (self: *MTL4RenderPipelineDescriptor) -> MTL4AlphaToOneState);
}
colorAttachmentMappingState :: (self: *MTL4RenderPipelineDescriptor) -> MTL4LogicalToPhysicalColorAttachmentMappingState {
	#insert #run METHOD_BODY(__selectors.colorAttachmentMappingState, #type (self: *MTL4RenderPipelineDescriptor) -> MTL4LogicalToPhysicalColorAttachmentMappingState);
}
colorAttachments :: (self: *MTL4RenderPipelineDescriptor) -> *MTL4RenderPipelineColorAttachmentDescriptorArray {
	#insert #run METHOD_BODY(__selectors.colorAttachments, #type (self: *MTL4RenderPipelineDescriptor) -> *MTL4RenderPipelineColorAttachmentDescriptorArray);
}
fragmentFunctionDescriptor :: (self: *MTL4RenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
	#insert #run METHOD_BODY(__selectors.fragmentFunctionDescriptor, #type (self: *MTL4RenderPipelineDescriptor) -> *MTL4FunctionDescriptor);
}
fragmentStaticLinkingDescriptor :: (self: *MTL4RenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
	#insert #run METHOD_BODY(__selectors.fragmentStaticLinkingDescriptor, #type (self: *MTL4RenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor);
}
inputPrimitiveTopology :: (self: *MTL4RenderPipelineDescriptor) -> MTLPrimitiveTopologyClass {
	#insert #run METHOD_BODY(__selectors.inputPrimitiveTopology, #type (self: *MTL4RenderPipelineDescriptor) -> MTLPrimitiveTopologyClass);
}
isRasterizationEnabled :: (self: *MTL4RenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isRasterizationEnabled, #type (self: *MTL4RenderPipelineDescriptor) -> bool);
}
maxVertexAmplificationCount :: (self: *MTL4RenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxVertexAmplificationCount, #type (self: *MTL4RenderPipelineDescriptor) -> NSUInteger);
}
rasterSampleCount :: (self: *MTL4RenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.rasterSampleCount, #type (self: *MTL4RenderPipelineDescriptor) -> NSUInteger);
}
rasterizationEnabled :: (self: *MTL4RenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isRasterizationEnabled, #type (self: *MTL4RenderPipelineDescriptor) -> bool);
}
reset :: (self: *MTL4RenderPipelineDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTL4RenderPipelineDescriptor) -> ());
}
setAlphaToCoverageState :: (self: *MTL4RenderPipelineDescriptor, alphaToCoverageState: MTL4AlphaToCoverageState) -> () {
	#insert #run METHOD_BODY(__selectors.setAlphaToCoverageState_, #type (self: *MTL4RenderPipelineDescriptor, alphaToCoverageState: MTL4AlphaToCoverageState) -> ());
}
setAlphaToOneState :: (self: *MTL4RenderPipelineDescriptor, alphaToOneState: MTL4AlphaToOneState) -> () {
	#insert #run METHOD_BODY(__selectors.setAlphaToOneState_, #type (self: *MTL4RenderPipelineDescriptor, alphaToOneState: MTL4AlphaToOneState) -> ());
}
setColorAttachmentMappingState :: (self: *MTL4RenderPipelineDescriptor, colorAttachmentMappingState: MTL4LogicalToPhysicalColorAttachmentMappingState) -> () {
	#insert #run METHOD_BODY(__selectors.setColorAttachmentMappingState_, #type (self: *MTL4RenderPipelineDescriptor, colorAttachmentMappingState: MTL4LogicalToPhysicalColorAttachmentMappingState) -> ());
}
setFragmentFunctionDescriptor :: (self: *MTL4RenderPipelineDescriptor, fragmentFunctionDescriptor: *MTL4FunctionDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentFunctionDescriptor_, #type (self: *MTL4RenderPipelineDescriptor, fragmentFunctionDescriptor: *MTL4FunctionDescriptor) -> ());
}
setFragmentStaticLinkingDescriptor :: (self: *MTL4RenderPipelineDescriptor, fragmentStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentStaticLinkingDescriptor_, #type (self: *MTL4RenderPipelineDescriptor, fragmentStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> ());
}
setInputPrimitiveTopology :: (self: *MTL4RenderPipelineDescriptor, inputPrimitiveTopology: MTLPrimitiveTopologyClass) -> () {
	#insert #run METHOD_BODY(__selectors.setInputPrimitiveTopology_, #type (self: *MTL4RenderPipelineDescriptor, inputPrimitiveTopology: MTLPrimitiveTopologyClass) -> ());
}
setMaxVertexAmplificationCount :: (self: *MTL4RenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxVertexAmplificationCount_, #type (self: *MTL4RenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> ());
}
setRasterSampleCount :: (self: *MTL4RenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRasterSampleCount_, #type (self: *MTL4RenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> ());
}
setRasterizationEnabled :: (self: *MTL4RenderPipelineDescriptor, rasterizationEnabled: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setRasterizationEnabled_, #type (self: *MTL4RenderPipelineDescriptor, rasterizationEnabled: bool) -> ());
}
setSupportFragmentBinaryLinking :: (self: *MTL4RenderPipelineDescriptor, supportFragmentBinaryLinking: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportFragmentBinaryLinking_, #type (self: *MTL4RenderPipelineDescriptor, supportFragmentBinaryLinking: bool) -> ());
}
setSupportIndirectCommandBuffers :: (self: *MTL4RenderPipelineDescriptor, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportIndirectCommandBuffers_, #type (self: *MTL4RenderPipelineDescriptor, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> ());
}
setSupportVertexBinaryLinking :: (self: *MTL4RenderPipelineDescriptor, supportVertexBinaryLinking: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportVertexBinaryLinking_, #type (self: *MTL4RenderPipelineDescriptor, supportVertexBinaryLinking: bool) -> ());
}
setVertexDescriptor :: (self: *MTL4RenderPipelineDescriptor, vertexDescriptor: *MTLVertexDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexDescriptor_, #type (self: *MTL4RenderPipelineDescriptor, vertexDescriptor: *MTLVertexDescriptor) -> ());
}
setVertexFunctionDescriptor :: (self: *MTL4RenderPipelineDescriptor, vertexFunctionDescriptor: *MTL4FunctionDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexFunctionDescriptor_, #type (self: *MTL4RenderPipelineDescriptor, vertexFunctionDescriptor: *MTL4FunctionDescriptor) -> ());
}
setVertexStaticLinkingDescriptor :: (self: *MTL4RenderPipelineDescriptor, vertexStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexStaticLinkingDescriptor_, #type (self: *MTL4RenderPipelineDescriptor, vertexStaticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> ());
}
supportFragmentBinaryLinking :: (self: *MTL4RenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportFragmentBinaryLinking, #type (self: *MTL4RenderPipelineDescriptor) -> bool);
}
supportIndirectCommandBuffers :: (self: *MTL4RenderPipelineDescriptor) -> MTL4IndirectCommandBufferSupportState {
	#insert #run METHOD_BODY(__selectors.supportIndirectCommandBuffers, #type (self: *MTL4RenderPipelineDescriptor) -> MTL4IndirectCommandBufferSupportState);
}
supportVertexBinaryLinking :: (self: *MTL4RenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportVertexBinaryLinking, #type (self: *MTL4RenderPipelineDescriptor) -> bool);
}
vertexDescriptor :: (self: *MTL4RenderPipelineDescriptor) -> *MTLVertexDescriptor {
	#insert #run METHOD_BODY(__selectors.vertexDescriptor, #type (self: *MTL4RenderPipelineDescriptor) -> *MTLVertexDescriptor);
}
vertexFunctionDescriptor :: (self: *MTL4RenderPipelineDescriptor) -> *MTL4FunctionDescriptor {
	#insert #run METHOD_BODY(__selectors.vertexFunctionDescriptor, #type (self: *MTL4RenderPipelineDescriptor) -> *MTL4FunctionDescriptor);
}
vertexStaticLinkingDescriptor :: (self: *MTL4RenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
	#insert #run METHOD_BODY(__selectors.vertexStaticLinkingDescriptor, #type (self: *MTL4RenderPipelineDescriptor) -> *MTL4StaticLinkingDescriptor);
}


MTLBuffer :: struct { using #as _: MTLResource; }
addDebugMarker :: (self: *MTLBuffer, marker: *NSString, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.addDebugMarker_range_, #type (self: *MTLBuffer, marker: *NSString, range: NSRange) -> ());
}
contents :: (self: *MTLBuffer) -> *void {
	#insert #run METHOD_BODY(__selectors.contents, #type (self: *MTLBuffer) -> *void);
}
didModifyRange :: (self: *MTLBuffer, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.didModifyRange_, #type (self: *MTLBuffer, range: NSRange) -> ());
}
gpuAddress :: (self: *MTLBuffer) -> MTLGPUAddress {
	#insert #run METHOD_BODY(__selectors.gpuAddress, #type (self: *MTLBuffer) -> MTLGPUAddress);
}
length :: (self: *MTLBuffer) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.length, #type (self: *MTLBuffer) -> NSUInteger);
}
newRemoteBufferViewForDevice :: (self: *MTLBuffer, device: *MTLDevice) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.newRemoteBufferViewForDevice_, #type (self: *MTLBuffer, device: *MTLDevice) -> *MTLBuffer);
}
newTensor :: (self: *MTLBuffer, descriptor: *MTLTensorDescriptor, offset: NSUInteger, error: **NSError) -> *MTLTensor {
	#insert #run METHOD_BODY(__selectors.newTensorWithDescriptor_offset_error_, #type (self: *MTLBuffer, descriptor: *MTLTensorDescriptor, offset: NSUInteger, error: **NSError) -> *MTLTensor);
}
newTexture :: (self: *MTLBuffer, descriptor: *MTLTextureDescriptor, offset: NSUInteger, bytesPerRow: NSUInteger) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.newTextureWithDescriptor_offset_bytesPerRow_, #type (self: *MTLBuffer, descriptor: *MTLTextureDescriptor, offset: NSUInteger, bytesPerRow: NSUInteger) -> *MTLTexture);
}
remoteStorageBuffer :: (self: *MTLBuffer) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.remoteStorageBuffer, #type (self: *MTLBuffer) -> *MTLBuffer);
}
removeAllDebugMarkers :: (self: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.removeAllDebugMarkers, #type (self: *MTLBuffer) -> ());
}
sparseBufferTier :: (self: *MTLBuffer) -> MTLBufferSparseTier {
	#insert #run METHOD_BODY(__selectors.sparseBufferTier, #type (self: *MTLBuffer) -> MTLBufferSparseTier);
}


MTLRenderPassAttachmentDescriptor :: struct {}
depthPlane :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.depthPlane, #type (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger);
}
level :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.level, #type (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger);
}
loadAction :: (self: *MTLRenderPassAttachmentDescriptor) -> MTLLoadAction {
	#insert #run METHOD_BODY(__selectors.loadAction, #type (self: *MTLRenderPassAttachmentDescriptor) -> MTLLoadAction);
}
resolveDepthPlane :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.resolveDepthPlane, #type (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger);
}
resolveLevel :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.resolveLevel, #type (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger);
}
resolveSlice :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.resolveSlice, #type (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger);
}
resolveTexture :: (self: *MTLRenderPassAttachmentDescriptor) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.resolveTexture, #type (self: *MTLRenderPassAttachmentDescriptor) -> *MTLTexture);
}
setDepthPlane :: (self: *MTLRenderPassAttachmentDescriptor, depthPlane: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthPlane_, #type (self: *MTLRenderPassAttachmentDescriptor, depthPlane: NSUInteger) -> ());
}
setLevel :: (self: *MTLRenderPassAttachmentDescriptor, level: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setLevel_, #type (self: *MTLRenderPassAttachmentDescriptor, level: NSUInteger) -> ());
}
setLoadAction :: (self: *MTLRenderPassAttachmentDescriptor, loadAction: MTLLoadAction) -> () {
	#insert #run METHOD_BODY(__selectors.setLoadAction_, #type (self: *MTLRenderPassAttachmentDescriptor, loadAction: MTLLoadAction) -> ());
}
setResolveDepthPlane :: (self: *MTLRenderPassAttachmentDescriptor, resolveDepthPlane: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setResolveDepthPlane_, #type (self: *MTLRenderPassAttachmentDescriptor, resolveDepthPlane: NSUInteger) -> ());
}
setResolveLevel :: (self: *MTLRenderPassAttachmentDescriptor, resolveLevel: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setResolveLevel_, #type (self: *MTLRenderPassAttachmentDescriptor, resolveLevel: NSUInteger) -> ());
}
setResolveSlice :: (self: *MTLRenderPassAttachmentDescriptor, resolveSlice: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setResolveSlice_, #type (self: *MTLRenderPassAttachmentDescriptor, resolveSlice: NSUInteger) -> ());
}
setResolveTexture :: (self: *MTLRenderPassAttachmentDescriptor, resolveTexture: *MTLTexture) -> () {
	#insert #run METHOD_BODY(__selectors.setResolveTexture_, #type (self: *MTLRenderPassAttachmentDescriptor, resolveTexture: *MTLTexture) -> ());
}
setSlice :: (self: *MTLRenderPassAttachmentDescriptor, slice: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSlice_, #type (self: *MTLRenderPassAttachmentDescriptor, slice: NSUInteger) -> ());
}
setStoreAction :: (self: *MTLRenderPassAttachmentDescriptor, storeAction: MTLStoreAction) -> () {
	#insert #run METHOD_BODY(__selectors.setStoreAction_, #type (self: *MTLRenderPassAttachmentDescriptor, storeAction: MTLStoreAction) -> ());
}
setStoreActionOptions :: (self: *MTLRenderPassAttachmentDescriptor, storeActionOptions: MTLStoreActionOptions) -> () {
	#insert #run METHOD_BODY(__selectors.setStoreActionOptions_, #type (self: *MTLRenderPassAttachmentDescriptor, storeActionOptions: MTLStoreActionOptions) -> ());
}
setTexture :: (self: *MTLRenderPassAttachmentDescriptor, texture: *MTLTexture) -> () {
	#insert #run METHOD_BODY(__selectors.setTexture_, #type (self: *MTLRenderPassAttachmentDescriptor, texture: *MTLTexture) -> ());
}
slice :: (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.slice, #type (self: *MTLRenderPassAttachmentDescriptor) -> NSUInteger);
}
storeAction :: (self: *MTLRenderPassAttachmentDescriptor) -> MTLStoreAction {
	#insert #run METHOD_BODY(__selectors.storeAction, #type (self: *MTLRenderPassAttachmentDescriptor) -> MTLStoreAction);
}
storeActionOptions :: (self: *MTLRenderPassAttachmentDescriptor) -> MTLStoreActionOptions {
	#insert #run METHOD_BODY(__selectors.storeActionOptions, #type (self: *MTLRenderPassAttachmentDescriptor) -> MTLStoreActionOptions);
}
texture :: (self: *MTLRenderPassAttachmentDescriptor) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.texture, #type (self: *MTLRenderPassAttachmentDescriptor) -> *MTLTexture);
}


MTLRenderPassColorAttachmentDescriptor :: struct { using #as _: MTLRenderPassAttachmentDescriptor; }
clearColor :: (self: *MTLRenderPassColorAttachmentDescriptor) -> MTLClearColor {
	#insert #run METHOD_BODY(__selectors.clearColor, #type (self: *MTLRenderPassColorAttachmentDescriptor) -> MTLClearColor);
}
setClearColor :: (self: *MTLRenderPassColorAttachmentDescriptor, clearColor: MTLClearColor) -> () {
	#insert #run METHOD_BODY(__selectors.setClearColor_, #type (self: *MTLRenderPassColorAttachmentDescriptor, clearColor: MTLClearColor) -> ());
}


MTLRenderPassDepthAttachmentDescriptor :: struct { using #as _: MTLRenderPassAttachmentDescriptor; }
clearDepth :: (self: *MTLRenderPassDepthAttachmentDescriptor) -> float64 {
	#insert #run METHOD_BODY(__selectors.clearDepth, #type (self: *MTLRenderPassDepthAttachmentDescriptor) -> float64);
}
depthResolveFilter :: (self: *MTLRenderPassDepthAttachmentDescriptor) -> MTLMultisampleDepthResolveFilter {
	#insert #run METHOD_BODY(__selectors.depthResolveFilter, #type (self: *MTLRenderPassDepthAttachmentDescriptor) -> MTLMultisampleDepthResolveFilter);
}
setClearDepth :: (self: *MTLRenderPassDepthAttachmentDescriptor, clearDepth: float64) -> () {
	#insert #run METHOD_BODY(__selectors.setClearDepth_, #type (self: *MTLRenderPassDepthAttachmentDescriptor, clearDepth: float64) -> ());
}
setDepthResolveFilter :: (self: *MTLRenderPassDepthAttachmentDescriptor, depthResolveFilter: MTLMultisampleDepthResolveFilter) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthResolveFilter_, #type (self: *MTLRenderPassDepthAttachmentDescriptor, depthResolveFilter: MTLMultisampleDepthResolveFilter) -> ());
}


MTLRenderPassStencilAttachmentDescriptor :: struct { using #as _: MTLRenderPassAttachmentDescriptor; }
clearStencil :: (self: *MTLRenderPassStencilAttachmentDescriptor) -> u32 {
	#insert #run METHOD_BODY(__selectors.clearStencil, #type (self: *MTLRenderPassStencilAttachmentDescriptor) -> u32);
}
setClearStencil :: (self: *MTLRenderPassStencilAttachmentDescriptor, clearStencil: u32) -> () {
	#insert #run METHOD_BODY(__selectors.setClearStencil_, #type (self: *MTLRenderPassStencilAttachmentDescriptor, clearStencil: u32) -> ());
}
setStencilResolveFilter :: (self: *MTLRenderPassStencilAttachmentDescriptor, stencilResolveFilter: MTLMultisampleStencilResolveFilter) -> () {
	#insert #run METHOD_BODY(__selectors.setStencilResolveFilter_, #type (self: *MTLRenderPassStencilAttachmentDescriptor, stencilResolveFilter: MTLMultisampleStencilResolveFilter) -> ());
}
stencilResolveFilter :: (self: *MTLRenderPassStencilAttachmentDescriptor) -> MTLMultisampleStencilResolveFilter {
	#insert #run METHOD_BODY(__selectors.stencilResolveFilter, #type (self: *MTLRenderPassStencilAttachmentDescriptor) -> MTLMultisampleStencilResolveFilter);
}


MTLRenderPassColorAttachmentDescriptorArray :: struct {}
object :: (self: *MTLRenderPassColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLRenderPassColorAttachmentDescriptor {
	#insert #run METHOD_BODY(__selectors.objectAtIndexedSubscript_, #type (self: *MTLRenderPassColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLRenderPassColorAttachmentDescriptor);
}
setObject :: (self: *MTLRenderPassColorAttachmentDescriptorArray, attachment: *MTLRenderPassColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObject_atIndexedSubscript_, #type (self: *MTLRenderPassColorAttachmentDescriptorArray, attachment: *MTLRenderPassColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> ());
}


MTLRenderPassSampleBufferAttachmentDescriptor :: struct {}
endOfFragmentSampleIndex :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.endOfFragmentSampleIndex, #type (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger);
}
endOfVertexSampleIndex :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.endOfVertexSampleIndex, #type (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger);
}
sampleBuffer :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
	#insert #run METHOD_BODY(__selectors.sampleBuffer, #type (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer);
}
setEndOfFragmentSampleIndex :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor, endOfFragmentSampleIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setEndOfFragmentSampleIndex_, #type (self: *MTLRenderPassSampleBufferAttachmentDescriptor, endOfFragmentSampleIndex: NSUInteger) -> ());
}
setEndOfVertexSampleIndex :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor, endOfVertexSampleIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setEndOfVertexSampleIndex_, #type (self: *MTLRenderPassSampleBufferAttachmentDescriptor, endOfVertexSampleIndex: NSUInteger) -> ());
}
setSampleBuffer :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setSampleBuffer_, #type (self: *MTLRenderPassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> ());
}
setStartOfFragmentSampleIndex :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor, startOfFragmentSampleIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setStartOfFragmentSampleIndex_, #type (self: *MTLRenderPassSampleBufferAttachmentDescriptor, startOfFragmentSampleIndex: NSUInteger) -> ());
}
setStartOfVertexSampleIndex :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor, startOfVertexSampleIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setStartOfVertexSampleIndex_, #type (self: *MTLRenderPassSampleBufferAttachmentDescriptor, startOfVertexSampleIndex: NSUInteger) -> ());
}
startOfFragmentSampleIndex :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.startOfFragmentSampleIndex, #type (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger);
}
startOfVertexSampleIndex :: (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.startOfVertexSampleIndex, #type (self: *MTLRenderPassSampleBufferAttachmentDescriptor) -> NSUInteger);
}


MTLRenderPassSampleBufferAttachmentDescriptorArray :: struct {}
object :: (self: *MTLRenderPassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLRenderPassSampleBufferAttachmentDescriptor {
	#insert #run METHOD_BODY(__selectors.objectAtIndexedSubscript_, #type (self: *MTLRenderPassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLRenderPassSampleBufferAttachmentDescriptor);
}
setObject :: (self: *MTLRenderPassSampleBufferAttachmentDescriptorArray, attachment: *MTLRenderPassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObject_atIndexedSubscript_, #type (self: *MTLRenderPassSampleBufferAttachmentDescriptorArray, attachment: *MTLRenderPassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> ());
}


MTLRenderPassDescriptor :: struct {}
colorAttachments :: (self: *MTLRenderPassDescriptor) -> *MTLRenderPassColorAttachmentDescriptorArray {
	#insert #run METHOD_BODY(__selectors.colorAttachments, #type (self: *MTLRenderPassDescriptor) -> *MTLRenderPassColorAttachmentDescriptorArray);
}
defaultRasterSampleCount :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.defaultRasterSampleCount, #type (self: *MTLRenderPassDescriptor) -> NSUInteger);
}
depthAttachment :: (self: *MTLRenderPassDescriptor) -> *MTLRenderPassDepthAttachmentDescriptor {
	#insert #run METHOD_BODY(__selectors.depthAttachment, #type (self: *MTLRenderPassDescriptor) -> *MTLRenderPassDepthAttachmentDescriptor);
}
getSamplePositions :: (self: *MTLRenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.getSamplePositions_count_, #type (self: *MTLRenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> NSUInteger);
}
imageblockSampleLength :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.imageblockSampleLength, #type (self: *MTLRenderPassDescriptor) -> NSUInteger);
}
rasterizationRateMap :: (self: *MTLRenderPassDescriptor) -> *MTLRasterizationRateMap {
	#insert #run METHOD_BODY(__selectors.rasterizationRateMap, #type (self: *MTLRenderPassDescriptor) -> *MTLRasterizationRateMap);
}
renderPassDescriptor :: (self: *MTLRenderPassDescriptor) -> *MTLRenderPassDescriptor {
	#insert #run METHOD_BODY(__selectors.renderPassDescriptor, #type (self: *MTLRenderPassDescriptor) -> *MTLRenderPassDescriptor);
}
renderTargetArrayLength :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.renderTargetArrayLength, #type (self: *MTLRenderPassDescriptor) -> NSUInteger);
}
renderTargetHeight :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.renderTargetHeight, #type (self: *MTLRenderPassDescriptor) -> NSUInteger);
}
renderTargetWidth :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.renderTargetWidth, #type (self: *MTLRenderPassDescriptor) -> NSUInteger);
}
sampleBufferAttachments :: (self: *MTLRenderPassDescriptor) -> *MTLRenderPassSampleBufferAttachmentDescriptorArray {
	#insert #run METHOD_BODY(__selectors.sampleBufferAttachments, #type (self: *MTLRenderPassDescriptor) -> *MTLRenderPassSampleBufferAttachmentDescriptorArray);
}
setDefaultRasterSampleCount :: (self: *MTLRenderPassDescriptor, defaultRasterSampleCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setDefaultRasterSampleCount_, #type (self: *MTLRenderPassDescriptor, defaultRasterSampleCount: NSUInteger) -> ());
}
setDepthAttachment :: (self: *MTLRenderPassDescriptor, depthAttachment: *MTLRenderPassDepthAttachmentDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthAttachment_, #type (self: *MTLRenderPassDescriptor, depthAttachment: *MTLRenderPassDepthAttachmentDescriptor) -> ());
}
setImageblockSampleLength :: (self: *MTLRenderPassDescriptor, imageblockSampleLength: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setImageblockSampleLength_, #type (self: *MTLRenderPassDescriptor, imageblockSampleLength: NSUInteger) -> ());
}
setRasterizationRateMap :: (self: *MTLRenderPassDescriptor, rasterizationRateMap: *MTLRasterizationRateMap) -> () {
	#insert #run METHOD_BODY(__selectors.setRasterizationRateMap_, #type (self: *MTLRenderPassDescriptor, rasterizationRateMap: *MTLRasterizationRateMap) -> ());
}
setRenderTargetArrayLength :: (self: *MTLRenderPassDescriptor, renderTargetArrayLength: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRenderTargetArrayLength_, #type (self: *MTLRenderPassDescriptor, renderTargetArrayLength: NSUInteger) -> ());
}
setRenderTargetHeight :: (self: *MTLRenderPassDescriptor, renderTargetHeight: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRenderTargetHeight_, #type (self: *MTLRenderPassDescriptor, renderTargetHeight: NSUInteger) -> ());
}
setRenderTargetWidth :: (self: *MTLRenderPassDescriptor, renderTargetWidth: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRenderTargetWidth_, #type (self: *MTLRenderPassDescriptor, renderTargetWidth: NSUInteger) -> ());
}
setSamplePositions :: (self: *MTLRenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSamplePositions_count_, #type (self: *MTLRenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> ());
}
setStencilAttachment :: (self: *MTLRenderPassDescriptor, stencilAttachment: *MTLRenderPassStencilAttachmentDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setStencilAttachment_, #type (self: *MTLRenderPassDescriptor, stencilAttachment: *MTLRenderPassStencilAttachmentDescriptor) -> ());
}
setSupportColorAttachmentMapping :: (self: *MTLRenderPassDescriptor, supportColorAttachmentMapping: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportColorAttachmentMapping_, #type (self: *MTLRenderPassDescriptor, supportColorAttachmentMapping: bool) -> ());
}
setThreadgroupMemoryLength :: (self: *MTLRenderPassDescriptor, threadgroupMemoryLength: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setThreadgroupMemoryLength_, #type (self: *MTLRenderPassDescriptor, threadgroupMemoryLength: NSUInteger) -> ());
}
setTileHeight :: (self: *MTLRenderPassDescriptor, tileHeight: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTileHeight_, #type (self: *MTLRenderPassDescriptor, tileHeight: NSUInteger) -> ());
}
setTileWidth :: (self: *MTLRenderPassDescriptor, tileWidth: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTileWidth_, #type (self: *MTLRenderPassDescriptor, tileWidth: NSUInteger) -> ());
}
setVisibilityResultBuffer :: (self: *MTLRenderPassDescriptor, visibilityResultBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setVisibilityResultBuffer_, #type (self: *MTLRenderPassDescriptor, visibilityResultBuffer: *MTLBuffer) -> ());
}
setVisibilityResultType :: (self: *MTLRenderPassDescriptor, visibilityResultType: MTLVisibilityResultType) -> () {
	#insert #run METHOD_BODY(__selectors.setVisibilityResultType_, #type (self: *MTLRenderPassDescriptor, visibilityResultType: MTLVisibilityResultType) -> ());
}
stencilAttachment :: (self: *MTLRenderPassDescriptor) -> *MTLRenderPassStencilAttachmentDescriptor {
	#insert #run METHOD_BODY(__selectors.stencilAttachment, #type (self: *MTLRenderPassDescriptor) -> *MTLRenderPassStencilAttachmentDescriptor);
}
supportColorAttachmentMapping :: (self: *MTLRenderPassDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportColorAttachmentMapping, #type (self: *MTLRenderPassDescriptor) -> bool);
}
threadgroupMemoryLength :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.threadgroupMemoryLength, #type (self: *MTLRenderPassDescriptor) -> NSUInteger);
}
tileHeight :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.tileHeight, #type (self: *MTLRenderPassDescriptor) -> NSUInteger);
}
tileWidth :: (self: *MTLRenderPassDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.tileWidth, #type (self: *MTLRenderPassDescriptor) -> NSUInteger);
}
visibilityResultBuffer :: (self: *MTLRenderPassDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.visibilityResultBuffer, #type (self: *MTLRenderPassDescriptor) -> *MTLBuffer);
}
visibilityResultType :: (self: *MTLRenderPassDescriptor) -> MTLVisibilityResultType {
	#insert #run METHOD_BODY(__selectors.visibilityResultType, #type (self: *MTLRenderPassDescriptor) -> MTLVisibilityResultType);
}


MTLHeapDescriptor :: struct {}
cpuCacheMode :: (self: *MTLHeapDescriptor) -> MTLCPUCacheMode {
	#insert #run METHOD_BODY(__selectors.cpuCacheMode, #type (self: *MTLHeapDescriptor) -> MTLCPUCacheMode);
}
hazardTrackingMode :: (self: *MTLHeapDescriptor) -> MTLHazardTrackingMode {
	#insert #run METHOD_BODY(__selectors.hazardTrackingMode, #type (self: *MTLHeapDescriptor) -> MTLHazardTrackingMode);
}
maxCompatiblePlacementSparsePageSize :: (self: *MTLHeapDescriptor) -> MTLSparsePageSize {
	#insert #run METHOD_BODY(__selectors.maxCompatiblePlacementSparsePageSize, #type (self: *MTLHeapDescriptor) -> MTLSparsePageSize);
}
resourceOptions :: (self: *MTLHeapDescriptor) -> MTLResourceOptions {
	#insert #run METHOD_BODY(__selectors.resourceOptions, #type (self: *MTLHeapDescriptor) -> MTLResourceOptions);
}
setCpuCacheMode :: (self: *MTLHeapDescriptor, cpuCacheMode: MTLCPUCacheMode) -> () {
	#insert #run METHOD_BODY(__selectors.setCpuCacheMode_, #type (self: *MTLHeapDescriptor, cpuCacheMode: MTLCPUCacheMode) -> ());
}
setHazardTrackingMode :: (self: *MTLHeapDescriptor, hazardTrackingMode: MTLHazardTrackingMode) -> () {
	#insert #run METHOD_BODY(__selectors.setHazardTrackingMode_, #type (self: *MTLHeapDescriptor, hazardTrackingMode: MTLHazardTrackingMode) -> ());
}
setMaxCompatiblePlacementSparsePageSize :: (self: *MTLHeapDescriptor, maxCompatiblePlacementSparsePageSize: MTLSparsePageSize) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxCompatiblePlacementSparsePageSize_, #type (self: *MTLHeapDescriptor, maxCompatiblePlacementSparsePageSize: MTLSparsePageSize) -> ());
}
setResourceOptions :: (self: *MTLHeapDescriptor, resourceOptions: MTLResourceOptions) -> () {
	#insert #run METHOD_BODY(__selectors.setResourceOptions_, #type (self: *MTLHeapDescriptor, resourceOptions: MTLResourceOptions) -> ());
}
setSize :: (self: *MTLHeapDescriptor, size: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSize_, #type (self: *MTLHeapDescriptor, size: NSUInteger) -> ());
}
setSparsePageSize :: (self: *MTLHeapDescriptor, sparsePageSize: MTLSparsePageSize) -> () {
	#insert #run METHOD_BODY(__selectors.setSparsePageSize_, #type (self: *MTLHeapDescriptor, sparsePageSize: MTLSparsePageSize) -> ());
}
setStorageMode :: (self: *MTLHeapDescriptor, storageMode: MTLStorageMode) -> () {
	#insert #run METHOD_BODY(__selectors.setStorageMode_, #type (self: *MTLHeapDescriptor, storageMode: MTLStorageMode) -> ());
}
setType :: (self: *MTLHeapDescriptor, type: MTLHeapType) -> () {
	#insert #run METHOD_BODY(__selectors.setType_, #type (self: *MTLHeapDescriptor, type: MTLHeapType) -> ());
}
size :: (self: *MTLHeapDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.size, #type (self: *MTLHeapDescriptor) -> NSUInteger);
}
sparsePageSize :: (self: *MTLHeapDescriptor) -> MTLSparsePageSize {
	#insert #run METHOD_BODY(__selectors.sparsePageSize, #type (self: *MTLHeapDescriptor) -> MTLSparsePageSize);
}
storageMode :: (self: *MTLHeapDescriptor) -> MTLStorageMode {
	#insert #run METHOD_BODY(__selectors.storageMode, #type (self: *MTLHeapDescriptor) -> MTLStorageMode);
}
type :: (self: *MTLHeapDescriptor) -> MTLHeapType {
	#insert #run METHOD_BODY(__selectors.type, #type (self: *MTLHeapDescriptor) -> MTLHeapType);
}


MTLHeap :: struct { using #as _: MTLAllocation; }
cpuCacheMode :: (self: *MTLHeap) -> MTLCPUCacheMode {
	#insert #run METHOD_BODY(__selectors.cpuCacheMode, #type (self: *MTLHeap) -> MTLCPUCacheMode);
}
currentAllocatedSize :: (self: *MTLHeap) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.currentAllocatedSize, #type (self: *MTLHeap) -> NSUInteger);
}
device :: (self: *MTLHeap) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLHeap) -> *MTLDevice);
}
hazardTrackingMode :: (self: *MTLHeap) -> MTLHazardTrackingMode {
	#insert #run METHOD_BODY(__selectors.hazardTrackingMode, #type (self: *MTLHeap) -> MTLHazardTrackingMode);
}
label :: (self: *MTLHeap) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLHeap) -> *NSString);
}
maxAvailableSize :: (self: *MTLHeap, alignment: NSUInteger) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxAvailableSizeWithAlignment_, #type (self: *MTLHeap, alignment: NSUInteger) -> NSUInteger);
}
newAccelerationStructure :: (self: *MTLHeap, size: NSUInteger) -> *MTLAccelerationStructure {
	#insert #run METHOD_BODY(__selectors.newAccelerationStructureWithSize_, #type (self: *MTLHeap, size: NSUInteger) -> *MTLAccelerationStructure);
}
newAccelerationStructure :: (self: *MTLHeap, descriptor: *MTLAccelerationStructureDescriptor) -> *MTLAccelerationStructure {
	#insert #run METHOD_BODY(__selectors.newAccelerationStructureWithDescriptor_, #type (self: *MTLHeap, descriptor: *MTLAccelerationStructureDescriptor) -> *MTLAccelerationStructure);
}
newAccelerationStructure :: (self: *MTLHeap, size: NSUInteger, offset: NSUInteger) -> *MTLAccelerationStructure {
	#insert #run METHOD_BODY(__selectors.newAccelerationStructureWithSize_offset_, #type (self: *MTLHeap, size: NSUInteger, offset: NSUInteger) -> *MTLAccelerationStructure);
}
newAccelerationStructure :: (self: *MTLHeap, descriptor: *MTLAccelerationStructureDescriptor, offset: NSUInteger) -> *MTLAccelerationStructure {
	#insert #run METHOD_BODY(__selectors.newAccelerationStructureWithDescriptor_offset_, #type (self: *MTLHeap, descriptor: *MTLAccelerationStructureDescriptor, offset: NSUInteger) -> *MTLAccelerationStructure);
}
newBuffer :: (self: *MTLHeap, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.newBufferWithLength_options_, #type (self: *MTLHeap, length: NSUInteger, options: MTLResourceOptions) -> *MTLBuffer);
}
newBuffer :: (self: *MTLHeap, length: NSUInteger, options: MTLResourceOptions, offset: NSUInteger) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.newBufferWithLength_options_offset_, #type (self: *MTLHeap, length: NSUInteger, options: MTLResourceOptions, offset: NSUInteger) -> *MTLBuffer);
}
newTexture :: (self: *MTLHeap, descriptor: *MTLTextureDescriptor) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.newTextureWithDescriptor_, #type (self: *MTLHeap, descriptor: *MTLTextureDescriptor) -> *MTLTexture);
}
newTexture :: (self: *MTLHeap, descriptor: *MTLTextureDescriptor, offset: NSUInteger) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.newTextureWithDescriptor_offset_, #type (self: *MTLHeap, descriptor: *MTLTextureDescriptor, offset: NSUInteger) -> *MTLTexture);
}
resourceOptions :: (self: *MTLHeap) -> MTLResourceOptions {
	#insert #run METHOD_BODY(__selectors.resourceOptions, #type (self: *MTLHeap) -> MTLResourceOptions);
}
setLabel :: (self: *MTLHeap, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLHeap, label: *NSString) -> ());
}
setPurgeableState :: (self: *MTLHeap, state: MTLPurgeableState) -> MTLPurgeableState {
	#insert #run METHOD_BODY(__selectors.setPurgeableState_, #type (self: *MTLHeap, state: MTLPurgeableState) -> MTLPurgeableState);
}
size :: (self: *MTLHeap) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.size, #type (self: *MTLHeap) -> NSUInteger);
}
storageMode :: (self: *MTLHeap) -> MTLStorageMode {
	#insert #run METHOD_BODY(__selectors.storageMode, #type (self: *MTLHeap) -> MTLStorageMode);
}
type :: (self: *MTLHeap) -> MTLHeapType {
	#insert #run METHOD_BODY(__selectors.type, #type (self: *MTLHeap) -> MTLHeapType);
}
usedSize :: (self: *MTLHeap) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.usedSize, #type (self: *MTLHeap) -> NSUInteger);
}


MTLVertexBufferLayoutDescriptor :: struct {}
setStepFunction :: (self: *MTLVertexBufferLayoutDescriptor, stepFunction: MTLVertexStepFunction) -> () {
	#insert #run METHOD_BODY(__selectors.setStepFunction_, #type (self: *MTLVertexBufferLayoutDescriptor, stepFunction: MTLVertexStepFunction) -> ());
}
setStepRate :: (self: *MTLVertexBufferLayoutDescriptor, stepRate: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setStepRate_, #type (self: *MTLVertexBufferLayoutDescriptor, stepRate: NSUInteger) -> ());
}
setStride :: (self: *MTLVertexBufferLayoutDescriptor, stride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setStride_, #type (self: *MTLVertexBufferLayoutDescriptor, stride: NSUInteger) -> ());
}
stepFunction :: (self: *MTLVertexBufferLayoutDescriptor) -> MTLVertexStepFunction {
	#insert #run METHOD_BODY(__selectors.stepFunction, #type (self: *MTLVertexBufferLayoutDescriptor) -> MTLVertexStepFunction);
}
stepRate :: (self: *MTLVertexBufferLayoutDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.stepRate, #type (self: *MTLVertexBufferLayoutDescriptor) -> NSUInteger);
}
stride :: (self: *MTLVertexBufferLayoutDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.stride, #type (self: *MTLVertexBufferLayoutDescriptor) -> NSUInteger);
}


MTLVertexBufferLayoutDescriptorArray :: struct {}
object :: (self: *MTLVertexBufferLayoutDescriptorArray, index: NSUInteger) -> *MTLVertexBufferLayoutDescriptor {
	#insert #run METHOD_BODY(__selectors.objectAtIndexedSubscript_, #type (self: *MTLVertexBufferLayoutDescriptorArray, index: NSUInteger) -> *MTLVertexBufferLayoutDescriptor);
}
setObject :: (self: *MTLVertexBufferLayoutDescriptorArray, bufferDesc: *MTLVertexBufferLayoutDescriptor, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObject_atIndexedSubscript_, #type (self: *MTLVertexBufferLayoutDescriptorArray, bufferDesc: *MTLVertexBufferLayoutDescriptor, index: NSUInteger) -> ());
}


MTLVertexAttributeDescriptor :: struct {}
bufferIndex :: (self: *MTLVertexAttributeDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.bufferIndex, #type (self: *MTLVertexAttributeDescriptor) -> NSUInteger);
}
format :: (self: *MTLVertexAttributeDescriptor) -> MTLVertexFormat {
	#insert #run METHOD_BODY(__selectors.format, #type (self: *MTLVertexAttributeDescriptor) -> MTLVertexFormat);
}
offset :: (self: *MTLVertexAttributeDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.offset, #type (self: *MTLVertexAttributeDescriptor) -> NSUInteger);
}
setBufferIndex :: (self: *MTLVertexAttributeDescriptor, bufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBufferIndex_, #type (self: *MTLVertexAttributeDescriptor, bufferIndex: NSUInteger) -> ());
}
setFormat :: (self: *MTLVertexAttributeDescriptor, format: MTLVertexFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setFormat_, #type (self: *MTLVertexAttributeDescriptor, format: MTLVertexFormat) -> ());
}
setOffset :: (self: *MTLVertexAttributeDescriptor, offset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setOffset_, #type (self: *MTLVertexAttributeDescriptor, offset: NSUInteger) -> ());
}


MTLVertexAttributeDescriptorArray :: struct {}
object :: (self: *MTLVertexAttributeDescriptorArray, index: NSUInteger) -> *MTLVertexAttributeDescriptor {
	#insert #run METHOD_BODY(__selectors.objectAtIndexedSubscript_, #type (self: *MTLVertexAttributeDescriptorArray, index: NSUInteger) -> *MTLVertexAttributeDescriptor);
}
setObject :: (self: *MTLVertexAttributeDescriptorArray, attributeDesc: *MTLVertexAttributeDescriptor, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObject_atIndexedSubscript_, #type (self: *MTLVertexAttributeDescriptorArray, attributeDesc: *MTLVertexAttributeDescriptor, index: NSUInteger) -> ());
}


MTLVertexDescriptor :: struct {}
attributes :: (self: *MTLVertexDescriptor) -> *MTLVertexAttributeDescriptorArray {
	#insert #run METHOD_BODY(__selectors.attributes, #type (self: *MTLVertexDescriptor) -> *MTLVertexAttributeDescriptorArray);
}
layouts :: (self: *MTLVertexDescriptor) -> *MTLVertexBufferLayoutDescriptorArray {
	#insert #run METHOD_BODY(__selectors.layouts, #type (self: *MTLVertexDescriptor) -> *MTLVertexBufferLayoutDescriptorArray);
}
reset :: (self: *MTLVertexDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTLVertexDescriptor) -> ());
}
vertexDescriptor :: (self: *MTLVertexDescriptor) -> *MTLVertexDescriptor {
	#insert #run METHOD_BODY(__selectors.vertexDescriptor, #type (self: *MTLVertexDescriptor) -> *MTLVertexDescriptor);
}


MTL4BinaryFunctionDescriptor :: struct {}
functionDescriptor :: (self: *MTL4BinaryFunctionDescriptor) -> *MTL4FunctionDescriptor {
	#insert #run METHOD_BODY(__selectors.functionDescriptor, #type (self: *MTL4BinaryFunctionDescriptor) -> *MTL4FunctionDescriptor);
}
name :: (self: *MTL4BinaryFunctionDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTL4BinaryFunctionDescriptor) -> *NSString);
}
options :: (self: *MTL4BinaryFunctionDescriptor) -> MTL4BinaryFunctionOptions {
	#insert #run METHOD_BODY(__selectors.options, #type (self: *MTL4BinaryFunctionDescriptor) -> MTL4BinaryFunctionOptions);
}
setFunctionDescriptor :: (self: *MTL4BinaryFunctionDescriptor, functionDescriptor: *MTL4FunctionDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setFunctionDescriptor_, #type (self: *MTL4BinaryFunctionDescriptor, functionDescriptor: *MTL4FunctionDescriptor) -> ());
}
setName :: (self: *MTL4BinaryFunctionDescriptor, name: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setName_, #type (self: *MTL4BinaryFunctionDescriptor, name: *NSString) -> ());
}
setOptions :: (self: *MTL4BinaryFunctionDescriptor, options: MTL4BinaryFunctionOptions) -> () {
	#insert #run METHOD_BODY(__selectors.setOptions_, #type (self: *MTL4BinaryFunctionDescriptor, options: MTL4BinaryFunctionOptions) -> ());
}


MTL4ComputeCommandEncoder :: struct { using #as _: MTL4CommandEncoder; }
buildAccelerationStructure :: (self: *MTL4ComputeCommandEncoder, accelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, scratchBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.buildAccelerationStructure_descriptor_scratchBuffer_, #type (self: *MTL4ComputeCommandEncoder, accelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, scratchBuffer: MTL4BufferRange) -> ());
}
copyAccelerationStructure :: (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> () {
	#insert #run METHOD_BODY(__selectors.copyAccelerationStructure_toAccelerationStructure_, #type (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> ());
}
copyAndCompactAccelerationStructure :: (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> () {
	#insert #run METHOD_BODY(__selectors.copyAndCompactAccelerationStructure_toAccelerationStructure_, #type (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> ());
}
copyFromBuffer :: (self: *MTL4ComputeCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, size: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_, #type (self: *MTL4ComputeCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, size: NSUInteger) -> ());
}
copyFromBuffer :: (self: *MTL4ComputeCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, #type (self: *MTL4ComputeCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> ());
}
copyFromBuffer :: (self: *MTL4ComputeCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin, options: MTLBlitOption) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_, #type (self: *MTL4ComputeCommandEncoder, sourceBuffer: *MTLBuffer, sourceOffset: NSUInteger, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin, options: MTLBlitOption) -> ());
}
copyFromTensor :: (self: *MTL4ComputeCommandEncoder, sourceTensor: *MTLTensor, sourceOrigin: *MTLTensorExtents, sourceDimensions: *MTLTensorExtents, destinationTensor: *MTLTensor, destinationOrigin: *MTLTensorExtents, destinationDimensions: *MTLTensorExtents) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromTensor_sourceOrigin_sourceDimensions_toTensor_destinationOrigin_destinationDimensions_, #type (self: *MTL4ComputeCommandEncoder, sourceTensor: *MTLTensor, sourceOrigin: *MTLTensorExtents, sourceDimensions: *MTLTensorExtents, destinationTensor: *MTLTensor, destinationOrigin: *MTLTensorExtents, destinationDimensions: *MTLTensorExtents) -> ());
}
copyFromTexture :: (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromTexture_toTexture_, #type (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, destinationTexture: *MTLTexture) -> ());
}
copyFromTexture :: (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, sliceCount: NSUInteger, levelCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount_, #type (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, sliceCount: NSUInteger, levelCount: NSUInteger) -> ());
}
copyFromTexture :: (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_, #type (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationTexture: *MTLTexture, destinationSlice: NSUInteger, destinationLevel: NSUInteger, destinationOrigin: MTLOrigin) -> ());
}
copyFromTexture :: (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_, #type (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger) -> ());
}
copyFromTexture :: (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger, options: MTLBlitOption) -> () {
	#insert #run METHOD_BODY(__selectors.copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options_, #type (self: *MTL4ComputeCommandEncoder, sourceTexture: *MTLTexture, sourceSlice: NSUInteger, sourceLevel: NSUInteger, sourceOrigin: MTLOrigin, sourceSize: MTLSize, destinationBuffer: *MTLBuffer, destinationOffset: NSUInteger, destinationBytesPerRow: NSUInteger, destinationBytesPerImage: NSUInteger, options: MTLBlitOption) -> ());
}
copyIndirectCommandBuffer :: (self: *MTL4ComputeCommandEncoder, source: *MTLIndirectCommandBuffer, sourceRange: NSRange, destination: *MTLIndirectCommandBuffer, destinationIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_, #type (self: *MTL4ComputeCommandEncoder, source: *MTLIndirectCommandBuffer, sourceRange: NSRange, destination: *MTLIndirectCommandBuffer, destinationIndex: NSUInteger) -> ());
}
dispatchThreadgroups :: (self: *MTL4ComputeCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.dispatchThreadgroups_threadsPerThreadgroup_, #type (self: *MTL4ComputeCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> ());
}
dispatchThreadgroups :: (self: *MTL4ComputeCommandEncoder, indirectBuffer: MTLGPUAddress, threadsPerThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.dispatchThreadgroupsWithIndirectBuffer_threadsPerThreadgroup_, #type (self: *MTL4ComputeCommandEncoder, indirectBuffer: MTLGPUAddress, threadsPerThreadgroup: MTLSize) -> ());
}
dispatchThreads :: (self: *MTL4ComputeCommandEncoder, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.dispatchThreads_threadsPerThreadgroup_, #type (self: *MTL4ComputeCommandEncoder, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> ());
}
dispatchThreads :: (self: *MTL4ComputeCommandEncoder, indirectBuffer: MTLGPUAddress) -> () {
	#insert #run METHOD_BODY(__selectors.dispatchThreadsWithIndirectBuffer_, #type (self: *MTL4ComputeCommandEncoder, indirectBuffer: MTLGPUAddress) -> ());
}
executeCommandsInBuffer :: (self: *MTL4ComputeCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.executeCommandsInBuffer_withRange_, #type (self: *MTL4ComputeCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> ());
}
executeCommandsInBuffer :: (self: *MTL4ComputeCommandEncoder, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: MTLGPUAddress) -> () {
	#insert #run METHOD_BODY(__selectors.executeCommandsInBuffer_indirectBuffer_, #type (self: *MTL4ComputeCommandEncoder, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: MTLGPUAddress) -> ());
}
fillBuffer :: (self: *MTL4ComputeCommandEncoder, buffer: *MTLBuffer, range: NSRange, value: u8) -> () {
	#insert #run METHOD_BODY(__selectors.fillBuffer_range_value_, #type (self: *MTL4ComputeCommandEncoder, buffer: *MTLBuffer, range: NSRange, value: u8) -> ());
}
generateMipmaps :: (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture) -> () {
	#insert #run METHOD_BODY(__selectors.generateMipmapsForTexture_, #type (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture) -> ());
}
optimizeContentsForCPUAccess :: (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture) -> () {
	#insert #run METHOD_BODY(__selectors.optimizeContentsForCPUAccess_, #type (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture) -> ());
}
optimizeContentsForCPUAccess :: (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.optimizeContentsForCPUAccess_slice_level_, #type (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> ());
}
optimizeContentsForGPUAccess :: (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture) -> () {
	#insert #run METHOD_BODY(__selectors.optimizeContentsForGPUAccess_, #type (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture) -> ());
}
optimizeContentsForGPUAccess :: (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.optimizeContentsForGPUAccess_slice_level_, #type (self: *MTL4ComputeCommandEncoder, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger) -> ());
}
optimizeIndirectCommandBuffer :: (self: *MTL4ComputeCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.optimizeIndirectCommandBuffer_withRange_, #type (self: *MTL4ComputeCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, range: NSRange) -> ());
}
refitAccelerationStructure :: (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.refitAccelerationStructure_descriptor_destination_scratchBuffer_, #type (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: MTL4BufferRange) -> ());
}
refitAccelerationStructure :: (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: MTL4BufferRange, options: MTLAccelerationStructureRefitOptions) -> () {
	#insert #run METHOD_BODY(__selectors.refitAccelerationStructure_descriptor_destination_scratchBuffer_options_, #type (self: *MTL4ComputeCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTL4AccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: MTL4BufferRange, options: MTLAccelerationStructureRefitOptions) -> ());
}
resetCommandsInBuffer :: (self: *MTL4ComputeCommandEncoder, buffer: *MTLIndirectCommandBuffer, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.resetCommandsInBuffer_withRange_, #type (self: *MTL4ComputeCommandEncoder, buffer: *MTLIndirectCommandBuffer, range: NSRange) -> ());
}
setArgumentTable :: (self: *MTL4ComputeCommandEncoder, argumentTable: *MTL4ArgumentTable) -> () {
	#insert #run METHOD_BODY(__selectors.setArgumentTable_, #type (self: *MTL4ComputeCommandEncoder, argumentTable: *MTL4ArgumentTable) -> ());
}
setComputePipelineState :: (self: *MTL4ComputeCommandEncoder, state: *MTLComputePipelineState) -> () {
	#insert #run METHOD_BODY(__selectors.setComputePipelineState_, #type (self: *MTL4ComputeCommandEncoder, state: *MTLComputePipelineState) -> ());
}
setImageblockWidth :: (self: *MTL4ComputeCommandEncoder, width: NSUInteger, height: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setImageblockWidth_height_, #type (self: *MTL4ComputeCommandEncoder, width: NSUInteger, height: NSUInteger) -> ());
}
setThreadgroupMemoryLength :: (self: *MTL4ComputeCommandEncoder, length: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setThreadgroupMemoryLength_atIndex_, #type (self: *MTL4ComputeCommandEncoder, length: NSUInteger, index: NSUInteger) -> ());
}
stages :: (self: *MTL4ComputeCommandEncoder) -> MTLStages {
	#insert #run METHOD_BODY(__selectors.stages, #type (self: *MTL4ComputeCommandEncoder) -> MTLStages);
}
writeCompactedAccelerationStructureSize :: (self: *MTL4ComputeCommandEncoder, accelerationStructure: *MTLAccelerationStructure, buffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.writeCompactedAccelerationStructureSize_toBuffer_, #type (self: *MTL4ComputeCommandEncoder, accelerationStructure: *MTLAccelerationStructure, buffer: MTL4BufferRange) -> ());
}
writeTimestamp :: (self: *MTL4ComputeCommandEncoder, granularity: MTL4TimestampGranularity, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.writeTimestampWithGranularity_intoHeap_atIndex_, #type (self: *MTL4ComputeCommandEncoder, granularity: MTL4TimestampGranularity, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> ());
}


MTLIOCommandBuffer :: struct {}
addBarrier :: (self: *MTLIOCommandBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.addBarrier, #type (self: *MTLIOCommandBuffer) -> ());
}
addCompletedHandler :: (self: *MTLIOCommandBuffer, block: MTLIOCommandBufferHandler) -> () {
	#insert #run METHOD_BODY(__selectors.addCompletedHandler_, #type (self: *MTLIOCommandBuffer, block: MTLIOCommandBufferHandler) -> ());
}
waitUntilCompleted :: (self: *MTLIOCommandBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.waitUntilCompleted, #type (self: *MTLIOCommandBuffer) -> ());
}
commit :: (self: *MTLIOCommandBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.commit, #type (self: *MTLIOCommandBuffer) -> ());
}
copyStatusToBuffer :: (self: *MTLIOCommandBuffer, buffer: *MTLBuffer, offset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.copyStatusToBuffer_offset_, #type (self: *MTLIOCommandBuffer, buffer: *MTLBuffer, offset: NSUInteger) -> ());
}
enqueue :: (self: *MTLIOCommandBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.enqueue, #type (self: *MTLIOCommandBuffer) -> ());
}
error :: (self: *MTLIOCommandBuffer) -> *NSError {
	#insert #run METHOD_BODY(__selectors.error, #type (self: *MTLIOCommandBuffer) -> *NSError);
}
label :: (self: *MTLIOCommandBuffer) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLIOCommandBuffer) -> *NSString);
}
loadBuffer :: (self: *MTLIOCommandBuffer, buffer: *MTLBuffer, offset: NSUInteger, size: NSUInteger, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.loadBuffer_offset_size_sourceHandle_sourceHandleOffset_, #type (self: *MTLIOCommandBuffer, buffer: *MTLBuffer, offset: NSUInteger, size: NSUInteger, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> ());
}
loadBytes :: (self: *MTLIOCommandBuffer, pointer: *void, size: NSUInteger, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.loadBytes_size_sourceHandle_sourceHandleOffset_, #type (self: *MTLIOCommandBuffer, pointer: *void, size: NSUInteger, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> ());
}
loadTexture :: (self: *MTLIOCommandBuffer, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger, size: MTLSize, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, destinationOrigin: MTLOrigin, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset_, #type (self: *MTLIOCommandBuffer, texture: *MTLTexture, slice: NSUInteger, level: NSUInteger, size: MTLSize, sourceBytesPerRow: NSUInteger, sourceBytesPerImage: NSUInteger, destinationOrigin: MTLOrigin, sourceHandle: *MTLIOFileHandle, sourceHandleOffset: NSUInteger) -> ());
}
popDebugGroup :: (self: *MTLIOCommandBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.popDebugGroup, #type (self: *MTLIOCommandBuffer) -> ());
}
pushDebugGroup :: (self: *MTLIOCommandBuffer, _string: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.pushDebugGroup_, #type (self: *MTLIOCommandBuffer, _string: *NSString) -> ());
}
setLabel :: (self: *MTLIOCommandBuffer, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLIOCommandBuffer, label: *NSString) -> ());
}
signalEvent :: (self: *MTLIOCommandBuffer, event: *MTLSharedEvent, value: u64) -> () {
	#insert #run METHOD_BODY(__selectors.signalEvent_value_, #type (self: *MTLIOCommandBuffer, event: *MTLSharedEvent, value: u64) -> ());
}
status :: (self: *MTLIOCommandBuffer) -> MTLIOStatus {
	#insert #run METHOD_BODY(__selectors.status, #type (self: *MTLIOCommandBuffer) -> MTLIOStatus);
}
tryCancel :: (self: *MTLIOCommandBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.tryCancel, #type (self: *MTLIOCommandBuffer) -> ());
}
wait :: (self: *MTLIOCommandBuffer, event: *MTLSharedEvent, value: u64) -> () {
	#insert #run METHOD_BODY(__selectors.waitForEvent_value_, #type (self: *MTLIOCommandBuffer, event: *MTLSharedEvent, value: u64) -> ());
}


MTLFunctionStitchingAttribute :: struct {}


MTLFunctionStitchingAttributeAlwaysInline :: struct { using #as _: MTLFunctionStitchingAttribute; }


MTLFunctionStitchingNode :: struct {}


MTLFunctionStitchingInputNode :: struct { using #as _: MTLFunctionStitchingNode; }
argumentIndex :: (self: *MTLFunctionStitchingInputNode) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.argumentIndex, #type (self: *MTLFunctionStitchingInputNode) -> NSUInteger);
}
init :: (self: *MTLFunctionStitchingInputNode, argument: NSUInteger) -> *MTLFunctionStitchingInputNode {
	#insert #run METHOD_BODY(__selectors.initWithArgumentIndex_, #type (self: *MTLFunctionStitchingInputNode, argument: NSUInteger) -> *MTLFunctionStitchingInputNode);
}
setArgumentIndex :: (self: *MTLFunctionStitchingInputNode, argumentIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setArgumentIndex_, #type (self: *MTLFunctionStitchingInputNode, argumentIndex: NSUInteger) -> ());
}


MTLFunctionStitchingFunctionNode :: struct { using #as _: MTLFunctionStitchingNode; }
arguments :: (self: *MTLFunctionStitchingFunctionNode) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.arguments, #type (self: *MTLFunctionStitchingFunctionNode) -> *NSArray);
}
controlDependencies :: (self: *MTLFunctionStitchingFunctionNode) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.controlDependencies, #type (self: *MTLFunctionStitchingFunctionNode) -> *NSArray);
}
init :: (self: *MTLFunctionStitchingFunctionNode, name: *NSString, arguments: *NSArray, controlDependencies: *NSArray) -> *MTLFunctionStitchingFunctionNode {
	#insert #run METHOD_BODY(__selectors.initWithName_arguments_controlDependencies_, #type (self: *MTLFunctionStitchingFunctionNode, name: *NSString, arguments: *NSArray, controlDependencies: *NSArray) -> *MTLFunctionStitchingFunctionNode);
}
name :: (self: *MTLFunctionStitchingFunctionNode) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTLFunctionStitchingFunctionNode) -> *NSString);
}
setArguments :: (self: *MTLFunctionStitchingFunctionNode, arguments: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setArguments_, #type (self: *MTLFunctionStitchingFunctionNode, arguments: *NSArray) -> ());
}
setControlDependencies :: (self: *MTLFunctionStitchingFunctionNode, controlDependencies: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setControlDependencies_, #type (self: *MTLFunctionStitchingFunctionNode, controlDependencies: *NSArray) -> ());
}
setName :: (self: *MTLFunctionStitchingFunctionNode, name: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setName_, #type (self: *MTLFunctionStitchingFunctionNode, name: *NSString) -> ());
}


MTLFunctionStitchingGraph :: struct {}
attributes :: (self: *MTLFunctionStitchingGraph) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.attributes, #type (self: *MTLFunctionStitchingGraph) -> *NSArray);
}
functionName :: (self: *MTLFunctionStitchingGraph) -> *NSString {
	#insert #run METHOD_BODY(__selectors.functionName, #type (self: *MTLFunctionStitchingGraph) -> *NSString);
}
init :: (self: *MTLFunctionStitchingGraph, functionName: *NSString, nodes: *NSArray, outputNode: *MTLFunctionStitchingFunctionNode, attributes: *NSArray) -> *MTLFunctionStitchingGraph {
	#insert #run METHOD_BODY(__selectors.initWithFunctionName_nodes_outputNode_attributes_, #type (self: *MTLFunctionStitchingGraph, functionName: *NSString, nodes: *NSArray, outputNode: *MTLFunctionStitchingFunctionNode, attributes: *NSArray) -> *MTLFunctionStitchingGraph);
}
nodes :: (self: *MTLFunctionStitchingGraph) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.nodes, #type (self: *MTLFunctionStitchingGraph) -> *NSArray);
}
outputNode :: (self: *MTLFunctionStitchingGraph) -> *MTLFunctionStitchingFunctionNode {
	#insert #run METHOD_BODY(__selectors.outputNode, #type (self: *MTLFunctionStitchingGraph) -> *MTLFunctionStitchingFunctionNode);
}
setAttributes :: (self: *MTLFunctionStitchingGraph, attributes: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setAttributes_, #type (self: *MTLFunctionStitchingGraph, attributes: *NSArray) -> ());
}
setFunctionName :: (self: *MTLFunctionStitchingGraph, functionName: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setFunctionName_, #type (self: *MTLFunctionStitchingGraph, functionName: *NSString) -> ());
}
setNodes :: (self: *MTLFunctionStitchingGraph, nodes: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setNodes_, #type (self: *MTLFunctionStitchingGraph, nodes: *NSArray) -> ());
}
setOutputNode :: (self: *MTLFunctionStitchingGraph, outputNode: *MTLFunctionStitchingFunctionNode) -> () {
	#insert #run METHOD_BODY(__selectors.setOutputNode_, #type (self: *MTLFunctionStitchingGraph, outputNode: *MTLFunctionStitchingFunctionNode) -> ());
}


MTLStitchedLibraryDescriptor :: struct {}
binaryArchives :: (self: *MTLStitchedLibraryDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.binaryArchives, #type (self: *MTLStitchedLibraryDescriptor) -> *NSArray);
}
functionGraphs :: (self: *MTLStitchedLibraryDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.functionGraphs, #type (self: *MTLStitchedLibraryDescriptor) -> *NSArray);
}
functions :: (self: *MTLStitchedLibraryDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.functions, #type (self: *MTLStitchedLibraryDescriptor) -> *NSArray);
}
options :: (self: *MTLStitchedLibraryDescriptor) -> MTLStitchedLibraryOptions {
	#insert #run METHOD_BODY(__selectors.options, #type (self: *MTLStitchedLibraryDescriptor) -> MTLStitchedLibraryOptions);
}
setBinaryArchives :: (self: *MTLStitchedLibraryDescriptor, binaryArchives: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setBinaryArchives_, #type (self: *MTLStitchedLibraryDescriptor, binaryArchives: *NSArray) -> ());
}
setFunctionGraphs :: (self: *MTLStitchedLibraryDescriptor, functionGraphs: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setFunctionGraphs_, #type (self: *MTLStitchedLibraryDescriptor, functionGraphs: *NSArray) -> ());
}
setFunctions :: (self: *MTLStitchedLibraryDescriptor, functions: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setFunctions_, #type (self: *MTLStitchedLibraryDescriptor, functions: *NSArray) -> ());
}
setOptions :: (self: *MTLStitchedLibraryDescriptor, options: MTLStitchedLibraryOptions) -> () {
	#insert #run METHOD_BODY(__selectors.setOptions_, #type (self: *MTLStitchedLibraryDescriptor, options: MTLStitchedLibraryOptions) -> ());
}


MTLLogState :: struct {}


MTLLogStateDescriptor :: struct {}
bufferSize :: (self: *MTLLogStateDescriptor) -> NSInteger {
	#insert #run METHOD_BODY(__selectors.bufferSize, #type (self: *MTLLogStateDescriptor) -> NSInteger);
}
level :: (self: *MTLLogStateDescriptor) -> MTLLogLevel {
	#insert #run METHOD_BODY(__selectors.level, #type (self: *MTLLogStateDescriptor) -> MTLLogLevel);
}
setBufferSize :: (self: *MTLLogStateDescriptor, bufferSize: NSInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBufferSize_, #type (self: *MTLLogStateDescriptor, bufferSize: NSInteger) -> ());
}
setLevel :: (self: *MTLLogStateDescriptor, level: MTLLogLevel) -> () {
	#insert #run METHOD_BODY(__selectors.setLevel_, #type (self: *MTLLogStateDescriptor, level: MTLLogLevel) -> ());
}


MTLVertexAttribute :: struct {}
active :: (self: *MTLVertexAttribute) -> bool {
	#insert #run METHOD_BODY(__selectors.isActive, #type (self: *MTLVertexAttribute) -> bool);
}
attributeIndex :: (self: *MTLVertexAttribute) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.attributeIndex, #type (self: *MTLVertexAttribute) -> NSUInteger);
}
attributeType :: (self: *MTLVertexAttribute) -> MTLDataType {
	#insert #run METHOD_BODY(__selectors.attributeType, #type (self: *MTLVertexAttribute) -> MTLDataType);
}
isActive :: (self: *MTLVertexAttribute) -> bool {
	#insert #run METHOD_BODY(__selectors.isActive, #type (self: *MTLVertexAttribute) -> bool);
}
isPatchControlPointData :: (self: *MTLVertexAttribute) -> bool {
	#insert #run METHOD_BODY(__selectors.isPatchControlPointData, #type (self: *MTLVertexAttribute) -> bool);
}
isPatchData :: (self: *MTLVertexAttribute) -> bool {
	#insert #run METHOD_BODY(__selectors.isPatchData, #type (self: *MTLVertexAttribute) -> bool);
}
name :: (self: *MTLVertexAttribute) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTLVertexAttribute) -> *NSString);
}
patchControlPointData :: (self: *MTLVertexAttribute) -> bool {
	#insert #run METHOD_BODY(__selectors.isPatchControlPointData, #type (self: *MTLVertexAttribute) -> bool);
}
patchData :: (self: *MTLVertexAttribute) -> bool {
	#insert #run METHOD_BODY(__selectors.isPatchData, #type (self: *MTLVertexAttribute) -> bool);
}


MTLAttribute :: struct {}
active :: (self: *MTLAttribute) -> bool {
	#insert #run METHOD_BODY(__selectors.isActive, #type (self: *MTLAttribute) -> bool);
}
attributeIndex :: (self: *MTLAttribute) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.attributeIndex, #type (self: *MTLAttribute) -> NSUInteger);
}
attributeType :: (self: *MTLAttribute) -> MTLDataType {
	#insert #run METHOD_BODY(__selectors.attributeType, #type (self: *MTLAttribute) -> MTLDataType);
}
isActive :: (self: *MTLAttribute) -> bool {
	#insert #run METHOD_BODY(__selectors.isActive, #type (self: *MTLAttribute) -> bool);
}
isPatchControlPointData :: (self: *MTLAttribute) -> bool {
	#insert #run METHOD_BODY(__selectors.isPatchControlPointData, #type (self: *MTLAttribute) -> bool);
}
isPatchData :: (self: *MTLAttribute) -> bool {
	#insert #run METHOD_BODY(__selectors.isPatchData, #type (self: *MTLAttribute) -> bool);
}
name :: (self: *MTLAttribute) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTLAttribute) -> *NSString);
}
patchControlPointData :: (self: *MTLAttribute) -> bool {
	#insert #run METHOD_BODY(__selectors.isPatchControlPointData, #type (self: *MTLAttribute) -> bool);
}
patchData :: (self: *MTLAttribute) -> bool {
	#insert #run METHOD_BODY(__selectors.isPatchData, #type (self: *MTLAttribute) -> bool);
}


MTLFunctionConstant :: struct {}
index :: (self: *MTLFunctionConstant) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.index, #type (self: *MTLFunctionConstant) -> NSUInteger);
}
name :: (self: *MTLFunctionConstant) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTLFunctionConstant) -> *NSString);
}
required :: (self: *MTLFunctionConstant) -> bool {
	#insert #run METHOD_BODY(__selectors.required, #type (self: *MTLFunctionConstant) -> bool);
}
type :: (self: *MTLFunctionConstant) -> MTLDataType {
	#insert #run METHOD_BODY(__selectors.type, #type (self: *MTLFunctionConstant) -> MTLDataType);
}


MTLFunction :: struct {}
device :: (self: *MTLFunction) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLFunction) -> *MTLDevice);
}
functionConstantsDictionary :: (self: *MTLFunction) -> *NSDictionary {
	#insert #run METHOD_BODY(__selectors.functionConstantsDictionary, #type (self: *MTLFunction) -> *NSDictionary);
}
functionType :: (self: *MTLFunction) -> MTLFunctionType {
	#insert #run METHOD_BODY(__selectors.functionType, #type (self: *MTLFunction) -> MTLFunctionType);
}
label :: (self: *MTLFunction) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLFunction) -> *NSString);
}
name :: (self: *MTLFunction) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTLFunction) -> *NSString);
}
newArgumentEncoder :: (self: *MTLFunction, bufferIndex: NSUInteger) -> *MTLArgumentEncoder {
	#insert #run METHOD_BODY(__selectors.newArgumentEncoderWithBufferIndex_, #type (self: *MTLFunction, bufferIndex: NSUInteger) -> *MTLArgumentEncoder);
}
newArgumentEncoder :: (self: *MTLFunction, bufferIndex: NSUInteger, reflection: *MTLAutoreleasedArgument) -> *MTLArgumentEncoder {
	#insert #run METHOD_BODY(__selectors.newArgumentEncoderWithBufferIndex_reflection_, #type (self: *MTLFunction, bufferIndex: NSUInteger, reflection: *MTLAutoreleasedArgument) -> *MTLArgumentEncoder);
}
options :: (self: *MTLFunction) -> MTLFunctionOptions {
	#insert #run METHOD_BODY(__selectors.options, #type (self: *MTLFunction) -> MTLFunctionOptions);
}
patchControlPointCount :: (self: *MTLFunction) -> NSInteger {
	#insert #run METHOD_BODY(__selectors.patchControlPointCount, #type (self: *MTLFunction) -> NSInteger);
}
patchType :: (self: *MTLFunction) -> MTLPatchType {
	#insert #run METHOD_BODY(__selectors.patchType, #type (self: *MTLFunction) -> MTLPatchType);
}
setLabel :: (self: *MTLFunction, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLFunction, label: *NSString) -> ());
}
stageInputAttributes :: (self: *MTLFunction) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.stageInputAttributes, #type (self: *MTLFunction) -> *NSArray);
}
vertexAttributes :: (self: *MTLFunction) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.vertexAttributes, #type (self: *MTLFunction) -> *NSArray);
}


MTLCompileOptions :: struct {}
allowReferencingUndefinedSymbols :: (self: *MTLCompileOptions) -> bool {
	#insert #run METHOD_BODY(__selectors.allowReferencingUndefinedSymbols, #type (self: *MTLCompileOptions) -> bool);
}
compileSymbolVisibility :: (self: *MTLCompileOptions) -> MTLCompileSymbolVisibility {
	#insert #run METHOD_BODY(__selectors.compileSymbolVisibility, #type (self: *MTLCompileOptions) -> MTLCompileSymbolVisibility);
}
enableLogging :: (self: *MTLCompileOptions) -> bool {
	#insert #run METHOD_BODY(__selectors.enableLogging, #type (self: *MTLCompileOptions) -> bool);
}
fastMathEnabled :: (self: *MTLCompileOptions) -> bool {
	#insert #run METHOD_BODY(__selectors.fastMathEnabled, #type (self: *MTLCompileOptions) -> bool);
}
installName :: (self: *MTLCompileOptions) -> *NSString {
	#insert #run METHOD_BODY(__selectors.installName, #type (self: *MTLCompileOptions) -> *NSString);
}
languageVersion :: (self: *MTLCompileOptions) -> MTLLanguageVersion {
	#insert #run METHOD_BODY(__selectors.languageVersion, #type (self: *MTLCompileOptions) -> MTLLanguageVersion);
}
libraries :: (self: *MTLCompileOptions) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.libraries, #type (self: *MTLCompileOptions) -> *NSArray);
}
libraryType :: (self: *MTLCompileOptions) -> MTLLibraryType {
	#insert #run METHOD_BODY(__selectors.libraryType, #type (self: *MTLCompileOptions) -> MTLLibraryType);
}
mathFloatingPointFunctions :: (self: *MTLCompileOptions) -> MTLMathFloatingPointFunctions {
	#insert #run METHOD_BODY(__selectors.mathFloatingPointFunctions, #type (self: *MTLCompileOptions) -> MTLMathFloatingPointFunctions);
}
mathMode :: (self: *MTLCompileOptions) -> MTLMathMode {
	#insert #run METHOD_BODY(__selectors.mathMode, #type (self: *MTLCompileOptions) -> MTLMathMode);
}
maxTotalThreadsPerThreadgroup :: (self: *MTLCompileOptions) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTotalThreadsPerThreadgroup, #type (self: *MTLCompileOptions) -> NSUInteger);
}
optimizationLevel :: (self: *MTLCompileOptions) -> MTLLibraryOptimizationLevel {
	#insert #run METHOD_BODY(__selectors.optimizationLevel, #type (self: *MTLCompileOptions) -> MTLLibraryOptimizationLevel);
}
preprocessorMacros :: (self: *MTLCompileOptions) -> *NSDictionary {
	#insert #run METHOD_BODY(__selectors.preprocessorMacros, #type (self: *MTLCompileOptions) -> *NSDictionary);
}
preserveInvariance :: (self: *MTLCompileOptions) -> bool {
	#insert #run METHOD_BODY(__selectors.preserveInvariance, #type (self: *MTLCompileOptions) -> bool);
}
requiredThreadsPerThreadgroup :: (self: *MTLCompileOptions) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.requiredThreadsPerThreadgroup, #type (self: *MTLCompileOptions) -> MTLSize);
}
setAllowReferencingUndefinedSymbols :: (self: *MTLCompileOptions, allowReferencingUndefinedSymbols: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setAllowReferencingUndefinedSymbols_, #type (self: *MTLCompileOptions, allowReferencingUndefinedSymbols: bool) -> ());
}
setCompileSymbolVisibility :: (self: *MTLCompileOptions, compileSymbolVisibility: MTLCompileSymbolVisibility) -> () {
	#insert #run METHOD_BODY(__selectors.setCompileSymbolVisibility_, #type (self: *MTLCompileOptions, compileSymbolVisibility: MTLCompileSymbolVisibility) -> ());
}
setEnableLogging :: (self: *MTLCompileOptions, enableLogging: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setEnableLogging_, #type (self: *MTLCompileOptions, enableLogging: bool) -> ());
}
setFastMathEnabled :: (self: *MTLCompileOptions, fastMathEnabled: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setFastMathEnabled_, #type (self: *MTLCompileOptions, fastMathEnabled: bool) -> ());
}
setInstallName :: (self: *MTLCompileOptions, installName: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setInstallName_, #type (self: *MTLCompileOptions, installName: *NSString) -> ());
}
setLanguageVersion :: (self: *MTLCompileOptions, languageVersion: MTLLanguageVersion) -> () {
	#insert #run METHOD_BODY(__selectors.setLanguageVersion_, #type (self: *MTLCompileOptions, languageVersion: MTLLanguageVersion) -> ());
}
setLibraries :: (self: *MTLCompileOptions, libraries: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setLibraries_, #type (self: *MTLCompileOptions, libraries: *NSArray) -> ());
}
setLibraryType :: (self: *MTLCompileOptions, libraryType: MTLLibraryType) -> () {
	#insert #run METHOD_BODY(__selectors.setLibraryType_, #type (self: *MTLCompileOptions, libraryType: MTLLibraryType) -> ());
}
setMathFloatingPointFunctions :: (self: *MTLCompileOptions, mathFloatingPointFunctions: MTLMathFloatingPointFunctions) -> () {
	#insert #run METHOD_BODY(__selectors.setMathFloatingPointFunctions_, #type (self: *MTLCompileOptions, mathFloatingPointFunctions: MTLMathFloatingPointFunctions) -> ());
}
setMathMode :: (self: *MTLCompileOptions, mathMode: MTLMathMode) -> () {
	#insert #run METHOD_BODY(__selectors.setMathMode_, #type (self: *MTLCompileOptions, mathMode: MTLMathMode) -> ());
}
setMaxTotalThreadsPerThreadgroup :: (self: *MTLCompileOptions, maxTotalThreadsPerThreadgroup: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxTotalThreadsPerThreadgroup_, #type (self: *MTLCompileOptions, maxTotalThreadsPerThreadgroup: NSUInteger) -> ());
}
setOptimizationLevel :: (self: *MTLCompileOptions, optimizationLevel: MTLLibraryOptimizationLevel) -> () {
	#insert #run METHOD_BODY(__selectors.setOptimizationLevel_, #type (self: *MTLCompileOptions, optimizationLevel: MTLLibraryOptimizationLevel) -> ());
}
setPreprocessorMacros :: (self: *MTLCompileOptions, preprocessorMacros: *NSDictionary) -> () {
	#insert #run METHOD_BODY(__selectors.setPreprocessorMacros_, #type (self: *MTLCompileOptions, preprocessorMacros: *NSDictionary) -> ());
}
setPreserveInvariance :: (self: *MTLCompileOptions, preserveInvariance: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setPreserveInvariance_, #type (self: *MTLCompileOptions, preserveInvariance: bool) -> ());
}
setRequiredThreadsPerThreadgroup :: (self: *MTLCompileOptions, requiredThreadsPerThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.setRequiredThreadsPerThreadgroup_, #type (self: *MTLCompileOptions, requiredThreadsPerThreadgroup: MTLSize) -> ());
}


MTLFunctionReflection :: struct {}
bindings :: (self: *MTLFunctionReflection) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.bindings, #type (self: *MTLFunctionReflection) -> *NSArray);
}


MTLLibrary :: struct {}
device :: (self: *MTLLibrary) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLLibrary) -> *MTLDevice);
}
functionNames :: (self: *MTLLibrary) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.functionNames, #type (self: *MTLLibrary) -> *NSArray);
}
installName :: (self: *MTLLibrary) -> *NSString {
	#insert #run METHOD_BODY(__selectors.installName, #type (self: *MTLLibrary) -> *NSString);
}
label :: (self: *MTLLibrary) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLLibrary) -> *NSString);
}
newFunction :: (self: *MTLLibrary, functionName: *NSString) -> *MTLFunction {
	#insert #run METHOD_BODY(__selectors.newFunctionWithName_, #type (self: *MTLLibrary, functionName: *NSString) -> *MTLFunction);
}
newFunction :: (self: *MTLLibrary, name: *NSString, constantValues: *MTLFunctionConstantValues, error: **NSError) -> *MTLFunction {
	#insert #run METHOD_BODY(__selectors.newFunctionWithName_constantValues_error_, #type (self: *MTLLibrary, name: *NSString, constantValues: *MTLFunctionConstantValues, error: **NSError) -> *MTLFunction);
}
newFunction :: (self: *MTLLibrary, descriptor: *MTLFunctionDescriptor, error: **NSError) -> *MTLFunction {
	#insert #run METHOD_BODY(__selectors.newFunctionWithDescriptor_error_, #type (self: *MTLLibrary, descriptor: *MTLFunctionDescriptor, error: **NSError) -> *MTLFunction);
}
type :: (self: *MTLLibrary) -> MTLLibraryType {
	#insert #run METHOD_BODY(__selectors.type, #type (self: *MTLLibrary) -> MTLLibraryType);
}
setLabel :: (self: *MTLLibrary, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLLibrary, label: *NSString) -> ());
}
newIntersectionFunction :: (self: *MTLLibrary, descriptor: *MTLIntersectionFunctionDescriptor, error: **NSError) -> *MTLFunction {
	#insert #run METHOD_BODY(__selectors.newIntersectionFunctionWithDescriptor_error_, #type (self: *MTLLibrary, descriptor: *MTLIntersectionFunctionDescriptor, error: **NSError) -> *MTLFunction);
}
reflectionForFunction :: (self: *MTLLibrary, functionName: *NSString) -> *MTLFunctionReflection {
	#insert #run METHOD_BODY(__selectors.reflectionForFunctionWithName_, #type (self: *MTLLibrary, functionName: *NSString) -> *MTLFunctionReflection);
}


MTL4ComputePipelineDescriptor :: struct { using #as _: MTL4PipelineDescriptor; }
computeFunctionDescriptor :: (self: *MTL4ComputePipelineDescriptor) -> *MTL4FunctionDescriptor {
	#insert #run METHOD_BODY(__selectors.computeFunctionDescriptor, #type (self: *MTL4ComputePipelineDescriptor) -> *MTL4FunctionDescriptor);
}
maxTotalThreadsPerThreadgroup :: (self: *MTL4ComputePipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTotalThreadsPerThreadgroup, #type (self: *MTL4ComputePipelineDescriptor) -> NSUInteger);
}
requiredThreadsPerThreadgroup :: (self: *MTL4ComputePipelineDescriptor) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.requiredThreadsPerThreadgroup, #type (self: *MTL4ComputePipelineDescriptor) -> MTLSize);
}
reset :: (self: *MTL4ComputePipelineDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTL4ComputePipelineDescriptor) -> ());
}
setComputeFunctionDescriptor :: (self: *MTL4ComputePipelineDescriptor, computeFunctionDescriptor: *MTL4FunctionDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setComputeFunctionDescriptor_, #type (self: *MTL4ComputePipelineDescriptor, computeFunctionDescriptor: *MTL4FunctionDescriptor) -> ());
}
setMaxTotalThreadsPerThreadgroup :: (self: *MTL4ComputePipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxTotalThreadsPerThreadgroup_, #type (self: *MTL4ComputePipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> ());
}
setRequiredThreadsPerThreadgroup :: (self: *MTL4ComputePipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.setRequiredThreadsPerThreadgroup_, #type (self: *MTL4ComputePipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> ());
}
setStaticLinkingDescriptor :: (self: *MTL4ComputePipelineDescriptor, staticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setStaticLinkingDescriptor_, #type (self: *MTL4ComputePipelineDescriptor, staticLinkingDescriptor: *MTL4StaticLinkingDescriptor) -> ());
}
setSupportBinaryLinking :: (self: *MTL4ComputePipelineDescriptor, supportBinaryLinking: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportBinaryLinking_, #type (self: *MTL4ComputePipelineDescriptor, supportBinaryLinking: bool) -> ());
}
setSupportIndirectCommandBuffers :: (self: *MTL4ComputePipelineDescriptor, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportIndirectCommandBuffers_, #type (self: *MTL4ComputePipelineDescriptor, supportIndirectCommandBuffers: MTL4IndirectCommandBufferSupportState) -> ());
}
setThreadGroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTL4ComputePipelineDescriptor, threadGroupSizeIsMultipleOfThreadExecutionWidth: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setThreadGroupSizeIsMultipleOfThreadExecutionWidth_, #type (self: *MTL4ComputePipelineDescriptor, threadGroupSizeIsMultipleOfThreadExecutionWidth: bool) -> ());
}
staticLinkingDescriptor :: (self: *MTL4ComputePipelineDescriptor) -> *MTL4StaticLinkingDescriptor {
	#insert #run METHOD_BODY(__selectors.staticLinkingDescriptor, #type (self: *MTL4ComputePipelineDescriptor) -> *MTL4StaticLinkingDescriptor);
}
supportBinaryLinking :: (self: *MTL4ComputePipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportBinaryLinking, #type (self: *MTL4ComputePipelineDescriptor) -> bool);
}
supportIndirectCommandBuffers :: (self: *MTL4ComputePipelineDescriptor) -> MTL4IndirectCommandBufferSupportState {
	#insert #run METHOD_BODY(__selectors.supportIndirectCommandBuffers, #type (self: *MTL4ComputePipelineDescriptor) -> MTL4IndirectCommandBufferSupportState);
}
threadGroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTL4ComputePipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.threadGroupSizeIsMultipleOfThreadExecutionWidth, #type (self: *MTL4ComputePipelineDescriptor) -> bool);
}


MTLResourceViewPoolDescriptor :: struct {}
label :: (self: *MTLResourceViewPoolDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLResourceViewPoolDescriptor) -> *NSString);
}
resourceViewCount :: (self: *MTLResourceViewPoolDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.resourceViewCount, #type (self: *MTLResourceViewPoolDescriptor) -> NSUInteger);
}
setLabel :: (self: *MTLResourceViewPoolDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLResourceViewPoolDescriptor, label: *NSString) -> ());
}
setResourceViewCount :: (self: *MTLResourceViewPoolDescriptor, resourceViewCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setResourceViewCount_, #type (self: *MTLResourceViewPoolDescriptor, resourceViewCount: NSUInteger) -> ());
}


MTLResourceViewPool :: struct {}
baseResourceID :: (self: *MTLResourceViewPool) -> MTLResourceID {
	#insert #run METHOD_BODY(__selectors.baseResourceID, #type (self: *MTLResourceViewPool) -> MTLResourceID);
}
copyResourceViewsFromPool :: (self: *MTLResourceViewPool, sourcePool: *MTLResourceViewPool, sourceRange: NSRange, destinationIndex: NSUInteger) -> MTLResourceID {
	#insert #run METHOD_BODY(__selectors.copyResourceViewsFromPool_sourceRange_destinationIndex_, #type (self: *MTLResourceViewPool, sourcePool: *MTLResourceViewPool, sourceRange: NSRange, destinationIndex: NSUInteger) -> MTLResourceID);
}
device :: (self: *MTLResourceViewPool) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLResourceViewPool) -> *MTLDevice);
}
label :: (self: *MTLResourceViewPool) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLResourceViewPool) -> *NSString);
}
resourceViewCount :: (self: *MTLResourceViewPool) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.resourceViewCount, #type (self: *MTLResourceViewPool) -> NSUInteger);
}


MTLAllocation :: struct {}
allocatedSize :: (self: *MTLAllocation) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.allocatedSize, #type (self: *MTLAllocation) -> NSUInteger);
}


MTL4RenderPassDescriptor :: struct {}
colorAttachments :: (self: *MTL4RenderPassDescriptor) -> *MTLRenderPassColorAttachmentDescriptorArray {
	#insert #run METHOD_BODY(__selectors.colorAttachments, #type (self: *MTL4RenderPassDescriptor) -> *MTLRenderPassColorAttachmentDescriptorArray);
}
defaultRasterSampleCount :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.defaultRasterSampleCount, #type (self: *MTL4RenderPassDescriptor) -> NSUInteger);
}
depthAttachment :: (self: *MTL4RenderPassDescriptor) -> *MTLRenderPassDepthAttachmentDescriptor {
	#insert #run METHOD_BODY(__selectors.depthAttachment, #type (self: *MTL4RenderPassDescriptor) -> *MTLRenderPassDepthAttachmentDescriptor);
}
getSamplePositions :: (self: *MTL4RenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.getSamplePositions_count_, #type (self: *MTL4RenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> NSUInteger);
}
imageblockSampleLength :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.imageblockSampleLength, #type (self: *MTL4RenderPassDescriptor) -> NSUInteger);
}
rasterizationRateMap :: (self: *MTL4RenderPassDescriptor) -> *MTLRasterizationRateMap {
	#insert #run METHOD_BODY(__selectors.rasterizationRateMap, #type (self: *MTL4RenderPassDescriptor) -> *MTLRasterizationRateMap);
}
renderTargetArrayLength :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.renderTargetArrayLength, #type (self: *MTL4RenderPassDescriptor) -> NSUInteger);
}
renderTargetHeight :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.renderTargetHeight, #type (self: *MTL4RenderPassDescriptor) -> NSUInteger);
}
renderTargetWidth :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.renderTargetWidth, #type (self: *MTL4RenderPassDescriptor) -> NSUInteger);
}
setDefaultRasterSampleCount :: (self: *MTL4RenderPassDescriptor, defaultRasterSampleCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setDefaultRasterSampleCount_, #type (self: *MTL4RenderPassDescriptor, defaultRasterSampleCount: NSUInteger) -> ());
}
setDepthAttachment :: (self: *MTL4RenderPassDescriptor, depthAttachment: *MTLRenderPassDepthAttachmentDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthAttachment_, #type (self: *MTL4RenderPassDescriptor, depthAttachment: *MTLRenderPassDepthAttachmentDescriptor) -> ());
}
setImageblockSampleLength :: (self: *MTL4RenderPassDescriptor, imageblockSampleLength: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setImageblockSampleLength_, #type (self: *MTL4RenderPassDescriptor, imageblockSampleLength: NSUInteger) -> ());
}
setRasterizationRateMap :: (self: *MTL4RenderPassDescriptor, rasterizationRateMap: *MTLRasterizationRateMap) -> () {
	#insert #run METHOD_BODY(__selectors.setRasterizationRateMap_, #type (self: *MTL4RenderPassDescriptor, rasterizationRateMap: *MTLRasterizationRateMap) -> ());
}
setRenderTargetArrayLength :: (self: *MTL4RenderPassDescriptor, renderTargetArrayLength: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRenderTargetArrayLength_, #type (self: *MTL4RenderPassDescriptor, renderTargetArrayLength: NSUInteger) -> ());
}
setRenderTargetHeight :: (self: *MTL4RenderPassDescriptor, renderTargetHeight: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRenderTargetHeight_, #type (self: *MTL4RenderPassDescriptor, renderTargetHeight: NSUInteger) -> ());
}
setRenderTargetWidth :: (self: *MTL4RenderPassDescriptor, renderTargetWidth: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRenderTargetWidth_, #type (self: *MTL4RenderPassDescriptor, renderTargetWidth: NSUInteger) -> ());
}
setSamplePositions :: (self: *MTL4RenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSamplePositions_count_, #type (self: *MTL4RenderPassDescriptor, positions: *MTLSamplePosition, count: NSUInteger) -> ());
}
setStencilAttachment :: (self: *MTL4RenderPassDescriptor, stencilAttachment: *MTLRenderPassStencilAttachmentDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setStencilAttachment_, #type (self: *MTL4RenderPassDescriptor, stencilAttachment: *MTLRenderPassStencilAttachmentDescriptor) -> ());
}
setSupportColorAttachmentMapping :: (self: *MTL4RenderPassDescriptor, supportColorAttachmentMapping: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportColorAttachmentMapping_, #type (self: *MTL4RenderPassDescriptor, supportColorAttachmentMapping: bool) -> ());
}
setThreadgroupMemoryLength :: (self: *MTL4RenderPassDescriptor, threadgroupMemoryLength: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setThreadgroupMemoryLength_, #type (self: *MTL4RenderPassDescriptor, threadgroupMemoryLength: NSUInteger) -> ());
}
setTileHeight :: (self: *MTL4RenderPassDescriptor, tileHeight: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTileHeight_, #type (self: *MTL4RenderPassDescriptor, tileHeight: NSUInteger) -> ());
}
setTileWidth :: (self: *MTL4RenderPassDescriptor, tileWidth: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTileWidth_, #type (self: *MTL4RenderPassDescriptor, tileWidth: NSUInteger) -> ());
}
setVisibilityResultBuffer :: (self: *MTL4RenderPassDescriptor, visibilityResultBuffer: *MTLBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setVisibilityResultBuffer_, #type (self: *MTL4RenderPassDescriptor, visibilityResultBuffer: *MTLBuffer) -> ());
}
setVisibilityResultType :: (self: *MTL4RenderPassDescriptor, visibilityResultType: MTLVisibilityResultType) -> () {
	#insert #run METHOD_BODY(__selectors.setVisibilityResultType_, #type (self: *MTL4RenderPassDescriptor, visibilityResultType: MTLVisibilityResultType) -> ());
}
stencilAttachment :: (self: *MTL4RenderPassDescriptor) -> *MTLRenderPassStencilAttachmentDescriptor {
	#insert #run METHOD_BODY(__selectors.stencilAttachment, #type (self: *MTL4RenderPassDescriptor) -> *MTLRenderPassStencilAttachmentDescriptor);
}
supportColorAttachmentMapping :: (self: *MTL4RenderPassDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportColorAttachmentMapping, #type (self: *MTL4RenderPassDescriptor) -> bool);
}
threadgroupMemoryLength :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.threadgroupMemoryLength, #type (self: *MTL4RenderPassDescriptor) -> NSUInteger);
}
tileHeight :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.tileHeight, #type (self: *MTL4RenderPassDescriptor) -> NSUInteger);
}
tileWidth :: (self: *MTL4RenderPassDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.tileWidth, #type (self: *MTL4RenderPassDescriptor) -> NSUInteger);
}
visibilityResultBuffer :: (self: *MTL4RenderPassDescriptor) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.visibilityResultBuffer, #type (self: *MTL4RenderPassDescriptor) -> *MTLBuffer);
}
visibilityResultType :: (self: *MTL4RenderPassDescriptor) -> MTLVisibilityResultType {
	#insert #run METHOD_BODY(__selectors.visibilityResultType, #type (self: *MTL4RenderPassDescriptor) -> MTLVisibilityResultType);
}


MTL4MachineLearningPipelineDescriptor :: struct { using #as _: MTL4PipelineDescriptor; }
inputDimensionsAtBufferIndex :: (self: *MTL4MachineLearningPipelineDescriptor, bufferIndex: NSInteger) -> *MTLTensorExtents {
	#insert #run METHOD_BODY(__selectors.inputDimensionsAtBufferIndex_, #type (self: *MTL4MachineLearningPipelineDescriptor, bufferIndex: NSInteger) -> *MTLTensorExtents);
}
label :: (self: *MTL4MachineLearningPipelineDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTL4MachineLearningPipelineDescriptor) -> *NSString);
}
machineLearningFunctionDescriptor :: (self: *MTL4MachineLearningPipelineDescriptor) -> *MTL4FunctionDescriptor {
	#insert #run METHOD_BODY(__selectors.machineLearningFunctionDescriptor, #type (self: *MTL4MachineLearningPipelineDescriptor) -> *MTL4FunctionDescriptor);
}
reset :: (self: *MTL4MachineLearningPipelineDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTL4MachineLearningPipelineDescriptor) -> ());
}
setInputDimensions :: (self: *MTL4MachineLearningPipelineDescriptor, dimensions: *MTLTensorExtents, bufferIndex: NSInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setInputDimensions_atBufferIndex_, #type (self: *MTL4MachineLearningPipelineDescriptor, dimensions: *MTLTensorExtents, bufferIndex: NSInteger) -> ());
}
setInputDimensions :: (self: *MTL4MachineLearningPipelineDescriptor, dimensions: *NSArray, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setInputDimensions_withRange_, #type (self: *MTL4MachineLearningPipelineDescriptor, dimensions: *NSArray, range: NSRange) -> ());
}
setLabel :: (self: *MTL4MachineLearningPipelineDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTL4MachineLearningPipelineDescriptor, label: *NSString) -> ());
}
setMachineLearningFunctionDescriptor :: (self: *MTL4MachineLearningPipelineDescriptor, machineLearningFunctionDescriptor: *MTL4FunctionDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setMachineLearningFunctionDescriptor_, #type (self: *MTL4MachineLearningPipelineDescriptor, machineLearningFunctionDescriptor: *MTL4FunctionDescriptor) -> ());
}


MTL4MachineLearningPipelineReflection :: struct {}
bindings :: (self: *MTL4MachineLearningPipelineReflection) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.bindings, #type (self: *MTL4MachineLearningPipelineReflection) -> *NSArray);
}


MTL4MachineLearningPipelineState :: struct { using #as _: MTLAllocation; }
device :: (self: *MTL4MachineLearningPipelineState) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTL4MachineLearningPipelineState) -> *MTLDevice);
}
intermediatesHeapSize :: (self: *MTL4MachineLearningPipelineState) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.intermediatesHeapSize, #type (self: *MTL4MachineLearningPipelineState) -> NSUInteger);
}
label :: (self: *MTL4MachineLearningPipelineState) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTL4MachineLearningPipelineState) -> *NSString);
}
reflection :: (self: *MTL4MachineLearningPipelineState) -> *MTL4MachineLearningPipelineReflection {
	#insert #run METHOD_BODY(__selectors.reflection, #type (self: *MTL4MachineLearningPipelineState) -> *MTL4MachineLearningPipelineReflection);
}


MTLFence :: struct {}
device :: (self: *MTLFence) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLFence) -> *MTLDevice);
}
label :: (self: *MTLFence) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLFence) -> *NSString);
}
setLabel :: (self: *MTLFence, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLFence, label: *NSString) -> ());
}


MTL4PipelineDataSetSerializerDescriptor :: struct {}
configuration :: (self: *MTL4PipelineDataSetSerializerDescriptor) -> MTL4PipelineDataSetSerializerConfiguration {
	#insert #run METHOD_BODY(__selectors.configuration, #type (self: *MTL4PipelineDataSetSerializerDescriptor) -> MTL4PipelineDataSetSerializerConfiguration);
}
setConfiguration :: (self: *MTL4PipelineDataSetSerializerDescriptor, configuration: MTL4PipelineDataSetSerializerConfiguration) -> () {
	#insert #run METHOD_BODY(__selectors.setConfiguration_, #type (self: *MTL4PipelineDataSetSerializerDescriptor, configuration: MTL4PipelineDataSetSerializerConfiguration) -> ());
}


MTL4PipelineDataSetSerializer :: struct {}
serializeAsArchiveAndFlushToURL :: (self: *MTL4PipelineDataSetSerializer, url: *NSURL, error: **NSError) -> bool {
	#insert #run METHOD_BODY(__selectors.serializeAsArchiveAndFlushToURL_error_, #type (self: *MTL4PipelineDataSetSerializer, url: *NSURL, error: **NSError) -> bool);
}
serializeAsPipelinesScript :: (self: *MTL4PipelineDataSetSerializer, error: **NSError) -> *NSData {
	#insert #run METHOD_BODY(__selectors.serializeAsPipelinesScriptWithError_, #type (self: *MTL4PipelineDataSetSerializer, error: **NSError) -> *NSData);
}


MTLIndirectCommandBufferDescriptor :: struct {}
commandTypes :: (self: *MTLIndirectCommandBufferDescriptor) -> MTLIndirectCommandType {
	#insert #run METHOD_BODY(__selectors.commandTypes, #type (self: *MTLIndirectCommandBufferDescriptor) -> MTLIndirectCommandType);
}
inheritBuffers :: (self: *MTLIndirectCommandBufferDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.inheritBuffers, #type (self: *MTLIndirectCommandBufferDescriptor) -> bool);
}
inheritCullMode :: (self: *MTLIndirectCommandBufferDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.inheritCullMode, #type (self: *MTLIndirectCommandBufferDescriptor) -> bool);
}
inheritDepthBias :: (self: *MTLIndirectCommandBufferDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.inheritDepthBias, #type (self: *MTLIndirectCommandBufferDescriptor) -> bool);
}
inheritDepthClipMode :: (self: *MTLIndirectCommandBufferDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.inheritDepthClipMode, #type (self: *MTLIndirectCommandBufferDescriptor) -> bool);
}
inheritDepthStencilState :: (self: *MTLIndirectCommandBufferDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.inheritDepthStencilState, #type (self: *MTLIndirectCommandBufferDescriptor) -> bool);
}
inheritFrontFacingWinding :: (self: *MTLIndirectCommandBufferDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.inheritFrontFacingWinding, #type (self: *MTLIndirectCommandBufferDescriptor) -> bool);
}
inheritPipelineState :: (self: *MTLIndirectCommandBufferDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.inheritPipelineState, #type (self: *MTLIndirectCommandBufferDescriptor) -> bool);
}
inheritTriangleFillMode :: (self: *MTLIndirectCommandBufferDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.inheritTriangleFillMode, #type (self: *MTLIndirectCommandBufferDescriptor) -> bool);
}
maxFragmentBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxFragmentBufferBindCount, #type (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger);
}
maxKernelBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxKernelBufferBindCount, #type (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger);
}
maxKernelThreadgroupMemoryBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxKernelThreadgroupMemoryBindCount, #type (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger);
}
maxMeshBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxMeshBufferBindCount, #type (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger);
}
maxObjectBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxObjectBufferBindCount, #type (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger);
}
maxObjectThreadgroupMemoryBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxObjectThreadgroupMemoryBindCount, #type (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger);
}
maxVertexBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxVertexBufferBindCount, #type (self: *MTLIndirectCommandBufferDescriptor) -> NSUInteger);
}
setCommandTypes :: (self: *MTLIndirectCommandBufferDescriptor, commandTypes: MTLIndirectCommandType) -> () {
	#insert #run METHOD_BODY(__selectors.setCommandTypes_, #type (self: *MTLIndirectCommandBufferDescriptor, commandTypes: MTLIndirectCommandType) -> ());
}
setInheritBuffers :: (self: *MTLIndirectCommandBufferDescriptor, inheritBuffers: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setInheritBuffers_, #type (self: *MTLIndirectCommandBufferDescriptor, inheritBuffers: bool) -> ());
}
setInheritCullMode :: (self: *MTLIndirectCommandBufferDescriptor, inheritCullMode: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setInheritCullMode_, #type (self: *MTLIndirectCommandBufferDescriptor, inheritCullMode: bool) -> ());
}
setInheritDepthBias :: (self: *MTLIndirectCommandBufferDescriptor, inheritDepthBias: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setInheritDepthBias_, #type (self: *MTLIndirectCommandBufferDescriptor, inheritDepthBias: bool) -> ());
}
setInheritDepthClipMode :: (self: *MTLIndirectCommandBufferDescriptor, inheritDepthClipMode: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setInheritDepthClipMode_, #type (self: *MTLIndirectCommandBufferDescriptor, inheritDepthClipMode: bool) -> ());
}
setInheritDepthStencilState :: (self: *MTLIndirectCommandBufferDescriptor, inheritDepthStencilState: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setInheritDepthStencilState_, #type (self: *MTLIndirectCommandBufferDescriptor, inheritDepthStencilState: bool) -> ());
}
setInheritFrontFacingWinding :: (self: *MTLIndirectCommandBufferDescriptor, inheritFrontFacingWinding: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setInheritFrontFacingWinding_, #type (self: *MTLIndirectCommandBufferDescriptor, inheritFrontFacingWinding: bool) -> ());
}
setInheritPipelineState :: (self: *MTLIndirectCommandBufferDescriptor, inheritPipelineState: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setInheritPipelineState_, #type (self: *MTLIndirectCommandBufferDescriptor, inheritPipelineState: bool) -> ());
}
setInheritTriangleFillMode :: (self: *MTLIndirectCommandBufferDescriptor, inheritTriangleFillMode: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setInheritTriangleFillMode_, #type (self: *MTLIndirectCommandBufferDescriptor, inheritTriangleFillMode: bool) -> ());
}
setMaxFragmentBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor, maxFragmentBufferBindCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxFragmentBufferBindCount_, #type (self: *MTLIndirectCommandBufferDescriptor, maxFragmentBufferBindCount: NSUInteger) -> ());
}
setMaxKernelBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor, maxKernelBufferBindCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxKernelBufferBindCount_, #type (self: *MTLIndirectCommandBufferDescriptor, maxKernelBufferBindCount: NSUInteger) -> ());
}
setMaxKernelThreadgroupMemoryBindCount :: (self: *MTLIndirectCommandBufferDescriptor, maxKernelThreadgroupMemoryBindCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxKernelThreadgroupMemoryBindCount_, #type (self: *MTLIndirectCommandBufferDescriptor, maxKernelThreadgroupMemoryBindCount: NSUInteger) -> ());
}
setMaxMeshBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor, maxMeshBufferBindCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxMeshBufferBindCount_, #type (self: *MTLIndirectCommandBufferDescriptor, maxMeshBufferBindCount: NSUInteger) -> ());
}
setMaxObjectBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor, maxObjectBufferBindCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxObjectBufferBindCount_, #type (self: *MTLIndirectCommandBufferDescriptor, maxObjectBufferBindCount: NSUInteger) -> ());
}
setMaxObjectThreadgroupMemoryBindCount :: (self: *MTLIndirectCommandBufferDescriptor, maxObjectThreadgroupMemoryBindCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxObjectThreadgroupMemoryBindCount_, #type (self: *MTLIndirectCommandBufferDescriptor, maxObjectThreadgroupMemoryBindCount: NSUInteger) -> ());
}
setMaxVertexBufferBindCount :: (self: *MTLIndirectCommandBufferDescriptor, maxVertexBufferBindCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxVertexBufferBindCount_, #type (self: *MTLIndirectCommandBufferDescriptor, maxVertexBufferBindCount: NSUInteger) -> ());
}
setSupportColorAttachmentMapping :: (self: *MTLIndirectCommandBufferDescriptor, supportColorAttachmentMapping: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportColorAttachmentMapping_, #type (self: *MTLIndirectCommandBufferDescriptor, supportColorAttachmentMapping: bool) -> ());
}
setSupportDynamicAttributeStride :: (self: *MTLIndirectCommandBufferDescriptor, supportDynamicAttributeStride: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportDynamicAttributeStride_, #type (self: *MTLIndirectCommandBufferDescriptor, supportDynamicAttributeStride: bool) -> ());
}
setSupportRayTracing :: (self: *MTLIndirectCommandBufferDescriptor, supportRayTracing: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportRayTracing_, #type (self: *MTLIndirectCommandBufferDescriptor, supportRayTracing: bool) -> ());
}
supportColorAttachmentMapping :: (self: *MTLIndirectCommandBufferDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportColorAttachmentMapping, #type (self: *MTLIndirectCommandBufferDescriptor) -> bool);
}
supportDynamicAttributeStride :: (self: *MTLIndirectCommandBufferDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportDynamicAttributeStride, #type (self: *MTLIndirectCommandBufferDescriptor) -> bool);
}
supportRayTracing :: (self: *MTLIndirectCommandBufferDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportRayTracing, #type (self: *MTLIndirectCommandBufferDescriptor) -> bool);
}


MTLIndirectCommandBuffer :: struct { using #as _: MTLResource; }
gpuResourceID :: (self: *MTLIndirectCommandBuffer) -> MTLResourceID {
	#insert #run METHOD_BODY(__selectors.gpuResourceID, #type (self: *MTLIndirectCommandBuffer) -> MTLResourceID);
}
indirectComputeCommand :: (self: *MTLIndirectCommandBuffer, commandIndex: NSUInteger) -> *MTLIndirectComputeCommand {
	#insert #run METHOD_BODY(__selectors.indirectComputeCommandAtIndex_, #type (self: *MTLIndirectCommandBuffer, commandIndex: NSUInteger) -> *MTLIndirectComputeCommand);
}
indirectRenderCommand :: (self: *MTLIndirectCommandBuffer, commandIndex: NSUInteger) -> *MTLIndirectRenderCommand {
	#insert #run METHOD_BODY(__selectors.indirectRenderCommandAtIndex_, #type (self: *MTLIndirectCommandBuffer, commandIndex: NSUInteger) -> *MTLIndirectRenderCommand);
}
reset :: (self: *MTLIndirectCommandBuffer, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.resetWithRange_, #type (self: *MTLIndirectCommandBuffer, range: NSRange) -> ());
}
size :: (self: *MTLIndirectCommandBuffer) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.size, #type (self: *MTLIndirectCommandBuffer) -> NSUInteger);
}


MTLRenderPipelineColorAttachmentDescriptor :: struct {}
alphaBlendOperation :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation {
	#insert #run METHOD_BODY(__selectors.alphaBlendOperation, #type (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation);
}
blendingEnabled :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isBlendingEnabled, #type (self: *MTLRenderPipelineColorAttachmentDescriptor) -> bool);
}
destinationAlphaBlendFactor :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
	#insert #run METHOD_BODY(__selectors.destinationAlphaBlendFactor, #type (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor);
}
destinationRGBBlendFactor :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
	#insert #run METHOD_BODY(__selectors.destinationRGBBlendFactor, #type (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor);
}
isBlendingEnabled :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isBlendingEnabled, #type (self: *MTLRenderPipelineColorAttachmentDescriptor) -> bool);
}
pixelFormat :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLPixelFormat {
	#insert #run METHOD_BODY(__selectors.pixelFormat, #type (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLPixelFormat);
}
rgbBlendOperation :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation {
	#insert #run METHOD_BODY(__selectors.rgbBlendOperation, #type (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendOperation);
}
setAlphaBlendOperation :: (self: *MTLRenderPipelineColorAttachmentDescriptor, alphaBlendOperation: MTLBlendOperation) -> () {
	#insert #run METHOD_BODY(__selectors.setAlphaBlendOperation_, #type (self: *MTLRenderPipelineColorAttachmentDescriptor, alphaBlendOperation: MTLBlendOperation) -> ());
}
setBlendingEnabled :: (self: *MTLRenderPipelineColorAttachmentDescriptor, blendingEnabled: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setBlendingEnabled_, #type (self: *MTLRenderPipelineColorAttachmentDescriptor, blendingEnabled: bool) -> ());
}
setDestinationAlphaBlendFactor :: (self: *MTLRenderPipelineColorAttachmentDescriptor, destinationAlphaBlendFactor: MTLBlendFactor) -> () {
	#insert #run METHOD_BODY(__selectors.setDestinationAlphaBlendFactor_, #type (self: *MTLRenderPipelineColorAttachmentDescriptor, destinationAlphaBlendFactor: MTLBlendFactor) -> ());
}
setDestinationRGBBlendFactor :: (self: *MTLRenderPipelineColorAttachmentDescriptor, destinationRGBBlendFactor: MTLBlendFactor) -> () {
	#insert #run METHOD_BODY(__selectors.setDestinationRGBBlendFactor_, #type (self: *MTLRenderPipelineColorAttachmentDescriptor, destinationRGBBlendFactor: MTLBlendFactor) -> ());
}
setPixelFormat :: (self: *MTLRenderPipelineColorAttachmentDescriptor, pixelFormat: MTLPixelFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setPixelFormat_, #type (self: *MTLRenderPipelineColorAttachmentDescriptor, pixelFormat: MTLPixelFormat) -> ());
}
setRgbBlendOperation :: (self: *MTLRenderPipelineColorAttachmentDescriptor, rgbBlendOperation: MTLBlendOperation) -> () {
	#insert #run METHOD_BODY(__selectors.setRgbBlendOperation_, #type (self: *MTLRenderPipelineColorAttachmentDescriptor, rgbBlendOperation: MTLBlendOperation) -> ());
}
setSourceAlphaBlendFactor :: (self: *MTLRenderPipelineColorAttachmentDescriptor, sourceAlphaBlendFactor: MTLBlendFactor) -> () {
	#insert #run METHOD_BODY(__selectors.setSourceAlphaBlendFactor_, #type (self: *MTLRenderPipelineColorAttachmentDescriptor, sourceAlphaBlendFactor: MTLBlendFactor) -> ());
}
setSourceRGBBlendFactor :: (self: *MTLRenderPipelineColorAttachmentDescriptor, sourceRGBBlendFactor: MTLBlendFactor) -> () {
	#insert #run METHOD_BODY(__selectors.setSourceRGBBlendFactor_, #type (self: *MTLRenderPipelineColorAttachmentDescriptor, sourceRGBBlendFactor: MTLBlendFactor) -> ());
}
setWriteMask :: (self: *MTLRenderPipelineColorAttachmentDescriptor, writeMask: MTLColorWriteMask) -> () {
	#insert #run METHOD_BODY(__selectors.setWriteMask_, #type (self: *MTLRenderPipelineColorAttachmentDescriptor, writeMask: MTLColorWriteMask) -> ());
}
sourceAlphaBlendFactor :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
	#insert #run METHOD_BODY(__selectors.sourceAlphaBlendFactor, #type (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor);
}
sourceRGBBlendFactor :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor {
	#insert #run METHOD_BODY(__selectors.sourceRGBBlendFactor, #type (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLBlendFactor);
}
writeMask :: (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLColorWriteMask {
	#insert #run METHOD_BODY(__selectors.writeMask, #type (self: *MTLRenderPipelineColorAttachmentDescriptor) -> MTLColorWriteMask);
}


MTLLogicalToPhysicalColorAttachmentMap :: struct {}
getPhysicalIndex :: (self: *MTLLogicalToPhysicalColorAttachmentMap, logicalIndex: NSUInteger) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.getPhysicalIndexForLogicalIndex_, #type (self: *MTLLogicalToPhysicalColorAttachmentMap, logicalIndex: NSUInteger) -> NSUInteger);
}
reset :: (self: *MTLLogicalToPhysicalColorAttachmentMap) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTLLogicalToPhysicalColorAttachmentMap) -> ());
}
setPhysicalIndex :: (self: *MTLLogicalToPhysicalColorAttachmentMap, physicalIndex: NSUInteger, logicalIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setPhysicalIndex_forLogicalIndex_, #type (self: *MTLLogicalToPhysicalColorAttachmentMap, physicalIndex: NSUInteger, logicalIndex: NSUInteger) -> ());
}


MTLRenderPipelineReflection :: struct {}
fragmentArguments :: (self: *MTLRenderPipelineReflection) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.fragmentArguments, #type (self: *MTLRenderPipelineReflection) -> *NSArray);
}
fragmentBindings :: (self: *MTLRenderPipelineReflection) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.fragmentBindings, #type (self: *MTLRenderPipelineReflection) -> *NSArray);
}
meshBindings :: (self: *MTLRenderPipelineReflection) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.meshBindings, #type (self: *MTLRenderPipelineReflection) -> *NSArray);
}
objectBindings :: (self: *MTLRenderPipelineReflection) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.objectBindings, #type (self: *MTLRenderPipelineReflection) -> *NSArray);
}
tileArguments :: (self: *MTLRenderPipelineReflection) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.tileArguments, #type (self: *MTLRenderPipelineReflection) -> *NSArray);
}
tileBindings :: (self: *MTLRenderPipelineReflection) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.tileBindings, #type (self: *MTLRenderPipelineReflection) -> *NSArray);
}
vertexArguments :: (self: *MTLRenderPipelineReflection) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.vertexArguments, #type (self: *MTLRenderPipelineReflection) -> *NSArray);
}
vertexBindings :: (self: *MTLRenderPipelineReflection) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.vertexBindings, #type (self: *MTLRenderPipelineReflection) -> *NSArray);
}


MTLRenderPipelineDescriptor :: struct {}
alphaToCoverageEnabled :: (self: *MTLRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isAlphaToCoverageEnabled, #type (self: *MTLRenderPipelineDescriptor) -> bool);
}
alphaToOneEnabled :: (self: *MTLRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isAlphaToOneEnabled, #type (self: *MTLRenderPipelineDescriptor) -> bool);
}
binaryArchives :: (self: *MTLRenderPipelineDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.binaryArchives, #type (self: *MTLRenderPipelineDescriptor) -> *NSArray);
}
colorAttachments :: (self: *MTLRenderPipelineDescriptor) -> *MTLRenderPipelineColorAttachmentDescriptorArray {
	#insert #run METHOD_BODY(__selectors.colorAttachments, #type (self: *MTLRenderPipelineDescriptor) -> *MTLRenderPipelineColorAttachmentDescriptorArray);
}
depthAttachmentPixelFormat :: (self: *MTLRenderPipelineDescriptor) -> MTLPixelFormat {
	#insert #run METHOD_BODY(__selectors.depthAttachmentPixelFormat, #type (self: *MTLRenderPipelineDescriptor) -> MTLPixelFormat);
}
fragmentBuffers :: (self: *MTLRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
	#insert #run METHOD_BODY(__selectors.fragmentBuffers, #type (self: *MTLRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray);
}
fragmentFunction :: (self: *MTLRenderPipelineDescriptor) -> *MTLFunction {
	#insert #run METHOD_BODY(__selectors.fragmentFunction, #type (self: *MTLRenderPipelineDescriptor) -> *MTLFunction);
}
fragmentLinkedFunctions :: (self: *MTLRenderPipelineDescriptor) -> *MTLLinkedFunctions {
	#insert #run METHOD_BODY(__selectors.fragmentLinkedFunctions, #type (self: *MTLRenderPipelineDescriptor) -> *MTLLinkedFunctions);
}
fragmentPreloadedLibraries :: (self: *MTLRenderPipelineDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.fragmentPreloadedLibraries, #type (self: *MTLRenderPipelineDescriptor) -> *NSArray);
}
inputPrimitiveTopology :: (self: *MTLRenderPipelineDescriptor) -> MTLPrimitiveTopologyClass {
	#insert #run METHOD_BODY(__selectors.inputPrimitiveTopology, #type (self: *MTLRenderPipelineDescriptor) -> MTLPrimitiveTopologyClass);
}
isAlphaToCoverageEnabled :: (self: *MTLRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isAlphaToCoverageEnabled, #type (self: *MTLRenderPipelineDescriptor) -> bool);
}
isAlphaToOneEnabled :: (self: *MTLRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isAlphaToOneEnabled, #type (self: *MTLRenderPipelineDescriptor) -> bool);
}
isRasterizationEnabled :: (self: *MTLRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isRasterizationEnabled, #type (self: *MTLRenderPipelineDescriptor) -> bool);
}
isTessellationFactorScaleEnabled :: (self: *MTLRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isTessellationFactorScaleEnabled, #type (self: *MTLRenderPipelineDescriptor) -> bool);
}
label :: (self: *MTLRenderPipelineDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLRenderPipelineDescriptor) -> *NSString);
}
maxFragmentCallStackDepth :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxFragmentCallStackDepth, #type (self: *MTLRenderPipelineDescriptor) -> NSUInteger);
}
maxTessellationFactor :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTessellationFactor, #type (self: *MTLRenderPipelineDescriptor) -> NSUInteger);
}
maxVertexAmplificationCount :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxVertexAmplificationCount, #type (self: *MTLRenderPipelineDescriptor) -> NSUInteger);
}
maxVertexCallStackDepth :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxVertexCallStackDepth, #type (self: *MTLRenderPipelineDescriptor) -> NSUInteger);
}
rasterSampleCount :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.rasterSampleCount, #type (self: *MTLRenderPipelineDescriptor) -> NSUInteger);
}
rasterizationEnabled :: (self: *MTLRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isRasterizationEnabled, #type (self: *MTLRenderPipelineDescriptor) -> bool);
}
reset :: (self: *MTLRenderPipelineDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTLRenderPipelineDescriptor) -> ());
}
sampleCount :: (self: *MTLRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.sampleCount, #type (self: *MTLRenderPipelineDescriptor) -> NSUInteger);
}
setAlphaToCoverageEnabled :: (self: *MTLRenderPipelineDescriptor, alphaToCoverageEnabled: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setAlphaToCoverageEnabled_, #type (self: *MTLRenderPipelineDescriptor, alphaToCoverageEnabled: bool) -> ());
}
setAlphaToOneEnabled :: (self: *MTLRenderPipelineDescriptor, alphaToOneEnabled: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setAlphaToOneEnabled_, #type (self: *MTLRenderPipelineDescriptor, alphaToOneEnabled: bool) -> ());
}
setBinaryArchives :: (self: *MTLRenderPipelineDescriptor, binaryArchives: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setBinaryArchives_, #type (self: *MTLRenderPipelineDescriptor, binaryArchives: *NSArray) -> ());
}
setDepthAttachmentPixelFormat :: (self: *MTLRenderPipelineDescriptor, depthAttachmentPixelFormat: MTLPixelFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthAttachmentPixelFormat_, #type (self: *MTLRenderPipelineDescriptor, depthAttachmentPixelFormat: MTLPixelFormat) -> ());
}
setFragmentFunction :: (self: *MTLRenderPipelineDescriptor, fragmentFunction: *MTLFunction) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentFunction_, #type (self: *MTLRenderPipelineDescriptor, fragmentFunction: *MTLFunction) -> ());
}
setFragmentLinkedFunctions :: (self: *MTLRenderPipelineDescriptor, fragmentLinkedFunctions: *MTLLinkedFunctions) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentLinkedFunctions_, #type (self: *MTLRenderPipelineDescriptor, fragmentLinkedFunctions: *MTLLinkedFunctions) -> ());
}
setFragmentPreloadedLibraries :: (self: *MTLRenderPipelineDescriptor, fragmentPreloadedLibraries: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentPreloadedLibraries_, #type (self: *MTLRenderPipelineDescriptor, fragmentPreloadedLibraries: *NSArray) -> ());
}
setInputPrimitiveTopology :: (self: *MTLRenderPipelineDescriptor, inputPrimitiveTopology: MTLPrimitiveTopologyClass) -> () {
	#insert #run METHOD_BODY(__selectors.setInputPrimitiveTopology_, #type (self: *MTLRenderPipelineDescriptor, inputPrimitiveTopology: MTLPrimitiveTopologyClass) -> ());
}
setLabel :: (self: *MTLRenderPipelineDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLRenderPipelineDescriptor, label: *NSString) -> ());
}
setMaxFragmentCallStackDepth :: (self: *MTLRenderPipelineDescriptor, maxFragmentCallStackDepth: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxFragmentCallStackDepth_, #type (self: *MTLRenderPipelineDescriptor, maxFragmentCallStackDepth: NSUInteger) -> ());
}
setMaxTessellationFactor :: (self: *MTLRenderPipelineDescriptor, maxTessellationFactor: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxTessellationFactor_, #type (self: *MTLRenderPipelineDescriptor, maxTessellationFactor: NSUInteger) -> ());
}
setMaxVertexAmplificationCount :: (self: *MTLRenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxVertexAmplificationCount_, #type (self: *MTLRenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> ());
}
setMaxVertexCallStackDepth :: (self: *MTLRenderPipelineDescriptor, maxVertexCallStackDepth: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxVertexCallStackDepth_, #type (self: *MTLRenderPipelineDescriptor, maxVertexCallStackDepth: NSUInteger) -> ());
}
setRasterSampleCount :: (self: *MTLRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRasterSampleCount_, #type (self: *MTLRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> ());
}
setRasterizationEnabled :: (self: *MTLRenderPipelineDescriptor, rasterizationEnabled: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setRasterizationEnabled_, #type (self: *MTLRenderPipelineDescriptor, rasterizationEnabled: bool) -> ());
}
setSampleCount :: (self: *MTLRenderPipelineDescriptor, sampleCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSampleCount_, #type (self: *MTLRenderPipelineDescriptor, sampleCount: NSUInteger) -> ());
}
setShaderValidation :: (self: *MTLRenderPipelineDescriptor, shaderValidation: MTLShaderValidation) -> () {
	#insert #run METHOD_BODY(__selectors.setShaderValidation_, #type (self: *MTLRenderPipelineDescriptor, shaderValidation: MTLShaderValidation) -> ());
}
setStencilAttachmentPixelFormat :: (self: *MTLRenderPipelineDescriptor, stencilAttachmentPixelFormat: MTLPixelFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setStencilAttachmentPixelFormat_, #type (self: *MTLRenderPipelineDescriptor, stencilAttachmentPixelFormat: MTLPixelFormat) -> ());
}
setSupportAddingFragmentBinaryFunctions :: (self: *MTLRenderPipelineDescriptor, supportAddingFragmentBinaryFunctions: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportAddingFragmentBinaryFunctions_, #type (self: *MTLRenderPipelineDescriptor, supportAddingFragmentBinaryFunctions: bool) -> ());
}
setSupportAddingVertexBinaryFunctions :: (self: *MTLRenderPipelineDescriptor, supportAddingVertexBinaryFunctions: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportAddingVertexBinaryFunctions_, #type (self: *MTLRenderPipelineDescriptor, supportAddingVertexBinaryFunctions: bool) -> ());
}
setSupportIndirectCommandBuffers :: (self: *MTLRenderPipelineDescriptor, supportIndirectCommandBuffers: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportIndirectCommandBuffers_, #type (self: *MTLRenderPipelineDescriptor, supportIndirectCommandBuffers: bool) -> ());
}
setTessellationControlPointIndexType :: (self: *MTLRenderPipelineDescriptor, tessellationControlPointIndexType: MTLTessellationControlPointIndexType) -> () {
	#insert #run METHOD_BODY(__selectors.setTessellationControlPointIndexType_, #type (self: *MTLRenderPipelineDescriptor, tessellationControlPointIndexType: MTLTessellationControlPointIndexType) -> ());
}
setTessellationFactorFormat :: (self: *MTLRenderPipelineDescriptor, tessellationFactorFormat: MTLTessellationFactorFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setTessellationFactorFormat_, #type (self: *MTLRenderPipelineDescriptor, tessellationFactorFormat: MTLTessellationFactorFormat) -> ());
}
setTessellationFactorScaleEnabled :: (self: *MTLRenderPipelineDescriptor, tessellationFactorScaleEnabled: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setTessellationFactorScaleEnabled_, #type (self: *MTLRenderPipelineDescriptor, tessellationFactorScaleEnabled: bool) -> ());
}
setTessellationFactorStepFunction :: (self: *MTLRenderPipelineDescriptor, tessellationFactorStepFunction: MTLTessellationFactorStepFunction) -> () {
	#insert #run METHOD_BODY(__selectors.setTessellationFactorStepFunction_, #type (self: *MTLRenderPipelineDescriptor, tessellationFactorStepFunction: MTLTessellationFactorStepFunction) -> ());
}
setTessellationOutputWindingOrder :: (self: *MTLRenderPipelineDescriptor, tessellationOutputWindingOrder: MTLWinding) -> () {
	#insert #run METHOD_BODY(__selectors.setTessellationOutputWindingOrder_, #type (self: *MTLRenderPipelineDescriptor, tessellationOutputWindingOrder: MTLWinding) -> ());
}
setTessellationPartitionMode :: (self: *MTLRenderPipelineDescriptor, tessellationPartitionMode: MTLTessellationPartitionMode) -> () {
	#insert #run METHOD_BODY(__selectors.setTessellationPartitionMode_, #type (self: *MTLRenderPipelineDescriptor, tessellationPartitionMode: MTLTessellationPartitionMode) -> ());
}
setVertexDescriptor :: (self: *MTLRenderPipelineDescriptor, vertexDescriptor: *MTLVertexDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexDescriptor_, #type (self: *MTLRenderPipelineDescriptor, vertexDescriptor: *MTLVertexDescriptor) -> ());
}
setVertexFunction :: (self: *MTLRenderPipelineDescriptor, vertexFunction: *MTLFunction) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexFunction_, #type (self: *MTLRenderPipelineDescriptor, vertexFunction: *MTLFunction) -> ());
}
setVertexLinkedFunctions :: (self: *MTLRenderPipelineDescriptor, vertexLinkedFunctions: *MTLLinkedFunctions) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexLinkedFunctions_, #type (self: *MTLRenderPipelineDescriptor, vertexLinkedFunctions: *MTLLinkedFunctions) -> ());
}
setVertexPreloadedLibraries :: (self: *MTLRenderPipelineDescriptor, vertexPreloadedLibraries: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexPreloadedLibraries_, #type (self: *MTLRenderPipelineDescriptor, vertexPreloadedLibraries: *NSArray) -> ());
}
shaderValidation :: (self: *MTLRenderPipelineDescriptor) -> MTLShaderValidation {
	#insert #run METHOD_BODY(__selectors.shaderValidation, #type (self: *MTLRenderPipelineDescriptor) -> MTLShaderValidation);
}
stencilAttachmentPixelFormat :: (self: *MTLRenderPipelineDescriptor) -> MTLPixelFormat {
	#insert #run METHOD_BODY(__selectors.stencilAttachmentPixelFormat, #type (self: *MTLRenderPipelineDescriptor) -> MTLPixelFormat);
}
supportAddingFragmentBinaryFunctions :: (self: *MTLRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportAddingFragmentBinaryFunctions, #type (self: *MTLRenderPipelineDescriptor) -> bool);
}
supportAddingVertexBinaryFunctions :: (self: *MTLRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportAddingVertexBinaryFunctions, #type (self: *MTLRenderPipelineDescriptor) -> bool);
}
supportIndirectCommandBuffers :: (self: *MTLRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportIndirectCommandBuffers, #type (self: *MTLRenderPipelineDescriptor) -> bool);
}
tessellationControlPointIndexType :: (self: *MTLRenderPipelineDescriptor) -> MTLTessellationControlPointIndexType {
	#insert #run METHOD_BODY(__selectors.tessellationControlPointIndexType, #type (self: *MTLRenderPipelineDescriptor) -> MTLTessellationControlPointIndexType);
}
tessellationFactorFormat :: (self: *MTLRenderPipelineDescriptor) -> MTLTessellationFactorFormat {
	#insert #run METHOD_BODY(__selectors.tessellationFactorFormat, #type (self: *MTLRenderPipelineDescriptor) -> MTLTessellationFactorFormat);
}
tessellationFactorScaleEnabled :: (self: *MTLRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isTessellationFactorScaleEnabled, #type (self: *MTLRenderPipelineDescriptor) -> bool);
}
tessellationFactorStepFunction :: (self: *MTLRenderPipelineDescriptor) -> MTLTessellationFactorStepFunction {
	#insert #run METHOD_BODY(__selectors.tessellationFactorStepFunction, #type (self: *MTLRenderPipelineDescriptor) -> MTLTessellationFactorStepFunction);
}
tessellationOutputWindingOrder :: (self: *MTLRenderPipelineDescriptor) -> MTLWinding {
	#insert #run METHOD_BODY(__selectors.tessellationOutputWindingOrder, #type (self: *MTLRenderPipelineDescriptor) -> MTLWinding);
}
tessellationPartitionMode :: (self: *MTLRenderPipelineDescriptor) -> MTLTessellationPartitionMode {
	#insert #run METHOD_BODY(__selectors.tessellationPartitionMode, #type (self: *MTLRenderPipelineDescriptor) -> MTLTessellationPartitionMode);
}
vertexBuffers :: (self: *MTLRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
	#insert #run METHOD_BODY(__selectors.vertexBuffers, #type (self: *MTLRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray);
}
vertexDescriptor :: (self: *MTLRenderPipelineDescriptor) -> *MTLVertexDescriptor {
	#insert #run METHOD_BODY(__selectors.vertexDescriptor, #type (self: *MTLRenderPipelineDescriptor) -> *MTLVertexDescriptor);
}
vertexFunction :: (self: *MTLRenderPipelineDescriptor) -> *MTLFunction {
	#insert #run METHOD_BODY(__selectors.vertexFunction, #type (self: *MTLRenderPipelineDescriptor) -> *MTLFunction);
}
vertexLinkedFunctions :: (self: *MTLRenderPipelineDescriptor) -> *MTLLinkedFunctions {
	#insert #run METHOD_BODY(__selectors.vertexLinkedFunctions, #type (self: *MTLRenderPipelineDescriptor) -> *MTLLinkedFunctions);
}
vertexPreloadedLibraries :: (self: *MTLRenderPipelineDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.vertexPreloadedLibraries, #type (self: *MTLRenderPipelineDescriptor) -> *NSArray);
}


MTLRenderPipelineFunctionsDescriptor :: struct {}
fragmentAdditionalBinaryFunctions :: (self: *MTLRenderPipelineFunctionsDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.fragmentAdditionalBinaryFunctions, #type (self: *MTLRenderPipelineFunctionsDescriptor) -> *NSArray);
}
setFragmentAdditionalBinaryFunctions :: (self: *MTLRenderPipelineFunctionsDescriptor, fragmentAdditionalBinaryFunctions: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentAdditionalBinaryFunctions_, #type (self: *MTLRenderPipelineFunctionsDescriptor, fragmentAdditionalBinaryFunctions: *NSArray) -> ());
}
setTileAdditionalBinaryFunctions :: (self: *MTLRenderPipelineFunctionsDescriptor, tileAdditionalBinaryFunctions: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setTileAdditionalBinaryFunctions_, #type (self: *MTLRenderPipelineFunctionsDescriptor, tileAdditionalBinaryFunctions: *NSArray) -> ());
}
setVertexAdditionalBinaryFunctions :: (self: *MTLRenderPipelineFunctionsDescriptor, vertexAdditionalBinaryFunctions: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexAdditionalBinaryFunctions_, #type (self: *MTLRenderPipelineFunctionsDescriptor, vertexAdditionalBinaryFunctions: *NSArray) -> ());
}
tileAdditionalBinaryFunctions :: (self: *MTLRenderPipelineFunctionsDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.tileAdditionalBinaryFunctions, #type (self: *MTLRenderPipelineFunctionsDescriptor) -> *NSArray);
}
vertexAdditionalBinaryFunctions :: (self: *MTLRenderPipelineFunctionsDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.vertexAdditionalBinaryFunctions, #type (self: *MTLRenderPipelineFunctionsDescriptor) -> *NSArray);
}


MTLRenderPipelineState :: struct { using #as _: MTLAllocation; }
device :: (self: *MTLRenderPipelineState) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLRenderPipelineState) -> *MTLDevice);
}
functionHandle :: (self: *MTLRenderPipelineState, name: *NSString, stage: MTLRenderStages) -> *MTLFunctionHandle {
	#insert #run METHOD_BODY(__selectors.functionHandleWithName_stage_, #type (self: *MTLRenderPipelineState, name: *NSString, stage: MTLRenderStages) -> *MTLFunctionHandle);
}
functionHandle :: (self: *MTLRenderPipelineState, function: *MTL4BinaryFunction, stage: MTLRenderStages) -> *MTLFunctionHandle {
	#insert #run METHOD_BODY(__selectors.functionHandleWithBinaryFunction_stage_, #type (self: *MTLRenderPipelineState, function: *MTL4BinaryFunction, stage: MTLRenderStages) -> *MTLFunctionHandle);
}
functionHandle :: (self: *MTLRenderPipelineState, function: *MTLFunction, stage: MTLRenderStages) -> *MTLFunctionHandle {
	#insert #run METHOD_BODY(__selectors.functionHandleWithFunction_stage_, #type (self: *MTLRenderPipelineState, function: *MTLFunction, stage: MTLRenderStages) -> *MTLFunctionHandle);
}
gpuResourceID :: (self: *MTLRenderPipelineState) -> MTLResourceID {
	#insert #run METHOD_BODY(__selectors.gpuResourceID, #type (self: *MTLRenderPipelineState) -> MTLResourceID);
}
imageblockMemoryLength :: (self: *MTLRenderPipelineState, imageblockDimensions: MTLSize) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.imageblockMemoryLengthForDimensions_, #type (self: *MTLRenderPipelineState, imageblockDimensions: MTLSize) -> NSUInteger);
}
imageblockSampleLength :: (self: *MTLRenderPipelineState) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.imageblockSampleLength, #type (self: *MTLRenderPipelineState) -> NSUInteger);
}
label :: (self: *MTLRenderPipelineState) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLRenderPipelineState) -> *NSString);
}
maxTotalThreadgroupsPerMeshGrid :: (self: *MTLRenderPipelineState) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTotalThreadgroupsPerMeshGrid, #type (self: *MTLRenderPipelineState) -> NSUInteger);
}
maxTotalThreadsPerMeshThreadgroup :: (self: *MTLRenderPipelineState) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTotalThreadsPerMeshThreadgroup, #type (self: *MTLRenderPipelineState) -> NSUInteger);
}
maxTotalThreadsPerObjectThreadgroup :: (self: *MTLRenderPipelineState) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTotalThreadsPerObjectThreadgroup, #type (self: *MTLRenderPipelineState) -> NSUInteger);
}
maxTotalThreadsPerThreadgroup :: (self: *MTLRenderPipelineState) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTotalThreadsPerThreadgroup, #type (self: *MTLRenderPipelineState) -> NSUInteger);
}
meshThreadExecutionWidth :: (self: *MTLRenderPipelineState) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.meshThreadExecutionWidth, #type (self: *MTLRenderPipelineState) -> NSUInteger);
}
newIntersectionFunctionTable :: (self: *MTLRenderPipelineState, descriptor: *MTLIntersectionFunctionTableDescriptor, stage: MTLRenderStages) -> *MTLIntersectionFunctionTable {
	#insert #run METHOD_BODY(__selectors.newIntersectionFunctionTableWithDescriptor_stage_, #type (self: *MTLRenderPipelineState, descriptor: *MTLIntersectionFunctionTableDescriptor, stage: MTLRenderStages) -> *MTLIntersectionFunctionTable);
}
newRenderPipelineDescriptor :: (self: *MTLRenderPipelineState) -> *MTL4PipelineDescriptor {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineDescriptorForSpecialization, #type (self: *MTLRenderPipelineState) -> *MTL4PipelineDescriptor);
}
newRenderPipelineState :: (self: *MTLRenderPipelineState, binaryFunctionsDescriptor: *MTL4RenderPipelineBinaryFunctionsDescriptor, error: **NSError) -> *MTLRenderPipelineState {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateWithBinaryFunctions_error_, #type (self: *MTLRenderPipelineState, binaryFunctionsDescriptor: *MTL4RenderPipelineBinaryFunctionsDescriptor, error: **NSError) -> *MTLRenderPipelineState);
}
newRenderPipelineState :: (self: *MTLRenderPipelineState, additionalBinaryFunctions: *MTLRenderPipelineFunctionsDescriptor, error: **NSError) -> *MTLRenderPipelineState {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateWithAdditionalBinaryFunctions_error_, #type (self: *MTLRenderPipelineState, additionalBinaryFunctions: *MTLRenderPipelineFunctionsDescriptor, error: **NSError) -> *MTLRenderPipelineState);
}
newVisibleFunctionTable :: (self: *MTLRenderPipelineState, descriptor: *MTLVisibleFunctionTableDescriptor, stage: MTLRenderStages) -> *MTLVisibleFunctionTable {
	#insert #run METHOD_BODY(__selectors.newVisibleFunctionTableWithDescriptor_stage_, #type (self: *MTLRenderPipelineState, descriptor: *MTLVisibleFunctionTableDescriptor, stage: MTLRenderStages) -> *MTLVisibleFunctionTable);
}
objectThreadExecutionWidth :: (self: *MTLRenderPipelineState) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.objectThreadExecutionWidth, #type (self: *MTLRenderPipelineState) -> NSUInteger);
}
reflection :: (self: *MTLRenderPipelineState) -> *MTLRenderPipelineReflection {
	#insert #run METHOD_BODY(__selectors.reflection, #type (self: *MTLRenderPipelineState) -> *MTLRenderPipelineReflection);
}
requiredThreadsPerMeshThreadgroup :: (self: *MTLRenderPipelineState) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.requiredThreadsPerMeshThreadgroup, #type (self: *MTLRenderPipelineState) -> MTLSize);
}
requiredThreadsPerObjectThreadgroup :: (self: *MTLRenderPipelineState) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.requiredThreadsPerObjectThreadgroup, #type (self: *MTLRenderPipelineState) -> MTLSize);
}
requiredThreadsPerTileThreadgroup :: (self: *MTLRenderPipelineState) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.requiredThreadsPerTileThreadgroup, #type (self: *MTLRenderPipelineState) -> MTLSize);
}
shaderValidation :: (self: *MTLRenderPipelineState) -> MTLShaderValidation {
	#insert #run METHOD_BODY(__selectors.shaderValidation, #type (self: *MTLRenderPipelineState) -> MTLShaderValidation);
}
supportIndirectCommandBuffers :: (self: *MTLRenderPipelineState) -> bool {
	#insert #run METHOD_BODY(__selectors.supportIndirectCommandBuffers, #type (self: *MTLRenderPipelineState) -> bool);
}
threadgroupSizeMatchesTileSize :: (self: *MTLRenderPipelineState) -> bool {
	#insert #run METHOD_BODY(__selectors.threadgroupSizeMatchesTileSize, #type (self: *MTLRenderPipelineState) -> bool);
}


MTLRenderPipelineColorAttachmentDescriptorArray :: struct {}
object :: (self: *MTLRenderPipelineColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLRenderPipelineColorAttachmentDescriptor {
	#insert #run METHOD_BODY(__selectors.objectAtIndexedSubscript_, #type (self: *MTLRenderPipelineColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLRenderPipelineColorAttachmentDescriptor);
}
setObject :: (self: *MTLRenderPipelineColorAttachmentDescriptorArray, attachment: *MTLRenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObject_atIndexedSubscript_, #type (self: *MTLRenderPipelineColorAttachmentDescriptorArray, attachment: *MTLRenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> ());
}


MTLTileRenderPipelineColorAttachmentDescriptor :: struct {}
pixelFormat :: (self: *MTLTileRenderPipelineColorAttachmentDescriptor) -> MTLPixelFormat {
	#insert #run METHOD_BODY(__selectors.pixelFormat, #type (self: *MTLTileRenderPipelineColorAttachmentDescriptor) -> MTLPixelFormat);
}
setPixelFormat :: (self: *MTLTileRenderPipelineColorAttachmentDescriptor, pixelFormat: MTLPixelFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setPixelFormat_, #type (self: *MTLTileRenderPipelineColorAttachmentDescriptor, pixelFormat: MTLPixelFormat) -> ());
}


MTLTileRenderPipelineColorAttachmentDescriptorArray :: struct {}
object :: (self: *MTLTileRenderPipelineColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLTileRenderPipelineColorAttachmentDescriptor {
	#insert #run METHOD_BODY(__selectors.objectAtIndexedSubscript_, #type (self: *MTLTileRenderPipelineColorAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLTileRenderPipelineColorAttachmentDescriptor);
}
setObject :: (self: *MTLTileRenderPipelineColorAttachmentDescriptorArray, attachment: *MTLTileRenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObject_atIndexedSubscript_, #type (self: *MTLTileRenderPipelineColorAttachmentDescriptorArray, attachment: *MTLTileRenderPipelineColorAttachmentDescriptor, attachmentIndex: NSUInteger) -> ());
}


MTLTileRenderPipelineDescriptor :: struct {}
binaryArchives :: (self: *MTLTileRenderPipelineDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.binaryArchives, #type (self: *MTLTileRenderPipelineDescriptor) -> *NSArray);
}
colorAttachments :: (self: *MTLTileRenderPipelineDescriptor) -> *MTLTileRenderPipelineColorAttachmentDescriptorArray {
	#insert #run METHOD_BODY(__selectors.colorAttachments, #type (self: *MTLTileRenderPipelineDescriptor) -> *MTLTileRenderPipelineColorAttachmentDescriptorArray);
}
label :: (self: *MTLTileRenderPipelineDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLTileRenderPipelineDescriptor) -> *NSString);
}
linkedFunctions :: (self: *MTLTileRenderPipelineDescriptor) -> *MTLLinkedFunctions {
	#insert #run METHOD_BODY(__selectors.linkedFunctions, #type (self: *MTLTileRenderPipelineDescriptor) -> *MTLLinkedFunctions);
}
maxCallStackDepth :: (self: *MTLTileRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxCallStackDepth, #type (self: *MTLTileRenderPipelineDescriptor) -> NSUInteger);
}
maxTotalThreadsPerThreadgroup :: (self: *MTLTileRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTotalThreadsPerThreadgroup, #type (self: *MTLTileRenderPipelineDescriptor) -> NSUInteger);
}
preloadedLibraries :: (self: *MTLTileRenderPipelineDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.preloadedLibraries, #type (self: *MTLTileRenderPipelineDescriptor) -> *NSArray);
}
rasterSampleCount :: (self: *MTLTileRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.rasterSampleCount, #type (self: *MTLTileRenderPipelineDescriptor) -> NSUInteger);
}
requiredThreadsPerThreadgroup :: (self: *MTLTileRenderPipelineDescriptor) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.requiredThreadsPerThreadgroup, #type (self: *MTLTileRenderPipelineDescriptor) -> MTLSize);
}
reset :: (self: *MTLTileRenderPipelineDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTLTileRenderPipelineDescriptor) -> ());
}
setBinaryArchives :: (self: *MTLTileRenderPipelineDescriptor, binaryArchives: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setBinaryArchives_, #type (self: *MTLTileRenderPipelineDescriptor, binaryArchives: *NSArray) -> ());
}
setLabel :: (self: *MTLTileRenderPipelineDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLTileRenderPipelineDescriptor, label: *NSString) -> ());
}
setLinkedFunctions :: (self: *MTLTileRenderPipelineDescriptor, linkedFunctions: *MTLLinkedFunctions) -> () {
	#insert #run METHOD_BODY(__selectors.setLinkedFunctions_, #type (self: *MTLTileRenderPipelineDescriptor, linkedFunctions: *MTLLinkedFunctions) -> ());
}
setMaxCallStackDepth :: (self: *MTLTileRenderPipelineDescriptor, maxCallStackDepth: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxCallStackDepth_, #type (self: *MTLTileRenderPipelineDescriptor, maxCallStackDepth: NSUInteger) -> ());
}
setMaxTotalThreadsPerThreadgroup :: (self: *MTLTileRenderPipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxTotalThreadsPerThreadgroup_, #type (self: *MTLTileRenderPipelineDescriptor, maxTotalThreadsPerThreadgroup: NSUInteger) -> ());
}
setPreloadedLibraries :: (self: *MTLTileRenderPipelineDescriptor, preloadedLibraries: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setPreloadedLibraries_, #type (self: *MTLTileRenderPipelineDescriptor, preloadedLibraries: *NSArray) -> ());
}
setRasterSampleCount :: (self: *MTLTileRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRasterSampleCount_, #type (self: *MTLTileRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> ());
}
setRequiredThreadsPerThreadgroup :: (self: *MTLTileRenderPipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.setRequiredThreadsPerThreadgroup_, #type (self: *MTLTileRenderPipelineDescriptor, requiredThreadsPerThreadgroup: MTLSize) -> ());
}
setShaderValidation :: (self: *MTLTileRenderPipelineDescriptor, shaderValidation: MTLShaderValidation) -> () {
	#insert #run METHOD_BODY(__selectors.setShaderValidation_, #type (self: *MTLTileRenderPipelineDescriptor, shaderValidation: MTLShaderValidation) -> ());
}
setSupportAddingBinaryFunctions :: (self: *MTLTileRenderPipelineDescriptor, supportAddingBinaryFunctions: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportAddingBinaryFunctions_, #type (self: *MTLTileRenderPipelineDescriptor, supportAddingBinaryFunctions: bool) -> ());
}
setThreadgroupSizeMatchesTileSize :: (self: *MTLTileRenderPipelineDescriptor, threadgroupSizeMatchesTileSize: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setThreadgroupSizeMatchesTileSize_, #type (self: *MTLTileRenderPipelineDescriptor, threadgroupSizeMatchesTileSize: bool) -> ());
}
setTileFunction :: (self: *MTLTileRenderPipelineDescriptor, tileFunction: *MTLFunction) -> () {
	#insert #run METHOD_BODY(__selectors.setTileFunction_, #type (self: *MTLTileRenderPipelineDescriptor, tileFunction: *MTLFunction) -> ());
}
shaderValidation :: (self: *MTLTileRenderPipelineDescriptor) -> MTLShaderValidation {
	#insert #run METHOD_BODY(__selectors.shaderValidation, #type (self: *MTLTileRenderPipelineDescriptor) -> MTLShaderValidation);
}
supportAddingBinaryFunctions :: (self: *MTLTileRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportAddingBinaryFunctions, #type (self: *MTLTileRenderPipelineDescriptor) -> bool);
}
threadgroupSizeMatchesTileSize :: (self: *MTLTileRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.threadgroupSizeMatchesTileSize, #type (self: *MTLTileRenderPipelineDescriptor) -> bool);
}
tileBuffers :: (self: *MTLTileRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
	#insert #run METHOD_BODY(__selectors.tileBuffers, #type (self: *MTLTileRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray);
}
tileFunction :: (self: *MTLTileRenderPipelineDescriptor) -> *MTLFunction {
	#insert #run METHOD_BODY(__selectors.tileFunction, #type (self: *MTLTileRenderPipelineDescriptor) -> *MTLFunction);
}


MTLMeshRenderPipelineDescriptor :: struct {}
alphaToCoverageEnabled :: (self: *MTLMeshRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isAlphaToCoverageEnabled, #type (self: *MTLMeshRenderPipelineDescriptor) -> bool);
}
alphaToOneEnabled :: (self: *MTLMeshRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isAlphaToOneEnabled, #type (self: *MTLMeshRenderPipelineDescriptor) -> bool);
}
binaryArchives :: (self: *MTLMeshRenderPipelineDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.binaryArchives, #type (self: *MTLMeshRenderPipelineDescriptor) -> *NSArray);
}
colorAttachments :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLRenderPipelineColorAttachmentDescriptorArray {
	#insert #run METHOD_BODY(__selectors.colorAttachments, #type (self: *MTLMeshRenderPipelineDescriptor) -> *MTLRenderPipelineColorAttachmentDescriptorArray);
}
depthAttachmentPixelFormat :: (self: *MTLMeshRenderPipelineDescriptor) -> MTLPixelFormat {
	#insert #run METHOD_BODY(__selectors.depthAttachmentPixelFormat, #type (self: *MTLMeshRenderPipelineDescriptor) -> MTLPixelFormat);
}
fragmentBuffers :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
	#insert #run METHOD_BODY(__selectors.fragmentBuffers, #type (self: *MTLMeshRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray);
}
fragmentFunction :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLFunction {
	#insert #run METHOD_BODY(__selectors.fragmentFunction, #type (self: *MTLMeshRenderPipelineDescriptor) -> *MTLFunction);
}
fragmentLinkedFunctions :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLLinkedFunctions {
	#insert #run METHOD_BODY(__selectors.fragmentLinkedFunctions, #type (self: *MTLMeshRenderPipelineDescriptor) -> *MTLLinkedFunctions);
}
isAlphaToCoverageEnabled :: (self: *MTLMeshRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isAlphaToCoverageEnabled, #type (self: *MTLMeshRenderPipelineDescriptor) -> bool);
}
isAlphaToOneEnabled :: (self: *MTLMeshRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isAlphaToOneEnabled, #type (self: *MTLMeshRenderPipelineDescriptor) -> bool);
}
isRasterizationEnabled :: (self: *MTLMeshRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isRasterizationEnabled, #type (self: *MTLMeshRenderPipelineDescriptor) -> bool);
}
label :: (self: *MTLMeshRenderPipelineDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLMeshRenderPipelineDescriptor) -> *NSString);
}
maxTotalThreadgroupsPerMeshGrid :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTotalThreadgroupsPerMeshGrid, #type (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger);
}
maxTotalThreadsPerMeshThreadgroup :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTotalThreadsPerMeshThreadgroup, #type (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger);
}
maxTotalThreadsPerObjectThreadgroup :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxTotalThreadsPerObjectThreadgroup, #type (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger);
}
maxVertexAmplificationCount :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxVertexAmplificationCount, #type (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger);
}
meshBuffers :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
	#insert #run METHOD_BODY(__selectors.meshBuffers, #type (self: *MTLMeshRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray);
}
meshFunction :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLFunction {
	#insert #run METHOD_BODY(__selectors.meshFunction, #type (self: *MTLMeshRenderPipelineDescriptor) -> *MTLFunction);
}
meshLinkedFunctions :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLLinkedFunctions {
	#insert #run METHOD_BODY(__selectors.meshLinkedFunctions, #type (self: *MTLMeshRenderPipelineDescriptor) -> *MTLLinkedFunctions);
}
meshThreadgroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTLMeshRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.meshThreadgroupSizeIsMultipleOfThreadExecutionWidth, #type (self: *MTLMeshRenderPipelineDescriptor) -> bool);
}
objectBuffers :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray {
	#insert #run METHOD_BODY(__selectors.objectBuffers, #type (self: *MTLMeshRenderPipelineDescriptor) -> *MTLPipelineBufferDescriptorArray);
}
objectFunction :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLFunction {
	#insert #run METHOD_BODY(__selectors.objectFunction, #type (self: *MTLMeshRenderPipelineDescriptor) -> *MTLFunction);
}
objectLinkedFunctions :: (self: *MTLMeshRenderPipelineDescriptor) -> *MTLLinkedFunctions {
	#insert #run METHOD_BODY(__selectors.objectLinkedFunctions, #type (self: *MTLMeshRenderPipelineDescriptor) -> *MTLLinkedFunctions);
}
objectThreadgroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTLMeshRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.objectThreadgroupSizeIsMultipleOfThreadExecutionWidth, #type (self: *MTLMeshRenderPipelineDescriptor) -> bool);
}
payloadMemoryLength :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.payloadMemoryLength, #type (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger);
}
rasterSampleCount :: (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.rasterSampleCount, #type (self: *MTLMeshRenderPipelineDescriptor) -> NSUInteger);
}
rasterizationEnabled :: (self: *MTLMeshRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.isRasterizationEnabled, #type (self: *MTLMeshRenderPipelineDescriptor) -> bool);
}
requiredThreadsPerMeshThreadgroup :: (self: *MTLMeshRenderPipelineDescriptor) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.requiredThreadsPerMeshThreadgroup, #type (self: *MTLMeshRenderPipelineDescriptor) -> MTLSize);
}
requiredThreadsPerObjectThreadgroup :: (self: *MTLMeshRenderPipelineDescriptor) -> MTLSize {
	#insert #run METHOD_BODY(__selectors.requiredThreadsPerObjectThreadgroup, #type (self: *MTLMeshRenderPipelineDescriptor) -> MTLSize);
}
reset :: (self: *MTLMeshRenderPipelineDescriptor) -> () {
	#insert #run METHOD_BODY(__selectors.reset, #type (self: *MTLMeshRenderPipelineDescriptor) -> ());
}
setAlphaToCoverageEnabled :: (self: *MTLMeshRenderPipelineDescriptor, alphaToCoverageEnabled: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setAlphaToCoverageEnabled_, #type (self: *MTLMeshRenderPipelineDescriptor, alphaToCoverageEnabled: bool) -> ());
}
setAlphaToOneEnabled :: (self: *MTLMeshRenderPipelineDescriptor, alphaToOneEnabled: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setAlphaToOneEnabled_, #type (self: *MTLMeshRenderPipelineDescriptor, alphaToOneEnabled: bool) -> ());
}
setBinaryArchives :: (self: *MTLMeshRenderPipelineDescriptor, binaryArchives: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setBinaryArchives_, #type (self: *MTLMeshRenderPipelineDescriptor, binaryArchives: *NSArray) -> ());
}
setDepthAttachmentPixelFormat :: (self: *MTLMeshRenderPipelineDescriptor, depthAttachmentPixelFormat: MTLPixelFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthAttachmentPixelFormat_, #type (self: *MTLMeshRenderPipelineDescriptor, depthAttachmentPixelFormat: MTLPixelFormat) -> ());
}
setFragmentFunction :: (self: *MTLMeshRenderPipelineDescriptor, fragmentFunction: *MTLFunction) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentFunction_, #type (self: *MTLMeshRenderPipelineDescriptor, fragmentFunction: *MTLFunction) -> ());
}
setFragmentLinkedFunctions :: (self: *MTLMeshRenderPipelineDescriptor, fragmentLinkedFunctions: *MTLLinkedFunctions) -> () {
	#insert #run METHOD_BODY(__selectors.setFragmentLinkedFunctions_, #type (self: *MTLMeshRenderPipelineDescriptor, fragmentLinkedFunctions: *MTLLinkedFunctions) -> ());
}
setLabel :: (self: *MTLMeshRenderPipelineDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLMeshRenderPipelineDescriptor, label: *NSString) -> ());
}
setMaxTotalThreadgroupsPerMeshGrid :: (self: *MTLMeshRenderPipelineDescriptor, maxTotalThreadgroupsPerMeshGrid: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxTotalThreadgroupsPerMeshGrid_, #type (self: *MTLMeshRenderPipelineDescriptor, maxTotalThreadgroupsPerMeshGrid: NSUInteger) -> ());
}
setMaxTotalThreadsPerMeshThreadgroup :: (self: *MTLMeshRenderPipelineDescriptor, maxTotalThreadsPerMeshThreadgroup: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxTotalThreadsPerMeshThreadgroup_, #type (self: *MTLMeshRenderPipelineDescriptor, maxTotalThreadsPerMeshThreadgroup: NSUInteger) -> ());
}
setMaxTotalThreadsPerObjectThreadgroup :: (self: *MTLMeshRenderPipelineDescriptor, maxTotalThreadsPerObjectThreadgroup: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxTotalThreadsPerObjectThreadgroup_, #type (self: *MTLMeshRenderPipelineDescriptor, maxTotalThreadsPerObjectThreadgroup: NSUInteger) -> ());
}
setMaxVertexAmplificationCount :: (self: *MTLMeshRenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxVertexAmplificationCount_, #type (self: *MTLMeshRenderPipelineDescriptor, maxVertexAmplificationCount: NSUInteger) -> ());
}
setMeshFunction :: (self: *MTLMeshRenderPipelineDescriptor, meshFunction: *MTLFunction) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshFunction_, #type (self: *MTLMeshRenderPipelineDescriptor, meshFunction: *MTLFunction) -> ());
}
setMeshLinkedFunctions :: (self: *MTLMeshRenderPipelineDescriptor, meshLinkedFunctions: *MTLLinkedFunctions) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshLinkedFunctions_, #type (self: *MTLMeshRenderPipelineDescriptor, meshLinkedFunctions: *MTLLinkedFunctions) -> ());
}
setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTLMeshRenderPipelineDescriptor, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth_, #type (self: *MTLMeshRenderPipelineDescriptor, meshThreadgroupSizeIsMultipleOfThreadExecutionWidth: bool) -> ());
}
setObjectFunction :: (self: *MTLMeshRenderPipelineDescriptor, objectFunction: *MTLFunction) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectFunction_, #type (self: *MTLMeshRenderPipelineDescriptor, objectFunction: *MTLFunction) -> ());
}
setObjectLinkedFunctions :: (self: *MTLMeshRenderPipelineDescriptor, objectLinkedFunctions: *MTLLinkedFunctions) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectLinkedFunctions_, #type (self: *MTLMeshRenderPipelineDescriptor, objectLinkedFunctions: *MTLLinkedFunctions) -> ());
}
setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth :: (self: *MTLMeshRenderPipelineDescriptor, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth_, #type (self: *MTLMeshRenderPipelineDescriptor, objectThreadgroupSizeIsMultipleOfThreadExecutionWidth: bool) -> ());
}
setPayloadMemoryLength :: (self: *MTLMeshRenderPipelineDescriptor, payloadMemoryLength: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setPayloadMemoryLength_, #type (self: *MTLMeshRenderPipelineDescriptor, payloadMemoryLength: NSUInteger) -> ());
}
setRasterSampleCount :: (self: *MTLMeshRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRasterSampleCount_, #type (self: *MTLMeshRenderPipelineDescriptor, rasterSampleCount: NSUInteger) -> ());
}
setRasterizationEnabled :: (self: *MTLMeshRenderPipelineDescriptor, rasterizationEnabled: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setRasterizationEnabled_, #type (self: *MTLMeshRenderPipelineDescriptor, rasterizationEnabled: bool) -> ());
}
setRequiredThreadsPerMeshThreadgroup :: (self: *MTLMeshRenderPipelineDescriptor, requiredThreadsPerMeshThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.setRequiredThreadsPerMeshThreadgroup_, #type (self: *MTLMeshRenderPipelineDescriptor, requiredThreadsPerMeshThreadgroup: MTLSize) -> ());
}
setRequiredThreadsPerObjectThreadgroup :: (self: *MTLMeshRenderPipelineDescriptor, requiredThreadsPerObjectThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.setRequiredThreadsPerObjectThreadgroup_, #type (self: *MTLMeshRenderPipelineDescriptor, requiredThreadsPerObjectThreadgroup: MTLSize) -> ());
}
setShaderValidation :: (self: *MTLMeshRenderPipelineDescriptor, shaderValidation: MTLShaderValidation) -> () {
	#insert #run METHOD_BODY(__selectors.setShaderValidation_, #type (self: *MTLMeshRenderPipelineDescriptor, shaderValidation: MTLShaderValidation) -> ());
}
setStencilAttachmentPixelFormat :: (self: *MTLMeshRenderPipelineDescriptor, stencilAttachmentPixelFormat: MTLPixelFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setStencilAttachmentPixelFormat_, #type (self: *MTLMeshRenderPipelineDescriptor, stencilAttachmentPixelFormat: MTLPixelFormat) -> ());
}
setSupportIndirectCommandBuffers :: (self: *MTLMeshRenderPipelineDescriptor, supportIndirectCommandBuffers: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setSupportIndirectCommandBuffers_, #type (self: *MTLMeshRenderPipelineDescriptor, supportIndirectCommandBuffers: bool) -> ());
}
shaderValidation :: (self: *MTLMeshRenderPipelineDescriptor) -> MTLShaderValidation {
	#insert #run METHOD_BODY(__selectors.shaderValidation, #type (self: *MTLMeshRenderPipelineDescriptor) -> MTLShaderValidation);
}
stencilAttachmentPixelFormat :: (self: *MTLMeshRenderPipelineDescriptor) -> MTLPixelFormat {
	#insert #run METHOD_BODY(__selectors.stencilAttachmentPixelFormat, #type (self: *MTLMeshRenderPipelineDescriptor) -> MTLPixelFormat);
}
supportIndirectCommandBuffers :: (self: *MTLMeshRenderPipelineDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.supportIndirectCommandBuffers, #type (self: *MTLMeshRenderPipelineDescriptor) -> bool);
}


MTLCommandQueue :: struct {}
addResidencySet :: (self: *MTLCommandQueue, residencySet: *MTLResidencySet) -> () {
	#insert #run METHOD_BODY(__selectors.addResidencySet_, #type (self: *MTLCommandQueue, residencySet: *MTLResidencySet) -> ());
}
addResidencySets :: (self: *MTLCommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.addResidencySets_count_, #type (self: *MTLCommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> ());
}
commandBuffer :: (self: *MTLCommandQueue) -> *MTLCommandBuffer {
	#insert #run METHOD_BODY(__selectors.commandBuffer, #type (self: *MTLCommandQueue) -> *MTLCommandBuffer);
}
commandBuffer :: (self: *MTLCommandQueue, descriptor: *MTLCommandBufferDescriptor) -> *MTLCommandBuffer {
	#insert #run METHOD_BODY(__selectors.commandBufferWithDescriptor_, #type (self: *MTLCommandQueue, descriptor: *MTLCommandBufferDescriptor) -> *MTLCommandBuffer);
}
commandBufferWithUnretainedReferences :: (self: *MTLCommandQueue) -> *MTLCommandBuffer {
	#insert #run METHOD_BODY(__selectors.commandBufferWithUnretainedReferences, #type (self: *MTLCommandQueue) -> *MTLCommandBuffer);
}
device :: (self: *MTLCommandQueue) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLCommandQueue) -> *MTLDevice);
}
insertDebugCaptureBoundary :: (self: *MTLCommandQueue) -> () {
	#insert #run METHOD_BODY(__selectors.insertDebugCaptureBoundary, #type (self: *MTLCommandQueue) -> ());
}
label :: (self: *MTLCommandQueue) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLCommandQueue) -> *NSString);
}
removeResidencySet :: (self: *MTLCommandQueue, residencySet: *MTLResidencySet) -> () {
	#insert #run METHOD_BODY(__selectors.removeResidencySet_, #type (self: *MTLCommandQueue, residencySet: *MTLResidencySet) -> ());
}
removeResidencySets :: (self: *MTLCommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.removeResidencySets_count_, #type (self: *MTLCommandQueue, residencySets: **MTLResidencySet, count: NSUInteger) -> ());
}
setLabel :: (self: *MTLCommandQueue, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLCommandQueue, label: *NSString) -> ());
}


MTLCommandQueueDescriptor :: struct {}
logState :: (self: *MTLCommandQueueDescriptor) -> *MTLLogState {
	#insert #run METHOD_BODY(__selectors.logState, #type (self: *MTLCommandQueueDescriptor) -> *MTLLogState);
}
maxCommandBufferCount :: (self: *MTLCommandQueueDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxCommandBufferCount, #type (self: *MTLCommandQueueDescriptor) -> NSUInteger);
}
setLogState :: (self: *MTLCommandQueueDescriptor, logState: *MTLLogState) -> () {
	#insert #run METHOD_BODY(__selectors.setLogState_, #type (self: *MTLCommandQueueDescriptor, logState: *MTLLogState) -> ());
}
setMaxCommandBufferCount :: (self: *MTLCommandQueueDescriptor, maxCommandBufferCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxCommandBufferCount_, #type (self: *MTLCommandQueueDescriptor, maxCommandBufferCount: NSUInteger) -> ());
}


MTLFunctionDescriptor :: struct {}
binaryArchives :: (self: *MTLFunctionDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.binaryArchives, #type (self: *MTLFunctionDescriptor) -> *NSArray);
}
constantValues :: (self: *MTLFunctionDescriptor) -> *MTLFunctionConstantValues {
	#insert #run METHOD_BODY(__selectors.constantValues, #type (self: *MTLFunctionDescriptor) -> *MTLFunctionConstantValues);
}
functionDescriptor :: (self: *MTLFunctionDescriptor) -> *MTLFunctionDescriptor {
	#insert #run METHOD_BODY(__selectors.functionDescriptor, #type (self: *MTLFunctionDescriptor) -> *MTLFunctionDescriptor);
}
name :: (self: *MTLFunctionDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTLFunctionDescriptor) -> *NSString);
}
options :: (self: *MTLFunctionDescriptor) -> MTLFunctionOptions {
	#insert #run METHOD_BODY(__selectors.options, #type (self: *MTLFunctionDescriptor) -> MTLFunctionOptions);
}
setBinaryArchives :: (self: *MTLFunctionDescriptor, binaryArchives: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setBinaryArchives_, #type (self: *MTLFunctionDescriptor, binaryArchives: *NSArray) -> ());
}
setConstantValues :: (self: *MTLFunctionDescriptor, constantValues: *MTLFunctionConstantValues) -> () {
	#insert #run METHOD_BODY(__selectors.setConstantValues_, #type (self: *MTLFunctionDescriptor, constantValues: *MTLFunctionConstantValues) -> ());
}
setName :: (self: *MTLFunctionDescriptor, name: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setName_, #type (self: *MTLFunctionDescriptor, name: *NSString) -> ());
}
setOptions :: (self: *MTLFunctionDescriptor, options: MTLFunctionOptions) -> () {
	#insert #run METHOD_BODY(__selectors.setOptions_, #type (self: *MTLFunctionDescriptor, options: MTLFunctionOptions) -> ());
}
setSpecializedName :: (self: *MTLFunctionDescriptor, specializedName: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setSpecializedName_, #type (self: *MTLFunctionDescriptor, specializedName: *NSString) -> ());
}
specializedName :: (self: *MTLFunctionDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.specializedName, #type (self: *MTLFunctionDescriptor) -> *NSString);
}


MTLIntersectionFunctionDescriptor :: struct { using #as _: MTLFunctionDescriptor; }


MTLAccelerationStructureCommandEncoder :: struct { using #as _: MTLCommandEncoder; }
buildAccelerationStructure :: (self: *MTLAccelerationStructureCommandEncoder, accelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset_, #type (self: *MTLAccelerationStructureCommandEncoder, accelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger) -> ());
}
copyAccelerationStructure :: (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> () {
	#insert #run METHOD_BODY(__selectors.copyAccelerationStructure_toAccelerationStructure_, #type (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> ());
}
copyAndCompactAccelerationStructure :: (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> () {
	#insert #run METHOD_BODY(__selectors.copyAndCompactAccelerationStructure_toAccelerationStructure_, #type (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, destinationAccelerationStructure: *MTLAccelerationStructure) -> ());
}
refitAccelerationStructure :: (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_, #type (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger) -> ());
}
refitAccelerationStructure :: (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger, options: MTLAccelerationStructureRefitOptions) -> () {
	#insert #run METHOD_BODY(__selectors.refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options_, #type (self: *MTLAccelerationStructureCommandEncoder, sourceAccelerationStructure: *MTLAccelerationStructure, descriptor: *MTLAccelerationStructureDescriptor, destinationAccelerationStructure: *MTLAccelerationStructure, scratchBuffer: *MTLBuffer, scratchBufferOffset: NSUInteger, options: MTLAccelerationStructureRefitOptions) -> ());
}
sampleCountersInBuffer :: (self: *MTLAccelerationStructureCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: bool) -> () {
	#insert #run METHOD_BODY(__selectors.sampleCountersInBuffer_atSampleIndex_withBarrier_, #type (self: *MTLAccelerationStructureCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: bool) -> ());
}
updateFence :: (self: *MTLAccelerationStructureCommandEncoder, fence: *MTLFence) -> () {
	#insert #run METHOD_BODY(__selectors.updateFence_, #type (self: *MTLAccelerationStructureCommandEncoder, fence: *MTLFence) -> ());
}
useHeap :: (self: *MTLAccelerationStructureCommandEncoder, heap: *MTLHeap) -> () {
	#insert #run METHOD_BODY(__selectors.useHeap_, #type (self: *MTLAccelerationStructureCommandEncoder, heap: *MTLHeap) -> ());
}
useHeaps :: (self: *MTLAccelerationStructureCommandEncoder, heaps: **MTLHeap, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.useHeaps_count_, #type (self: *MTLAccelerationStructureCommandEncoder, heaps: **MTLHeap, count: NSUInteger) -> ());
}
useResource :: (self: *MTLAccelerationStructureCommandEncoder, resource: *MTLResource, usage: MTLResourceUsage) -> () {
	#insert #run METHOD_BODY(__selectors.useResource_usage_, #type (self: *MTLAccelerationStructureCommandEncoder, resource: *MTLResource, usage: MTLResourceUsage) -> ());
}
useResources :: (self: *MTLAccelerationStructureCommandEncoder, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> () {
	#insert #run METHOD_BODY(__selectors.useResources_count_usage_, #type (self: *MTLAccelerationStructureCommandEncoder, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> ());
}
waitForFence :: (self: *MTLAccelerationStructureCommandEncoder, fence: *MTLFence) -> () {
	#insert #run METHOD_BODY(__selectors.waitForFence_, #type (self: *MTLAccelerationStructureCommandEncoder, fence: *MTLFence) -> ());
}
writeCompactedAccelerationStructureSize :: (self: *MTLAccelerationStructureCommandEncoder, accelerationStructure: *MTLAccelerationStructure, buffer: *MTLBuffer, offset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.writeCompactedAccelerationStructureSize_toBuffer_offset_, #type (self: *MTLAccelerationStructureCommandEncoder, accelerationStructure: *MTLAccelerationStructure, buffer: *MTLBuffer, offset: NSUInteger) -> ());
}
writeCompactedAccelerationStructureSize :: (self: *MTLAccelerationStructureCommandEncoder, accelerationStructure: *MTLAccelerationStructure, buffer: *MTLBuffer, offset: NSUInteger, sizeDataType: MTLDataType) -> () {
	#insert #run METHOD_BODY(__selectors.writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType_, #type (self: *MTLAccelerationStructureCommandEncoder, accelerationStructure: *MTLAccelerationStructure, buffer: *MTLBuffer, offset: NSUInteger, sizeDataType: MTLDataType) -> ());
}


MTLAccelerationStructurePassSampleBufferAttachmentDescriptor :: struct {}
endOfEncoderSampleIndex :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.endOfEncoderSampleIndex, #type (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor) -> NSUInteger);
}
sampleBuffer :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
	#insert #run METHOD_BODY(__selectors.sampleBuffer, #type (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer);
}
setEndOfEncoderSampleIndex :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setEndOfEncoderSampleIndex_, #type (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> ());
}
setSampleBuffer :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setSampleBuffer_, #type (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> ());
}
setStartOfEncoderSampleIndex :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setStartOfEncoderSampleIndex_, #type (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> ());
}
startOfEncoderSampleIndex :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.startOfEncoderSampleIndex, #type (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor) -> NSUInteger);
}


MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray :: struct {}
object :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor {
	#insert #run METHOD_BODY(__selectors.objectAtIndexedSubscript_, #type (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor);
}
setObject :: (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray, attachment: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObject_atIndexedSubscript_, #type (self: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray, attachment: *MTLAccelerationStructurePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> ());
}


MTLAccelerationStructurePassDescriptor :: struct {}
accelerationStructurePassDescriptor :: (self: *MTLAccelerationStructurePassDescriptor) -> *MTLAccelerationStructurePassDescriptor {
	#insert #run METHOD_BODY(__selectors.accelerationStructurePassDescriptor, #type (self: *MTLAccelerationStructurePassDescriptor) -> *MTLAccelerationStructurePassDescriptor);
}
sampleBufferAttachments :: (self: *MTLAccelerationStructurePassDescriptor) -> *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray {
	#insert #run METHOD_BODY(__selectors.sampleBufferAttachments, #type (self: *MTLAccelerationStructurePassDescriptor) -> *MTLAccelerationStructurePassSampleBufferAttachmentDescriptorArray);
}


MTLBlitPassSampleBufferAttachmentDescriptor :: struct {}
endOfEncoderSampleIndex :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.endOfEncoderSampleIndex, #type (self: *MTLBlitPassSampleBufferAttachmentDescriptor) -> NSUInteger);
}
sampleBuffer :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
	#insert #run METHOD_BODY(__selectors.sampleBuffer, #type (self: *MTLBlitPassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer);
}
setEndOfEncoderSampleIndex :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setEndOfEncoderSampleIndex_, #type (self: *MTLBlitPassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> ());
}
setSampleBuffer :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setSampleBuffer_, #type (self: *MTLBlitPassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> ());
}
setStartOfEncoderSampleIndex :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setStartOfEncoderSampleIndex_, #type (self: *MTLBlitPassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> ());
}
startOfEncoderSampleIndex :: (self: *MTLBlitPassSampleBufferAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.startOfEncoderSampleIndex, #type (self: *MTLBlitPassSampleBufferAttachmentDescriptor) -> NSUInteger);
}


MTLBlitPassSampleBufferAttachmentDescriptorArray :: struct {}
object :: (self: *MTLBlitPassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLBlitPassSampleBufferAttachmentDescriptor {
	#insert #run METHOD_BODY(__selectors.objectAtIndexedSubscript_, #type (self: *MTLBlitPassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLBlitPassSampleBufferAttachmentDescriptor);
}
setObject :: (self: *MTLBlitPassSampleBufferAttachmentDescriptorArray, attachment: *MTLBlitPassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObject_atIndexedSubscript_, #type (self: *MTLBlitPassSampleBufferAttachmentDescriptorArray, attachment: *MTLBlitPassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> ());
}


MTLBlitPassDescriptor :: struct {}
blitPassDescriptor :: (self: *MTLBlitPassDescriptor) -> *MTLBlitPassDescriptor {
	#insert #run METHOD_BODY(__selectors.blitPassDescriptor, #type (self: *MTLBlitPassDescriptor) -> *MTLBlitPassDescriptor);
}
sampleBufferAttachments :: (self: *MTLBlitPassDescriptor) -> *MTLBlitPassSampleBufferAttachmentDescriptorArray {
	#insert #run METHOD_BODY(__selectors.sampleBufferAttachments, #type (self: *MTLBlitPassDescriptor) -> *MTLBlitPassSampleBufferAttachmentDescriptorArray);
}


MTL4AccelerationStructureDescriptor :: struct { using #as _: MTLAccelerationStructureDescriptor; }


MTL4AccelerationStructureGeometryDescriptor :: struct {}
allowDuplicateIntersectionFunctionInvocation :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.allowDuplicateIntersectionFunctionInvocation, #type (self: *MTL4AccelerationStructureGeometryDescriptor) -> bool);
}
intersectionFunctionTableOffset :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.intersectionFunctionTableOffset, #type (self: *MTL4AccelerationStructureGeometryDescriptor) -> NSUInteger);
}
label :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTL4AccelerationStructureGeometryDescriptor) -> *NSString);
}
opaque :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.opaque, #type (self: *MTL4AccelerationStructureGeometryDescriptor) -> bool);
}
primitiveDataBuffer :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.primitiveDataBuffer, #type (self: *MTL4AccelerationStructureGeometryDescriptor) -> MTL4BufferRange);
}
primitiveDataElementSize :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.primitiveDataElementSize, #type (self: *MTL4AccelerationStructureGeometryDescriptor) -> NSUInteger);
}
primitiveDataStride :: (self: *MTL4AccelerationStructureGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.primitiveDataStride, #type (self: *MTL4AccelerationStructureGeometryDescriptor) -> NSUInteger);
}
setAllowDuplicateIntersectionFunctionInvocation :: (self: *MTL4AccelerationStructureGeometryDescriptor, allowDuplicateIntersectionFunctionInvocation: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setAllowDuplicateIntersectionFunctionInvocation_, #type (self: *MTL4AccelerationStructureGeometryDescriptor, allowDuplicateIntersectionFunctionInvocation: bool) -> ());
}
setIntersectionFunctionTableOffset :: (self: *MTL4AccelerationStructureGeometryDescriptor, intersectionFunctionTableOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setIntersectionFunctionTableOffset_, #type (self: *MTL4AccelerationStructureGeometryDescriptor, intersectionFunctionTableOffset: NSUInteger) -> ());
}
setLabel :: (self: *MTL4AccelerationStructureGeometryDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTL4AccelerationStructureGeometryDescriptor, label: *NSString) -> ());
}
setOpaque :: (self: *MTL4AccelerationStructureGeometryDescriptor, opaque: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setOpaque_, #type (self: *MTL4AccelerationStructureGeometryDescriptor, opaque: bool) -> ());
}
setPrimitiveDataBuffer :: (self: *MTL4AccelerationStructureGeometryDescriptor, primitiveDataBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setPrimitiveDataBuffer_, #type (self: *MTL4AccelerationStructureGeometryDescriptor, primitiveDataBuffer: MTL4BufferRange) -> ());
}
setPrimitiveDataElementSize :: (self: *MTL4AccelerationStructureGeometryDescriptor, primitiveDataElementSize: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setPrimitiveDataElementSize_, #type (self: *MTL4AccelerationStructureGeometryDescriptor, primitiveDataElementSize: NSUInteger) -> ());
}
setPrimitiveDataStride :: (self: *MTL4AccelerationStructureGeometryDescriptor, primitiveDataStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setPrimitiveDataStride_, #type (self: *MTL4AccelerationStructureGeometryDescriptor, primitiveDataStride: NSUInteger) -> ());
}


MTL4PrimitiveAccelerationStructureDescriptor :: struct { using #as _: MTL4AccelerationStructureDescriptor; }
geometryDescriptors :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.geometryDescriptors, #type (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> *NSArray);
}
motionEndBorderMode :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode {
	#insert #run METHOD_BODY(__selectors.motionEndBorderMode, #type (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode);
}
motionEndTime :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> float {
	#insert #run METHOD_BODY(__selectors.motionEndTime, #type (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> float);
}
motionKeyframeCount :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.motionKeyframeCount, #type (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> NSUInteger);
}
motionStartBorderMode :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode {
	#insert #run METHOD_BODY(__selectors.motionStartBorderMode, #type (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> MTLMotionBorderMode);
}
motionStartTime :: (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> float {
	#insert #run METHOD_BODY(__selectors.motionStartTime, #type (self: *MTL4PrimitiveAccelerationStructureDescriptor) -> float);
}
setGeometryDescriptors :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, geometryDescriptors: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setGeometryDescriptors_, #type (self: *MTL4PrimitiveAccelerationStructureDescriptor, geometryDescriptors: *NSArray) -> ());
}
setMotionEndBorderMode :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionEndBorderMode: MTLMotionBorderMode) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionEndBorderMode_, #type (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionEndBorderMode: MTLMotionBorderMode) -> ());
}
setMotionEndTime :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionEndTime: float) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionEndTime_, #type (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionEndTime: float) -> ());
}
setMotionKeyframeCount :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionKeyframeCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionKeyframeCount_, #type (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionKeyframeCount: NSUInteger) -> ());
}
setMotionStartBorderMode :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionStartBorderMode: MTLMotionBorderMode) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionStartBorderMode_, #type (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionStartBorderMode: MTLMotionBorderMode) -> ());
}
setMotionStartTime :: (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionStartTime: float) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionStartTime_, #type (self: *MTL4PrimitiveAccelerationStructureDescriptor, motionStartTime: float) -> ());
}


MTL4AccelerationStructureTriangleGeometryDescriptor :: struct { using #as _: MTL4AccelerationStructureGeometryDescriptor; }
indexBuffer :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.indexBuffer, #type (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTL4BufferRange);
}
indexType :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTLIndexType {
	#insert #run METHOD_BODY(__selectors.indexType, #type (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTLIndexType);
}
setIndexBuffer :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, indexBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexBuffer_, #type (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, indexBuffer: MTL4BufferRange) -> ());
}
setIndexType :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, indexType: MTLIndexType) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexType_, #type (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, indexType: MTLIndexType) -> ());
}
setTransformationMatrixBuffer :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, transformationMatrixBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setTransformationMatrixBuffer_, #type (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, transformationMatrixBuffer: MTL4BufferRange) -> ());
}
setTransformationMatrixLayout :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> () {
	#insert #run METHOD_BODY(__selectors.setTransformationMatrixLayout_, #type (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> ());
}
setTriangleCount :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, triangleCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTriangleCount_, #type (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, triangleCount: NSUInteger) -> ());
}
setVertexBuffer :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, vertexBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexBuffer_, #type (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, vertexBuffer: MTL4BufferRange) -> ());
}
setVertexFormat :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexFormat_, #type (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> ());
}
setVertexStride :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, vertexStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexStride_, #type (self: *MTL4AccelerationStructureTriangleGeometryDescriptor, vertexStride: NSUInteger) -> ());
}
transformationMatrixBuffer :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.transformationMatrixBuffer, #type (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTL4BufferRange);
}
transformationMatrixLayout :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTLMatrixLayout {
	#insert #run METHOD_BODY(__selectors.transformationMatrixLayout, #type (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTLMatrixLayout);
}
triangleCount :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.triangleCount, #type (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> NSUInteger);
}
vertexBuffer :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.vertexBuffer, #type (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTL4BufferRange);
}
vertexFormat :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTLAttributeFormat {
	#insert #run METHOD_BODY(__selectors.vertexFormat, #type (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> MTLAttributeFormat);
}
vertexStride :: (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.vertexStride, #type (self: *MTL4AccelerationStructureTriangleGeometryDescriptor) -> NSUInteger);
}


MTL4AccelerationStructureBoundingBoxGeometryDescriptor :: struct { using #as _: MTL4AccelerationStructureGeometryDescriptor; }
boundingBoxBuffer :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.boundingBoxBuffer, #type (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor) -> MTL4BufferRange);
}
boundingBoxCount :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.boundingBoxCount, #type (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger);
}
boundingBoxStride :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.boundingBoxStride, #type (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor) -> NSUInteger);
}
setBoundingBoxBuffer :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setBoundingBoxBuffer_, #type (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxBuffer: MTL4BufferRange) -> ());
}
setBoundingBoxCount :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBoundingBoxCount_, #type (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> ());
}
setBoundingBoxStride :: (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBoundingBoxStride_, #type (self: *MTL4AccelerationStructureBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> ());
}


MTL4AccelerationStructureMotionTriangleGeometryDescriptor :: struct { using #as _: MTL4AccelerationStructureGeometryDescriptor; }
indexBuffer :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.indexBuffer, #type (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTL4BufferRange);
}
indexType :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTLIndexType {
	#insert #run METHOD_BODY(__selectors.indexType, #type (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTLIndexType);
}
setIndexBuffer :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, indexBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexBuffer_, #type (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, indexBuffer: MTL4BufferRange) -> ());
}
setIndexType :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, indexType: MTLIndexType) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexType_, #type (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, indexType: MTLIndexType) -> ());
}
setTransformationMatrixBuffer :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setTransformationMatrixBuffer_, #type (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixBuffer: MTL4BufferRange) -> ());
}
setTransformationMatrixLayout :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> () {
	#insert #run METHOD_BODY(__selectors.setTransformationMatrixLayout_, #type (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, transformationMatrixLayout: MTLMatrixLayout) -> ());
}
setTriangleCount :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, triangleCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTriangleCount_, #type (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, triangleCount: NSUInteger) -> ());
}
setVertexBuffers :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, vertexBuffers: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexBuffers_, #type (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, vertexBuffers: MTL4BufferRange) -> ());
}
setVertexFormat :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexFormat_, #type (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, vertexFormat: MTLAttributeFormat) -> ());
}
setVertexStride :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, vertexStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexStride_, #type (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor, vertexStride: NSUInteger) -> ());
}
transformationMatrixBuffer :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.transformationMatrixBuffer, #type (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTL4BufferRange);
}
transformationMatrixLayout :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTLMatrixLayout {
	#insert #run METHOD_BODY(__selectors.transformationMatrixLayout, #type (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTLMatrixLayout);
}
triangleCount :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.triangleCount, #type (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger);
}
vertexBuffers :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.vertexBuffers, #type (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTL4BufferRange);
}
vertexFormat :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTLAttributeFormat {
	#insert #run METHOD_BODY(__selectors.vertexFormat, #type (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> MTLAttributeFormat);
}
vertexStride :: (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.vertexStride, #type (self: *MTL4AccelerationStructureMotionTriangleGeometryDescriptor) -> NSUInteger);
}


MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor :: struct { using #as _: MTL4AccelerationStructureGeometryDescriptor; }
boundingBoxBuffers :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.boundingBoxBuffers, #type (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor) -> MTL4BufferRange);
}
boundingBoxCount :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.boundingBoxCount, #type (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger);
}
boundingBoxStride :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.boundingBoxStride, #type (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor) -> NSUInteger);
}
setBoundingBoxBuffers :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxBuffers: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setBoundingBoxBuffers_, #type (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxBuffers: MTL4BufferRange) -> ());
}
setBoundingBoxCount :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBoundingBoxCount_, #type (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxCount: NSUInteger) -> ());
}
setBoundingBoxStride :: (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBoundingBoxStride_, #type (self: *MTL4AccelerationStructureMotionBoundingBoxGeometryDescriptor, boundingBoxStride: NSUInteger) -> ());
}


MTL4AccelerationStructureCurveGeometryDescriptor :: struct { using #as _: MTL4AccelerationStructureGeometryDescriptor; }
controlPointBuffer :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.controlPointBuffer, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTL4BufferRange);
}
controlPointCount :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.controlPointCount, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger);
}
controlPointFormat :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat {
	#insert #run METHOD_BODY(__selectors.controlPointFormat, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat);
}
controlPointStride :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.controlPointStride, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger);
}
curveBasis :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLCurveBasis {
	#insert #run METHOD_BODY(__selectors.curveBasis, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLCurveBasis);
}
curveEndCaps :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLCurveEndCaps {
	#insert #run METHOD_BODY(__selectors.curveEndCaps, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLCurveEndCaps);
}
curveType :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLCurveType {
	#insert #run METHOD_BODY(__selectors.curveType, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLCurveType);
}
indexBuffer :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.indexBuffer, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTL4BufferRange);
}
indexType :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLIndexType {
	#insert #run METHOD_BODY(__selectors.indexType, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLIndexType);
}
radiusBuffer :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.radiusBuffer, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTL4BufferRange);
}
radiusFormat :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat {
	#insert #run METHOD_BODY(__selectors.radiusFormat, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> MTLAttributeFormat);
}
radiusStride :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.radiusStride, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger);
}
segmentControlPointCount :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.segmentControlPointCount, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger);
}
segmentCount :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.segmentCount, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor) -> NSUInteger);
}
setControlPointBuffer :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointBuffer_, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointBuffer: MTL4BufferRange) -> ());
}
setControlPointCount :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointCount_, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointCount: NSUInteger) -> ());
}
setControlPointFormat :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointFormat_, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> ());
}
setControlPointStride :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointStride_, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor, controlPointStride: NSUInteger) -> ());
}
setCurveBasis :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> () {
	#insert #run METHOD_BODY(__selectors.setCurveBasis_, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> ());
}
setCurveEndCaps :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> () {
	#insert #run METHOD_BODY(__selectors.setCurveEndCaps_, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> ());
}
setCurveType :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, curveType: MTLCurveType) -> () {
	#insert #run METHOD_BODY(__selectors.setCurveType_, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor, curveType: MTLCurveType) -> ());
}
setIndexBuffer :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, indexBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexBuffer_, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor, indexBuffer: MTL4BufferRange) -> ());
}
setIndexType :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, indexType: MTLIndexType) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexType_, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor, indexType: MTLIndexType) -> ());
}
setRadiusBuffer :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, radiusBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setRadiusBuffer_, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor, radiusBuffer: MTL4BufferRange) -> ());
}
setRadiusFormat :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setRadiusFormat_, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> ());
}
setRadiusStride :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, radiusStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRadiusStride_, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor, radiusStride: NSUInteger) -> ());
}
setSegmentControlPointCount :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSegmentControlPointCount_, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> ());
}
setSegmentCount :: (self: *MTL4AccelerationStructureCurveGeometryDescriptor, segmentCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSegmentCount_, #type (self: *MTL4AccelerationStructureCurveGeometryDescriptor, segmentCount: NSUInteger) -> ());
}


MTL4AccelerationStructureMotionCurveGeometryDescriptor :: struct { using #as _: MTL4AccelerationStructureGeometryDescriptor; }
controlPointBuffers :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.controlPointBuffers, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTL4BufferRange);
}
controlPointCount :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.controlPointCount, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger);
}
controlPointFormat :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat {
	#insert #run METHOD_BODY(__selectors.controlPointFormat, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat);
}
controlPointStride :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.controlPointStride, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger);
}
curveBasis :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveBasis {
	#insert #run METHOD_BODY(__selectors.curveBasis, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveBasis);
}
curveEndCaps :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveEndCaps {
	#insert #run METHOD_BODY(__selectors.curveEndCaps, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveEndCaps);
}
curveType :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveType {
	#insert #run METHOD_BODY(__selectors.curveType, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLCurveType);
}
indexBuffer :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.indexBuffer, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTL4BufferRange);
}
indexType :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLIndexType {
	#insert #run METHOD_BODY(__selectors.indexType, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLIndexType);
}
radiusBuffers :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.radiusBuffers, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTL4BufferRange);
}
radiusFormat :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat {
	#insert #run METHOD_BODY(__selectors.radiusFormat, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> MTLAttributeFormat);
}
radiusStride :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.radiusStride, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger);
}
segmentControlPointCount :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.segmentControlPointCount, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger);
}
segmentCount :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.segmentCount, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor) -> NSUInteger);
}
setControlPointBuffers :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointBuffers: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointBuffers_, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointBuffers: MTL4BufferRange) -> ());
}
setControlPointCount :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointCount_, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointCount: NSUInteger) -> ());
}
setControlPointFormat :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointFormat_, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointFormat: MTLAttributeFormat) -> ());
}
setControlPointStride :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setControlPointStride_, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, controlPointStride: NSUInteger) -> ());
}
setCurveBasis :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> () {
	#insert #run METHOD_BODY(__selectors.setCurveBasis_, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, curveBasis: MTLCurveBasis) -> ());
}
setCurveEndCaps :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> () {
	#insert #run METHOD_BODY(__selectors.setCurveEndCaps_, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, curveEndCaps: MTLCurveEndCaps) -> ());
}
setCurveType :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, curveType: MTLCurveType) -> () {
	#insert #run METHOD_BODY(__selectors.setCurveType_, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, curveType: MTLCurveType) -> ());
}
setIndexBuffer :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, indexBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexBuffer_, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, indexBuffer: MTL4BufferRange) -> ());
}
setIndexType :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, indexType: MTLIndexType) -> () {
	#insert #run METHOD_BODY(__selectors.setIndexType_, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, indexType: MTLIndexType) -> ());
}
setRadiusBuffers :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, radiusBuffers: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setRadiusBuffers_, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, radiusBuffers: MTL4BufferRange) -> ());
}
setRadiusFormat :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setRadiusFormat_, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, radiusFormat: MTLAttributeFormat) -> ());
}
setRadiusStride :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, radiusStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setRadiusStride_, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, radiusStride: NSUInteger) -> ());
}
setSegmentControlPointCount :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSegmentControlPointCount_, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, segmentControlPointCount: NSUInteger) -> ());
}
setSegmentCount :: (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, segmentCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSegmentCount_, #type (self: *MTL4AccelerationStructureMotionCurveGeometryDescriptor, segmentCount: NSUInteger) -> ());
}


MTL4InstanceAccelerationStructureDescriptor :: struct { using #as _: MTL4AccelerationStructureDescriptor; }
instanceCount :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.instanceCount, #type (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger);
}
instanceDescriptorBuffer :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.instanceDescriptorBuffer, #type (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTL4BufferRange);
}
instanceDescriptorStride :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.instanceDescriptorStride, #type (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger);
}
instanceDescriptorType :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType {
	#insert #run METHOD_BODY(__selectors.instanceDescriptorType, #type (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType);
}
instanceTransformationMatrixLayout :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTLMatrixLayout {
	#insert #run METHOD_BODY(__selectors.instanceTransformationMatrixLayout, #type (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTLMatrixLayout);
}
motionTransformBuffer :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.motionTransformBuffer, #type (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTL4BufferRange);
}
motionTransformCount :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.motionTransformCount, #type (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger);
}
motionTransformStride :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.motionTransformStride, #type (self: *MTL4InstanceAccelerationStructureDescriptor) -> NSUInteger);
}
motionTransformType :: (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTLTransformType {
	#insert #run METHOD_BODY(__selectors.motionTransformType, #type (self: *MTL4InstanceAccelerationStructureDescriptor) -> MTLTransformType);
}
setInstanceCount :: (self: *MTL4InstanceAccelerationStructureDescriptor, instanceCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceCount_, #type (self: *MTL4InstanceAccelerationStructureDescriptor, instanceCount: NSUInteger) -> ());
}
setInstanceDescriptorBuffer :: (self: *MTL4InstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceDescriptorBuffer_, #type (self: *MTL4InstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: MTL4BufferRange) -> ());
}
setInstanceDescriptorStride :: (self: *MTL4InstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceDescriptorStride_, #type (self: *MTL4InstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> ());
}
setInstanceDescriptorType :: (self: *MTL4InstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceDescriptorType_, #type (self: *MTL4InstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> ());
}
setInstanceTransformationMatrixLayout :: (self: *MTL4InstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceTransformationMatrixLayout_, #type (self: *MTL4InstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> ());
}
setMotionTransformBuffer :: (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformBuffer_, #type (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformBuffer: MTL4BufferRange) -> ());
}
setMotionTransformCount :: (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformCount_, #type (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformCount: NSUInteger) -> ());
}
setMotionTransformStride :: (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformStride_, #type (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> ());
}
setMotionTransformType :: (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformType_, #type (self: *MTL4InstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> ());
}


MTL4IndirectInstanceAccelerationStructureDescriptor :: struct { using #as _: MTL4AccelerationStructureDescriptor; }
instanceCountBuffer :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.instanceCountBuffer, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange);
}
instanceDescriptorBuffer :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.instanceDescriptorBuffer, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange);
}
instanceDescriptorStride :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.instanceDescriptorStride, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
instanceDescriptorType :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType {
	#insert #run METHOD_BODY(__selectors.instanceDescriptorType, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTLAccelerationStructureInstanceDescriptorType);
}
instanceTransformationMatrixLayout :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTLMatrixLayout {
	#insert #run METHOD_BODY(__selectors.instanceTransformationMatrixLayout, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTLMatrixLayout);
}
maxInstanceCount :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxInstanceCount, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
maxMotionTransformCount :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxMotionTransformCount, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
motionTransformBuffer :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.motionTransformBuffer, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange);
}
motionTransformCountBuffer :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange {
	#insert #run METHOD_BODY(__selectors.motionTransformCountBuffer, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTL4BufferRange);
}
motionTransformStride :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.motionTransformStride, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> NSUInteger);
}
motionTransformType :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTLTransformType {
	#insert #run METHOD_BODY(__selectors.motionTransformType, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor) -> MTLTransformType);
}
setInstanceCountBuffer :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceCountBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceCountBuffer_, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceCountBuffer: MTL4BufferRange) -> ());
}
setInstanceDescriptorBuffer :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceDescriptorBuffer_, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceDescriptorBuffer: MTL4BufferRange) -> ());
}
setInstanceDescriptorStride :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceDescriptorStride_, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceDescriptorStride: NSUInteger) -> ());
}
setInstanceDescriptorType :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceDescriptorType_, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceDescriptorType: MTLAccelerationStructureInstanceDescriptorType) -> ());
}
setInstanceTransformationMatrixLayout :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> () {
	#insert #run METHOD_BODY(__selectors.setInstanceTransformationMatrixLayout_, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, instanceTransformationMatrixLayout: MTLMatrixLayout) -> ());
}
setMaxInstanceCount :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, maxInstanceCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxInstanceCount_, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, maxInstanceCount: NSUInteger) -> ());
}
setMaxMotionTransformCount :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, maxMotionTransformCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxMotionTransformCount_, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, maxMotionTransformCount: NSUInteger) -> ());
}
setMotionTransformBuffer :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformBuffer_, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformBuffer: MTL4BufferRange) -> ());
}
setMotionTransformCountBuffer :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformCountBuffer: MTL4BufferRange) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformCountBuffer_, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformCountBuffer: MTL4BufferRange) -> ());
}
setMotionTransformStride :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformStride_, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformStride: NSUInteger) -> ());
}
setMotionTransformType :: (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> () {
	#insert #run METHOD_BODY(__selectors.setMotionTransformType_, #type (self: *MTL4IndirectInstanceAccelerationStructureDescriptor, motionTransformType: MTLTransformType) -> ());
}


MTLEvent :: struct {}
device :: (self: *MTLEvent) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLEvent) -> *MTLDevice);
}
label :: (self: *MTLEvent) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLEvent) -> *NSString);
}
setLabel :: (self: *MTLEvent, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLEvent, label: *NSString) -> ());
}


MTLSharedEventListener :: struct {}
dispatchQueue :: (self: *MTLSharedEventListener) -> dispatch_queue_t {
	#insert #run METHOD_BODY(__selectors.dispatchQueue, #type (self: *MTLSharedEventListener) -> dispatch_queue_t);
}
init :: (self: *MTLSharedEventListener, dispatchQueue: dispatch_queue_t) -> *MTLSharedEventListener {
	#insert #run METHOD_BODY(__selectors.initWithDispatchQueue_, #type (self: *MTLSharedEventListener, dispatchQueue: dispatch_queue_t) -> *MTLSharedEventListener);
}
sharedListener :: (self: *MTLSharedEventListener) -> *MTLSharedEventListener {
	#insert #run METHOD_BODY(__selectors.sharedListener, #type (self: *MTLSharedEventListener) -> *MTLSharedEventListener);
}


MTLSharedEvent :: struct { using #as _: MTLEvent; }
newSharedEventHandle :: (self: *MTLSharedEvent) -> *MTLSharedEventHandle {
	#insert #run METHOD_BODY(__selectors.newSharedEventHandle, #type (self: *MTLSharedEvent) -> *MTLSharedEventHandle);
}
notifyListener :: (self: *MTLSharedEvent, listener: *MTLSharedEventListener, value: u64, block: MTLSharedEventNotificationBlock) -> () {
	#insert #run METHOD_BODY(__selectors.notifyListener_atValue_block_, #type (self: *MTLSharedEvent, listener: *MTLSharedEventListener, value: u64, block: MTLSharedEventNotificationBlock) -> ());
}
waitUntilSignaledValue :: (self: *MTLSharedEvent, value: u64, milliseconds: u64) -> bool {
	#insert #run METHOD_BODY(__selectors.waitUntilSignaledValue_timeoutMS_, #type (self: *MTLSharedEvent, value: u64, milliseconds: u64) -> bool);
}
setSignaledValue :: (self: *MTLSharedEvent, signaledValue: u64) -> () {
	#insert #run METHOD_BODY(__selectors.setSignaledValue_, #type (self: *MTLSharedEvent, signaledValue: u64) -> ());
}
signaledValue :: (self: *MTLSharedEvent) -> u64 {
	#insert #run METHOD_BODY(__selectors.signaledValue, #type (self: *MTLSharedEvent) -> u64);
}


MTLSharedEventHandle :: struct {}
label :: (self: *MTLSharedEventHandle) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLSharedEventHandle) -> *NSString);
}


MTL4PipelineOptions :: struct {}
setShaderReflection :: (self: *MTL4PipelineOptions, shaderReflection: MTL4ShaderReflection) -> () {
	#insert #run METHOD_BODY(__selectors.setShaderReflection_, #type (self: *MTL4PipelineOptions, shaderReflection: MTL4ShaderReflection) -> ());
}
setShaderValidation :: (self: *MTL4PipelineOptions, shaderValidation: MTLShaderValidation) -> () {
	#insert #run METHOD_BODY(__selectors.setShaderValidation_, #type (self: *MTL4PipelineOptions, shaderValidation: MTLShaderValidation) -> ());
}
shaderReflection :: (self: *MTL4PipelineOptions) -> MTL4ShaderReflection {
	#insert #run METHOD_BODY(__selectors.shaderReflection, #type (self: *MTL4PipelineOptions) -> MTL4ShaderReflection);
}
shaderValidation :: (self: *MTL4PipelineOptions) -> MTLShaderValidation {
	#insert #run METHOD_BODY(__selectors.shaderValidation, #type (self: *MTL4PipelineOptions) -> MTLShaderValidation);
}


MTL4PipelineDescriptor :: struct {}
label :: (self: *MTL4PipelineDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTL4PipelineDescriptor) -> *NSString);
}
options :: (self: *MTL4PipelineDescriptor) -> *MTL4PipelineOptions {
	#insert #run METHOD_BODY(__selectors.options, #type (self: *MTL4PipelineDescriptor) -> *MTL4PipelineOptions);
}
setLabel :: (self: *MTL4PipelineDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTL4PipelineDescriptor, label: *NSString) -> ());
}
setOptions :: (self: *MTL4PipelineDescriptor, options: *MTL4PipelineOptions) -> () {
	#insert #run METHOD_BODY(__selectors.setOptions_, #type (self: *MTL4PipelineDescriptor, options: *MTL4PipelineOptions) -> ());
}


MTLBinaryArchiveDescriptor :: struct {}
setUrl :: (self: *MTLBinaryArchiveDescriptor, url: *NSURL) -> () {
	#insert #run METHOD_BODY(__selectors.setUrl_, #type (self: *MTLBinaryArchiveDescriptor, url: *NSURL) -> ());
}
url :: (self: *MTLBinaryArchiveDescriptor) -> *NSURL {
	#insert #run METHOD_BODY(__selectors.url, #type (self: *MTLBinaryArchiveDescriptor) -> *NSURL);
}


MTLBinaryArchive :: struct {}
addComputePipelineFunctions :: (self: *MTLBinaryArchive, descriptor: *MTLComputePipelineDescriptor, error: **NSError) -> bool {
	#insert #run METHOD_BODY(__selectors.addComputePipelineFunctionsWithDescriptor_error_, #type (self: *MTLBinaryArchive, descriptor: *MTLComputePipelineDescriptor, error: **NSError) -> bool);
}
addFunction :: (self: *MTLBinaryArchive, descriptor: *MTLFunctionDescriptor, library: *MTLLibrary, error: **NSError) -> bool {
	#insert #run METHOD_BODY(__selectors.addFunctionWithDescriptor_library_error_, #type (self: *MTLBinaryArchive, descriptor: *MTLFunctionDescriptor, library: *MTLLibrary, error: **NSError) -> bool);
}
addLibrary :: (self: *MTLBinaryArchive, descriptor: *MTLStitchedLibraryDescriptor, error: **NSError) -> bool {
	#insert #run METHOD_BODY(__selectors.addLibraryWithDescriptor_error_, #type (self: *MTLBinaryArchive, descriptor: *MTLStitchedLibraryDescriptor, error: **NSError) -> bool);
}
addMeshRenderPipelineFunctions :: (self: *MTLBinaryArchive, descriptor: *MTLMeshRenderPipelineDescriptor, error: **NSError) -> bool {
	#insert #run METHOD_BODY(__selectors.addMeshRenderPipelineFunctionsWithDescriptor_error_, #type (self: *MTLBinaryArchive, descriptor: *MTLMeshRenderPipelineDescriptor, error: **NSError) -> bool);
}
addRenderPipelineFunctions :: (self: *MTLBinaryArchive, descriptor: *MTLRenderPipelineDescriptor, error: **NSError) -> bool {
	#insert #run METHOD_BODY(__selectors.addRenderPipelineFunctionsWithDescriptor_error_, #type (self: *MTLBinaryArchive, descriptor: *MTLRenderPipelineDescriptor, error: **NSError) -> bool);
}
addTileRenderPipelineFunctions :: (self: *MTLBinaryArchive, descriptor: *MTLTileRenderPipelineDescriptor, error: **NSError) -> bool {
	#insert #run METHOD_BODY(__selectors.addTileRenderPipelineFunctionsWithDescriptor_error_, #type (self: *MTLBinaryArchive, descriptor: *MTLTileRenderPipelineDescriptor, error: **NSError) -> bool);
}
device :: (self: *MTLBinaryArchive) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLBinaryArchive) -> *MTLDevice);
}
label :: (self: *MTLBinaryArchive) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLBinaryArchive) -> *NSString);
}
serializeToURL :: (self: *MTLBinaryArchive, url: *NSURL, error: **NSError) -> bool {
	#insert #run METHOD_BODY(__selectors.serializeToURL_error_, #type (self: *MTLBinaryArchive, url: *NSURL, error: **NSError) -> bool);
}
setLabel :: (self: *MTLBinaryArchive, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLBinaryArchive, label: *NSString) -> ());
}


MTL4CompilerDescriptor :: struct {}
label :: (self: *MTL4CompilerDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTL4CompilerDescriptor) -> *NSString);
}
pipelineDataSetSerializer :: (self: *MTL4CompilerDescriptor) -> *MTL4PipelineDataSetSerializer {
	#insert #run METHOD_BODY(__selectors.pipelineDataSetSerializer, #type (self: *MTL4CompilerDescriptor) -> *MTL4PipelineDataSetSerializer);
}
setLabel :: (self: *MTL4CompilerDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTL4CompilerDescriptor, label: *NSString) -> ());
}
setPipelineDataSetSerializer :: (self: *MTL4CompilerDescriptor, pipelineDataSetSerializer: *MTL4PipelineDataSetSerializer) -> () {
	#insert #run METHOD_BODY(__selectors.setPipelineDataSetSerializer_, #type (self: *MTL4CompilerDescriptor, pipelineDataSetSerializer: *MTL4PipelineDataSetSerializer) -> ());
}


MTL4CompilerTaskOptions :: struct {}
lookupArchives :: (self: *MTL4CompilerTaskOptions) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.lookupArchives, #type (self: *MTL4CompilerTaskOptions) -> *NSArray);
}
setLookupArchives :: (self: *MTL4CompilerTaskOptions, lookupArchives: *NSArray) -> () {
	#insert #run METHOD_BODY(__selectors.setLookupArchives_, #type (self: *MTL4CompilerTaskOptions, lookupArchives: *NSArray) -> ());
}


MTL4Compiler :: struct {}
device :: (self: *MTL4Compiler) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTL4Compiler) -> *MTLDevice);
}
label :: (self: *MTL4Compiler) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTL4Compiler) -> *NSString);
}
newBinaryFunction :: (self: *MTL4Compiler, descriptor: *MTL4BinaryFunctionDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTL4BinaryFunction {
	#insert #run METHOD_BODY(__selectors.newBinaryFunctionWithDescriptor_compilerTaskOptions_error_, #type (self: *MTL4Compiler, descriptor: *MTL4BinaryFunctionDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTL4BinaryFunction);
}
newBinaryFunction :: (self: *MTL4Compiler, descriptor: *MTL4BinaryFunctionDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTL4NewBinaryFunctionCompletionHandler) -> *MTL4CompilerTask {
	#insert #run METHOD_BODY(__selectors.newBinaryFunctionWithDescriptor_compilerTaskOptions_completionHandler_, #type (self: *MTL4Compiler, descriptor: *MTL4BinaryFunctionDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTL4NewBinaryFunctionCompletionHandler) -> *MTL4CompilerTask);
}
newComputePipelineState :: (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLComputePipelineState {
	#insert #run METHOD_BODY(__selectors.newComputePipelineStateWithDescriptor_compilerTaskOptions_error_, #type (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLComputePipelineState);
}
newComputePipelineState :: (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLComputePipelineState {
	#insert #run METHOD_BODY(__selectors.newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_error_, #type (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLComputePipelineState);
}
newComputePipelineState :: (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> *MTL4CompilerTask {
	#insert #run METHOD_BODY(__selectors.newComputePipelineStateWithDescriptor_compilerTaskOptions_completionHandler_, #type (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> *MTL4CompilerTask);
}
newComputePipelineState :: (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> *MTL4CompilerTask {
	#insert #run METHOD_BODY(__selectors.newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_completionHandler_, #type (self: *MTL4Compiler, descriptor: *MTL4ComputePipelineDescriptor, dynamicLinkingDescriptor: *MTL4PipelineStageDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewComputePipelineStateCompletionHandler) -> *MTL4CompilerTask);
}
pipelineDataSetSerializer :: (self: *MTL4Compiler) -> *MTL4PipelineDataSetSerializer {
	#insert #run METHOD_BODY(__selectors.pipelineDataSetSerializer, #type (self: *MTL4Compiler) -> *MTL4PipelineDataSetSerializer);
}
newDynamicLibrary :: (self: *MTL4Compiler, library: *MTLLibrary, error: **NSError) -> *MTLDynamicLibrary {
	#insert #run METHOD_BODY(__selectors.newDynamicLibrary_error_, #type (self: *MTL4Compiler, library: *MTLLibrary, error: **NSError) -> *MTLDynamicLibrary);
}
newDynamicLibrary :: (self: *MTL4Compiler, url: *NSURL, error: **NSError) -> *MTLDynamicLibrary {
	#insert #run METHOD_BODY(__selectors.newDynamicLibraryWithURL_error_, #type (self: *MTL4Compiler, url: *NSURL, error: **NSError) -> *MTLDynamicLibrary);
}
newDynamicLibrary :: (self: *MTL4Compiler, library: *MTLLibrary, completionHandler: MTLNewDynamicLibraryCompletionHandler) -> *MTL4CompilerTask {
	#insert #run METHOD_BODY(__selectors.newDynamicLibrary_completionHandler_, #type (self: *MTL4Compiler, library: *MTLLibrary, completionHandler: MTLNewDynamicLibraryCompletionHandler) -> *MTL4CompilerTask);
}
newDynamicLibrary :: (self: *MTL4Compiler, url: *NSURL, completionHandler: MTLNewDynamicLibraryCompletionHandler) -> *MTL4CompilerTask {
	#insert #run METHOD_BODY(__selectors.newDynamicLibraryWithURL_completionHandler_, #type (self: *MTL4Compiler, url: *NSURL, completionHandler: MTLNewDynamicLibraryCompletionHandler) -> *MTL4CompilerTask);
}
newRenderPipelineStateBySpecialization :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, pipeline: *MTLRenderPipelineState, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateBySpecializationWithDescriptor_pipeline_completionHandler_, #type (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, pipeline: *MTLRenderPipelineState, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask);
}
newRenderPipelineStateBySpecialization :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, pipeline: *MTLRenderPipelineState, error: **NSError) -> *MTLRenderPipelineState {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateBySpecializationWithDescriptor_pipeline_error_, #type (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, pipeline: *MTLRenderPipelineState, error: **NSError) -> *MTLRenderPipelineState);
}
newLibrary :: (self: *MTL4Compiler, descriptor: *MTL4LibraryDescriptor, error: **NSError) -> *MTLLibrary {
	#insert #run METHOD_BODY(__selectors.newLibraryWithDescriptor_error_, #type (self: *MTL4Compiler, descriptor: *MTL4LibraryDescriptor, error: **NSError) -> *MTLLibrary);
}
newLibrary :: (self: *MTL4Compiler, descriptor: *MTL4LibraryDescriptor, completionHandler: MTLNewLibraryCompletionHandler) -> *MTL4CompilerTask {
	#insert #run METHOD_BODY(__selectors.newLibraryWithDescriptor_completionHandler_, #type (self: *MTL4Compiler, descriptor: *MTL4LibraryDescriptor, completionHandler: MTLNewLibraryCompletionHandler) -> *MTL4CompilerTask);
}
newRenderPipelineState :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_completionHandler_, #type (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask);
}
newMachineLearningPipelineState :: (self: *MTL4Compiler, descriptor: *MTL4MachineLearningPipelineDescriptor, error: **NSError) -> *MTL4MachineLearningPipelineState {
	#insert #run METHOD_BODY(__selectors.newMachineLearningPipelineStateWithDescriptor_error_, #type (self: *MTL4Compiler, descriptor: *MTL4MachineLearningPipelineDescriptor, error: **NSError) -> *MTL4MachineLearningPipelineState);
}
newMachineLearningPipelineState :: (self: *MTL4Compiler, descriptor: *MTL4MachineLearningPipelineDescriptor, completionHandler: MTL4NewMachineLearningPipelineStateCompletionHandler) -> *MTL4CompilerTask {
	#insert #run METHOD_BODY(__selectors.newMachineLearningPipelineStateWithDescriptor_completionHandler_, #type (self: *MTL4Compiler, descriptor: *MTL4MachineLearningPipelineDescriptor, completionHandler: MTL4NewMachineLearningPipelineStateCompletionHandler) -> *MTL4CompilerTask);
}
newRenderPipelineState :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateWithDescriptor_compilerTaskOptions_completionHandler_, #type (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, completionHandler: MTLNewRenderPipelineStateCompletionHandler) -> *MTL4CompilerTask);
}
newRenderPipelineState :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLRenderPipelineState {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateWithDescriptor_compilerTaskOptions_error_, #type (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLRenderPipelineState);
}
newRenderPipelineState :: (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLRenderPipelineState {
	#insert #run METHOD_BODY(__selectors.newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_error_, #type (self: *MTL4Compiler, descriptor: *MTL4PipelineDescriptor, dynamicLinkingDescriptor: *MTL4RenderPipelineDynamicLinkingDescriptor, compilerTaskOptions: *MTL4CompilerTaskOptions, error: **NSError) -> *MTLRenderPipelineState);
}


MTLIOCommandQueue :: struct {}
commandBuffer :: (self: *MTLIOCommandQueue) -> *MTLIOCommandBuffer {
	#insert #run METHOD_BODY(__selectors.commandBuffer, #type (self: *MTLIOCommandQueue) -> *MTLIOCommandBuffer);
}
commandBufferWithUnretainedReferences :: (self: *MTLIOCommandQueue) -> *MTLIOCommandBuffer {
	#insert #run METHOD_BODY(__selectors.commandBufferWithUnretainedReferences, #type (self: *MTLIOCommandQueue) -> *MTLIOCommandBuffer);
}
enqueueBarrier :: (self: *MTLIOCommandQueue) -> () {
	#insert #run METHOD_BODY(__selectors.enqueueBarrier, #type (self: *MTLIOCommandQueue) -> ());
}
label :: (self: *MTLIOCommandQueue) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLIOCommandQueue) -> *NSString);
}
setLabel :: (self: *MTLIOCommandQueue, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLIOCommandQueue, label: *NSString) -> ());
}


MTLIOScratchBuffer :: struct {}
buffer :: (self: *MTLIOScratchBuffer) -> *MTLBuffer {
	#insert #run METHOD_BODY(__selectors.buffer, #type (self: *MTLIOScratchBuffer) -> *MTLBuffer);
}


MTLIOScratchBufferAllocator :: struct {}
newScratchBuffer :: (self: *MTLIOScratchBufferAllocator, minimumSize: NSUInteger) -> *MTLIOScratchBuffer {
	#insert #run METHOD_BODY(__selectors.newScratchBufferWithMinimumSize_, #type (self: *MTLIOScratchBufferAllocator, minimumSize: NSUInteger) -> *MTLIOScratchBuffer);
}


MTLIOCommandQueueDescriptor :: struct {}
maxCommandBufferCount :: (self: *MTLIOCommandQueueDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxCommandBufferCount, #type (self: *MTLIOCommandQueueDescriptor) -> NSUInteger);
}
maxCommandsInFlight :: (self: *MTLIOCommandQueueDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maxCommandsInFlight, #type (self: *MTLIOCommandQueueDescriptor) -> NSUInteger);
}
priority :: (self: *MTLIOCommandQueueDescriptor) -> MTLIOPriority {
	#insert #run METHOD_BODY(__selectors.priority, #type (self: *MTLIOCommandQueueDescriptor) -> MTLIOPriority);
}
scratchBufferAllocator :: (self: *MTLIOCommandQueueDescriptor) -> *MTLIOScratchBufferAllocator {
	#insert #run METHOD_BODY(__selectors.scratchBufferAllocator, #type (self: *MTLIOCommandQueueDescriptor) -> *MTLIOScratchBufferAllocator);
}
setMaxCommandBufferCount :: (self: *MTLIOCommandQueueDescriptor, maxCommandBufferCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxCommandBufferCount_, #type (self: *MTLIOCommandQueueDescriptor, maxCommandBufferCount: NSUInteger) -> ());
}
setMaxCommandsInFlight :: (self: *MTLIOCommandQueueDescriptor, maxCommandsInFlight: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaxCommandsInFlight_, #type (self: *MTLIOCommandQueueDescriptor, maxCommandsInFlight: NSUInteger) -> ());
}
setPriority :: (self: *MTLIOCommandQueueDescriptor, priority: MTLIOPriority) -> () {
	#insert #run METHOD_BODY(__selectors.setPriority_, #type (self: *MTLIOCommandQueueDescriptor, priority: MTLIOPriority) -> ());
}
setScratchBufferAllocator :: (self: *MTLIOCommandQueueDescriptor, scratchBufferAllocator: *MTLIOScratchBufferAllocator) -> () {
	#insert #run METHOD_BODY(__selectors.setScratchBufferAllocator_, #type (self: *MTLIOCommandQueueDescriptor, scratchBufferAllocator: *MTLIOScratchBufferAllocator) -> ());
}
setType :: (self: *MTLIOCommandQueueDescriptor, type: MTLIOCommandQueueType) -> () {
	#insert #run METHOD_BODY(__selectors.setType_, #type (self: *MTLIOCommandQueueDescriptor, type: MTLIOCommandQueueType) -> ());
}
type :: (self: *MTLIOCommandQueueDescriptor) -> MTLIOCommandQueueType {
	#insert #run METHOD_BODY(__selectors.type, #type (self: *MTLIOCommandQueueDescriptor) -> MTLIOCommandQueueType);
}


MTLIOFileHandle :: struct {}
label :: (self: *MTLIOFileHandle) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLIOFileHandle) -> *NSString);
}
setLabel :: (self: *MTLIOFileHandle, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLIOFileHandle, label: *NSString) -> ());
}


MTLCaptureScope :: struct {}
device :: (self: *MTLCaptureScope) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLCaptureScope) -> *MTLDevice);
}
label :: (self: *MTLCaptureScope) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLCaptureScope) -> *NSString);
}
setLabel :: (self: *MTLCaptureScope, pLabel: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLCaptureScope, pLabel: *NSString) -> ());
}
commandQueue :: (self: *MTLCaptureScope) -> *MTLCommandQueue {
	#insert #run METHOD_BODY(__selectors.commandQueue, #type (self: *MTLCaptureScope) -> *MTLCommandQueue);
}
beginScope :: (self: *MTLCaptureScope) -> () {
	#insert #run METHOD_BODY(__selectors.beginScope, #type (self: *MTLCaptureScope) -> ());
}
endScope :: (self: *MTLCaptureScope) -> () {
	#insert #run METHOD_BODY(__selectors.endScope, #type (self: *MTLCaptureScope) -> ());
}


MTLComputeCommandEncoder :: struct { using #as _: MTLCommandEncoder; }
dispatchThreadgroups :: (self: *MTLComputeCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.dispatchThreadgroups_threadsPerThreadgroup_, #type (self: *MTLComputeCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> ());
}
dispatchThreadgroups :: (self: *MTLComputeCommandEncoder, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger, threadsPerThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_, #type (self: *MTLComputeCommandEncoder, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger, threadsPerThreadgroup: MTLSize) -> ());
}
dispatchThreads :: (self: *MTLComputeCommandEncoder, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.dispatchThreads_threadsPerThreadgroup_, #type (self: *MTLComputeCommandEncoder, threadsPerGrid: MTLSize, threadsPerThreadgroup: MTLSize) -> ());
}
dispatchType :: (self: *MTLComputeCommandEncoder) -> MTLDispatchType {
	#insert #run METHOD_BODY(__selectors.dispatchType, #type (self: *MTLComputeCommandEncoder) -> MTLDispatchType);
}
executeCommandsInBuffer :: (self: *MTLComputeCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.executeCommandsInBuffer_withRange_, #type (self: *MTLComputeCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> ());
}
executeCommandsInBuffer :: (self: *MTLComputeCommandEncoder, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_, #type (self: *MTLComputeCommandEncoder, indirectCommandbuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> ());
}
memoryBarrier :: (self: *MTLComputeCommandEncoder, scope: MTLBarrierScope) -> () {
	#insert #run METHOD_BODY(__selectors.memoryBarrierWithScope_, #type (self: *MTLComputeCommandEncoder, scope: MTLBarrierScope) -> ());
}
memoryBarrier :: (self: *MTLComputeCommandEncoder, resources: **MTLResource, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.memoryBarrierWithResources_count_, #type (self: *MTLComputeCommandEncoder, resources: **MTLResource, count: NSUInteger) -> ());
}
sampleCountersInBuffer :: (self: *MTLComputeCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: bool) -> () {
	#insert #run METHOD_BODY(__selectors.sampleCountersInBuffer_atSampleIndex_withBarrier_, #type (self: *MTLComputeCommandEncoder, sampleBuffer: *MTLCounterSampleBuffer, sampleIndex: NSUInteger, barrier: bool) -> ());
}
setAccelerationStructure :: (self: *MTLComputeCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setAccelerationStructure_atBufferIndex_, #type (self: *MTLComputeCommandEncoder, accelerationStructure: *MTLAccelerationStructure, bufferIndex: NSUInteger) -> ());
}
setBuffer :: (self: *MTLComputeCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBuffer_offset_atIndex_, #type (self: *MTLComputeCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, index: NSUInteger) -> ());
}
setBuffer :: (self: *MTLComputeCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBuffer_offset_attributeStride_atIndex_, #type (self: *MTLComputeCommandEncoder, buffer: *MTLBuffer, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> ());
}
setBufferOffset :: (self: *MTLComputeCommandEncoder, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBufferOffset_atIndex_, #type (self: *MTLComputeCommandEncoder, offset: NSUInteger, index: NSUInteger) -> ());
}
setBufferOffset :: (self: *MTLComputeCommandEncoder, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBufferOffset_attributeStride_atIndex_, #type (self: *MTLComputeCommandEncoder, offset: NSUInteger, stride: NSUInteger, index: NSUInteger) -> ());
}
setBuffers :: (self: *MTLComputeCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setBuffers_offsets_withRange_, #type (self: *MTLComputeCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, range: NSRange) -> ());
}
setBuffers :: (self: *MTLComputeCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, strides: *NSUInteger, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setBuffers_offsets_attributeStrides_withRange_, #type (self: *MTLComputeCommandEncoder, buffers: **MTLBuffer, offsets: *NSUInteger, strides: *NSUInteger, range: NSRange) -> ());
}
setBytes :: (self: *MTLComputeCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBytes_length_atIndex_, #type (self: *MTLComputeCommandEncoder, bytes: *void, length: NSUInteger, index: NSUInteger) -> ());
}
setBytes :: (self: *MTLComputeCommandEncoder, bytes: *void, length: NSUInteger, stride: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setBytes_length_attributeStride_atIndex_, #type (self: *MTLComputeCommandEncoder, bytes: *void, length: NSUInteger, stride: NSUInteger, index: NSUInteger) -> ());
}
setComputePipelineState :: (self: *MTLComputeCommandEncoder, state: *MTLComputePipelineState) -> () {
	#insert #run METHOD_BODY(__selectors.setComputePipelineState_, #type (self: *MTLComputeCommandEncoder, state: *MTLComputePipelineState) -> ());
}
setImageblockWidth :: (self: *MTLComputeCommandEncoder, width: NSUInteger, height: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setImageblockWidth_height_, #type (self: *MTLComputeCommandEncoder, width: NSUInteger, height: NSUInteger) -> ());
}
setIntersectionFunctionTable :: (self: *MTLComputeCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setIntersectionFunctionTable_atBufferIndex_, #type (self: *MTLComputeCommandEncoder, intersectionFunctionTable: *MTLIntersectionFunctionTable, bufferIndex: NSUInteger) -> ());
}
setIntersectionFunctionTables :: (self: *MTLComputeCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setIntersectionFunctionTables_withBufferRange_, #type (self: *MTLComputeCommandEncoder, intersectionFunctionTables: **MTLIntersectionFunctionTable, range: NSRange) -> ());
}
setSamplerState :: (self: *MTLComputeCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSamplerState_atIndex_, #type (self: *MTLComputeCommandEncoder, sampler: *MTLSamplerState, index: NSUInteger) -> ());
}
setSamplerState :: (self: *MTLComputeCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSamplerState_lodMinClamp_lodMaxClamp_atIndex_, #type (self: *MTLComputeCommandEncoder, sampler: *MTLSamplerState, lodMinClamp: float, lodMaxClamp: float, index: NSUInteger) -> ());
}
setSamplerStates :: (self: *MTLComputeCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setSamplerStates_withRange_, #type (self: *MTLComputeCommandEncoder, samplers: **MTLSamplerState, range: NSRange) -> ());
}
setSamplerStates :: (self: *MTLComputeCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setSamplerStates_lodMinClamps_lodMaxClamps_withRange_, #type (self: *MTLComputeCommandEncoder, samplers: **MTLSamplerState, lodMinClamps: *float, lodMaxClamps: *float, range: NSRange) -> ());
}
setStageInRegion :: (self: *MTLComputeCommandEncoder, region: MTLRegion) -> () {
	#insert #run METHOD_BODY(__selectors.setStageInRegion_, #type (self: *MTLComputeCommandEncoder, region: MTLRegion) -> ());
}
setStageInRegion :: (self: *MTLComputeCommandEncoder, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setStageInRegionWithIndirectBuffer_indirectBufferOffset_, #type (self: *MTLComputeCommandEncoder, indirectBuffer: *MTLBuffer, indirectBufferOffset: NSUInteger) -> ());
}
setTexture :: (self: *MTLComputeCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setTexture_atIndex_, #type (self: *MTLComputeCommandEncoder, texture: *MTLTexture, index: NSUInteger) -> ());
}
setTextures :: (self: *MTLComputeCommandEncoder, textures: **MTLTexture, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setTextures_withRange_, #type (self: *MTLComputeCommandEncoder, textures: **MTLTexture, range: NSRange) -> ());
}
setThreadgroupMemoryLength :: (self: *MTLComputeCommandEncoder, length: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setThreadgroupMemoryLength_atIndex_, #type (self: *MTLComputeCommandEncoder, length: NSUInteger, index: NSUInteger) -> ());
}
setVisibleFunctionTable :: (self: *MTLComputeCommandEncoder, visibleFunctionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVisibleFunctionTable_atBufferIndex_, #type (self: *MTLComputeCommandEncoder, visibleFunctionTable: *MTLVisibleFunctionTable, bufferIndex: NSUInteger) -> ());
}
setVisibleFunctionTables :: (self: *MTLComputeCommandEncoder, visibleFunctionTables: **MTLVisibleFunctionTable, range: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.setVisibleFunctionTables_withBufferRange_, #type (self: *MTLComputeCommandEncoder, visibleFunctionTables: **MTLVisibleFunctionTable, range: NSRange) -> ());
}
updateFence :: (self: *MTLComputeCommandEncoder, fence: *MTLFence) -> () {
	#insert #run METHOD_BODY(__selectors.updateFence_, #type (self: *MTLComputeCommandEncoder, fence: *MTLFence) -> ());
}
useHeap :: (self: *MTLComputeCommandEncoder, heap: *MTLHeap) -> () {
	#insert #run METHOD_BODY(__selectors.useHeap_, #type (self: *MTLComputeCommandEncoder, heap: *MTLHeap) -> ());
}
useHeaps :: (self: *MTLComputeCommandEncoder, heaps: **MTLHeap, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.useHeaps_count_, #type (self: *MTLComputeCommandEncoder, heaps: **MTLHeap, count: NSUInteger) -> ());
}
useResource :: (self: *MTLComputeCommandEncoder, resource: *MTLResource, usage: MTLResourceUsage) -> () {
	#insert #run METHOD_BODY(__selectors.useResource_usage_, #type (self: *MTLComputeCommandEncoder, resource: *MTLResource, usage: MTLResourceUsage) -> ());
}
useResources :: (self: *MTLComputeCommandEncoder, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> () {
	#insert #run METHOD_BODY(__selectors.useResources_count_usage_, #type (self: *MTLComputeCommandEncoder, resources: **MTLResource, count: NSUInteger, usage: MTLResourceUsage) -> ());
}
waitForFence :: (self: *MTLComputeCommandEncoder, fence: *MTLFence) -> () {
	#insert #run METHOD_BODY(__selectors.waitForFence_, #type (self: *MTLComputeCommandEncoder, fence: *MTLFence) -> ());
}


MTL4RenderCommandEncoder :: struct { using #as _: MTL4CommandEncoder; }
dispatchThreadsPerTile :: (self: *MTL4RenderCommandEncoder, threadsPerTile: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.dispatchThreadsPerTile_, #type (self: *MTL4RenderCommandEncoder, threadsPerTile: MTLSize) -> ());
}
drawIndexedPrimitives :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_, #type (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger) -> ());
}
drawIndexedPrimitives :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, instanceCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_instanceCount_, #type (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, instanceCount: NSUInteger) -> ());
}
drawIndexedPrimitives :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_instanceCount_baseVertex_baseInstance_, #type (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexCount: NSUInteger, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, instanceCount: NSUInteger, baseVertex: NSInteger, baseInstance: NSUInteger) -> ());
}
drawIndexedPrimitives :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, indirectBuffer: MTLGPUAddress) -> () {
	#insert #run METHOD_BODY(__selectors.drawIndexedPrimitives_indexType_indexBuffer_indexBufferLength_indirectBuffer_, #type (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indexType: MTLIndexType, indexBuffer: MTLGPUAddress, indexBufferLength: NSUInteger, indirectBuffer: MTLGPUAddress) -> ());
}
drawMeshThreadgroups :: (self: *MTL4RenderCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, #type (self: *MTL4RenderCommandEncoder, threadgroupsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> ());
}
drawMeshThreadgroups :: (self: *MTL4RenderCommandEncoder, indirectBuffer: MTLGPUAddress, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.drawMeshThreadgroupsWithIndirectBuffer_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, #type (self: *MTL4RenderCommandEncoder, indirectBuffer: MTLGPUAddress, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> ());
}
drawMeshThreads :: (self: *MTL4RenderCommandEncoder, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> () {
	#insert #run METHOD_BODY(__selectors.drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_, #type (self: *MTL4RenderCommandEncoder, threadsPerGrid: MTLSize, threadsPerObjectThreadgroup: MTLSize, threadsPerMeshThreadgroup: MTLSize) -> ());
}
drawPrimitives :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawPrimitives_vertexStart_vertexCount_, #type (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger) -> ());
}
drawPrimitives :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawPrimitives_vertexStart_vertexCount_instanceCount_, #type (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger) -> ());
}
drawPrimitives :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_, #type (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, vertexStart: NSUInteger, vertexCount: NSUInteger, instanceCount: NSUInteger, baseInstance: NSUInteger) -> ());
}
drawPrimitives :: (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indirectBuffer: MTLGPUAddress) -> () {
	#insert #run METHOD_BODY(__selectors.drawPrimitives_indirectBuffer_, #type (self: *MTL4RenderCommandEncoder, primitiveType: MTLPrimitiveType, indirectBuffer: MTLGPUAddress) -> ());
}
executeCommandsInBuffer :: (self: *MTL4RenderCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> () {
	#insert #run METHOD_BODY(__selectors.executeCommandsInBuffer_withRange_, #type (self: *MTL4RenderCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, executionRange: NSRange) -> ());
}
executeCommandsInBuffer :: (self: *MTL4RenderCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: MTLGPUAddress) -> () {
	#insert #run METHOD_BODY(__selectors.executeCommandsInBuffer_indirectBuffer_, #type (self: *MTL4RenderCommandEncoder, indirectCommandBuffer: *MTLIndirectCommandBuffer, indirectRangeBuffer: MTLGPUAddress) -> ());
}
setArgumentTable :: (self: *MTL4RenderCommandEncoder, argumentTable: *MTL4ArgumentTable, stages: MTLRenderStages) -> () {
	#insert #run METHOD_BODY(__selectors.setArgumentTable_atStages_, #type (self: *MTL4RenderCommandEncoder, argumentTable: *MTL4ArgumentTable, stages: MTLRenderStages) -> ());
}
setBlendColor :: (self: *MTL4RenderCommandEncoder, red: float, green: float, blue: float, alpha: float) -> () {
	#insert #run METHOD_BODY(__selectors.setBlendColorRed_green_blue_alpha_, #type (self: *MTL4RenderCommandEncoder, red: float, green: float, blue: float, alpha: float) -> ());
}
setColorAttachmentMap :: (self: *MTL4RenderCommandEncoder, mapping: *MTLLogicalToPhysicalColorAttachmentMap) -> () {
	#insert #run METHOD_BODY(__selectors.setColorAttachmentMap_, #type (self: *MTL4RenderCommandEncoder, mapping: *MTLLogicalToPhysicalColorAttachmentMap) -> ());
}
setColorStoreAction :: (self: *MTL4RenderCommandEncoder, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setColorStoreAction_atIndex_, #type (self: *MTL4RenderCommandEncoder, storeAction: MTLStoreAction, colorAttachmentIndex: NSUInteger) -> ());
}
setCullMode :: (self: *MTL4RenderCommandEncoder, cullMode: MTLCullMode) -> () {
	#insert #run METHOD_BODY(__selectors.setCullMode_, #type (self: *MTL4RenderCommandEncoder, cullMode: MTLCullMode) -> ());
}
setDepthBias :: (self: *MTL4RenderCommandEncoder, depthBias: float, slopeScale: float, clamp: float) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthBias_slopeScale_clamp_, #type (self: *MTL4RenderCommandEncoder, depthBias: float, slopeScale: float, clamp: float) -> ());
}
setDepthClipMode :: (self: *MTL4RenderCommandEncoder, depthClipMode: MTLDepthClipMode) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthClipMode_, #type (self: *MTL4RenderCommandEncoder, depthClipMode: MTLDepthClipMode) -> ());
}
setDepthStencilState :: (self: *MTL4RenderCommandEncoder, depthStencilState: *MTLDepthStencilState) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthStencilState_, #type (self: *MTL4RenderCommandEncoder, depthStencilState: *MTLDepthStencilState) -> ());
}
setDepthStoreAction :: (self: *MTL4RenderCommandEncoder, storeAction: MTLStoreAction) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthStoreAction_, #type (self: *MTL4RenderCommandEncoder, storeAction: MTLStoreAction) -> ());
}
setDepthTestBounds :: (self: *MTL4RenderCommandEncoder, minBound: float, maxBound: float) -> () {
	#insert #run METHOD_BODY(__selectors.setDepthTestMinBound_maxBound_, #type (self: *MTL4RenderCommandEncoder, minBound: float, maxBound: float) -> ());
}
setFrontFacingWinding :: (self: *MTL4RenderCommandEncoder, frontFacingWinding: MTLWinding) -> () {
	#insert #run METHOD_BODY(__selectors.setFrontFacingWinding_, #type (self: *MTL4RenderCommandEncoder, frontFacingWinding: MTLWinding) -> ());
}
setObjectThreadgroupMemoryLength :: (self: *MTL4RenderCommandEncoder, length: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObjectThreadgroupMemoryLength_atIndex_, #type (self: *MTL4RenderCommandEncoder, length: NSUInteger, index: NSUInteger) -> ());
}
setRenderPipelineState :: (self: *MTL4RenderCommandEncoder, pipelineState: *MTLRenderPipelineState) -> () {
	#insert #run METHOD_BODY(__selectors.setRenderPipelineState_, #type (self: *MTL4RenderCommandEncoder, pipelineState: *MTLRenderPipelineState) -> ());
}
setScissorRect :: (self: *MTL4RenderCommandEncoder, rect: MTLScissorRect) -> () {
	#insert #run METHOD_BODY(__selectors.setScissorRect_, #type (self: *MTL4RenderCommandEncoder, rect: MTLScissorRect) -> ());
}
setScissorRects :: (self: *MTL4RenderCommandEncoder, scissorRects: *MTLScissorRect, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setScissorRects_count_, #type (self: *MTL4RenderCommandEncoder, scissorRects: *MTLScissorRect, count: NSUInteger) -> ());
}
setStencilReferenceValue :: (self: *MTL4RenderCommandEncoder, referenceValue: u32) -> () {
	#insert #run METHOD_BODY(__selectors.setStencilReferenceValue_, #type (self: *MTL4RenderCommandEncoder, referenceValue: u32) -> ());
}
setStencilReferenceValues :: (self: *MTL4RenderCommandEncoder, frontReferenceValue: u32, backReferenceValue: u32) -> () {
	#insert #run METHOD_BODY(__selectors.setStencilFrontReferenceValue_backReferenceValue_, #type (self: *MTL4RenderCommandEncoder, frontReferenceValue: u32, backReferenceValue: u32) -> ());
}
setStencilStoreAction :: (self: *MTL4RenderCommandEncoder, storeAction: MTLStoreAction) -> () {
	#insert #run METHOD_BODY(__selectors.setStencilStoreAction_, #type (self: *MTL4RenderCommandEncoder, storeAction: MTLStoreAction) -> ());
}
setThreadgroupMemoryLength :: (self: *MTL4RenderCommandEncoder, length: NSUInteger, offset: NSUInteger, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setThreadgroupMemoryLength_offset_atIndex_, #type (self: *MTL4RenderCommandEncoder, length: NSUInteger, offset: NSUInteger, index: NSUInteger) -> ());
}
setTriangleFillMode :: (self: *MTL4RenderCommandEncoder, fillMode: MTLTriangleFillMode) -> () {
	#insert #run METHOD_BODY(__selectors.setTriangleFillMode_, #type (self: *MTL4RenderCommandEncoder, fillMode: MTLTriangleFillMode) -> ());
}
setVertexAmplificationCount :: (self: *MTL4RenderCommandEncoder, count: NSUInteger, viewMappings: *MTLVertexAmplificationViewMapping) -> () {
	#insert #run METHOD_BODY(__selectors.setVertexAmplificationCount_viewMappings_, #type (self: *MTL4RenderCommandEncoder, count: NSUInteger, viewMappings: *MTLVertexAmplificationViewMapping) -> ());
}
setViewport :: (self: *MTL4RenderCommandEncoder, viewport: MTLViewport) -> () {
	#insert #run METHOD_BODY(__selectors.setViewport_, #type (self: *MTL4RenderCommandEncoder, viewport: MTLViewport) -> ());
}
setViewports :: (self: *MTL4RenderCommandEncoder, viewports: *MTLViewport, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setViewports_count_, #type (self: *MTL4RenderCommandEncoder, viewports: *MTLViewport, count: NSUInteger) -> ());
}
setVisibilityResultMode :: (self: *MTL4RenderCommandEncoder, mode: MTLVisibilityResultMode, offset: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setVisibilityResultMode_offset_, #type (self: *MTL4RenderCommandEncoder, mode: MTLVisibilityResultMode, offset: NSUInteger) -> ());
}
tileHeight :: (self: *MTL4RenderCommandEncoder) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.tileHeight, #type (self: *MTL4RenderCommandEncoder) -> NSUInteger);
}
tileWidth :: (self: *MTL4RenderCommandEncoder) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.tileWidth, #type (self: *MTL4RenderCommandEncoder) -> NSUInteger);
}
writeTimestamp :: (self: *MTL4RenderCommandEncoder, granularity: MTL4TimestampGranularity, stage: MTLRenderStages, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.writeTimestampWithGranularity_afterStage_intoHeap_atIndex_, #type (self: *MTL4RenderCommandEncoder, granularity: MTL4TimestampGranularity, stage: MTLRenderStages, counterHeap: *MTL4CounterHeap, index: NSUInteger) -> ());
}


MTLCounter :: struct {}
name :: (self: *MTLCounter) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTLCounter) -> *NSString);
}


MTLCounterSet :: struct {}
counters :: (self: *MTLCounterSet) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.counters, #type (self: *MTLCounterSet) -> *NSArray);
}
name :: (self: *MTLCounterSet) -> *NSString {
	#insert #run METHOD_BODY(__selectors.name, #type (self: *MTLCounterSet) -> *NSString);
}


MTLCounterSampleBufferDescriptor :: struct {}
counterSet :: (self: *MTLCounterSampleBufferDescriptor) -> *MTLCounterSet {
	#insert #run METHOD_BODY(__selectors.counterSet, #type (self: *MTLCounterSampleBufferDescriptor) -> *MTLCounterSet);
}
label :: (self: *MTLCounterSampleBufferDescriptor) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLCounterSampleBufferDescriptor) -> *NSString);
}
sampleCount :: (self: *MTLCounterSampleBufferDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.sampleCount, #type (self: *MTLCounterSampleBufferDescriptor) -> NSUInteger);
}
setCounterSet :: (self: *MTLCounterSampleBufferDescriptor, counterSet: *MTLCounterSet) -> () {
	#insert #run METHOD_BODY(__selectors.setCounterSet_, #type (self: *MTLCounterSampleBufferDescriptor, counterSet: *MTLCounterSet) -> ());
}
setLabel :: (self: *MTLCounterSampleBufferDescriptor, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLCounterSampleBufferDescriptor, label: *NSString) -> ());
}
setSampleCount :: (self: *MTLCounterSampleBufferDescriptor, sampleCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setSampleCount_, #type (self: *MTLCounterSampleBufferDescriptor, sampleCount: NSUInteger) -> ());
}
setStorageMode :: (self: *MTLCounterSampleBufferDescriptor, storageMode: MTLStorageMode) -> () {
	#insert #run METHOD_BODY(__selectors.setStorageMode_, #type (self: *MTLCounterSampleBufferDescriptor, storageMode: MTLStorageMode) -> ());
}
storageMode :: (self: *MTLCounterSampleBufferDescriptor) -> MTLStorageMode {
	#insert #run METHOD_BODY(__selectors.storageMode, #type (self: *MTLCounterSampleBufferDescriptor) -> MTLStorageMode);
}


MTLCounterSampleBuffer :: struct {}
device :: (self: *MTLCounterSampleBuffer) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLCounterSampleBuffer) -> *MTLDevice);
}
label :: (self: *MTLCounterSampleBuffer) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLCounterSampleBuffer) -> *NSString);
}
resolveCounterRange :: (self: *MTLCounterSampleBuffer, range: NSRange) -> *NSData {
	#insert #run METHOD_BODY(__selectors.resolveCounterRange_, #type (self: *MTLCounterSampleBuffer, range: NSRange) -> *NSData);
}
sampleCount :: (self: *MTLCounterSampleBuffer) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.sampleCount, #type (self: *MTLCounterSampleBuffer) -> NSUInteger);
}


MTLResourceStatePassSampleBufferAttachmentDescriptor :: struct {}
endOfEncoderSampleIndex :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.endOfEncoderSampleIndex, #type (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor) -> NSUInteger);
}
sampleBuffer :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer {
	#insert #run METHOD_BODY(__selectors.sampleBuffer, #type (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor) -> *MTLCounterSampleBuffer);
}
setEndOfEncoderSampleIndex :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setEndOfEncoderSampleIndex_, #type (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor, endOfEncoderSampleIndex: NSUInteger) -> ());
}
setSampleBuffer :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.setSampleBuffer_, #type (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor, sampleBuffer: *MTLCounterSampleBuffer) -> ());
}
setStartOfEncoderSampleIndex :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setStartOfEncoderSampleIndex_, #type (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor, startOfEncoderSampleIndex: NSUInteger) -> ());
}
startOfEncoderSampleIndex :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.startOfEncoderSampleIndex, #type (self: *MTLResourceStatePassSampleBufferAttachmentDescriptor) -> NSUInteger);
}


MTLResourceStatePassSampleBufferAttachmentDescriptorArray :: struct {}
object :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLResourceStatePassSampleBufferAttachmentDescriptor {
	#insert #run METHOD_BODY(__selectors.objectAtIndexedSubscript_, #type (self: *MTLResourceStatePassSampleBufferAttachmentDescriptorArray, attachmentIndex: NSUInteger) -> *MTLResourceStatePassSampleBufferAttachmentDescriptor);
}
setObject :: (self: *MTLResourceStatePassSampleBufferAttachmentDescriptorArray, attachment: *MTLResourceStatePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setObject_atIndexedSubscript_, #type (self: *MTLResourceStatePassSampleBufferAttachmentDescriptorArray, attachment: *MTLResourceStatePassSampleBufferAttachmentDescriptor, attachmentIndex: NSUInteger) -> ());
}


MTLResourceStatePassDescriptor :: struct {}
resourceStatePassDescriptor :: (self: *MTLResourceStatePassDescriptor) -> *MTLResourceStatePassDescriptor {
	#insert #run METHOD_BODY(__selectors.resourceStatePassDescriptor, #type (self: *MTLResourceStatePassDescriptor) -> *MTLResourceStatePassDescriptor);
}
sampleBufferAttachments :: (self: *MTLResourceStatePassDescriptor) -> *MTLResourceStatePassSampleBufferAttachmentDescriptorArray {
	#insert #run METHOD_BODY(__selectors.sampleBufferAttachments, #type (self: *MTLResourceStatePassDescriptor) -> *MTLResourceStatePassSampleBufferAttachmentDescriptorArray);
}


MTLCommandBufferDescriptor :: struct {}
errorOptions :: (self: *MTLCommandBufferDescriptor) -> MTLCommandBufferErrorOption {
	#insert #run METHOD_BODY(__selectors.errorOptions, #type (self: *MTLCommandBufferDescriptor) -> MTLCommandBufferErrorOption);
}
logState :: (self: *MTLCommandBufferDescriptor) -> *MTLLogState {
	#insert #run METHOD_BODY(__selectors.logState, #type (self: *MTLCommandBufferDescriptor) -> *MTLLogState);
}
retainedReferences :: (self: *MTLCommandBufferDescriptor) -> bool {
	#insert #run METHOD_BODY(__selectors.retainedReferences, #type (self: *MTLCommandBufferDescriptor) -> bool);
}
setErrorOptions :: (self: *MTLCommandBufferDescriptor, errorOptions: MTLCommandBufferErrorOption) -> () {
	#insert #run METHOD_BODY(__selectors.setErrorOptions_, #type (self: *MTLCommandBufferDescriptor, errorOptions: MTLCommandBufferErrorOption) -> ());
}
setLogState :: (self: *MTLCommandBufferDescriptor, logState: *MTLLogState) -> () {
	#insert #run METHOD_BODY(__selectors.setLogState_, #type (self: *MTLCommandBufferDescriptor, logState: *MTLLogState) -> ());
}
setRetainedReferences :: (self: *MTLCommandBufferDescriptor, retainedReferences: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setRetainedReferences_, #type (self: *MTLCommandBufferDescriptor, retainedReferences: bool) -> ());
}


MTLCommandBufferEncoderInfo :: struct {}
debugSignposts :: (self: *MTLCommandBufferEncoderInfo) -> *NSArray {
	#insert #run METHOD_BODY(__selectors.debugSignposts, #type (self: *MTLCommandBufferEncoderInfo) -> *NSArray);
}
errorState :: (self: *MTLCommandBufferEncoderInfo) -> MTLCommandEncoderErrorState {
	#insert #run METHOD_BODY(__selectors.errorState, #type (self: *MTLCommandBufferEncoderInfo) -> MTLCommandEncoderErrorState);
}
label :: (self: *MTLCommandBufferEncoderInfo) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLCommandBufferEncoderInfo) -> *NSString);
}


MTLCommandBuffer :: struct {}
GPUEndTime :: (self: *MTLCommandBuffer) -> CFTimeInterval {
	#insert #run METHOD_BODY(__selectors.GPUEndTime, #type (self: *MTLCommandBuffer) -> CFTimeInterval);
}
GPUStartTime :: (self: *MTLCommandBuffer) -> CFTimeInterval {
	#insert #run METHOD_BODY(__selectors.GPUStartTime, #type (self: *MTLCommandBuffer) -> CFTimeInterval);
}
accelerationStructureCommandEncoder :: (self: *MTLCommandBuffer) -> *MTLAccelerationStructureCommandEncoder {
	#insert #run METHOD_BODY(__selectors.accelerationStructureCommandEncoder, #type (self: *MTLCommandBuffer) -> *MTLAccelerationStructureCommandEncoder);
}
accelerationStructureCommandEncoder :: (self: *MTLCommandBuffer, descriptor: *MTLAccelerationStructurePassDescriptor) -> *MTLAccelerationStructureCommandEncoder {
	#insert #run METHOD_BODY(__selectors.accelerationStructureCommandEncoderWithDescriptor_, #type (self: *MTLCommandBuffer, descriptor: *MTLAccelerationStructurePassDescriptor) -> *MTLAccelerationStructureCommandEncoder);
}
addCompletedHandler :: (self: *MTLCommandBuffer, block: MTLCommandBufferHandler) -> () {
	#insert #run METHOD_BODY(__selectors.addCompletedHandler_, #type (self: *MTLCommandBuffer, block: MTLCommandBufferHandler) -> ());
}
waitUntilScheduled :: (self: *MTLCommandBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.waitUntilScheduled, #type (self: *MTLCommandBuffer) -> ());
}
addScheduledHandler :: (self: *MTLCommandBuffer, block: MTLCommandBufferHandler) -> () {
	#insert #run METHOD_BODY(__selectors.addScheduledHandler_, #type (self: *MTLCommandBuffer, block: MTLCommandBufferHandler) -> ());
}
waitUntilCompleted :: (self: *MTLCommandBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.waitUntilCompleted, #type (self: *MTLCommandBuffer) -> ());
}
blitCommandEncoder :: (self: *MTLCommandBuffer) -> *MTLBlitCommandEncoder {
	#insert #run METHOD_BODY(__selectors.blitCommandEncoder, #type (self: *MTLCommandBuffer) -> *MTLBlitCommandEncoder);
}
blitCommandEncoder :: (self: *MTLCommandBuffer, blitPassDescriptor: *MTLBlitPassDescriptor) -> *MTLBlitCommandEncoder {
	#insert #run METHOD_BODY(__selectors.blitCommandEncoderWithDescriptor_, #type (self: *MTLCommandBuffer, blitPassDescriptor: *MTLBlitPassDescriptor) -> *MTLBlitCommandEncoder);
}
commandQueue :: (self: *MTLCommandBuffer) -> *MTLCommandQueue {
	#insert #run METHOD_BODY(__selectors.commandQueue, #type (self: *MTLCommandBuffer) -> *MTLCommandQueue);
}
commit :: (self: *MTLCommandBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.commit, #type (self: *MTLCommandBuffer) -> ());
}
computeCommandEncoder :: (self: *MTLCommandBuffer, computePassDescriptor: *MTLComputePassDescriptor) -> *MTLComputeCommandEncoder {
	#insert #run METHOD_BODY(__selectors.computeCommandEncoderWithDescriptor_, #type (self: *MTLCommandBuffer, computePassDescriptor: *MTLComputePassDescriptor) -> *MTLComputeCommandEncoder);
}
computeCommandEncoder :: (self: *MTLCommandBuffer) -> *MTLComputeCommandEncoder {
	#insert #run METHOD_BODY(__selectors.computeCommandEncoder, #type (self: *MTLCommandBuffer) -> *MTLComputeCommandEncoder);
}
computeCommandEncoder :: (self: *MTLCommandBuffer, dispatchType: MTLDispatchType) -> *MTLComputeCommandEncoder {
	#insert #run METHOD_BODY(__selectors.computeCommandEncoderWithDispatchType_, #type (self: *MTLCommandBuffer, dispatchType: MTLDispatchType) -> *MTLComputeCommandEncoder);
}
device :: (self: *MTLCommandBuffer) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *MTLCommandBuffer) -> *MTLDevice);
}
encodeSignalEvent :: (self: *MTLCommandBuffer, event: *MTLEvent, value: u64) -> () {
	#insert #run METHOD_BODY(__selectors.encodeSignalEvent_value_, #type (self: *MTLCommandBuffer, event: *MTLEvent, value: u64) -> ());
}
encodeWait :: (self: *MTLCommandBuffer, event: *MTLEvent, value: u64) -> () {
	#insert #run METHOD_BODY(__selectors.encodeWaitForEvent_value_, #type (self: *MTLCommandBuffer, event: *MTLEvent, value: u64) -> ());
}
enqueue :: (self: *MTLCommandBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.enqueue, #type (self: *MTLCommandBuffer) -> ());
}
error :: (self: *MTLCommandBuffer) -> *NSError {
	#insert #run METHOD_BODY(__selectors.error, #type (self: *MTLCommandBuffer) -> *NSError);
}
errorOptions :: (self: *MTLCommandBuffer) -> MTLCommandBufferErrorOption {
	#insert #run METHOD_BODY(__selectors.errorOptions, #type (self: *MTLCommandBuffer) -> MTLCommandBufferErrorOption);
}
kernelEndTime :: (self: *MTLCommandBuffer) -> CFTimeInterval {
	#insert #run METHOD_BODY(__selectors.kernelEndTime, #type (self: *MTLCommandBuffer) -> CFTimeInterval);
}
kernelStartTime :: (self: *MTLCommandBuffer) -> CFTimeInterval {
	#insert #run METHOD_BODY(__selectors.kernelStartTime, #type (self: *MTLCommandBuffer) -> CFTimeInterval);
}
label :: (self: *MTLCommandBuffer) -> *NSString {
	#insert #run METHOD_BODY(__selectors.label, #type (self: *MTLCommandBuffer) -> *NSString);
}
logs :: (self: *MTLCommandBuffer) -> *MTLLogContainer {
	#insert #run METHOD_BODY(__selectors.logs, #type (self: *MTLCommandBuffer) -> *MTLLogContainer);
}
parallelRenderCommandEncoder :: (self: *MTLCommandBuffer, renderPassDescriptor: *MTLRenderPassDescriptor) -> *MTLParallelRenderCommandEncoder {
	#insert #run METHOD_BODY(__selectors.parallelRenderCommandEncoderWithDescriptor_, #type (self: *MTLCommandBuffer, renderPassDescriptor: *MTLRenderPassDescriptor) -> *MTLParallelRenderCommandEncoder);
}
popDebugGroup :: (self: *MTLCommandBuffer) -> () {
	#insert #run METHOD_BODY(__selectors.popDebugGroup, #type (self: *MTLCommandBuffer) -> ());
}
presentDrawable :: (self: *MTLCommandBuffer, drawable: *MTLDrawable) -> () {
	#insert #run METHOD_BODY(__selectors.presentDrawable_, #type (self: *MTLCommandBuffer, drawable: *MTLDrawable) -> ());
}
presentDrawableAfterMinimumDuration :: (self: *MTLCommandBuffer, drawable: *MTLDrawable, duration: CFTimeInterval) -> () {
	#insert #run METHOD_BODY(__selectors.presentDrawable_afterMinimumDuration_, #type (self: *MTLCommandBuffer, drawable: *MTLDrawable, duration: CFTimeInterval) -> ());
}
presentDrawableAtTime :: (self: *MTLCommandBuffer, drawable: *MTLDrawable, presentationTime: CFTimeInterval) -> () {
	#insert #run METHOD_BODY(__selectors.presentDrawable_atTime_, #type (self: *MTLCommandBuffer, drawable: *MTLDrawable, presentationTime: CFTimeInterval) -> ());
}
pushDebugGroup :: (self: *MTLCommandBuffer, _string: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.pushDebugGroup_, #type (self: *MTLCommandBuffer, _string: *NSString) -> ());
}
renderCommandEncoder :: (self: *MTLCommandBuffer, renderPassDescriptor: *MTLRenderPassDescriptor) -> *MTLRenderCommandEncoder {
	#insert #run METHOD_BODY(__selectors.renderCommandEncoderWithDescriptor_, #type (self: *MTLCommandBuffer, renderPassDescriptor: *MTLRenderPassDescriptor) -> *MTLRenderCommandEncoder);
}
resourceStateCommandEncoder :: (self: *MTLCommandBuffer) -> *MTLResourceStateCommandEncoder {
	#insert #run METHOD_BODY(__selectors.resourceStateCommandEncoder, #type (self: *MTLCommandBuffer) -> *MTLResourceStateCommandEncoder);
}
resourceStateCommandEncoder :: (self: *MTLCommandBuffer, resourceStatePassDescriptor: *MTLResourceStatePassDescriptor) -> *MTLResourceStateCommandEncoder {
	#insert #run METHOD_BODY(__selectors.resourceStateCommandEncoderWithDescriptor_, #type (self: *MTLCommandBuffer, resourceStatePassDescriptor: *MTLResourceStatePassDescriptor) -> *MTLResourceStateCommandEncoder);
}
retainedReferences :: (self: *MTLCommandBuffer) -> bool {
	#insert #run METHOD_BODY(__selectors.retainedReferences, #type (self: *MTLCommandBuffer) -> bool);
}
setLabel :: (self: *MTLCommandBuffer, label: *NSString) -> () {
	#insert #run METHOD_BODY(__selectors.setLabel_, #type (self: *MTLCommandBuffer, label: *NSString) -> ());
}
status :: (self: *MTLCommandBuffer) -> MTLCommandBufferStatus {
	#insert #run METHOD_BODY(__selectors.status, #type (self: *MTLCommandBuffer) -> MTLCommandBufferStatus);
}
useResidencySet :: (self: *MTLCommandBuffer, residencySet: *MTLResidencySet) -> () {
	#insert #run METHOD_BODY(__selectors.useResidencySet_, #type (self: *MTLCommandBuffer, residencySet: *MTLResidencySet) -> ());
}
useResidencySets :: (self: *MTLCommandBuffer, residencySets: **MTLResidencySet, count: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.useResidencySets_count_, #type (self: *MTLCommandBuffer, residencySets: **MTLResidencySet, count: NSUInteger) -> ());
}


CAMetalLayer :: struct { using #as calayer: CALayer; _priv: *_CAMetalLayerPrivate; }
 _CAMetalLayerPrivate :: struct {}
layer :: (self: *CAMetalLayer) -> *CAMetalLayer {
	#insert #run METHOD_BODY(__selectors.layer, #type (self: *CAMetalLayer) -> *CAMetalLayer);
}
device :: (self: *CAMetalLayer) -> *MTLDevice {
	#insert #run METHOD_BODY(__selectors.device, #type (self: *CAMetalLayer) -> *MTLDevice);
}
setDevice :: (self: *CAMetalLayer, device: *MTLDevice) -> () {
	#insert #run METHOD_BODY(__selectors.setDevice_, #type (self: *CAMetalLayer, device: *MTLDevice) -> ());
}
pixelFormat :: (self: *CAMetalLayer) -> MTLPixelFormat {
	#insert #run METHOD_BODY(__selectors.pixelFormat, #type (self: *CAMetalLayer) -> MTLPixelFormat);
}
setPixelFormat :: (self: *CAMetalLayer, pixelFormat: MTLPixelFormat) -> () {
	#insert #run METHOD_BODY(__selectors.setPixelFormat_, #type (self: *CAMetalLayer, pixelFormat: MTLPixelFormat) -> ());
}
framebufferOnly :: (self: *CAMetalLayer) -> bool {
	#insert #run METHOD_BODY(__selectors.framebufferOnly, #type (self: *CAMetalLayer) -> bool);
}
setFramebufferOnly :: (self: *CAMetalLayer, framebufferOnly: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setFramebufferOnly_, #type (self: *CAMetalLayer, framebufferOnly: bool) -> ());
}
drawableSize :: (self: *CAMetalLayer) -> CGSize {
	#insert #run METHOD_BODY(__selectors.drawableSize, #type (self: *CAMetalLayer) -> CGSize);
}
setDrawableSize :: (self: *CAMetalLayer, drawableSize: CGSize) -> () {
	#insert #run METHOD_BODY(__selectors.setDrawableSize_, #type (self: *CAMetalLayer, drawableSize: CGSize) -> ());
}
nextDrawable :: (self: *CAMetalLayer) -> *CAMetalDrawable {
	#insert #run METHOD_BODY(__selectors.nextDrawable, #type (self: *CAMetalLayer) -> *CAMetalDrawable);
}
maximumDrawableCount :: (self: *CAMetalLayer) -> NSUInteger {
	#insert #run METHOD_BODY(__selectors.maximumDrawableCount, #type (self: *CAMetalLayer) -> NSUInteger);
}
setMaximumDrawableCount :: (self: *CAMetalLayer, maximumDrawableCount: NSUInteger) -> () {
	#insert #run METHOD_BODY(__selectors.setMaximumDrawableCount_, #type (self: *CAMetalLayer, maximumDrawableCount: NSUInteger) -> ());
}
displaySyncEnabled :: (self: *CAMetalLayer) -> bool {
	#insert #run METHOD_BODY(__selectors.displaySyncEnabled, #type (self: *CAMetalLayer) -> bool);
}
setDisplaySyncEnabled :: (self: *CAMetalLayer, displaySyncEnabled: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setDisplaySyncEnabled_, #type (self: *CAMetalLayer, displaySyncEnabled: bool) -> ());
}
colorspace :: (self: *CAMetalLayer) -> CGColorSpaceRef {
	#insert #run METHOD_BODY(__selectors.colorspace, #type (self: *CAMetalLayer) -> CGColorSpaceRef);
}
setColorspace :: (self: *CAMetalLayer, colorspace: CGColorSpaceRef) -> () {
	#insert #run METHOD_BODY(__selectors.setColorspace_, #type (self: *CAMetalLayer, colorspace: CGColorSpaceRef) -> ());
}
allowsNextDrawableTimeout :: (self: *CAMetalLayer) -> bool {
	#insert #run METHOD_BODY(__selectors.allowsNextDrawableTimeout, #type (self: *CAMetalLayer) -> bool);
}
setAllowsNextDrawableTimeout :: (self: *CAMetalLayer, allowsNextDrawableTimeout: bool) -> () {
	#insert #run METHOD_BODY(__selectors.setAllowsNextDrawableTimeout_, #type (self: *CAMetalLayer, allowsNextDrawableTimeout: bool) -> ());
}
residencySet :: (self: *CAMetalLayer) -> *MTLResidencySet {
	#insert #run METHOD_BODY(__selectors.residencySet, #type (self: *CAMetalLayer) -> *MTLResidencySet);
}


CAMetalDrawable :: struct { using #as _: MTLDrawable; }
layer :: (self: *CAMetalDrawable) -> *CAMetalLayer {
	#insert #run METHOD_BODY(__selectors.layer, #type (self: *CAMetalDrawable) -> *CAMetalLayer);
}
texture :: (self: *CAMetalDrawable) -> *MTLTexture {
	#insert #run METHOD_BODY(__selectors.texture, #type (self: *CAMetalDrawable) -> *MTLTexture);
}


MTLRenderStages :: enum_flags NSUInteger {
	Vertex :: 1;
	Fragment :: 1 << 1;
	Tile :: 1 << 2;
	Object :: 1 << 3;
	Mesh :: 1 << 4;
;
	MTLRenderStageVertex :: 1;
	MTLRenderStageFragment :: 1 << 1;
	MTLRenderStageTile :: 1 << 2;
	MTLRenderStageObject :: 1 << 3;
	MTLRenderStageMesh :: 1 << 4;
}

MTLTensorUsage :: enum_flags NSUInteger {
	Compute :: 1;
	Render :: 1 << 1;
	MachineLearning :: 1 << 2;
;
	MTLTensorUsageCompute :: 1;
	MTLTensorUsageRender :: 1 << 1;
	MTLTensorUsageMachineLearning :: 1 << 2;
}

MTLBlitOption :: enum_flags NSUInteger {
	None :: 0;
	DepthFromDepthStencil :: 1;
	StencilFromDepthStencil :: 1 << 1;
	RowLinearPVRTC :: 1 << 2;
;
	MTLBlitOptionNone :: 0;
	MTLBlitOptionDepthFromDepthStencil :: 1;
	MTLBlitOptionStencilFromDepthStencil :: 1 << 1;
	MTLBlitOptionRowLinearPVRTC :: 1 << 2;
}

MTLResourceUsage :: enum_flags NSUInteger {
	Read :: 1;
	Write :: 1 << 1;
	Sample :: 1 << 2;
;
	MTLResourceUsageRead :: 1;
	MTLResourceUsageWrite :: 1 << 1;
	MTLResourceUsageSample :: 1 << 2;
}

MTLBarrierScope :: enum_flags NSUInteger {
	Buffers :: 1;
	Textures :: 1 << 1;
	RenderTargets :: 1 << 2;
;
	MTLBarrierScopeBuffers :: 1;
	MTLBarrierScopeTextures :: 1 << 1;
	MTLBarrierScopeRenderTargets :: 1 << 2;
}

MTLStages :: enum_flags NSUInteger {
	Vertex :: 1;
	Fragment :: 1 << 1;
	Tile :: 1 << 2;
	Object :: 1 << 3;
	Mesh :: 1 << 4;
	ResourceState :: 1 << 26;
	Dispatch :: 1 << 27;
	Blit :: 1 << 28;
	AccelerationStructure :: 1 << 29;
	MachineLearning :: 1 << 30;
	All :: 9223372036854775807;
;
	MTLStageVertex :: 1;
	MTLStageFragment :: 1 << 1;
	MTLStageTile :: 1 << 2;
	MTLStageObject :: 1 << 3;
	MTLStageMesh :: 1 << 4;
	MTLStageResourceState :: 1 << 26;
	MTLStageDispatch :: 1 << 27;
	MTLStageBlit :: 1 << 28;
	MTLStageAccelerationStructure :: 1 << 29;
	MTLStageMachineLearning :: 1 << 30;
	MTLStageAll :: 9223372036854775807;
}

MTLTextureUsage :: enum_flags NSUInteger {
	Unknown :: 0;
	ShaderRead :: 1;
	ShaderWrite :: 1 << 1;
	RenderTarget :: 1 << 2;
	PixelFormatView :: 1 << 4;
	ShaderAtomic :: 1 << 5;
;
	MTLTextureUsageUnknown :: 0;
	MTLTextureUsageShaderRead :: 1;
	MTLTextureUsageShaderWrite :: 1 << 1;
	MTLTextureUsageRenderTarget :: 1 << 2;
	MTLTextureUsagePixelFormatView :: 1 << 4;
	MTLTextureUsageShaderAtomic :: 1 << 5;
}

MTLIntersectionFunctionSignature :: enum_flags NSUInteger {
	None :: 0;
	Instancing :: 1;
	TriangleData :: 1 << 1;
	WorldSpaceData :: 1 << 2;
	InstanceMotion :: 1 << 3;
	PrimitiveMotion :: 1 << 4;
	ExtendedLimits :: 1 << 5;
	MaxLevels :: 1 << 6;
	CurveData :: 1 << 7;
	IntersectionFunctionBuffer :: 1 << 8;
	UserData :: 1 << 9;
;
	MTLIntersectionFunctionSignatureNone :: 0;
	MTLIntersectionFunctionSignatureInstancing :: 1;
	MTLIntersectionFunctionSignatureTriangleData :: 1 << 1;
	MTLIntersectionFunctionSignatureWorldSpaceData :: 1 << 2;
	MTLIntersectionFunctionSignatureInstanceMotion :: 1 << 3;
	MTLIntersectionFunctionSignaturePrimitiveMotion :: 1 << 4;
	MTLIntersectionFunctionSignatureExtendedLimits :: 1 << 5;
	MTLIntersectionFunctionSignatureMaxLevels :: 1 << 6;
	MTLIntersectionFunctionSignatureCurveData :: 1 << 7;
	MTLIntersectionFunctionSignatureIntersectionFunctionBuffer :: 1 << 8;
	MTLIntersectionFunctionSignatureUserData :: 1 << 9;
}

MTL4VisibilityOptions :: enum_flags NSUInteger {
	None :: 0;
	Device :: 1;
	ResourceAlias :: 1 << 1;
;
	MTL4VisibilityOptionNone :: 0;
	MTL4VisibilityOptionDevice :: 1;
	MTL4VisibilityOptionResourceAlias :: 1 << 1;
}

MTLResourceOptions :: enum_flags NSUInteger {
	CPUCacheModeDefaultCache :: 0;
	CPUCacheModeWriteCombined :: 1;
	StorageModeShared :: 0;
	StorageModeManaged :: 1 << 4;
	StorageModePrivate :: 1 << 5;
	StorageModeMemoryless :: 1 << 5;
	HazardTrackingModeDefault :: 0;
	HazardTrackingModeUntracked :: 1 << 8;
	HazardTrackingModeTracked :: 1 << 9;
	OptionCPUCacheModeDefault :: 0;
	OptionCPUCacheModeWriteCombined :: 1;
;
	MTLResourceCPUCacheModeDefaultCache :: 0;
	MTLResourceCPUCacheModeWriteCombined :: 1;
	MTLResourceStorageModeShared :: 0;
	MTLResourceStorageModeManaged :: 1 << 4;
	MTLResourceStorageModePrivate :: 1 << 5;
	MTLResourceStorageModeMemoryless :: 1 << 5;
	MTLResourceHazardTrackingModeDefault :: 0;
	MTLResourceHazardTrackingModeUntracked :: 1 << 8;
	MTLResourceHazardTrackingModeTracked :: 1 << 9;
	MTLResourceOptionCPUCacheModeDefault :: 0;
	MTLResourceOptionCPUCacheModeWriteCombined :: 1;
}

MTLAccelerationStructureRefitOptions :: enum_flags NSUInteger {
	VertexData :: 1;
	PerPrimitiveData :: 1 << 1;
;
	MTLAccelerationStructureRefitOptionVertexData :: 1;
	MTLAccelerationStructureRefitOptionPerPrimitiveData :: 1 << 1;
}

MTLAccelerationStructureUsage :: enum_flags NSUInteger {
	None :: 0;
	Refit :: 1;
	PreferFastBuild :: 1 << 1;
	ExtendedLimits :: 1 << 2;
	PreferFastIntersection :: 1 << 4;
	MinimizeMemory :: 1 << 5;
;
	MTLAccelerationStructureUsageNone :: 0;
	MTLAccelerationStructureUsageRefit :: 1;
	MTLAccelerationStructureUsagePreferFastBuild :: 1 << 1;
	MTLAccelerationStructureUsageExtendedLimits :: 1 << 2;
	MTLAccelerationStructureUsagePreferFastIntersection :: 1 << 4;
	MTLAccelerationStructureUsageMinimizeMemory :: 1 << 5;
}

MTLAccelerationStructureInstanceOptions :: enum_flags u32 {
	None :: 0;
	DisableTriangleCulling :: 1;
	TriangleFrontFacingWindingCounterClockwise :: 1 << 1;
	Opaque :: 1 << 2;
	NonOpaque :: 1 << 3;
;
	MTLAccelerationStructureInstanceOptionNone :: 0;
	MTLAccelerationStructureInstanceOptionDisableTriangleCulling :: 1;
	MTLAccelerationStructureInstanceOptionTriangleFrontFacingWindingCounterClockwise :: 1 << 1;
	MTLAccelerationStructureInstanceOptionOpaque :: 1 << 2;
	MTLAccelerationStructureInstanceOptionNonOpaque :: 1 << 3;
}

MTLPipelineOption :: enum_flags NSUInteger {
	None :: 0;
	ArgumentInfo :: 1;
	BindingInfo :: 1;
	BufferTypeInfo :: 1 << 1;
	FailOnBinaryArchiveMiss :: 1 << 2;
;
	MTLPipelineOptionNone :: 0;
	MTLPipelineOptionArgumentInfo :: 1;
	MTLPipelineOptionBindingInfo :: 1;
	MTLPipelineOptionBufferTypeInfo :: 1 << 1;
	MTLPipelineOptionFailOnBinaryArchiveMiss :: 1 << 2;
}

MTLStoreActionOptions :: enum_flags NSUInteger {
	None :: 0;
	CustomSamplePositions :: 1;
	ValidMask :: 1;
;
	MTLStoreActionOptionNone :: 0;
	MTLStoreActionOptionCustomSamplePositions :: 1;
	MTLStoreActionOptionValidMask :: 1;
}

MTL4BinaryFunctionOptions :: enum_flags NSUInteger {
	None :: 0;
	PipelineIndependent :: 1 << 1;
;
	MTL4BinaryFunctionOptionNone :: 0;
	MTL4BinaryFunctionOptionPipelineIndependent :: 1 << 1;
}

MTLStitchedLibraryOptions :: enum_flags NSUInteger {
	None :: 0;
	FailOnBinaryArchiveMiss :: 1;
	StoreLibraryInMetalPipelinesScript :: 1 << 1;
;
	MTLStitchedLibraryOptionNone :: 0;
	MTLStitchedLibraryOptionFailOnBinaryArchiveMiss :: 1;
	MTLStitchedLibraryOptionStoreLibraryInMetalPipelinesScript :: 1 << 1;
}

MTL4PipelineDataSetSerializerConfiguration :: enum_flags NSUInteger {
	CaptureDescriptors :: 1;
	CaptureBinaries :: 1 << 1;
;
	MTL4PipelineDataSetSerializerConfigurationCaptureDescriptors :: 1;
	MTL4PipelineDataSetSerializerConfigurationCaptureBinaries :: 1 << 1;
}

MTLIndirectCommandType :: enum_flags NSUInteger {
	Draw :: 1;
	DrawIndexed :: 1 << 1;
	DrawPatches :: 1 << 2;
	DrawIndexedPatches :: 1 << 3;
	ConcurrentDispatch :: 1 << 5;
	ConcurrentDispatchThreads :: 1 << 6;
	DrawMeshThreadgroups :: 1 << 7;
	DrawMeshThreads :: 1 << 8;
;
	MTLIndirectCommandTypeDraw :: 1;
	MTLIndirectCommandTypeDrawIndexed :: 1 << 1;
	MTLIndirectCommandTypeDrawPatches :: 1 << 2;
	MTLIndirectCommandTypeDrawIndexedPatches :: 1 << 3;
	MTLIndirectCommandTypeConcurrentDispatch :: 1 << 5;
	MTLIndirectCommandTypeConcurrentDispatchThreads :: 1 << 6;
	MTLIndirectCommandTypeDrawMeshThreadgroups :: 1 << 7;
	MTLIndirectCommandTypeDrawMeshThreads :: 1 << 8;
}

MTLColorWriteMask :: enum_flags NSUInteger {
	None :: 0;
	Red :: 1 << 3;
	Green :: 1 << 2;
	Blue :: 1 << 1;
	Alpha :: 1;
	All :: 15;
	Unspecialized :: 1 << 4;
;
	MTLColorWriteMaskNone :: 0;
	MTLColorWriteMaskRed :: 1 << 3;
	MTLColorWriteMaskGreen :: 1 << 2;
	MTLColorWriteMaskBlue :: 1 << 1;
	MTLColorWriteMaskAlpha :: 1;
	MTLColorWriteMaskAll :: 15;
	MTLColorWriteMaskUnspecialized :: 1 << 4;
}

MTLFunctionOptions :: enum_flags NSUInteger {
	None :: 0;
	CompileToBinary :: 1;
	StoreFunctionInMetalPipelinesScript :: 1 << 1;
	StoreFunctionInMetalScript :: 1 << 1;
	FailOnBinaryArchiveMiss :: 1 << 2;
	PipelineIndependent :: 1 << 3;
;
	MTLFunctionOptionNone :: 0;
	MTLFunctionOptionCompileToBinary :: 1;
	MTLFunctionOptionStoreFunctionInMetalPipelinesScript :: 1 << 1;
	MTLFunctionOptionStoreFunctionInMetalScript :: 1 << 1;
	MTLFunctionOptionFailOnBinaryArchiveMiss :: 1 << 2;
	MTLFunctionOptionPipelineIndependent :: 1 << 3;
}

MTL4ShaderReflection :: enum_flags NSUInteger {
	None :: 0;
	BindingInfo :: 1;
	BufferTypeInfo :: 1 << 1;
;
	MTL4ShaderReflectionNone :: 0;
	MTL4ShaderReflectionBindingInfo :: 1;
	MTL4ShaderReflectionBufferTypeInfo :: 1 << 1;
}

MTL4RenderEncoderOptions :: enum_flags NSUInteger {
	None :: 0;
	Suspending :: 1;
	Resuming :: 1 << 1;
;
	MTL4RenderEncoderOptionNone :: 0;
	MTL4RenderEncoderOptionSuspending :: 1;
	MTL4RenderEncoderOptionResuming :: 1 << 1;
}

MTLCommandBufferErrorOption :: enum_flags NSUInteger {
	None :: 0;
	EncoderExecutionStatus :: 1;
;
	MTLCommandBufferErrorOptionNone :: 0;
	MTLCommandBufferErrorOptionEncoderExecutionStatus :: 1;
}


NSFastEnumeration :: struct {};
task_id_token_t :: struct {};
NSNumber :: struct {};

// TODO: make it so the parser can read these or just implement them here
PackedFloat3 :: struct {}
PackedFloatQuaternion :: struct {}

init_mtl :: () {
    if __selectors.accelerationStructureCommandEncoder return;

    init_objective_c_selector_struct(*__selectors);

    assert(__selectors.supportsFamily_ != null);
}



MTLTimestamp :: u64;
MTLGPUAddress :: u64;

MTLCoordinate2D :: MTLSamplePosition;


// we can't handle these yet, but they're block items
MTLNewRenderPipelineStateWithReflectionCompletionHandler :: *void;
MTLSharedEventNotificationBlock :: *void;
MTLNewRenderPipelineStateCompletionHandler :: *void;
MTLNewLibraryCompletionHandler :: *void;
MTLNewDynamicLibraryCompletionHandler :: *void;
MTLNewComputePipelineStateWithReflectionCompletionHandler :: *void;
MTLNewComputePipelineStateCompletionHandler :: *void;
MTLIOCommandBufferHandler :: *void;
MTLDrawablePresentedHandler :: *void;
MTLCommandBufferHandler :: *void;
MTL4NewMachineLearningPipelineStateCompletionHandler :: *void;
MTL4NewBinaryFunctionCompletionHandler :: *void;
MTL4CommitFeedbackHandler :: *void;

MTLAutoreleasedComputePipelineReflection :: *MTLComputePipelineReflection;
MTLAutoreleasedRenderPipelineReflection :: *MTLRenderPipelineReflection;
MTLAutoreleasedArgument :: *MTLArgument;

// These are opaque
IOSurfaceRef :: *void;
CGColorSpaceRef :: *void;


// borrowed from the code that ships with the compiler
MTLCreateSystemDefaultDevice :: () -> *MTLDevice #foreign Metal;
MTLCopyAllDevices :: () -> *NSArray(id) #foreign Metal;
MTLDeviceNotificationName :: *NSString;
MTLDeviceWasAddedNotification: MTLDeviceNotificationName;
MTLDeviceRemovalRequestedNotification: MTLDeviceNotificationName;
MTLDeviceWasRemovedNotification: MTLDeviceNotificationName;
MTLRemoveDeviceObserver :: (observer: id) -> () #foreign Metal;
Metal :: #library,system,link_always "Metal";  // We were having some problems on Mac, so, try this.. .

#scope_file

__selectors: __generated_selectors;

__generated_selectors :: struct #type_info_no_size_complaint {
	GPUEndTime : *void = ---;
	GPUStartTime : *void = ---;
	URL : *void = ---;
	accelerationStructureCommandEncoder : *void = ---;
	accelerationStructureCommandEncoderWithDescriptor_ : *void = ---;
	accelerationStructurePassDescriptor : *void = ---;
	accelerationStructureSizesWithDescriptor_ : *void = ---;
	access : *void = ---;
	addAllocation_ : *void = ---;
	addAllocations_count_ : *void = ---;
	addBarrier : *void = ---;
	addCompletedHandler_ : *void = ---;
	addComputePipelineFunctionsWithDescriptor_error_ : *void = ---;
	addDebugMarker_range_ : *void = ---;
	addFeedbackHandler_ : *void = ---;
	addFunctionWithDescriptor_library_error_ : *void = ---;
	addLibraryWithDescriptor_error_ : *void = ---;
	addLogHandler_ : *void = ---;
	addMeshRenderPipelineFunctionsWithDescriptor_error_ : *void = ---;
	addPresentedHandler_ : *void = ---;
	addRenderPipelineFunctionsWithDescriptor_error_ : *void = ---;
	addResidencySet_ : *void = ---;
	addResidencySets_count_ : *void = ---;
	addScheduledHandler_ : *void = ---;
	addTileRenderPipelineFunctionsWithDescriptor_error_ : *void = ---;
	alignment : *void = ---;
	allAllocations : *void = ---;
	allocatedSize : *void = ---;
	allocationCount : *void = ---;
	allowDuplicateIntersectionFunctionInvocation : *void = ---;
	allowGPUOptimizedContents : *void = ---;
	allowReferencingUndefinedSymbols : *void = ---;
	alphaBlendOperation : *void = ---;
	alphaToCoverageState : *void = ---;
	alphaToOneState : *void = ---;
	architecture : *void = ---;
	areBarycentricCoordsSupported : *void = ---;
	areProgrammableSamplePositionsSupported : *void = ---;
	areRasterOrderGroupsSupported : *void = ---;
	argumentBuffersSupport : *void = ---;
	argumentDescriptor : *void = ---;
	argumentIndex : *void = ---;
	argumentIndexStride : *void = ---;
	arguments : *void = ---;
	arrayLength : *void = ---;
	arrayType : *void = ---;
	attributeIndex : *void = ---;
	attributeType : *void = ---;
	attributes : *void = ---;
	backFaceStencil : *void = ---;
	barrierAfterEncoderStages_beforeEncoderStages_visibilityOptions_ : *void = ---;
	barrierAfterQueueStages_beforeStages_ : *void = ---;
	barrierAfterQueueStages_beforeStages_visibilityOptions_ : *void = ---;
	barrierAfterStages_beforeQueueStages_visibilityOptions_ : *void = ---;
	baseResourceID : *void = ---;
	beginCommandBufferWithAllocator_ : *void = ---;
	beginCommandBufferWithAllocator_options_ : *void = ---;
	binaryArchives : *void = ---;
	binaryFunctions : *void = ---;
	binaryLinkedFunctions : *void = ---;
	bindings : *void = ---;
	blendingState : *void = ---;
	blitCommandEncoder : *void = ---;
	blitCommandEncoderWithDescriptor_ : *void = ---;
	blitPassDescriptor : *void = ---;
	borderColor : *void = ---;
	boundingBoxBuffer : *void = ---;
	boundingBoxBufferOffset : *void = ---;
	boundingBoxBuffers : *void = ---;
	boundingBoxCount : *void = ---;
	boundingBoxStride : *void = ---;
	buffer : *void = ---;
	bufferAlignment : *void = ---;
	bufferBytesPerRow : *void = ---;
	bufferDataSize : *void = ---;
	bufferDataType : *void = ---;
	bufferIndex : *void = ---;
	bufferOffset : *void = ---;
	bufferPointerType : *void = ---;
	bufferSize : *void = ---;
	bufferStructType : *void = ---;
	buffers : *void = ---;
	buildAccelerationStructure_descriptor_scratchBuffer_ : *void = ---;
	buildAccelerationStructure_descriptor_scratchBuffer_scratchBufferOffset_ : *void = ---;
	captureObject : *void = ---;
	clearBarrier : *void = ---;
	clearColor : *void = ---;
	clearDepth : *void = ---;
	clearStencil : *void = ---;
	colorAttachmentMappingState : *void = ---;
	colorAttachments : *void = ---;
	column : *void = ---;
	commandBuffer : *void = ---;
	commandBufferWithDescriptor_ : *void = ---;
	commandBufferWithUnretainedReferences : *void = ---;
	commandQueue : *void = ---;
	commandTypes : *void = ---;
	commit : *void = ---;
	commit_count_ : *void = ---;
	commit_count_options_ : *void = ---;
	compareFunction : *void = ---;
	compileSymbolVisibility : *void = ---;
	compiler : *void = ---;
	compressionType : *void = ---;
	computeCommandEncoder : *void = ---;
	computeCommandEncoderWithDescriptor_ : *void = ---;
	computeCommandEncoderWithDispatchType_ : *void = ---;
	computeFunction : *void = ---;
	computeFunctionDescriptor : *void = ---;
	computePassDescriptor : *void = ---;
	concurrentDispatchThreadgroups_threadsPerThreadgroup_ : *void = ---;
	concurrentDispatchThreads_threadsPerThreadgroup_ : *void = ---;
	configuration : *void = ---;
	constantBlockAlignment : *void = ---;
	constantDataAtIndex_ : *void = ---;
	constantValues : *void = ---;
	containsAllocation_ : *void = ---;
	contents : *void = ---;
	controlDependencies : *void = ---;
	controlPointBuffer : *void = ---;
	controlPointBufferOffset : *void = ---;
	controlPointBuffers : *void = ---;
	controlPointCount : *void = ---;
	controlPointFormat : *void = ---;
	controlPointStride : *void = ---;
	convertSparsePixelRegions_toTileRegions_withTileSize_alignmentMode_numRegions_ : *void = ---;
	convertSparseTileRegions_toPixelRegions_withTileSize_numRegions_ : *void = ---;
	copyAccelerationStructure_toAccelerationStructure_ : *void = ---;
	copyAndCompactAccelerationStructure_toAccelerationStructure_ : *void = ---;
	copyBufferMappingsFromBuffer_toBuffer_operations_count_ : *void = ---;
	copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_ : *void = ---;
	copyFromBuffer_sourceOffset_sourceBytesPerRow_sourceBytesPerImage_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_options_ : *void = ---;
	copyFromBuffer_sourceOffset_toBuffer_destinationOffset_size_ : *void = ---;
	copyFromTensor_sourceOrigin_sourceDimensions_toTensor_destinationOrigin_destinationDimensions_ : *void = ---;
	copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_ : *void = ---;
	copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toBuffer_destinationOffset_destinationBytesPerRow_destinationBytesPerImage_options_ : *void = ---;
	copyFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_ : *void = ---;
	copyFromTexture_sourceSlice_sourceLevel_toTexture_destinationSlice_destinationLevel_sliceCount_levelCount_ : *void = ---;
	copyFromTexture_toTexture_ : *void = ---;
	copyIndirectCommandBuffer_sourceRange_destination_destinationIndex_ : *void = ---;
	copyParameterDataToBuffer_offset_ : *void = ---;
	copyResourceViewsFromPool_sourceRange_destinationIndex_ : *void = ---;
	copyStatusToBuffer_offset_ : *void = ---;
	copyTextureMappingsFromTexture_toTexture_operations_count_ : *void = ---;
	count : *void = ---;
	counterSet : *void = ---;
	counterSets : *void = ---;
	counters : *void = ---;
	cpuCacheMode : *void = ---;
	currentAllocatedSize : *void = ---;
	curveBasis : *void = ---;
	curveEndCaps : *void = ---;
	curveType : *void = ---;
	data : *void = ---;
	dataSize : *void = ---;
	dataType : *void = ---;
	dealloc : *void = ---;
	debugLocation : *void = ---;
	debugSignposts : *void = ---;
	defaultCaptureScope : *void = ---;
	defaultRasterSampleCount : *void = ---;
	depth : *void = ---;
	depthAttachment : *void = ---;
	depthAttachmentPixelFormat : *void = ---;
	depthCompareFunction : *void = ---;
	depthFailureOperation : *void = ---;
	depthPlane : *void = ---;
	depthResolveFilter : *void = ---;
	depthStencilPassOperation : *void = ---;
	descriptor : *void = ---;
	destination : *void = ---;
	destinationAlphaBlendFactor : *void = ---;
	destinationRGBBlendFactor : *void = ---;
	device : *void = ---;
	didModifyRange_ : *void = ---;
	dimensions : *void = ---;
	dispatchNetworkWithIntermediatesHeap_ : *void = ---;
	dispatchQueue : *void = ---;
	dispatchThreadgroups_threadsPerThreadgroup_ : *void = ---;
	dispatchThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerThreadgroup_ : *void = ---;
	dispatchThreadgroupsWithIndirectBuffer_threadsPerThreadgroup_ : *void = ---;
	dispatchThreads_threadsPerThreadgroup_ : *void = ---;
	dispatchThreadsPerTile_ : *void = ---;
	dispatchThreadsWithIndirectBuffer_ : *void = ---;
	dispatchType : *void = ---;
	drawIndexedPatches_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_indirectBuffer_indirectBufferOffset_ : *void = ---;
	drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_ : *void = ---;
	drawIndexedPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_controlPointIndexBuffer_controlPointIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_ : *void = ---;
	drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_ : *void = ---;
	drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_instanceCount_ : *void = ---;
	drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferLength_instanceCount_baseVertex_baseInstance_ : *void = ---;
	drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_ : *void = ---;
	drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_ : *void = ---;
	drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_baseVertex_baseInstance_ : *void = ---;
	drawIndexedPrimitives_indexType_indexBuffer_indexBufferLength_indirectBuffer_ : *void = ---;
	drawIndexedPrimitives_indexType_indexBuffer_indexBufferOffset_indirectBuffer_indirectBufferOffset_ : *void = ---;
	drawMeshThreadgroups_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ : *void = ---;
	drawMeshThreadgroupsWithIndirectBuffer_indirectBufferOffset_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ : *void = ---;
	drawMeshThreadgroupsWithIndirectBuffer_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ : *void = ---;
	drawMeshThreads_threadsPerObjectThreadgroup_threadsPerMeshThreadgroup_ : *void = ---;
	drawPatches_patchIndexBuffer_patchIndexBufferOffset_indirectBuffer_indirectBufferOffset_ : *void = ---;
	drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_ : *void = ---;
	drawPatches_patchStart_patchCount_patchIndexBuffer_patchIndexBufferOffset_instanceCount_baseInstance_tessellationFactorBuffer_tessellationFactorBufferOffset_tessellationFactorBufferInstanceStride_ : *void = ---;
	drawPrimitives_indirectBuffer_ : *void = ---;
	drawPrimitives_indirectBuffer_indirectBufferOffset_ : *void = ---;
	drawPrimitives_vertexStart_vertexCount_ : *void = ---;
	drawPrimitives_vertexStart_vertexCount_instanceCount_ : *void = ---;
	drawPrimitives_vertexStart_vertexCount_instanceCount_baseInstance_ : *void = ---;
	drawableID : *void = ---;
	elementArrayType : *void = ---;
	elementIsArgumentBuffer : *void = ---;
	elementPointerType : *void = ---;
	elementStructType : *void = ---;
	elementTensorReferenceType : *void = ---;
	elementTextureReferenceType : *void = ---;
	elementType : *void = ---;
	enableLogging : *void = ---;
	encodeSignalEvent_value_ : *void = ---;
	encodeWaitForEvent_value_ : *void = ---;
	encodedLength : *void = ---;
	encoderLabel : *void = ---;
	endCommandBuffer : *void = ---;
	endEncoding : *void = ---;
	endOfEncoderSampleIndex : *void = ---;
	endOfFragmentSampleIndex : *void = ---;
	endOfVertexSampleIndex : *void = ---;
	endResidency : *void = ---;
	enqueue : *void = ---;
	enqueueBarrier : *void = ---;
	error : *void = ---;
	errorOptions : *void = ---;
	errorState : *void = ---;
	executeCommandsInBuffer_indirectBuffer_ : *void = ---;
	executeCommandsInBuffer_indirectBuffer_indirectBufferOffset_ : *void = ---;
	executeCommandsInBuffer_withRange_ : *void = ---;
	extentAtDimensionIndex_ : *void = ---;
	fastMathEnabled : *void = ---;
	feedbackQueue : *void = ---;
	fillBuffer_range_value_ : *void = ---;
	firstMipmapInTail : *void = ---;
	format : *void = ---;
	fragmentAdditionalBinaryFunctions : *void = ---;
	fragmentArguments : *void = ---;
	fragmentBindings : *void = ---;
	fragmentBuffers : *void = ---;
	fragmentFunction : *void = ---;
	fragmentFunctionDescriptor : *void = ---;
	fragmentLinkedFunctions : *void = ---;
	fragmentLinkingDescriptor : *void = ---;
	fragmentPreloadedLibraries : *void = ---;
	fragmentStaticLinkingDescriptor : *void = ---;
	frontFaceStencil : *void = ---;
	function : *void = ---;
	functionConstantsDictionary : *void = ---;
	functionCount : *void = ---;
	functionDescriptor : *void = ---;
	functionDescriptors : *void = ---;
	functionGraph : *void = ---;
	functionGraphs : *void = ---;
	functionHandleWithBinaryFunction_ : *void = ---;
	functionHandleWithBinaryFunction_stage_ : *void = ---;
	functionHandleWithFunction_ : *void = ---;
	functionHandleWithFunction_stage_ : *void = ---;
	functionHandleWithName_ : *void = ---;
	functionHandleWithName_stage_ : *void = ---;
	functionName : *void = ---;
	functionNames : *void = ---;
	functionType : *void = ---;
	functions : *void = ---;
	generateMipmapsForTexture_ : *void = ---;
	geometryDescriptors : *void = ---;
	getBytes_bytesPerRow_bytesPerImage_fromRegion_mipmapLevel_slice_ : *void = ---;
	getBytes_bytesPerRow_fromRegion_mipmapLevel_ : *void = ---;
	getBytes_strides_fromSliceOrigin_sliceDimensions_ : *void = ---;
	getDefaultSamplePositions_count_ : *void = ---;
	getPhysicalIndexForLogicalIndex_ : *void = ---;
	getSamplePositions_count_ : *void = ---;
	getTextureAccessCounters_region_mipLevel_slice_resetCounters_countersBuffer_countersBufferOffset_ : *void = ---;
	gpuAddress : *void = ---;
	gpuResourceID : *void = ---;
	groups : *void = ---;
	hasUnifiedMemory : *void = ---;
	hazardTrackingMode : *void = ---;
	heap : *void = ---;
	heapAccelerationStructureSizeAndAlignWithDescriptor_ : *void = ---;
	heapAccelerationStructureSizeAndAlignWithSize_ : *void = ---;
	heapBufferSizeAndAlignWithLength_options_ : *void = ---;
	heapOffset : *void = ---;
	heapTextureSizeAndAlignWithDescriptor_ : *void = ---;
	height : *void = ---;
	horizontal : *void = ---;
	horizontalSampleStorage : *void = ---;
	imageblockMemoryLengthForDimensions_ : *void = ---;
	imageblockSampleLength : *void = ---;
	index : *void = ---;
	indexBuffer : *void = ---;
	indexBufferIndex : *void = ---;
	indexBufferOffset : *void = ---;
	indexType : *void = ---;
	indirectComputeCommandAtIndex_ : *void = ---;
	indirectRenderCommandAtIndex_ : *void = ---;
	inheritBuffers : *void = ---;
	inheritCullMode : *void = ---;
	inheritDepthBias : *void = ---;
	inheritDepthClipMode : *void = ---;
	inheritDepthStencilState : *void = ---;
	inheritFrontFacingWinding : *void = ---;
	inheritPipelineState : *void = ---;
	inheritTriangleFillMode : *void = ---;
	init : *void = ---;
	initWithArgumentIndex_ : *void = ---;
	initWithDispatchQueue_ : *void = ---;
	initWithFunctionName_nodes_outputNode_attributes_ : *void = ---;
	initWithName_arguments_controlDependencies_ : *void = ---;
	initWithRank_values_ : *void = ---;
	initWithSampleCount_ : *void = ---;
	initWithSampleCount_horizontal_vertical_ : *void = ---;
	initialCapacity : *void = ---;
	initializeBindings : *void = ---;
	inputDimensionsAtBufferIndex_ : *void = ---;
	inputPrimitiveTopology : *void = ---;
	insertDebugCaptureBoundary : *void = ---;
	insertDebugSignpost_ : *void = ---;
	insertLibraries : *void = ---;
	installName : *void = ---;
	instanceCount : *void = ---;
	instanceCountBuffer : *void = ---;
	instanceCountBufferOffset : *void = ---;
	instanceDescriptorBuffer : *void = ---;
	instanceDescriptorBufferOffset : *void = ---;
	instanceDescriptorStride : *void = ---;
	instanceDescriptorType : *void = ---;
	instanceTransformationMatrixLayout : *void = ---;
	instancedAccelerationStructures : *void = ---;
	intermediatesHeapSize : *void = ---;
	intersectionFunctionTableDescriptor : *void = ---;
	intersectionFunctionTableOffset : *void = ---;
	invalidateCounterRange_ : *void = ---;
	iosurface : *void = ---;
	iosurfacePlane : *void = ---;
	isActive : *void = ---;
	isAliasable : *void = ---;
	isAlphaToCoverageEnabled : *void = ---;
	isAlphaToOneEnabled : *void = ---;
	isArgument : *void = ---;
	isBlendingEnabled : *void = ---;
	isCapturing : *void = ---;
	isDepth24Stencil8PixelFormatSupported : *void = ---;
	isDepthTexture : *void = ---;
	isDepthWriteEnabled : *void = ---;
	isFramebufferOnly : *void = ---;
	isHeadless : *void = ---;
	isLowPower : *void = ---;
	isPatchControlPointData : *void = ---;
	isPatchData : *void = ---;
	isRasterizationEnabled : *void = ---;
	isRemovable : *void = ---;
	isShareable : *void = ---;
	isSparse : *void = ---;
	isTessellationFactorScaleEnabled : *void = ---;
	isUsed : *void = ---;
	kernelEndTime : *void = ---;
	kernelStartTime : *void = ---;
	label : *void = ---;
	languageVersion : *void = ---;
	layerAtIndex_ : *void = ---;
	layerCount : *void = ---;
	layers : *void = ---;
	layouts : *void = ---;
	length : *void = ---;
	level : *void = ---;
	levelRange : *void = ---;
	libraries : *void = ---;
	library : *void = ---;
	libraryType : *void = ---;
	line : *void = ---;
	linkedFunctions : *void = ---;
	loadAction : *void = ---;
	loadBuffer_offset_size_sourceHandle_sourceHandleOffset_ : *void = ---;
	loadBytes_size_sourceHandle_sourceHandleOffset_ : *void = ---;
	loadTexture_slice_level_size_sourceBytesPerRow_sourceBytesPerImage_destinationOrigin_sourceHandle_sourceHandleOffset_ : *void = ---;
	location : *void = ---;
	locationNumber : *void = ---;
	lodAverage : *void = ---;
	lodBias : *void = ---;
	lodMaxClamp : *void = ---;
	lodMinClamp : *void = ---;
	logState : *void = ---;
	logs : *void = ---;
	lookupArchives : *void = ---;
	machineLearningCommandEncoder : *void = ---;
	machineLearningFunctionDescriptor : *void = ---;
	magFilter : *void = ---;
	makeAliasable : *void = ---;
	mapPhysicalToScreenCoordinates_forLayer_ : *void = ---;
	mapScreenToPhysicalCoordinates_forLayer_ : *void = ---;
	mathFloatingPointFunctions : *void = ---;
	mathMode : *void = ---;
	maxAnisotropy : *void = ---;
	maxArgumentBufferSamplerCount : *void = ---;
	maxAvailableSizeWithAlignment_ : *void = ---;
	maxBufferBindCount : *void = ---;
	maxBufferLength : *void = ---;
	maxCallStackDepth : *void = ---;
	maxCommandBufferCount : *void = ---;
	maxCommandsInFlight : *void = ---;
	maxCompatiblePlacementSparsePageSize : *void = ---;
	maxFragmentBufferBindCount : *void = ---;
	maxFragmentCallStackDepth : *void = ---;
	maxInstanceCount : *void = ---;
	maxKernelBufferBindCount : *void = ---;
	maxKernelThreadgroupMemoryBindCount : *void = ---;
	maxMeshBufferBindCount : *void = ---;
	maxMotionTransformCount : *void = ---;
	maxObjectBufferBindCount : *void = ---;
	maxObjectThreadgroupMemoryBindCount : *void = ---;
	maxSampleCount : *void = ---;
	maxSamplerStateBindCount : *void = ---;
	maxTessellationFactor : *void = ---;
	maxTextureBindCount : *void = ---;
	maxThreadgroupMemoryLength : *void = ---;
	maxThreadsPerThreadgroup : *void = ---;
	maxTotalThreadgroupsPerMeshGrid : *void = ---;
	maxTotalThreadsPerMeshThreadgroup : *void = ---;
	maxTotalThreadsPerObjectThreadgroup : *void = ---;
	maxTotalThreadsPerThreadgroup : *void = ---;
	maxTransferRate : *void = ---;
	maxVertexAmplificationCount : *void = ---;
	maxVertexBufferBindCount : *void = ---;
	maxVertexCallStackDepth : *void = ---;
	maximumConcurrentCompilationTaskCount : *void = ---;
	memberByName_ : *void = ---;
	members : *void = ---;
	memoryBarrierWithResources_count_ : *void = ---;
	memoryBarrierWithResources_count_afterStages_beforeStages_ : *void = ---;
	memoryBarrierWithScope_ : *void = ---;
	memoryBarrierWithScope_afterStages_beforeStages_ : *void = ---;
	meshAdditionalBinaryFunctions : *void = ---;
	meshBindings : *void = ---;
	meshBuffers : *void = ---;
	meshFunction : *void = ---;
	meshFunctionDescriptor : *void = ---;
	meshLinkedFunctions : *void = ---;
	meshLinkingDescriptor : *void = ---;
	meshStaticLinkingDescriptor : *void = ---;
	meshThreadExecutionWidth : *void = ---;
	meshThreadgroupSizeIsMultipleOfThreadExecutionWidth : *void = ---;
	minFilter : *void = ---;
	minimumLinearTextureAlignmentForPixelFormat_ : *void = ---;
	minimumTextureBufferAlignmentForPixelFormat_ : *void = ---;
	mipFilter : *void = ---;
	mipmapLevelCount : *void = ---;
	motionEndBorderMode : *void = ---;
	motionEndTime : *void = ---;
	motionKeyframeCount : *void = ---;
	motionStartBorderMode : *void = ---;
	motionStartTime : *void = ---;
	motionTransformBuffer : *void = ---;
	motionTransformBufferOffset : *void = ---;
	motionTransformCount : *void = ---;
	motionTransformCountBuffer : *void = ---;
	motionTransformCountBufferOffset : *void = ---;
	motionTransformStride : *void = ---;
	motionTransformType : *void = ---;
	moveTextureMappingsFromTexture_sourceSlice_sourceLevel_sourceOrigin_sourceSize_toTexture_destinationSlice_destinationLevel_destinationOrigin_ : *void = ---;
	mutability : *void = ---;
	name : *void = ---;
	newAccelerationStructureWithDescriptor_ : *void = ---;
	newAccelerationStructureWithDescriptor_offset_ : *void = ---;
	newAccelerationStructureWithSize_ : *void = ---;
	newAccelerationStructureWithSize_offset_ : *void = ---;
	newArchiveWithURL_error_ : *void = ---;
	newArgumentEncoderForBufferAtIndex_ : *void = ---;
	newArgumentEncoderWithArguments_ : *void = ---;
	newArgumentEncoderWithBufferBinding_ : *void = ---;
	newArgumentEncoderWithBufferIndex_ : *void = ---;
	newArgumentEncoderWithBufferIndex_reflection_ : *void = ---;
	newArgumentTableWithDescriptor_error_ : *void = ---;
	newBinaryArchiveWithDescriptor_error_ : *void = ---;
	newBinaryFunctionWithDescriptor_compilerTaskOptions_completionHandler_ : *void = ---;
	newBinaryFunctionWithDescriptor_compilerTaskOptions_error_ : *void = ---;
	newBinaryFunctionWithDescriptor_error_ : *void = ---;
	newBufferWithBytes_length_options_ : *void = ---;
	newBufferWithBytesNoCopy_length_options_deallocator_ : *void = ---;
	newBufferWithLength_options_ : *void = ---;
	newBufferWithLength_options_offset_ : *void = ---;
	newBufferWithLength_options_placementSparsePageSize_ : *void = ---;
	newCaptureScopeWithCommandQueue_ : *void = ---;
	newCaptureScopeWithDevice_ : *void = ---;
	newCaptureScopeWithMTL4CommandQueue_ : *void = ---;
	newCommandAllocator : *void = ---;
	newCommandAllocatorWithDescriptor_error_ : *void = ---;
	newCommandBuffer : *void = ---;
	newCommandQueue : *void = ---;
	newCommandQueueWithDescriptor_ : *void = ---;
	newCommandQueueWithMaxCommandBufferCount_ : *void = ---;
	newCompilerWithDescriptor_error_ : *void = ---;
	newComputePipelineStateWithAdditionalBinaryFunctions_error_ : *void = ---;
	newComputePipelineStateWithBinaryFunctions_error_ : *void = ---;
	newComputePipelineStateWithDescriptor_compilerTaskOptions_completionHandler_ : *void = ---;
	newComputePipelineStateWithDescriptor_compilerTaskOptions_error_ : *void = ---;
	newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_completionHandler_ : *void = ---;
	newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_error_ : *void = ---;
	newComputePipelineStateWithDescriptor_dynamicLinkingDescriptor_error_ : *void = ---;
	newComputePipelineStateWithDescriptor_error_ : *void = ---;
	newComputePipelineStateWithDescriptor_options_completionHandler_ : *void = ---;
	newComputePipelineStateWithDescriptor_options_reflection_error_ : *void = ---;
	newComputePipelineStateWithFunction_completionHandler_ : *void = ---;
	newComputePipelineStateWithFunction_error_ : *void = ---;
	newComputePipelineStateWithFunction_options_completionHandler_ : *void = ---;
	newComputePipelineStateWithFunction_options_reflection_error_ : *void = ---;
	newCounterHeapWithDescriptor_error_ : *void = ---;
	newCounterSampleBufferWithDescriptor_error_ : *void = ---;
	newDefaultLibrary : *void = ---;
	newDefaultLibraryWithBundle_error_ : *void = ---;
	newDepthStencilStateWithDescriptor_ : *void = ---;
	newDynamicLibrary_completionHandler_ : *void = ---;
	newDynamicLibrary_error_ : *void = ---;
	newDynamicLibraryWithURL_completionHandler_ : *void = ---;
	newDynamicLibraryWithURL_error_ : *void = ---;
	newEvent : *void = ---;
	newFence : *void = ---;
	newFunctionWithDescriptor_completionHandler_ : *void = ---;
	newFunctionWithDescriptor_error_ : *void = ---;
	newFunctionWithName_ : *void = ---;
	newFunctionWithName_constantValues_completionHandler_ : *void = ---;
	newFunctionWithName_constantValues_error_ : *void = ---;
	newHeapWithDescriptor_ : *void = ---;
	newIOCommandQueueWithDescriptor_error_ : *void = ---;
	newIOFileHandleWithURL_compressionMethod_error_ : *void = ---;
	newIOFileHandleWithURL_error_ : *void = ---;
	newIOHandleWithURL_compressionMethod_error_ : *void = ---;
	newIOHandleWithURL_error_ : *void = ---;
	newIndirectCommandBufferWithDescriptor_maxCommandCount_options_ : *void = ---;
	newIntersectionFunctionTableWithDescriptor_ : *void = ---;
	newIntersectionFunctionTableWithDescriptor_stage_ : *void = ---;
	newIntersectionFunctionWithDescriptor_completionHandler_ : *void = ---;
	newIntersectionFunctionWithDescriptor_error_ : *void = ---;
	newLibraryWithData_error_ : *void = ---;
	newLibraryWithDescriptor_completionHandler_ : *void = ---;
	newLibraryWithDescriptor_error_ : *void = ---;
	newLibraryWithFile_error_ : *void = ---;
	newLibraryWithSource_options_completionHandler_ : *void = ---;
	newLibraryWithSource_options_error_ : *void = ---;
	newLibraryWithStitchedDescriptor_completionHandler_ : *void = ---;
	newLibraryWithStitchedDescriptor_error_ : *void = ---;
	newLibraryWithURL_error_ : *void = ---;
	newLogStateWithDescriptor_error_ : *void = ---;
	newMTL4CommandQueue : *void = ---;
	newMTL4CommandQueueWithDescriptor_error_ : *void = ---;
	newMachineLearningPipelineStateWithDescriptor_completionHandler_ : *void = ---;
	newMachineLearningPipelineStateWithDescriptor_error_ : *void = ---;
	newPipelineDataSetSerializerWithDescriptor_ : *void = ---;
	newRasterizationRateMapWithDescriptor_ : *void = ---;
	newRemoteBufferViewForDevice_ : *void = ---;
	newRemoteTextureViewForDevice_ : *void = ---;
	newRenderPipelineDescriptorForSpecialization : *void = ---;
	newRenderPipelineStateBySpecializationWithDescriptor_pipeline_completionHandler_ : *void = ---;
	newRenderPipelineStateBySpecializationWithDescriptor_pipeline_error_ : *void = ---;
	newRenderPipelineStateWithAdditionalBinaryFunctions_error_ : *void = ---;
	newRenderPipelineStateWithBinaryFunctions_error_ : *void = ---;
	newRenderPipelineStateWithDescriptor_compilerTaskOptions_completionHandler_ : *void = ---;
	newRenderPipelineStateWithDescriptor_compilerTaskOptions_error_ : *void = ---;
	newRenderPipelineStateWithDescriptor_completionHandler_ : *void = ---;
	newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_completionHandler_ : *void = ---;
	newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_compilerTaskOptions_error_ : *void = ---;
	newRenderPipelineStateWithDescriptor_dynamicLinkingDescriptor_error_ : *void = ---;
	newRenderPipelineStateWithDescriptor_error_ : *void = ---;
	newRenderPipelineStateWithDescriptor_options_completionHandler_ : *void = ---;
	newRenderPipelineStateWithDescriptor_options_reflection_error_ : *void = ---;
	newRenderPipelineStateWithMeshDescriptor_options_completionHandler_ : *void = ---;
	newRenderPipelineStateWithMeshDescriptor_options_reflection_error_ : *void = ---;
	newRenderPipelineStateWithTileDescriptor_options_completionHandler_ : *void = ---;
	newRenderPipelineStateWithTileDescriptor_options_reflection_error_ : *void = ---;
	newResidencySetWithDescriptor_error_ : *void = ---;
	newSamplerStateWithDescriptor_ : *void = ---;
	newScratchBufferWithMinimumSize_ : *void = ---;
	newSharedEvent : *void = ---;
	newSharedEventHandle : *void = ---;
	newSharedEventWithHandle_ : *void = ---;
	newSharedTextureHandle : *void = ---;
	newSharedTextureWithDescriptor_ : *void = ---;
	newSharedTextureWithHandle_ : *void = ---;
	newTensorWithDescriptor_error_ : *void = ---;
	newTensorWithDescriptor_offset_error_ : *void = ---;
	newTextureViewPoolWithDescriptor_error_ : *void = ---;
	newTextureViewWithDescriptor_ : *void = ---;
	newTextureViewWithPixelFormat_ : *void = ---;
	newTextureViewWithPixelFormat_textureType_levels_slices_ : *void = ---;
	newTextureViewWithPixelFormat_textureType_levels_slices_swizzle_ : *void = ---;
	newTextureWithDescriptor_ : *void = ---;
	newTextureWithDescriptor_iosurface_plane_ : *void = ---;
	newTextureWithDescriptor_offset_ : *void = ---;
	newTextureWithDescriptor_offset_bytesPerRow_ : *void = ---;
	newVisibleFunctionTableWithDescriptor_ : *void = ---;
	newVisibleFunctionTableWithDescriptor_stage_ : *void = ---;
	nodes : *void = ---;
	normalizedCoordinates : *void = ---;
	notifyListener_atValue_block_ : *void = ---;
	objectAdditionalBinaryFunctions : *void = ---;
	objectAtIndexedSubscript_ : *void = ---;
	objectBindings : *void = ---;
	objectBuffers : *void = ---;
	objectFunction : *void = ---;
	objectFunctionDescriptor : *void = ---;
	objectLinkedFunctions : *void = ---;
	objectLinkingDescriptor : *void = ---;
	objectPayloadAlignment : *void = ---;
	objectPayloadDataSize : *void = ---;
	objectStaticLinkingDescriptor : *void = ---;
	objectThreadExecutionWidth : *void = ---;
	objectThreadgroupSizeIsMultipleOfThreadExecutionWidth : *void = ---;
	offset : *void = ---;
	opaque : *void = ---;
	optimizationLevel : *void = ---;
	optimizeContentsForCPUAccess_ : *void = ---;
	optimizeContentsForCPUAccess_slice_level_ : *void = ---;
	optimizeContentsForGPUAccess_ : *void = ---;
	optimizeContentsForGPUAccess_slice_level_ : *void = ---;
	optimizeIndirectCommandBuffer_withRange_ : *void = ---;
	options : *void = ---;
	outputNode : *void = ---;
	outputURL : *void = ---;
	parallelRenderCommandEncoderWithDescriptor_ : *void = ---;
	parameterBufferSizeAndAlign : *void = ---;
	parentRelativeLevel : *void = ---;
	parentRelativeSlice : *void = ---;
	parentTexture : *void = ---;
	patchControlPointCount : *void = ---;
	patchType : *void = ---;
	payloadMemoryLength : *void = ---;
	peerCount : *void = ---;
	peerGroupID : *void = ---;
	peerIndex : *void = ---;
	physicalGranularity : *void = ---;
	physicalSizeForLayer_ : *void = ---;
	pipelineDataSetSerializer : *void = ---;
	pixelFormat : *void = ---;
	placementSparsePageSize : *void = ---;
	pointerType : *void = ---;
	popDebugGroup : *void = ---;
	preloadedLibraries : *void = ---;
	preprocessorMacros : *void = ---;
	present : *void = ---;
	presentAfterMinimumDuration_ : *void = ---;
	presentAtTime_ : *void = ---;
	presentDrawable_ : *void = ---;
	presentDrawable_afterMinimumDuration_ : *void = ---;
	presentDrawable_atTime_ : *void = ---;
	presentedTime : *void = ---;
	preserveInvariance : *void = ---;
	primitiveDataBuffer : *void = ---;
	primitiveDataBufferOffset : *void = ---;
	primitiveDataElementSize : *void = ---;
	primitiveDataStride : *void = ---;
	priority : *void = ---;
	privateFunctionDescriptors : *void = ---;
	privateFunctions : *void = ---;
	pushDebugGroup_ : *void = ---;
	queryTimestampFrequency : *void = ---;
	rAddressMode : *void = ---;
	radiusBuffer : *void = ---;
	radiusBufferOffset : *void = ---;
	radiusBuffers : *void = ---;
	radiusFormat : *void = ---;
	radiusStride : *void = ---;
	rank : *void = ---;
	rasterSampleCount : *void = ---;
	rasterizationRateMap : *void = ---;
	rasterizationRateMapDescriptorWithScreenSize_ : *void = ---;
	rasterizationRateMapDescriptorWithScreenSize_layer_ : *void = ---;
	rasterizationRateMapDescriptorWithScreenSize_layerCount_layers_ : *void = ---;
	readMask : *void = ---;
	readWriteTextureSupport : *void = ---;
	recommendedMaxWorkingSetSize : *void = ---;
	reductionMode : *void = ---;
	refitAccelerationStructure_descriptor_destination_scratchBuffer_ : *void = ---;
	refitAccelerationStructure_descriptor_destination_scratchBuffer_options_ : *void = ---;
	refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_ : *void = ---;
	refitAccelerationStructure_descriptor_destination_scratchBuffer_scratchBufferOffset_options_ : *void = ---;
	reflection : *void = ---;
	reflectionForFunctionWithName_ : *void = ---;
	registryID : *void = ---;
	remoteStorageBuffer : *void = ---;
	remoteStorageTexture : *void = ---;
	removeAllAllocations : *void = ---;
	removeAllDebugMarkers : *void = ---;
	removeAllocation_ : *void = ---;
	removeAllocations_count_ : *void = ---;
	removeResidencySet_ : *void = ---;
	removeResidencySets_count_ : *void = ---;
	renderCommandEncoder : *void = ---;
	renderCommandEncoderWithDescriptor_ : *void = ---;
	renderCommandEncoderWithDescriptor_options_ : *void = ---;
	renderPassDescriptor : *void = ---;
	renderTargetArrayLength : *void = ---;
	renderTargetHeight : *void = ---;
	renderTargetWidth : *void = ---;
	replaceRegion_mipmapLevel_slice_withBytes_bytesPerRow_bytesPerImage_ : *void = ---;
	replaceRegion_mipmapLevel_withBytes_bytesPerRow_ : *void = ---;
	replaceSliceOrigin_sliceDimensions_withBytes_strides_ : *void = ---;
	requestResidency : *void = ---;
	required : *void = ---;
	requiredThreadsPerMeshThreadgroup : *void = ---;
	requiredThreadsPerObjectThreadgroup : *void = ---;
	requiredThreadsPerThreadgroup : *void = ---;
	requiredThreadsPerTileThreadgroup : *void = ---;
	reset : *void = ---;
	resetCommandsInBuffer_withRange_ : *void = ---;
	resetTextureAccessCounters_region_mipLevel_slice_ : *void = ---;
	resetWithRange_ : *void = ---;
	resolveCounterHeap_withRange_intoBuffer_waitFence_updateFence_ : *void = ---;
	resolveCounterRange_ : *void = ---;
	resolveCounters_inRange_destinationBuffer_destinationOffset_ : *void = ---;
	resolveDepthPlane : *void = ---;
	resolveLevel : *void = ---;
	resolveSlice : *void = ---;
	resolveTexture : *void = ---;
	resourceOptions : *void = ---;
	resourceStateCommandEncoder : *void = ---;
	resourceStateCommandEncoderWithDescriptor_ : *void = ---;
	resourceStatePassDescriptor : *void = ---;
	resourceViewCount : *void = ---;
	retainedReferences : *void = ---;
	rgbBlendOperation : *void = ---;
	rootResource : *void = ---;
	sAddressMode : *void = ---;
	sampleBuffer : *void = ---;
	sampleBufferAttachments : *void = ---;
	sampleCount : *void = ---;
	sampleCountersInBuffer_atSampleIndex_withBarrier_ : *void = ---;
	sampleTimestamps_gpuTimestamp_ : *void = ---;
	scratchBufferAllocator : *void = ---;
	screenSize : *void = ---;
	segmentControlPointCount : *void = ---;
	segmentCount : *void = ---;
	serializeAsArchiveAndFlushToURL_error_ : *void = ---;
	serializeAsPipelinesScriptWithError_ : *void = ---;
	serializeToURL_error_ : *void = ---;
	setAccelerationStructure_atBufferIndex_ : *void = ---;
	setAccelerationStructure_atIndex_ : *void = ---;
	setAccess_ : *void = ---;
	setAddress_atIndex_ : *void = ---;
	setAddress_attributeStride_atIndex_ : *void = ---;
	setAllowDuplicateIntersectionFunctionInvocation_ : *void = ---;
	setAllowGPUOptimizedContents_ : *void = ---;
	setAllowReferencingUndefinedSymbols_ : *void = ---;
	setAlphaBlendOperation_ : *void = ---;
	setAlphaToCoverageEnabled_ : *void = ---;
	setAlphaToCoverageState_ : *void = ---;
	setAlphaToOneEnabled_ : *void = ---;
	setAlphaToOneState_ : *void = ---;
	setArgumentBuffer_offset_ : *void = ---;
	setArgumentBuffer_startOffset_arrayElement_ : *void = ---;
	setArgumentIndex_ : *void = ---;
	setArgumentTable_ : *void = ---;
	setArgumentTable_atStages_ : *void = ---;
	setArguments_ : *void = ---;
	setArrayLength_ : *void = ---;
	setAttributes_ : *void = ---;
	setBackFaceStencil_ : *void = ---;
	setBarrier : *void = ---;
	setBinaryArchives_ : *void = ---;
	setBinaryFunctions_ : *void = ---;
	setBinaryLinkedFunctions_ : *void = ---;
	setBlendColorRed_green_blue_alpha_ : *void = ---;
	setBlendingEnabled_ : *void = ---;
	setBlendingState_ : *void = ---;
	setBorderColor_ : *void = ---;
	setBoundingBoxBuffer_ : *void = ---;
	setBoundingBoxBufferOffset_ : *void = ---;
	setBoundingBoxBuffers_ : *void = ---;
	setBoundingBoxCount_ : *void = ---;
	setBoundingBoxStride_ : *void = ---;
	setBuffer_ : *void = ---;
	setBuffer_offset_atIndex_ : *void = ---;
	setBuffer_offset_attributeStride_atIndex_ : *void = ---;
	setBufferIndex_ : *void = ---;
	setBufferOffset_atIndex_ : *void = ---;
	setBufferOffset_attributeStride_atIndex_ : *void = ---;
	setBufferSize_ : *void = ---;
	setBuffers_offsets_attributeStrides_withRange_ : *void = ---;
	setBuffers_offsets_withRange_ : *void = ---;
	setBytes_length_atIndex_ : *void = ---;
	setBytes_length_attributeStride_atIndex_ : *void = ---;
	setCaptureObject_ : *void = ---;
	setClearColor_ : *void = ---;
	setClearDepth_ : *void = ---;
	setClearStencil_ : *void = ---;
	setColorAttachmentMap_ : *void = ---;
	setColorAttachmentMappingState_ : *void = ---;
	setColorStoreAction_atIndex_ : *void = ---;
	setColorStoreActionOptions_atIndex_ : *void = ---;
	setCommandTypes_ : *void = ---;
	setCompareFunction_ : *void = ---;
	setCompileSymbolVisibility_ : *void = ---;
	setCompressionType_ : *void = ---;
	setComputeFunction_ : *void = ---;
	setComputeFunctionDescriptor_ : *void = ---;
	setComputePipelineState_ : *void = ---;
	setComputePipelineState_atIndex_ : *void = ---;
	setComputePipelineStates_withRange_ : *void = ---;
	setConfiguration_ : *void = ---;
	setConstantBlockAlignment_ : *void = ---;
	setConstantValue_type_atIndex_ : *void = ---;
	setConstantValue_type_withName_ : *void = ---;
	setConstantValues_ : *void = ---;
	setConstantValues_type_withRange_ : *void = ---;
	setControlDependencies_ : *void = ---;
	setControlPointBuffer_ : *void = ---;
	setControlPointBufferOffset_ : *void = ---;
	setControlPointBuffers_ : *void = ---;
	setControlPointCount_ : *void = ---;
	setControlPointFormat_ : *void = ---;
	setControlPointStride_ : *void = ---;
	setCount_ : *void = ---;
	setCounterSet_ : *void = ---;
	setCpuCacheMode_ : *void = ---;
	setCullMode_ : *void = ---;
	setCurveBasis_ : *void = ---;
	setCurveEndCaps_ : *void = ---;
	setCurveType_ : *void = ---;
	setDataType_ : *void = ---;
	setDefaultCaptureScope_ : *void = ---;
	setDefaultRasterSampleCount_ : *void = ---;
	setDepth_ : *void = ---;
	setDepthAttachment_ : *void = ---;
	setDepthAttachmentPixelFormat_ : *void = ---;
	setDepthBias_slopeScale_clamp_ : *void = ---;
	setDepthClipMode_ : *void = ---;
	setDepthCompareFunction_ : *void = ---;
	setDepthFailureOperation_ : *void = ---;
	setDepthPlane_ : *void = ---;
	setDepthResolveFilter_ : *void = ---;
	setDepthStencilPassOperation_ : *void = ---;
	setDepthStencilState_ : *void = ---;
	setDepthStencilState_atIndex_ : *void = ---;
	setDepthStencilStates_withRange_ : *void = ---;
	setDepthStoreAction_ : *void = ---;
	setDepthStoreActionOptions_ : *void = ---;
	setDepthTestMinBound_maxBound_ : *void = ---;
	setDepthWriteEnabled_ : *void = ---;
	setDestination_ : *void = ---;
	setDestinationAlphaBlendFactor_ : *void = ---;
	setDestinationRGBBlendFactor_ : *void = ---;
	setDimensions_ : *void = ---;
	setDispatchType_ : *void = ---;
	setEnableLogging_ : *void = ---;
	setEndOfEncoderSampleIndex_ : *void = ---;
	setEndOfFragmentSampleIndex_ : *void = ---;
	setEndOfVertexSampleIndex_ : *void = ---;
	setErrorOptions_ : *void = ---;
	setFastMathEnabled_ : *void = ---;
	setFeedbackQueue_ : *void = ---;
	setFormat_ : *void = ---;
	setFragmentAccelerationStructure_atBufferIndex_ : *void = ---;
	setFragmentAdditionalBinaryFunctions_ : *void = ---;
	setFragmentBuffer_offset_atIndex_ : *void = ---;
	setFragmentBufferOffset_atIndex_ : *void = ---;
	setFragmentBuffers_offsets_withRange_ : *void = ---;
	setFragmentBytes_length_atIndex_ : *void = ---;
	setFragmentFunction_ : *void = ---;
	setFragmentFunctionDescriptor_ : *void = ---;
	setFragmentIntersectionFunctionTable_atBufferIndex_ : *void = ---;
	setFragmentIntersectionFunctionTables_withBufferRange_ : *void = ---;
	setFragmentLinkedFunctions_ : *void = ---;
	setFragmentPreloadedLibraries_ : *void = ---;
	setFragmentSamplerState_atIndex_ : *void = ---;
	setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_ : *void = ---;
	setFragmentSamplerStates_lodMinClamps_lodMaxClamps_withRange_ : *void = ---;
	setFragmentSamplerStates_withRange_ : *void = ---;
	setFragmentStaticLinkingDescriptor_ : *void = ---;
	setFragmentTexture_atIndex_ : *void = ---;
	setFragmentTextures_withRange_ : *void = ---;
	setFragmentVisibleFunctionTable_atBufferIndex_ : *void = ---;
	setFragmentVisibleFunctionTables_withBufferRange_ : *void = ---;
	setFrontFaceStencil_ : *void = ---;
	setFrontFacingWinding_ : *void = ---;
	setFunction_atIndex_ : *void = ---;
	setFunctionCount_ : *void = ---;
	setFunctionDescriptor_ : *void = ---;
	setFunctionDescriptors_ : *void = ---;
	setFunctionGraph_ : *void = ---;
	setFunctionGraphs_ : *void = ---;
	setFunctionName_ : *void = ---;
	setFunctions_ : *void = ---;
	setFunctions_withRange_ : *void = ---;
	setGeometryDescriptors_ : *void = ---;
	setGroups_ : *void = ---;
	setHazardTrackingMode_ : *void = ---;
	setHeight_ : *void = ---;
	setImageblockSampleLength_ : *void = ---;
	setImageblockWidth_height_ : *void = ---;
	setIndex_ : *void = ---;
	setIndexBuffer_ : *void = ---;
	setIndexBufferIndex_ : *void = ---;
	setIndexBufferOffset_ : *void = ---;
	setIndexType_ : *void = ---;
	setIndirectCommandBuffer_atIndex_ : *void = ---;
	setIndirectCommandBuffers_withRange_ : *void = ---;
	setInheritBuffers_ : *void = ---;
	setInheritCullMode_ : *void = ---;
	setInheritDepthBias_ : *void = ---;
	setInheritDepthClipMode_ : *void = ---;
	setInheritDepthStencilState_ : *void = ---;
	setInheritFrontFacingWinding_ : *void = ---;
	setInheritPipelineState_ : *void = ---;
	setInheritTriangleFillMode_ : *void = ---;
	setInitialCapacity_ : *void = ---;
	setInitializeBindings_ : *void = ---;
	setInputDimensions_atBufferIndex_ : *void = ---;
	setInputDimensions_withRange_ : *void = ---;
	setInputPrimitiveTopology_ : *void = ---;
	setInsertLibraries_ : *void = ---;
	setInstallName_ : *void = ---;
	setInstanceCount_ : *void = ---;
	setInstanceCountBuffer_ : *void = ---;
	setInstanceCountBufferOffset_ : *void = ---;
	setInstanceDescriptorBuffer_ : *void = ---;
	setInstanceDescriptorBufferOffset_ : *void = ---;
	setInstanceDescriptorStride_ : *void = ---;
	setInstanceDescriptorType_ : *void = ---;
	setInstanceTransformationMatrixLayout_ : *void = ---;
	setInstancedAccelerationStructures_ : *void = ---;
	setIntersectionFunctionTable_atBufferIndex_ : *void = ---;
	setIntersectionFunctionTable_atIndex_ : *void = ---;
	setIntersectionFunctionTableOffset_ : *void = ---;
	setIntersectionFunctionTables_withBufferRange_ : *void = ---;
	setIntersectionFunctionTables_withRange_ : *void = ---;
	setKernelBuffer_offset_atIndex_ : *void = ---;
	setKernelBuffer_offset_attributeStride_atIndex_ : *void = ---;
	setLabel_ : *void = ---;
	setLanguageVersion_ : *void = ---;
	setLayer_atIndex_ : *void = ---;
	setLevel_ : *void = ---;
	setLevelRange_ : *void = ---;
	setLibraries_ : *void = ---;
	setLibrary_ : *void = ---;
	setLibraryType_ : *void = ---;
	setLinkedFunctions_ : *void = ---;
	setLoadAction_ : *void = ---;
	setLodAverage_ : *void = ---;
	setLodBias_ : *void = ---;
	setLodMaxClamp_ : *void = ---;
	setLodMinClamp_ : *void = ---;
	setLogState_ : *void = ---;
	setLookupArchives_ : *void = ---;
	setMachineLearningFunctionDescriptor_ : *void = ---;
	setMagFilter_ : *void = ---;
	setMathFloatingPointFunctions_ : *void = ---;
	setMathMode_ : *void = ---;
	setMaxAnisotropy_ : *void = ---;
	setMaxBufferBindCount_ : *void = ---;
	setMaxCallStackDepth_ : *void = ---;
	setMaxCommandBufferCount_ : *void = ---;
	setMaxCommandsInFlight_ : *void = ---;
	setMaxCompatiblePlacementSparsePageSize_ : *void = ---;
	setMaxFragmentBufferBindCount_ : *void = ---;
	setMaxFragmentCallStackDepth_ : *void = ---;
	setMaxInstanceCount_ : *void = ---;
	setMaxKernelBufferBindCount_ : *void = ---;
	setMaxKernelThreadgroupMemoryBindCount_ : *void = ---;
	setMaxMeshBufferBindCount_ : *void = ---;
	setMaxMotionTransformCount_ : *void = ---;
	setMaxObjectBufferBindCount_ : *void = ---;
	setMaxObjectThreadgroupMemoryBindCount_ : *void = ---;
	setMaxSamplerStateBindCount_ : *void = ---;
	setMaxTessellationFactor_ : *void = ---;
	setMaxTextureBindCount_ : *void = ---;
	setMaxTotalThreadgroupsPerMeshGrid_ : *void = ---;
	setMaxTotalThreadsPerMeshThreadgroup_ : *void = ---;
	setMaxTotalThreadsPerObjectThreadgroup_ : *void = ---;
	setMaxTotalThreadsPerThreadgroup_ : *void = ---;
	setMaxVertexAmplificationCount_ : *void = ---;
	setMaxVertexBufferBindCount_ : *void = ---;
	setMaxVertexCallStackDepth_ : *void = ---;
	setMeshAdditionalBinaryFunctions_ : *void = ---;
	setMeshBuffer_offset_atIndex_ : *void = ---;
	setMeshBufferOffset_atIndex_ : *void = ---;
	setMeshBuffers_offsets_withRange_ : *void = ---;
	setMeshBytes_length_atIndex_ : *void = ---;
	setMeshFunction_ : *void = ---;
	setMeshFunctionDescriptor_ : *void = ---;
	setMeshLinkedFunctions_ : *void = ---;
	setMeshSamplerState_atIndex_ : *void = ---;
	setMeshSamplerState_lodMinClamp_lodMaxClamp_atIndex_ : *void = ---;
	setMeshSamplerStates_lodMinClamps_lodMaxClamps_withRange_ : *void = ---;
	setMeshSamplerStates_withRange_ : *void = ---;
	setMeshStaticLinkingDescriptor_ : *void = ---;
	setMeshTexture_atIndex_ : *void = ---;
	setMeshTextures_withRange_ : *void = ---;
	setMeshThreadgroupSizeIsMultipleOfThreadExecutionWidth_ : *void = ---;
	setMinFilter_ : *void = ---;
	setMipFilter_ : *void = ---;
	setMipmapLevelCount_ : *void = ---;
	setMotionEndBorderMode_ : *void = ---;
	setMotionEndTime_ : *void = ---;
	setMotionKeyframeCount_ : *void = ---;
	setMotionStartBorderMode_ : *void = ---;
	setMotionStartTime_ : *void = ---;
	setMotionTransformBuffer_ : *void = ---;
	setMotionTransformBufferOffset_ : *void = ---;
	setMotionTransformCount_ : *void = ---;
	setMotionTransformCountBuffer_ : *void = ---;
	setMotionTransformCountBufferOffset_ : *void = ---;
	setMotionTransformStride_ : *void = ---;
	setMotionTransformType_ : *void = ---;
	setMutability_ : *void = ---;
	setName_ : *void = ---;
	setNodes_ : *void = ---;
	setNormalizedCoordinates_ : *void = ---;
	setObject_atIndexedSubscript_ : *void = ---;
	setObjectAdditionalBinaryFunctions_ : *void = ---;
	setObjectBuffer_offset_atIndex_ : *void = ---;
	setObjectBufferOffset_atIndex_ : *void = ---;
	setObjectBuffers_offsets_withRange_ : *void = ---;
	setObjectBytes_length_atIndex_ : *void = ---;
	setObjectFunction_ : *void = ---;
	setObjectFunctionDescriptor_ : *void = ---;
	setObjectLinkedFunctions_ : *void = ---;
	setObjectSamplerState_atIndex_ : *void = ---;
	setObjectSamplerState_lodMinClamp_lodMaxClamp_atIndex_ : *void = ---;
	setObjectSamplerStates_lodMinClamps_lodMaxClamps_withRange_ : *void = ---;
	setObjectSamplerStates_withRange_ : *void = ---;
	setObjectStaticLinkingDescriptor_ : *void = ---;
	setObjectTexture_atIndex_ : *void = ---;
	setObjectTextures_withRange_ : *void = ---;
	setObjectThreadgroupMemoryLength_atIndex_ : *void = ---;
	setObjectThreadgroupSizeIsMultipleOfThreadExecutionWidth_ : *void = ---;
	setOffset_ : *void = ---;
	setOpaque_ : *void = ---;
	setOpaqueCurveIntersectionFunctionWithSignature_atIndex_ : *void = ---;
	setOpaqueCurveIntersectionFunctionWithSignature_withRange_ : *void = ---;
	setOpaqueTriangleIntersectionFunctionWithSignature_atIndex_ : *void = ---;
	setOpaqueTriangleIntersectionFunctionWithSignature_withRange_ : *void = ---;
	setOptimizationLevel_ : *void = ---;
	setOptions_ : *void = ---;
	setOutputNode_ : *void = ---;
	setOutputURL_ : *void = ---;
	setOwnerWithIdentity_ : *void = ---;
	setPayloadMemoryLength_ : *void = ---;
	setPhysicalIndex_forLogicalIndex_ : *void = ---;
	setPipelineDataSetSerializer_ : *void = ---;
	setPipelineState_ : *void = ---;
	setPixelFormat_ : *void = ---;
	setPlacementSparsePageSize_ : *void = ---;
	setPreloadedLibraries_ : *void = ---;
	setPreprocessorMacros_ : *void = ---;
	setPreserveInvariance_ : *void = ---;
	setPrimitiveDataBuffer_ : *void = ---;
	setPrimitiveDataBufferOffset_ : *void = ---;
	setPrimitiveDataElementSize_ : *void = ---;
	setPrimitiveDataStride_ : *void = ---;
	setPriority_ : *void = ---;
	setPrivateFunctionDescriptors_ : *void = ---;
	setPrivateFunctions_ : *void = ---;
	setPurgeableState_ : *void = ---;
	setRAddressMode_ : *void = ---;
	setRadiusBuffer_ : *void = ---;
	setRadiusBufferOffset_ : *void = ---;
	setRadiusBuffers_ : *void = ---;
	setRadiusFormat_ : *void = ---;
	setRadiusStride_ : *void = ---;
	setRasterSampleCount_ : *void = ---;
	setRasterizationEnabled_ : *void = ---;
	setRasterizationRateMap_ : *void = ---;
	setReadMask_ : *void = ---;
	setReductionMode_ : *void = ---;
	setRenderPipelineState_ : *void = ---;
	setRenderPipelineState_atIndex_ : *void = ---;
	setRenderPipelineStates_withRange_ : *void = ---;
	setRenderTargetArrayLength_ : *void = ---;
	setRenderTargetHeight_ : *void = ---;
	setRenderTargetWidth_ : *void = ---;
	setRequiredThreadsPerMeshThreadgroup_ : *void = ---;
	setRequiredThreadsPerObjectThreadgroup_ : *void = ---;
	setRequiredThreadsPerThreadgroup_ : *void = ---;
	setResolveDepthPlane_ : *void = ---;
	setResolveLevel_ : *void = ---;
	setResolveSlice_ : *void = ---;
	setResolveTexture_ : *void = ---;
	setResource_atBufferIndex_ : *void = ---;
	setResourceOptions_ : *void = ---;
	setResourceViewCount_ : *void = ---;
	setRetainedReferences_ : *void = ---;
	setRgbBlendOperation_ : *void = ---;
	setSAddressMode_ : *void = ---;
	setSampleBuffer_ : *void = ---;
	setSampleCount_ : *void = ---;
	setSamplePositions_count_ : *void = ---;
	setSamplerState_atIndex_ : *void = ---;
	setSamplerState_lodMinClamp_lodMaxClamp_atIndex_ : *void = ---;
	setSamplerStates_lodMinClamps_lodMaxClamps_withRange_ : *void = ---;
	setSamplerStates_withRange_ : *void = ---;
	setScissorRect_ : *void = ---;
	setScissorRects_count_ : *void = ---;
	setScratchBufferAllocator_ : *void = ---;
	setScreenSize_ : *void = ---;
	setSegmentControlPointCount_ : *void = ---;
	setSegmentCount_ : *void = ---;
	setShaderReflection_ : *void = ---;
	setShaderValidation_ : *void = ---;
	setShouldMaximizeConcurrentCompilation_ : *void = ---;
	setSignaledValue_ : *void = ---;
	setSize_ : *void = ---;
	setSlice_ : *void = ---;
	setSliceRange_ : *void = ---;
	setSource_ : *void = ---;
	setSourceAlphaBlendFactor_ : *void = ---;
	setSourceRGBBlendFactor_ : *void = ---;
	setSparsePageSize_ : *void = ---;
	setSpecializedName_ : *void = ---;
	setStageInRegion_ : *void = ---;
	setStageInRegionWithIndirectBuffer_indirectBufferOffset_ : *void = ---;
	setStageInputDescriptor_ : *void = ---;
	setStartOfEncoderSampleIndex_ : *void = ---;
	setStartOfFragmentSampleIndex_ : *void = ---;
	setStartOfVertexSampleIndex_ : *void = ---;
	setStaticLinkingDescriptor_ : *void = ---;
	setStencilAttachment_ : *void = ---;
	setStencilAttachmentPixelFormat_ : *void = ---;
	setStencilCompareFunction_ : *void = ---;
	setStencilFailureOperation_ : *void = ---;
	setStencilFrontReferenceValue_backReferenceValue_ : *void = ---;
	setStencilReferenceValue_ : *void = ---;
	setStencilResolveFilter_ : *void = ---;
	setStencilStoreAction_ : *void = ---;
	setStencilStoreActionOptions_ : *void = ---;
	setStepFunction_ : *void = ---;
	setStepRate_ : *void = ---;
	setStorageMode_ : *void = ---;
	setStoreAction_ : *void = ---;
	setStoreActionOptions_ : *void = ---;
	setStride_ : *void = ---;
	setStrides_ : *void = ---;
	setSupportAddingBinaryFunctions_ : *void = ---;
	setSupportAddingFragmentBinaryFunctions_ : *void = ---;
	setSupportAddingVertexBinaryFunctions_ : *void = ---;
	setSupportArgumentBuffers_ : *void = ---;
	setSupportAttributeStrides_ : *void = ---;
	setSupportBinaryLinking_ : *void = ---;
	setSupportColorAttachmentMapping_ : *void = ---;
	setSupportDynamicAttributeStride_ : *void = ---;
	setSupportFragmentBinaryLinking_ : *void = ---;
	setSupportIndirectCommandBuffers_ : *void = ---;
	setSupportMeshBinaryLinking_ : *void = ---;
	setSupportObjectBinaryLinking_ : *void = ---;
	setSupportRayTracing_ : *void = ---;
	setSupportVertexBinaryLinking_ : *void = ---;
	setSwizzle_ : *void = ---;
	setTAddressMode_ : *void = ---;
	setTessellationControlPointIndexType_ : *void = ---;
	setTessellationFactorBuffer_offset_instanceStride_ : *void = ---;
	setTessellationFactorFormat_ : *void = ---;
	setTessellationFactorScale_ : *void = ---;
	setTessellationFactorScaleEnabled_ : *void = ---;
	setTessellationFactorStepFunction_ : *void = ---;
	setTessellationOutputWindingOrder_ : *void = ---;
	setTessellationPartitionMode_ : *void = ---;
	setTexture_ : *void = ---;
	setTexture_atIndex_ : *void = ---;
	setTextureType_ : *void = ---;
	setTextureView_atIndex_ : *void = ---;
	setTextureView_descriptor_atIndex_ : *void = ---;
	setTextureViewFromBuffer_descriptor_offset_bytesPerRow_atIndex_ : *void = ---;
	setTextures_withRange_ : *void = ---;
	setThreadGroupSizeIsMultipleOfThreadExecutionWidth_ : *void = ---;
	setThreadgroupMemoryLength_ : *void = ---;
	setThreadgroupMemoryLength_atIndex_ : *void = ---;
	setThreadgroupMemoryLength_offset_atIndex_ : *void = ---;
	setThreadgroupSizeMatchesTileSize_ : *void = ---;
	setTileAccelerationStructure_atBufferIndex_ : *void = ---;
	setTileAdditionalBinaryFunctions_ : *void = ---;
	setTileBuffer_offset_atIndex_ : *void = ---;
	setTileBufferOffset_atIndex_ : *void = ---;
	setTileBuffers_offsets_withRange_ : *void = ---;
	setTileBytes_length_atIndex_ : *void = ---;
	setTileFunction_ : *void = ---;
	setTileFunctionDescriptor_ : *void = ---;
	setTileHeight_ : *void = ---;
	setTileIntersectionFunctionTable_atBufferIndex_ : *void = ---;
	setTileIntersectionFunctionTables_withBufferRange_ : *void = ---;
	setTileSamplerState_atIndex_ : *void = ---;
	setTileSamplerState_lodMinClamp_lodMaxClamp_atIndex_ : *void = ---;
	setTileSamplerStates_lodMinClamps_lodMaxClamps_withRange_ : *void = ---;
	setTileSamplerStates_withRange_ : *void = ---;
	setTileTexture_atIndex_ : *void = ---;
	setTileTextures_withRange_ : *void = ---;
	setTileVisibleFunctionTable_atBufferIndex_ : *void = ---;
	setTileVisibleFunctionTables_withBufferRange_ : *void = ---;
	setTileWidth_ : *void = ---;
	setTransformationMatrixBuffer_ : *void = ---;
	setTransformationMatrixBufferOffset_ : *void = ---;
	setTransformationMatrixLayout_ : *void = ---;
	setTriangleCount_ : *void = ---;
	setTriangleFillMode_ : *void = ---;
	setType_ : *void = ---;
	setUrl_ : *void = ---;
	setUsage_ : *void = ---;
	setVertexAccelerationStructure_atBufferIndex_ : *void = ---;
	setVertexAdditionalBinaryFunctions_ : *void = ---;
	setVertexAmplificationCount_viewMappings_ : *void = ---;
	setVertexBuffer_ : *void = ---;
	setVertexBuffer_offset_atIndex_ : *void = ---;
	setVertexBuffer_offset_attributeStride_atIndex_ : *void = ---;
	setVertexBufferOffset_ : *void = ---;
	setVertexBufferOffset_atIndex_ : *void = ---;
	setVertexBufferOffset_attributeStride_atIndex_ : *void = ---;
	setVertexBuffers_ : *void = ---;
	setVertexBuffers_offsets_attributeStrides_withRange_ : *void = ---;
	setVertexBuffers_offsets_withRange_ : *void = ---;
	setVertexBytes_length_atIndex_ : *void = ---;
	setVertexBytes_length_attributeStride_atIndex_ : *void = ---;
	setVertexDescriptor_ : *void = ---;
	setVertexFormat_ : *void = ---;
	setVertexFunction_ : *void = ---;
	setVertexFunctionDescriptor_ : *void = ---;
	setVertexIntersectionFunctionTable_atBufferIndex_ : *void = ---;
	setVertexIntersectionFunctionTables_withBufferRange_ : *void = ---;
	setVertexLinkedFunctions_ : *void = ---;
	setVertexPreloadedLibraries_ : *void = ---;
	setVertexSamplerState_atIndex_ : *void = ---;
	setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_ : *void = ---;
	setVertexSamplerStates_lodMinClamps_lodMaxClamps_withRange_ : *void = ---;
	setVertexSamplerStates_withRange_ : *void = ---;
	setVertexStaticLinkingDescriptor_ : *void = ---;
	setVertexStride_ : *void = ---;
	setVertexTexture_atIndex_ : *void = ---;
	setVertexTextures_withRange_ : *void = ---;
	setVertexVisibleFunctionTable_atBufferIndex_ : *void = ---;
	setVertexVisibleFunctionTables_withBufferRange_ : *void = ---;
	setViewport_ : *void = ---;
	setViewports_count_ : *void = ---;
	setVisibilityResultBuffer_ : *void = ---;
	setVisibilityResultMode_offset_ : *void = ---;
	setVisibilityResultType_ : *void = ---;
	setVisibleFunctionTable_atBufferIndex_ : *void = ---;
	setVisibleFunctionTable_atIndex_ : *void = ---;
	setVisibleFunctionTables_withBufferRange_ : *void = ---;
	setVisibleFunctionTables_withRange_ : *void = ---;
	setWidth_ : *void = ---;
	setWriteMask_ : *void = ---;
	shaderReflection : *void = ---;
	shaderValidation : *void = ---;
	sharedCaptureManager : *void = ---;
	sharedListener : *void = ---;
	shouldMaximizeConcurrentCompilation : *void = ---;
	signalDrawable_ : *void = ---;
	signalEvent_value_ : *void = ---;
	signaledValue : *void = ---;
	size : *void = ---;
	sizeOfCounterHeapEntry_ : *void = ---;
	slice : *void = ---;
	sliceRange : *void = ---;
	source : *void = ---;
	sourceAlphaBlendFactor : *void = ---;
	sourceRGBBlendFactor : *void = ---;
	sparseBufferTier : *void = ---;
	sparsePageSize : *void = ---;
	sparseTextureTier : *void = ---;
	sparseTileSizeInBytes : *void = ---;
	sparseTileSizeInBytesForSparsePageSize_ : *void = ---;
	sparseTileSizeWithTextureType_pixelFormat_sampleCount_ : *void = ---;
	sparseTileSizeWithTextureType_pixelFormat_sampleCount_sparsePageSize_ : *void = ---;
	specializedName : *void = ---;
	stageInputAttributes : *void = ---;
	stageInputDescriptor : *void = ---;
	stageInputOutputDescriptor : *void = ---;
	stages : *void = ---;
	startCaptureWithCommandQueue_ : *void = ---;
	startCaptureWithDescriptor_error_ : *void = ---;
	startCaptureWithDevice_ : *void = ---;
	startCaptureWithScope_ : *void = ---;
	startOfEncoderSampleIndex : *void = ---;
	startOfFragmentSampleIndex : *void = ---;
	startOfVertexSampleIndex : *void = ---;
	staticLinkingDescriptor : *void = ---;
	staticThreadgroupMemoryLength : *void = ---;
	status : *void = ---;
	stencilAttachment : *void = ---;
	stencilAttachmentPixelFormat : *void = ---;
	stencilCompareFunction : *void = ---;
	stencilFailureOperation : *void = ---;
	stencilResolveFilter : *void = ---;
	stepFunction : *void = ---;
	stepRate : *void = ---;
	stopCapture : *void = ---;
	storageMode : *void = ---;
	storeAction : *void = ---;
	storeActionOptions : *void = ---;
	stride : *void = ---;
	strides : *void = ---;
	structType : *void = ---;
	supportAddingBinaryFunctions : *void = ---;
	supportAddingFragmentBinaryFunctions : *void = ---;
	supportAddingVertexBinaryFunctions : *void = ---;
	supportArgumentBuffers : *void = ---;
	supportAttributeStrides : *void = ---;
	supportBinaryLinking : *void = ---;
	supportColorAttachmentMapping : *void = ---;
	supportDynamicAttributeStride : *void = ---;
	supportFragmentBinaryLinking : *void = ---;
	supportIndirectCommandBuffers : *void = ---;
	supportMeshBinaryLinking : *void = ---;
	supportObjectBinaryLinking : *void = ---;
	supportRayTracing : *void = ---;
	supportVertexBinaryLinking : *void = ---;
	supports32BitFloatFiltering : *void = ---;
	supports32BitMSAA : *void = ---;
	supportsBCTextureCompression : *void = ---;
	supportsCounterSampling_ : *void = ---;
	supportsDestination_ : *void = ---;
	supportsDynamicLibraries : *void = ---;
	supportsFamily_ : *void = ---;
	supportsFeatureSet_ : *void = ---;
	supportsFunctionPointers : *void = ---;
	supportsFunctionPointersFromRender : *void = ---;
	supportsPrimitiveMotionBlur : *void = ---;
	supportsPullModelInterpolation : *void = ---;
	supportsQueryTextureLOD : *void = ---;
	supportsRasterizationRateMapWithLayerCount_ : *void = ---;
	supportsRaytracing : *void = ---;
	supportsRaytracingFromRender : *void = ---;
	supportsRenderDynamicLibraries : *void = ---;
	supportsShaderBarycentricCoordinates : *void = ---;
	supportsTextureSampleCount_ : *void = ---;
	supportsVertexAmplificationCount_ : *void = ---;
	swizzle : *void = ---;
	synchronizeResource_ : *void = ---;
	synchronizeTexture_slice_level_ : *void = ---;
	tAddressMode : *void = ---;
	tailSizeInBytes : *void = ---;
	tensorDataType : *void = ---;
	tensorReferenceType : *void = ---;
	tensorSizeAndAlignWithDescriptor_ : *void = ---;
	tessellationControlPointIndexType : *void = ---;
	tessellationFactorFormat : *void = ---;
	tessellationFactorStepFunction : *void = ---;
	tessellationOutputWindingOrder : *void = ---;
	tessellationPartitionMode : *void = ---;
	texture : *void = ---;
	texture2DDescriptorWithPixelFormat_width_height_mipmapped_ : *void = ---;
	textureBarrier : *void = ---;
	textureBufferDescriptorWithPixelFormat_width_resourceOptions_usage_ : *void = ---;
	textureCubeDescriptorWithPixelFormat_size_mipmapped_ : *void = ---;
	textureDataType : *void = ---;
	textureReferenceType : *void = ---;
	textureType : *void = ---;
	threadExecutionWidth : *void = ---;
	threadGroupSizeIsMultipleOfThreadExecutionWidth : *void = ---;
	threadgroupMemoryAlignment : *void = ---;
	threadgroupMemoryDataSize : *void = ---;
	threadgroupMemoryLength : *void = ---;
	threadgroupSizeMatchesTileSize : *void = ---;
	tileAdditionalBinaryFunctions : *void = ---;
	tileArguments : *void = ---;
	tileBindings : *void = ---;
	tileBuffers : *void = ---;
	tileFunction : *void = ---;
	tileFunctionDescriptor : *void = ---;
	tileHeight : *void = ---;
	tileLinkingDescriptor : *void = ---;
	tileWidth : *void = ---;
	transformationMatrixBuffer : *void = ---;
	transformationMatrixBufferOffset : *void = ---;
	transformationMatrixLayout : *void = ---;
	triangleCount : *void = ---;
	tryCancel : *void = ---;
	type : *void = ---;
	updateBufferMappings_heap_operations_count_ : *void = ---;
	updateFence_ : *void = ---;
	updateFence_afterEncoderStages_ : *void = ---;
	updateFence_afterStages_ : *void = ---;
	updateTextureMapping_mode_indirectBuffer_indirectBufferOffset_ : *void = ---;
	updateTextureMapping_mode_region_mipLevel_slice_ : *void = ---;
	updateTextureMappings_heap_operations_count_ : *void = ---;
	updateTextureMappings_mode_regions_mipLevels_slices_numRegions_ : *void = ---;
	url : *void = ---;
	usage : *void = ---;
	useHeap_ : *void = ---;
	useHeap_stages_ : *void = ---;
	useHeaps_count_ : *void = ---;
	useHeaps_count_stages_ : *void = ---;
	useResidencySet_ : *void = ---;
	useResidencySets_count_ : *void = ---;
	useResource_usage_ : *void = ---;
	useResource_usage_stages_ : *void = ---;
	useResources_count_usage_ : *void = ---;
	useResources_count_usage_stages_ : *void = ---;
	usedSize : *void = ---;
	vertexAdditionalBinaryFunctions : *void = ---;
	vertexArguments : *void = ---;
	vertexAttributes : *void = ---;
	vertexBindings : *void = ---;
	vertexBuffer : *void = ---;
	vertexBufferOffset : *void = ---;
	vertexBuffers : *void = ---;
	vertexDescriptor : *void = ---;
	vertexFormat : *void = ---;
	vertexFunction : *void = ---;
	vertexFunctionDescriptor : *void = ---;
	vertexLinkedFunctions : *void = ---;
	vertexLinkingDescriptor : *void = ---;
	vertexPreloadedLibraries : *void = ---;
	vertexStaticLinkingDescriptor : *void = ---;
	vertexStride : *void = ---;
	vertical : *void = ---;
	verticalSampleStorage : *void = ---;
	visibilityResultBuffer : *void = ---;
	visibilityResultType : *void = ---;
	visibleFunctionTableDescriptor : *void = ---;
	waitForDrawable_ : *void = ---;
	waitForEvent_value_ : *void = ---;
	waitForFence_ : *void = ---;
	waitForFence_beforeEncoderStages_ : *void = ---;
	waitForFence_beforeStages_ : *void = ---;
	waitUntilCompleted : *void = ---;
	waitUntilScheduled : *void = ---;
	waitUntilSignaledValue_timeoutMS_ : *void = ---;
	width : *void = ---;
	writeCompactedAccelerationStructureSize_toBuffer_ : *void = ---;
	writeCompactedAccelerationStructureSize_toBuffer_offset_ : *void = ---;
	writeCompactedAccelerationStructureSize_toBuffer_offset_sizeDataType_ : *void = ---;
	writeMask : *void = ---;
	writeTimestampIntoHeap_atIndex_ : *void = ---;
	writeTimestampWithGranularity_afterStage_intoHeap_atIndex_ : *void = ---;
	writeTimestampWithGranularity_intoHeap_atIndex_ : *void = ---;
	accessor : *void = ---;
	allowsNextDrawableTimeout : *void = ---;
	colorspace : *void = ---;
	displaySyncEnabled : *void = ---;
	drawableSize : *void = ---;
	framebufferOnly : *void = ---;
	layer : *void = ---;
	maximumDrawableCount : *void = ---;
	nextDrawable : *void = ---;
	residencySet : *void = ---;
	setAllowsNextDrawableTimeout_ : *void = ---;
	setColorspace_ : *void = ---;
	setDevice_ : *void = ---;
	setDisplaySyncEnabled_ : *void = ---;
	setDrawableSize_ : *void = ---;
	setFramebufferOnly_ : *void = ---;
	setMaximumDrawableCount_ : *void = ---;
}


#import "Objective_C";
#import "macos";

