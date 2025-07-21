/* Kingdom Core: WASM: bindings generator */

build_files := string.[
    "wasm3/source/m3_api_libc.c",
    "wasm3/source/extensions/m3_extensions.c",
    "wasm3/source/m3_api_meta_wasi.c",
    "wasm3/source/m3_api_tracer.c",
    "wasm3/source/m3_api_uvwasi.c",
    "wasm3/source/m3_api_wasi.c",
    "wasm3/source/m3_bind.c",
    "wasm3/source/m3_code.c",
    "wasm3/source/m3_compile.c",
    "wasm3/source/m3_core.c",
    "wasm3/source/m3_env.c",
    "wasm3/source/m3_exec.c",
    "wasm3/source/m3_function.c",
    "wasm3/source/m3_info.c",
    "wasm3/source/m3_module.c",
    "wasm3/source/m3_parse.c"	
];

build :: () {
    set_build_options_dc(.{do_output=false});

	options := get_build_options();
    extra: [..] string;

	array_add(*extra,
		"-Wall",
	    "-Wextra",
	    "-Wpedantic",
	    "-Wparentheses",
	    "-Wundef",
	    "-Wpointer-arith",
	    "-Wstrict-aliasing=2",
	    "-std=gnu11",
		"-Xclang",
		"-target-feature",
		"-Xclang",
		"+tail-call"
	);
	
    #if OS == .MACOS {
        macos_version_arg := tprint("-mmacosx-version-min=%.%", options.minimum_os_version.major, options.minimum_os_version.minor);
        array_add(*extra, macos_version_arg);
    }
    success := build_cpp_static_lib("m3", ..build_files, debug=true, extra = extra);
    if !success {
        compiler_set_workspace_status(.FAILED);
        return;
    }

    if !generate_bindings() {
        compiler_set_workspace_status(.FAILED);
        return;
    }

    w := compiler_create_workspace("wasm3");

    options.output_type     = .STATIC_LIBRARY;
    options.output_executable_name = "m3";
    set_build_options(options, w);
}

#run build();

#import "Basic";
#import "Bindings_Generator";
#import "BuildCpp";
#import "Compiler";
