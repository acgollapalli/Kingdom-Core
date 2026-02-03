/* platform layer for non wasm platforms 

	api layer is designed to be readily translatable to go over wasm.
*/

init_app :: (title: string) -> Window_Type {
    the_window = create_window(WINDOW_WIDTH, WINDOW_HEIGHT, title);
    init_graphics(); // TODO: rename this, it inits the graphics layer
    return the_window;
}


#if OS == .MACOS {
    #load "macos.jai";
}



#scope_module
the_window: Window_Type;

USE_APPLE_HEAP_ALLOCATION :: true;
__USE_MTL4_COMPILER :: #exists(GFX_USE_MTL4_COMPILER);

#scope_file

#import "Window_Creation";
#import "Sound_Player";
#import "Gamepad";
    

