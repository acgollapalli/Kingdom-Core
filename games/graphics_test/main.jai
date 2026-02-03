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

    // initialize examples;
    init_draw_quad();

    semaphore = create_semaphore();

    create_depth_stencil_textures();

    command_queue = get_command_queue();
    clear_color = .{0, 0, 0, 1};

    quit := false;
    last_frame := current_time_monotonic();
    start_time := current_time_monotonic();

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

            next_demo := true;
            next_demo = draw_quad(command_buffer);

            quit = !next_demo;
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

#load "platform.jai";
#load "01_draw_a_quad.jai";

#import "shader_compiler";

#import "Input";
#import "Basic";
#import "Math";
#import "File";
