/*                                  Kingdom Core: WASM                      */

// @TODO: I don't think this has a lot of platform specific code
// so we could probably just use a single generated bindings file
#if OS == .WINDOWS {
#load "generated_macos.jai";
} else #if OS == .LINUX {
#load "generated_linux.jai";
} else #if OS == .MACOS {
#load "generated_macos.jai";
} else {
    assert(false);
}