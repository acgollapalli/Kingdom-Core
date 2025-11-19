/*                              Kingdom Core: WASM                           */

// @Note: We don't compile WAMR here. Hopefully we will at some point. 
// Or better yet, just write our own, but I already burned too much time trying
// so instead we'll just use the library.

generate_bindings :: () -> bool {
    output_filename: string;
    opts: Generate_Bindings_Options;
    {
        using opts;

        #if OS == .WINDOWS {
            output_filename          = "generated_windows.jai";
            strip_flags = 0;
	        array_add(*libpaths,       "wamr/lib/windows_amd");
	        array_add(*libnames,      "iwasm");
			footer = WINDOWS_FOOTER;
        } else #if OS == .LINUX {
            output_filename          = "generated_linux.jai";
            strip_flags = 0;
	        array_add(*libpaths,       "linux");
        } else #if OS == .MACOS {
            output_filename          = "generated_macos.jai";
            strip_flags = 0;
	        array_add(*libpaths,       "wamr/lib/darwin-aarch64");
	        array_add(*libnames,      "libiwasm");
			footer = MACOS_FOOTER;
        } else {
            assert(false);
        }

        // array_add(*libnames,      "msquic");
		// array_add(*include_paths, "msquic/src/inc");
        array_add(*source_files,  "wamr/include/lib_export.h", "wamr/include/wasm_export.h");
        array_add(*extra_clang_arguments, "-x", "c++", "-DWIN32_LEAN_AND_MEAN");
        // array_add(*extra_clang_arguments, "-x", "c++");
		//array_add(*strip_prefixes, "QUIC", "MsQuic");
		generate_library_declarations = false;
    }

    return generate_bindings(opts, output_filename);
}



main :: () {
	generate_bindings();
}

#run main();

MACOS_FOOTER :: #string END

libiwasm :: #library,no_dll "wamr/lib/darwin-aarch64/libiwasm";

END

#import "POSIX";
#import "Basic";
#import "Bindings_Generator";
#import "Compiler";
#import "String";
