main :: () {
    the_window = create_window(WINDOW_WIDTH, WINDOW_HEIGHT, "window_test");
    held_keys: String_Builder;
    text_edit: [..] u8;

    window_width:  s32 = WINDOW_WIDTH;
    window_height: s32 = WINDOW_HEIGHT;

    quit := false;
    while !quit {
        Input.update_window_events();

        for Input.events_this_frame {
            if it.type == .QUIT then quit = true;

            if it.type == {
                case .KEYBOARD;
                    if it.key_pressed && it.key_code == .BACKSPACE {
                        // @FixMe this works fine for English characters since most of that character set
                        // is one-byte in UTF8, but will not work correctly for many other language characters.
                        if text_edit.count then pop(*text_edit);
                    }
                case .TEXT_INPUT;
                    value := it.utf32;

                    str := character_utf32_to_utf8(value);
                    for 0..str.count-1 {
                        array_add(*text_edit, str[it]);
                    }
                    free(str);
                case .WINDOW; // @Incomplete: Event_Type.WINDOW events are not generated yet on any of the platforms.
                case .MOUSE_WHEEL;
            }
        }

        resizes := Input.get_window_resizes();  // We might want to collapse all resizes down to 1 for each window, but we don't currently do this, I think.
        for record: resizes {

            if record.window == the_window {
                window_width = record.width;
                window_height = record.height;
            }
        }

        for Input.input_button_states {
            if it & .DOWN {
                if it_index >= 0x20 && it_index < 0x7F {
                    value: u8 = cast(u8) it_index;
                    str: string;
                    str.data = *value;
                    str.count = 1;
                    append(*held_keys, str);
                } else {
                    print_to_builder(*held_keys, "% ", cast(Input.Key_Code) it_index);
                }
            }
        }

        held_keys_text := builder_to_string(*held_keys);
        defer free(held_keys_text);
   }
}


#scope_module

#import "Basic";
#import "Math";
#import "Window_Creation";
#import "String";
#import "System";

Input   :: #import "Input";
Unicode :: #import "Unicode";
System  :: #import "System";

character_utf32_to_utf8 :: Unicode.character_utf32_to_utf8;


WINDOW_WIDTH  :: 1280;
WINDOW_HEIGHT :: 720;
FONT_HEIGHT :: 32;
fps_time := 0.0;
last_time: float64;
elapsed_time: float64;
TICK_PERIOD : float64 : 1.0/60.0; // time between game updates
dt: float;
the_window: Window_Type;



// To build for android: jai input_test.jai +Android/Toolchain -ext ttf [-x64]
//
// Mouse events will work with the android_generate_mouse_clicks_for_touch_events simulation. Also, keyboard
// and mouse events will work if physical devices are attached. A specific touch_test.jai example would be beneficial!
