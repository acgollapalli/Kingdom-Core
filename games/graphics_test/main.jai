/* main */


clear_color : GPUClearColor;
command_queue : CommandQueue;

main :: () {
    init_app("Graphics Test");
    gpu_init();
    
    command_queue = gpu_get_command_queue();
    clear_color = .{0, 0, 0, 1};
    
    quit := false;
    while !quit {
        update_window_events();

        for events_this_frame {
            if it.type == .QUIT then quit = true;

        }

        quit = on_frame();
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

render_frame :: () {
    clear_color.red = ifx clear_color.red > 1.0 then cast(float64)0.0 else clear_color.red + 0.01;

    swapchain_image := gpu_get_next_swapchain_image();
    swapchain_texture := gpu_get_swapchain_texture(swapchain_image);

    render_pass_desc := GPURenderPassDescriptor.{
       color_attachments = .[{ texture = swapchain_texture, load_op = .Clear, clear_color = clear_color }]
    };

    command_buffer := gpu_get_command_buffer(command_queue);

    gpu_begin_render_pass(command_buffer, render_pass_desc);
    gpu_end_render_pass(command_buffer);
    gpu_present_swapchain_image(command_buffer, swapchain_image);
    gpu_submit_command_buffers(command_queue, command_buffer);
    
}

on_frame :: () -> should_quit: bool {
    should_quit := handle_input();
    render_frame();
   
    return should_quit;
}




#load "platform.jai";


#import "Input";
#import "Basic";
