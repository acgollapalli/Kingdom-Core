init_draw_quad :: () {
    blend : BlendDescriptor;
    raster_descriptor := RasterDescriptor.{
        cull = .None,
        color_targets = .[
            { format = .BGRA8Unorm_sRGB }
        ],
        depth_format = depth_texture_format,
        stencil_format = stencil_texture_format,
        blend_descriptor = *blend
    };

    // shaders are compiled from slang source to slang's IR at compile time, and then 
    // compiled from slang's IR to native platform code at runtime.
    // I don't really know how much time this saves for shader compilation vs just compiling
    // from source on demand, given that most of the cost of shader compilation in games is due
    // to pipeline explosion, which really shouldn't be as much of an issue with this graphics
    // api
    #run build_shaders();

    vertex_shader := read_entire_file(tprint("%/%.slv", SHADER_DIRECTORY, QUAD_VERTEX_SHADER));
    pixel_shader := read_entire_file(tprint("%/%.slv", SHADER_DIRECTORY, QUAD_PIXEL_SHADER));

    pipeline = create_graphics_pipeline(xx vertex_shader, xx pixel_shader, raster_descriptor);

    depth := DepthStencilDescriptor.{
        depth_test = .Never, // always passes
        depth_mode = .None,
        //stencil_front.test = .Always, // always passes
        //stencil_back.test = .Always, // always passes
    };

    depth_state = create_depth_stencil_state(depth);

    vertex_buffer = gpu_alloc(size_of([4]Vertex2D));
    vertices := cast(*[4]Vertex2D, vertex_buffer.cpu);
    vertices.* = .[
        {{ 0.5,   0.5 }, { 1., 0., 0.}},
        {{ 0.5,  -0.5 }, { 0., 1., 0.}},
        {{ -0.5, -0.5 }, { 0., 0., 1.}},
        {{ -0.5, +0.5 }, { 1., 1., 1.}},
    ];

    vertex_data = gpu_alloc(size_of(VertexData));
    vertex_data_cpu := cast(*VertexData, vertex_data.cpu);
    vertex_data_cpu.* = .{
        vertices = vertex_buffer.gpu
    };

    pixel_buffer = gpu_alloc(size_of([4]PixelColor));
    pixel_colors := cast(*[4]PixelColor, pixel_buffer.cpu);
    pixel_colors.* = .[
        {{1., 0., 0.}},
        {{0., 1., 0.}},
        {{0., 0., 1.}},
        {{1., 1., 1.}},
    ];
    pixel_data = gpu_alloc(size_of(PixelData));
    pixel_data_cpu := cast(*PixelData, pixel_data.cpu);
    pixel_data_cpu.* = .{
        colors = pixel_buffer.gpu,
        use_vertex_out = true,
    };

    // Our draw calls take GPU pointers to support 
    index_buffer = gpu_alloc(size_of([INDEX_COUNT]u32));
    indices := cast(*[INDEX_COUNT]u32, index_buffer.cpu);
    indices.* = .[
        0, 3, 1,
        1, 3, 2,
    ];
}

draw_quad :: (command_buffer: CommandBuffer) -> bool {
    pixel_data_cpu := cast(*PixelData, pixel_data.cpu);
    if stage_time == seconds_to_apollo(0)  stage_time = current_time_monotonic();

    stage_s128 := (current_time_monotonic() - stage_time) / stage_length;
    stage : Stage;

    if stage_s128 ==  to_s128(Stage.VertexOut.(int)) stage = .VertexOut; // feels like this stage takes longer
    if stage_s128 ==  to_s128(Stage.Red.(int)) stage = .Red;
    if stage_s128 ==  to_s128(Stage.Green.(int)) stage = .Green;
    if stage_s128 ==  to_s128(Stage.Blue.(int)) stage = .Blue;
    if stage_s128 ==  to_s128(Stage.White.(int)) stage = .White;
    if stage_s128 > to_s128(Stage.White.(int)) return false;

    if stage != .VertexOut {
        pixel_data_cpu.* = .{
            colors = pixel_buffer.gpu,
            color_index = xx (stage -1),
            use_vertex_out = false,
        };
    };

    set_pipeline(command_buffer, pipeline);
    draw_indexed(command_buffer, vertex_data.gpu, pixel_data.gpu, index_buffer.gpu, INDEX_COUNT);

    return true;
}


#scope_file 

pipeline : Pipeline;
depth_state: DepthStencilState;
vertex_buffer, vertex_data, pixel_buffer, pixel_data, index_buffer: Allocation;
stage_time : Apollo_Time;
Stage :: enum {
    VertexOut;
    Red;
    Blue;
    Green;
    White;
}

stage_length :: #run seconds_to_apollo(1);

INDEX_COUNT :: 6;

// compile shaders to Slang IR here
// TODO: remove debug symbols from here and from make_metal_function
build_shaders :: () #compile_time {
    compile_to_slang_ir(tprint("%/%.slang", SHADER_DIRECTORY, QUAD_VERTEX_SHADER), SHADER_DIRECTORY, debug_symbols = true);
    compile_to_slang_ir(tprint("%/%.slang", SHADER_DIRECTORY, QUAD_PIXEL_SHADER), SHADER_DIRECTORY, debug_symbols = true);
}

Vertex2D :: struct {
    position: struct { x: float32; y: float32; } #align 8;
    color: struct { r: float32; g: float32; b: float32; } #align 16;
}

#if false {
    #run {
        print("\n\n=== debug run block ===\n\n");

        print("size of Vertex2D: %\n", size_of(Vertex2D));

        vertex2d_type := cast(*Type_Info_Struct, type_info(Vertex2D));
        for vertex2d_type.members  print("member name: %, offset: % bytes\n", it.name, it.offset_in_bytes);
        print("\n=== end debug run block ===\n\n");
    }
}
#assert(size_of(Vertex2D) == 32);

VertexData :: struct {
    // TODO: We should update the types on Allocation and host_pointer_from_device so 
    // that you can't accidentally pass a cpu pointer instead of a GPU pointer (because
    // that is the sort of careless mistake that I, and probably others, would make).
    vertices : *void; // GPU Pointer
}

PixelColor :: struct {
    color: struct { r: float32; g: float32; b: float32;} #align 16;
}
#assert(size_of(PixelColor) == 16);

PixelData :: struct {
    colors: *void;
    color_index: u32;
    use_vertex_out: bool;
}

#assert(size_of(bool) == 1);


SHADER_DIRECTORY :: "shaders";
QUAD_VERTEX_SHADER :: "draw_quad_vs";
QUAD_PIXEL_SHADER :: "draw_quad_ps";


