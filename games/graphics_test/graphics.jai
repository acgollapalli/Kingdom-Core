WINDOW_WIDTH :: 1280;
WINDOW_HEIGHT :: 720;

#if OS == .MACOS {
    TextureHandle :: *MTLTexture;
    TextureViewHandle :: *MTLTexture;
    CommandQueue :: *MTL4CommandQueue;

    RenderPass :: *MTLRenderPassDescriptor;
    ShaderIR :: *MTLFunction;
    RenderPipeline :: *MTLRenderPipelineState;

    CommandBuffer :: *CommandBuffer_;
    CommandBuffer_ :: struct {
        buffer : *MTL4CommandBuffer;
        allocator : *MTL4CommandAllocator;
        active_encoder : *MTL4CommandEncoder;
        active_encoder_kind: Encoder_Kind;
        active_pipeline: Pipeline;
        vertex_argument_table: *MTL4ArgumentTable;
        pixel_argument_table: *MTL4ArgumentTable;
        compute_argument_table: *MTL4ArgumentTable;
        frame_used: u64;
    }

    Semaphore :: *MTLSharedEvent;

    DepthStencilState_ :: struct {
        descriptor: DepthStencilDescriptor;
        state: *MTLDepthStencilState;
    }
    DepthStencilState :: *DepthStencilState_;

    Pipeline :: *Pipeline_;
}

// TODO: rename these from attachment to target
RenderPassDescriptor :: struct {
    color_targets : [] struct {
        texture: TextureHandle;
        load_op: LoadOp = .Load;
        store_op: StoreOp = .Store;
        clear_color: ClearColor = .{ 0.0, 0.0, 0.0, 0.0 };
    };
    depth_target : struct {
        texture: TextureHandle;
        load_op: LoadOp = .Clear;
        store_op: StoreOp = .Dont_Care;
        clear_value: float64 = 1.0;
    };
    stencil_target : struct {
        texture: TextureHandle;
        load_op: LoadOp = .Clear;
        store_op: StoreOp = .Dont_Care;
        clear_value: u32 = 0;
    };
}


ShaderSource :: string;

// enum OP { OP_NEVER, OP_LESS, OP_EQUAL, OP_LESS_EQUAL, OP_GREATER, OP_NOT_EQUAL, OP_GREATER_EQUAL, OP_ALWAYS };

Op :: enum u32 {
    Never :: 0;
    Less :: 1;
    Equal :: 2;
    Less_Equal :: 3;
    Greater :: 4;
    Not_Equal :: 5;
    Greater_Equal :: 6;
    Always :: 7;

    Keep :: 0;
    Zero :: 1;
    Replace :: 2;
    IncrementClamp :: 3;
    DecrementClamp :: 4;
    Invert :: 5;
    IncrementWrap :: 6;
    DecrementWrap :: 7;
}

LoadOp :: enum u32 {
    Dont_Care :: 0;
    Load :: 1;
    Clear :: 2;
}

StoreOp :: enum u32 {
    Dont_Care :: 0;
    Store :: 1;
    Multisample_Resolve :: 2;
    Store_And_Multisample_Resolve :: 3;
    Unknown :: 4;
    Custom_Sample_Depth_Store :: 5;
}

ClearColor :: struct {
    red: float64;
    green: float64;
    blue: float64;
    alpha: float64;
}

PipelineType :: enum u32 {
    Compute;
    Graphics;
    GraphicsMeshlet;
}

Pipeline_ :: union kind: PipelineType {
    compute: struct {};
    graphics: struct{
        descriptor: RasterDescriptor;
        pipeline: RenderPipeline;
    };
    graphics_meshlet: struct {};
}

Allocation :: struct {
    cpu: *void;
    gpu: *void;
    size: u64;
}

Memory :: enum u32 {
    Default;
    GPU;
    Readback;
}

// enum TOPOLOGY { TOPOLOGY_TRIANGLE_LIST, TOPOLOGY_TRIANGLE_STRIP, TOPOLOGY_TRIANGLE_FAN };
Topology :: enum u32 {
    None;
    Triangle;
    Line;
    Point;
    //Triangle_List;
    Triangle_Strip;
    //Triangle_Fan;
}

// enum CULL { CULL_CCW, CULL_CW, CULL_ALL, CULL_NONE };
Cull :: enum u32 {
    CCW;
    CW;
    All; // why is cull all a thing?
    None;
}

