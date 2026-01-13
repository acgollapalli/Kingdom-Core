
#if OS == .MACOS {
    TextureHandle :: *MTLTexture;
    CommandQueue :: *MTLCommandQueue;
    CommandBuffer :: *MTLCommandBuffer;
    RenderPass :: *MTLRenderPassDescriptor;
    Shader :: *MTLFunction;
    RenderPipeline :: *MTLRenderPipelineState;
    _DepthStencilState :: *MTLDepthStencilState;
}

RenderPassDescriptor :: struct {
    color_attachments : [] struct {
        texture: TextureHandle;
        load_op: LoadOp = .Load;
        store_op: StoreOp = .Store;
        clear_color: ClearColor = .{ 0.0, 0.0, 0.0, 0.0 };
    };
    depth_attachment : void;
    stencil_attachment : void;
}

// enum OP { OP_NEVER, OP_LESS, OP_EQUAL, OP_LESS_EQUAL, OP_GREATER, OP_NOT_EQUAL, OP_GREATER_EQUAL, OP_ALWAYS };

Op :: enum {
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

LoadOp :: enum {
    Dont_Care :: 0;
    Load :: 1;
    Clear :: 2;
}

StoreOp :: enum {
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

PipelineType :: enum int {
    Compute;
    Graphics;
    GraphicsMeshlet;
}

Pipeline :: union kind: PipelineType {
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
}

Memory :: enum int {
    Default;
    GPU;
    Readback;
}

// enum TOPOLOGY { TOPOLOGY_TRIANGLE_LIST, TOPOLOGY_TRIANGLE_STRIP, TOPOLOGY_TRIANGLE_FAN };
Topology :: enum int {
    None;
    Triangle;
    Line;
    Point;
    //Triangle_List;
    Triangle_Strip;
    //Triangle_Fan;
}

// enum CULL { CULL_CCW, CULL_CW, CULL_ALL, CULL_NONE };
Cull :: enum int {
    CCW;
    CW;
    All; // why is cull all a thing?
    None;
}

// enum FORMAT { FORMAT_NONE, FORMAT_RGBA8_UNORM, FORMAT_D32_FLOAT, FORMAT_RG11B10_FLOAT, FORMAT_RGB10_A2_UNORM, ... };
Format :: enum int {
    None;
    A8_Unorm :: 1;
    R8_Unorm :: 10;
    R8_Unorm_sRGB :: 11;
    R8_Snorm :: 12;
    R8_Uint :: 13;
    R8_Sint :: 14;
    R16_Unorm :: 20;
    R16_Snorm :: 22;
    R16_Uint :: 23;
    R16_Sint :: 24;
    R16_Float :: 25;
    RG8_Unorm :: 30;
    RG8_Unorm_sRGB :: 31;
    RG8_Snorm :: 32;
    RG8_Uint :: 33;
    RG8_Sint :: 34;
    B5G6R5_Unorm :: 40;
    A1BGR5_Unorm :: 41;
    ABGR4_Unorm :: 42;
    BGR5A1_Unorm :: 43;
    R32_Uint :: 53;
    R32_Sint :: 54;
    R32_Float :: 55;
    RG16_Unorm :: 60;
    RG16_Snorm :: 62;
    RG16_Uint :: 63;
    RG16_Sint :: 64;
    RG16_Float :: 65;
    RGBA8_Unorm :: 70;
    RGBA8_Unorm_sRGB :: 71;
    RGBA8_Snorm :: 72;
    RGBA8_Uint :: 73;
    RGBA8_Sint :: 74;
    BGRA8_Unorm :: 80;
    BGRA8_Unorm_sRGB :: 81;
    RGB10A2_Unorm :: 90;
    RGB10A2_Uint :: 91;
    RG11B10_Float :: 92;
    RGB9E5_Float :: 93;
    BGR10A2_Unorm :: 94;
    BGR10_XR :: 554;
    BGR10_XR_sRGB :: 555;
    RG32_Uint :: 103;
    RG32_Sint :: 104;
    RG32_Float :: 105;
    RGBA16_Unorm :: 110;
    RGBA16_Snorm :: 112;
    RGBA16_Uint :: 113;
    RGBA16_Sint :: 114;
    RGBA16_Float :: 115;
    BGRA10_XR :: 552;
    BGRA10_XR_sRGB :: 553;
    RGBA32_Uint :: 123;
    RGBA32_Sint :: 124;
    RGBA32_Float :: 125;
    BC1_RGBA :: 130;
    BC1_RGBA_sRGB :: 131;
    BC2_RGBA :: 132;
    BC2_RGBA_sRGB :: 133;
    BC3_RGBA :: 134;
    BC3_RGBA_sRGB :: 135;
    BC4_R_Unorm :: 140;
    BC4_R_Snorm :: 141;
    BC5_RG_Unorm :: 142;
    BC5_RG_Snorm :: 143;
    BC6H_RGB_Float :: 150;
    BC6H_RGBUfloat :: 151;
    BC7_RGBA_Unorm :: 152;
    BC7_RGBA_Unorm_sRGB :: 153;
    PVRTC_RGB_2BPP :: 160;
    PVRTC_RGB_2BPP_sRGB :: 161;
    PVRTC_RGB_4BPP :: 162;
    PVRTC_RGB_4BPP_sRGB :: 163;
    PVRTC_RGBA_2BPP :: 164;
    PVRTC_RGBA_2BPP_sRGB :: 165;
    PVRTC_RGBA_4BPP :: 166;
    PVRTC_RGBA_4BPP_sRGB :: 167;
    EAC_R11_Unorm :: 170;
    EAC_R11_Snorm :: 172;
    EAC_RG11_Unorm :: 174;
    EAC_RG11_Snorm :: 176;
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
    GBGR422 :: 240;
    BGRG422 :: 241;
    Depth16_Unorm :: 250;
    Depth32_Float :: 252;
    Stencil8 :: 253;
    Depth24_Unorm_Stencil8 :: 255;
    Depth32_Float_Stencil8 :: 260;
    X32_Stencil8 :: 261;
    X24_Stencil8 :: 262;
}

// enum BLEND { BLEND_ADD, BLEND_SUBTRACT, BLEND_REV_SUBTRACT, BLEND_MIN, BLEND_MAX };
Blend :: enum u8 {
    Add;
    Subtract;
    Rev_Subtract;
    Min;
    Max;
}

// enum FACTOR { FACTOR_ZERO, FACTOR_ONE, FACTOR_SRC_COLOR, FACTOR_DST_COLOR, FACTOR_SRC_ALPHA, ... };
Factor :: enum int {
    Zero;
    One;
    Src_Color;
    Dst_Color;
    Src_Alpha;
    // TODO: Actually get these to be the appropriate ones for metal and vulkan
}

ColorTarget :: struct {
    format: Format;
    write_mask: u8;
}

BlendDescriptor :: struct {
    color_op: Blend;
    src_color_factor: Factor;
    dst_color_factor: Factor;
    alpha_op: Blend;
    src_alpha_factor: Factor;
    dst_alpha_factor: Factor;
    // color_write_mask: u8; // I think this is redundant
}

DepthFlags :: enum_flags u8 {
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

DepthStencilState :: struct {
    descriptor: DepthStencilDescriptor;
    state: _DepthStencilState;
}

RasterDescriptor :: struct {
    topology: Topology;
    cull: Cull;
    alpha_to_coverage := false;
    support_dual_source_blending := false;
    sample_count: u8 = 1; // we may need to reorder this for alignment purposes
    depth_format: Format;
    stencil_format: Format;
    color_targets: []ColorTarget; // we may have to change this to our own array struct to cross the wasm barrier
    blend_descriptor: *BlendDescriptor; // nullable, so it's a pointer
}
