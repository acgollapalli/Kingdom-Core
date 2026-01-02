
#if OS == .MACOS {
    TextureHandle :: *MTLTexture;
    CommandQueue :: *MTLCommandQueue;
}


GPURenderPassDescriptor :: struct {
    color_attachments : [] struct {
        texture: TextureHandle;
        load_op: GPULoadOp = .Load;
        store_op: GPUStoreOp = .Store;
        clear_color: GPUClearColor = .{ 0.0, 0.0, 0.0, 0.0 };
    };
    depth_attachment : void;
    stencil_attachment : void;
}

GPULoadOp :: enum {
    Dont_Care :: 0;
    Load :: 1;
    Clear :: 2;
}

GPUStoreOp :: enum {
    Dont_Care :: 0;
    Store :: 1;
    Multisample_Resolve :: 2;
    Store_And_Multisample_Resolve :: 3;
    Unknown :: 4;
    Custom_Sample_Depth_Store :: 5;
}

GPUClearColor :: struct {
    red: float64;
    green: float64;
    blue: float64;
    alpha: float64;
}

GPUPipelineType :: enum int {
    Compute;
    Graphics;
    GraphicsMeshlet;
}

GPUPipeline :: union kind: GPUPipelineType {
    compute: struct {};
    graphics: struct{};
    graphics_meshlet: struct {};
}
    