// enum FORMAT { FORMAT_NONE, FORMAT_RGBA8_UNORM, FORMAT_D32_FLOAT, FORMAT_RG11B10_FLOAT, FORMAT_RGB10_A2_UNORM, ... };
// TODO: check Vulkan bindings for pixel format values. Right now these are just straight up
// taken from the Metal bindings
Format :: enum u32 {
	None :: 0;
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
	Unspecificied :: 263;
}


//enum USAGE_FLAGS { USAGE_SAMPLED, USAGE_STORAGE, USAGE_COLOR_ATTACHMENT, USAGE_DEPTH_STENCIL_ATTACHMENT, ... };
UsageFlags :: enum_flags u32 {
    None :: 0x00;
    Sampled :: 0x01;
    Storage :: 0x02;
    ColorAttachment :: 0x04;
    DepthStencilAttachment :: 0x08;
}

// enum BLEND { BLEND_ADD, BLEND_SUBTRACT, BLEND_REV_SUBTRACT, BLEND_MIN, BLEND_MAX };
Blend :: enum u32 {
    Add :: 0;
    Subtract :: 1;
    Rev_Subtract :: 2;
    Min :: 3;
    Max :: 4;
}

// enum FACTOR { FACTOR_ZERO, FACTOR_ONE, FACTOR_SRC_COLOR, FACTOR_DST_COLOR, FACTOR_SRC_ALPHA, ... };
Factor :: enum u32 {
    Zero :: 0;
    One :: 1;
    Src_Color :: 2;
    Dst_Color :: 6;
    Src_Alpha :: 4;
    Dst_Alpha :: 8;
    // TODO: Actually get these to be the appropriate ones for metal and vulkan
}

// WARNING:: These are going to be different for each platform
// so don't pass these to platform functions directly. Instead,
// use the platform-specific conversion functions
WriteMask :: enum_flags u8 {
    None :: 0;
    R:: 1 << 3;
	G :: 1 << 2;
	B:: 1 << 1;
	A :: 1;
	All :: R | G | B | A;
}

ColorTarget :: struct {
    format : Format;
    write_mask := WriteMask.None;
}

BlendDescriptor :: struct {
    color_op := Blend.Add;
    src_color_factor := Factor.One;
    dst_color_factor := Factor.Zero;
    alpha_op := Blend.Add;
    src_alpha_factor := Factor.One;
    dst_alpha_factor := Factor.Zero;
    color_write_mask := WriteMask.None; // I think this is redundant
}

DepthFlags :: enum_flags u32 {
    None :: 0x00;
    Read :: 0x01;
    Write :: 0x02;
}

Stencil :: struct {
    test := Op.Always;
    fail_op := Op.Keep;
    pass_op := Op.Keep;
    depth_fail_op := Op.Keep;
    reference: u32; // no idea what this does
}

DepthStencilDescriptor :: struct {
    depth_mode: DepthFlags;
    depth_test := Op.Always;
    depth_bias : float32;
    depth_bias_slope_factor : float32;
    depth_bias_clamp : float32;
    stencil_read_mask: u32 = 0xff;
    stencil_write_mask: u32 = 0xff;
    stencil_front: Stencil;
    stencil_back: Stencil;
}


RasterDescriptor :: struct {
    topology: Topology = .Triangle;
    cull: Cull;
    alpha_to_coverage := false;
    support_dual_source_blending := false;
    sample_count: u8 = 1; // we may need to reorder this for alignment purposes
    depth_format: Format;
    stencil_format: Format;
    color_targets: []ColorTarget; // we may have to change this to our own array struct to cross the wasm barrier
    blend_descriptor: *BlendDescriptor; // nullable, so it's a pointer
}

TextureSizeAlign :: struct {
    size: u64;
    align: u64;
}

// NOTE: TextureHandle and TextureDescriptorHandle are platform dependent.
// This is because we're basicaly implementing this on top of metal and vulkan
// so unfortunately, this is how it has to be.
//TextureDescriptorHandle :: struct 

Texture ::enum u32 { 
    Texture_1D :: 0; 
    Texture_2D :: 1; 
    Texture_3D :: 2; 
    Texture_Cube :: 3; 
    Texture_2D_Array :: 4; 
    Texture_Cube_Array :: 5;
}

TextureDescriptor :: struct { 
    type := Texture.Texture_2D;
    dimensions : struct {
        width: u32;
        height: u32;
        depth: u32;
    };
    mipCount : u32 = 1;
    layerCount : u32 = 1;
    sampleCount : u32 = 1;
    format := Format.None; 
    usage := UsageFlags.None;
};
#assert(size_of(TextureDescriptor) == 36);


