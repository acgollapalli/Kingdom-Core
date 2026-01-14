/* platform layer for non wasm platforms 

	api layer is designed to be readily translatable to go over wasm.
*/

init_app :: (title: string) -> Window_Type {
    the_window = create_window(WINDOW_WIDTH, WINDOW_HEIGHT, title);
    return the_window;
}

#if OS == .MACOS {
    #load "macos.jai";
}


#scope_module
the_window: Window_Type;

#scope_file

#import "Window_Creation";
#import "Sound_Player";
#import "Gamepad";
    
WINDOW_WIDTH :: 1280;
WINDOW_HEIGHT :: 720;
