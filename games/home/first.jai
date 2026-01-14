/* Kingdom Core: Home */

build_bundle :: () {
	/* borrowed from the wasm64 example (thanks Jon, Raphael, etc.)*/
    set_build_options_dc(.{do_output = false});

    w := compiler_create_workspace("Wasm");

    options := get_build_options(w);
    copy_commonly_propagated_fields(get_build_options(), *options);

    options.output_type                         = .EXECUTABLE;
    options.backend                             = .LLVM; // WASM only works with the LLVM backend, obviously.
    options.os_target                           = .WASM;
    options.cpu_target                          = .CUSTOM;
    options.emit_debug_info                     = .DWARF;
    options.backtrace_on_crash                  = .OFF; // Runtime_Support_Crash_Handler doesn’t support WASM (yet?)
    options.output_path                         = "public/";
    options.output_executable_name              = "game";
    options.llvm_options.target_system_features = "+bulk-memory"; // "This options is needed so that "memcpy" and "memset" are mapped to "memory.copy" and "memory.fill" instructions in WASM.
    options.llvm_options.enable_split_modules   = false;
    options.llvm_options.function_sections      = true; // To get around "LLVM ERROR: section already has a defining function: .text"

    import_paths: [..]string;
	array_add(*import_paths, "../../modules");
	
    // Add our own modules folder first so that we can override modules with our own version, if necessary.
    array_add(*import_paths, tprint("%modules", #filepath));
    for options.import_path array_add(*import_paths, it);
    options.import_path = import_paths;

    // This was compiled from https://github.com/wingo/walloc via "clang -Oz --target=wasm64 -nostdlib -c -o walloc.o walloc.c".
    // We should probably port this allocator to Jai instead…
    //  -rluba, 2023-11-15
    walloc_object_file_path := "../../assets/binaries/walloc.o"; // @Incomplete: this belongs more properly to the walloc module and also makes it annoying to build things individually

    STACK_SIZE :: 24 * 1024;
    options.additional_linker_arguments = .["--stack-first", "-z", tprint("stack-size=%", STACK_SIZE), walloc_object_file_path];
//options.additional_linker_arguments = .["--stack-first", "-z", tprint("stack-size=%", STACK_SIZE)];

    set_build_options(options, w);

    // Replace the default allocator with Walloc (https://github.com/wingo/walloc).
    remap_import(w, "*", "Default_Allocator", "Walloc");

    compiler_begin_intercept(w);

    add_build_file("main.jai", w);

    while true {
        message := compiler_wait_for_message();
        if message.kind == {
            case .TYPECHECKED;
                typechecked := cast(*Message_Typechecked) message;
                for body: typechecked.procedure_bodies {
                    header := body.expression.header;
                    // You could replace individual procedure bodies here, if you needed to.
                }

            case .COMPLETE;
                break;
        }
    }

    compiler_end_intercept(w);
}

build_server :: () {
    set_build_options_dc(.{do_output = false});
	
    w := compiler_create_workspace("Server");
	
    options := get_build_options(w);
    copy_commonly_propagated_fields(get_build_options(), *options);

    options.output_type                         = .EXECUTABLE;
    options.backend                             = .LLVM; // WASM only works with the LLVM backend, obviously.
    options.output_path                         = "public/";
    options.output_executable_name              = "server";

    import_paths: [..]string;
	array_add(*import_paths, "../../modules");
	
    // Add our own modules folder first so that we can override modules with our own version, if necessary.
    array_add(*import_paths, tprint("%modules", #filepath));
    for options.import_path array_add(*import_paths, it);
    options.import_path = import_paths;

	set_build_options(options, w);

	compiler_begin_intercept(w);

	add_build_file("server.jai", w);

	while true {
		message := compiler_wait_for_message();
        if message.kind == {

			case .COMPLETE;
				break;
		}
	}

	compiler_end_intercept(w);
}

build_all :: () {
	build_bundle();
	build_server();
}

#run build_all();


#import "Basic";
#import "Compiler";
