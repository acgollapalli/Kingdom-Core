/* main */


clear_color : ClearColor;
command_queue : CommandQueue;
semaphore : Semaphore;
app_level_frame_counter : u64;

DEBUG_PIPELINES :: true;
FRAMES_IN_FLIGHT :: 3;

depth_stencil_texture :: struct {
    depth_texture : TextureHandle;
    stencil_texture : TextureHandle;
}

depth_stencil_textures : [FRAMES_IN_FLIGHT] depth_stencil_texture;

depth_texture_format :: Format.Depth32Float;
stencil_texture_format :: Format.Stencil8;

create_depth_stencil_textures :: () {
    for depth_stencil_textures {
        // HACK: create a fucking depth texture and stencil texture so we can actually see our fucking quads
        {
            depth_texture_descriptor := texture2DDescriptor(xx objc_getClass("MTLTextureDescriptor"), .Depth32Float, WINDOW_WIDTH, WINDOW_HEIGHT, xx false);
            autorelease(depth_texture_descriptor);
            setUsage(depth_texture_descriptor, .ShaderWrite | .RenderTarget);

            depth_stencil_textures[it_index].depth_texture = xx newTexture(the_device, depth_texture_descriptor);

            stencil_texture_descriptor := texture2DDescriptor(xx objc_getClass("MTLTextureDescriptor"), .Stencil8, WINDOW_WIDTH, WINDOW_HEIGHT, xx false);
            autorelease(stencil_texture_descriptor);
            setUsage(stencil_texture_descriptor, .ShaderWrite | .RenderTarget);

            depth_stencil_textures[it_index].stencil_texture = xx newTexture(the_device, stencil_texture_descriptor);
        }

    }


}

main :: () {
    init_app("Graphics Test");
    init();

    semaphore = create_semaphore();

    create_depth_stencil_textures();

    command_queue = get_command_queue();
    clear_color = .{0, 0, 0, 1};

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

    pipeline := create_graphics_pipeline(xx vertex_shader, xx pixel_shader, raster_descriptor);
    defer free_pipeline(pipeline);

    vertex_buffer := gpu_alloc(size_of([4]Vertex2D));
    vertices := cast(*[4]Vertex2D, vertex_buffer.cpu);
    vertices.* = .[
        {{ 0.5,   0.5 }, { 1., 0., 0.}},
        {{ 0.5,  -0.5 }, { 0., 1., 0.}},
        {{ -0.5, -0.5 }, { 0., 0., 1.}},
        {{ -0.5, +0.5 }, { 1., 1., 1.}},
    ];

    depth := DepthStencilDescriptor.{
        depth_test = .Never, // always passes
        depth_mode = .None,
        //stencil_front.test = .Always, // always passes
        //stencil_back.test = .Always, // always passes
    };

    depth_state := create_depth_stencil_state(depth);
    defer free_depth_stencil_state(depth_state);

    vertex_data := gpu_alloc(size_of(VertexData));
    vertex_data_cpu := cast(*VertexData, vertex_data.cpu);
    vertex_data_cpu.* = .{
        vertices = vertex_buffer.gpu
    };

    pixel_buffer := gpu_alloc(size_of([4]PixelColor));
    pixel_colors := cast(*[4]PixelColor, pixel_buffer.cpu);
    pixel_colors.* = .[
        {{1., 0., 0.}},
        {{0., 1., 0.}},
        {{0., 0., 1.}},
        {{1., 1., 1.}},
    ];
    pixel_data := gpu_alloc(size_of(PixelData));
    pixel_data_cpu := cast(*PixelData, pixel_data.cpu);
    pixel_data_cpu.* = .{
        colors = pixel_buffer.gpu
    };

    // Our draw calls take GPU pointers to support 
    index_buffer := gpu_alloc(size_of([6]u32));
    indices := cast(*[6]u32, index_buffer.cpu);
    indices.* = .[
        0, 3, 1,
        1, 3, 2,
    ];

    quit := false;
    last_frame := current_time_monotonic();

    swapchain_index := 0;

    while !quit {
        if frame_counter > FRAMES_IN_FLIGHT  wait_semaphore(semaphore, frame_counter - FRAMES_IN_FLIGHT);

        frame_time := current_time_monotonic();
        if to_milliseconds(frame_time - last_frame) < 3 continue;
        
        defer {
            last_frame = frame_time;
            frame_counter += 1;
            swapchain_index = xx frame_counter % FRAMES_IN_FLIGHT;
        }

        swapchain_image := get_next_swapchain_image(); 
        if !swapchain_image continue;
        assert(swapchain_image != null);

        reset_temporary_storage();

        update_window_events();

        for events_this_frame {
            if it.type == .QUIT then quit = true;
        }
        quit = handle_input();


        swapchain_texture := get_swapchain_texture(swapchain_image);
        depth_texture := depth_stencil_textures[swapchain_index].depth_texture;
        stencil_texture := depth_stencil_textures[swapchain_index].stencil_texture;

        // clear_color.red = ifx clear_color.red > 1.0 then cast(float64)0.0 else clear_color.red + 0.01;

        render_pass_desc := RenderPassDescriptor.{
           color_targets = .[{ 
               texture = swapchain_texture, 
               load_op = .Clear, 
               store_op = .Store, 
               clear_color = clear_color 
           }],
           depth_target.texture = depth_texture,
           stencil_target.texture = stencil_texture,
        };


        command_buffer := start_command_recording(command_queue);
        {
            begin_render_pass(command_buffer, render_pass_desc);
            defer end_render_pass(command_buffer);

            set_pipeline(command_buffer, pipeline);
            //set_depth_stencil_state(command_buffer, depth_state);

            draw_indexed(command_buffer, vertex_data.gpu, pixel_data.gpu, index_buffer.gpu, indices.count);
            //setAddress(command_buffer.vertex_argument_table, xx vertex_buffer.gpu, 0);
            //drawPrimitives(xx command_buffer.active_encoder, MTLPrimitiveTypeTriangle, 0, 3); 
        }
        submit(command_queue, command_buffer, semaphore = semaphore, semaphore_value = frame_counter);
        present_swapchain_image(command_queue, swapchain_image);
    }

}

handle_input :: () -> should_quit: bool {
    should_quit := false;
    for events_this_frame {
            if it.type == .KEYBOARD {
                if it.key_pressed == 0 continue;

                if it.key_code == .ESCAPE {
                    should_quit = true;
                }
            }
    }
    return should_quit;
}


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
}


SHADER_DIRECTORY :: "shaders";
QUAD_VERTEX_SHADER :: "draw_quad_vs";
QUAD_PIXEL_SHADER :: "draw_quad_ps";

#load "platform.jai";

#import "shader_compiler";


#import "Input";
#import "Basic";
#import "Math";
#import "File";
