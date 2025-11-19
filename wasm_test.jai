/* just a quick test to see if we can get a wasm file to run */

POOL_SIZE :: 512 * 1024 *12;

main :: () {
    //wasm_bin := read_entire_file("games/home/public/game.wasm");
    wasm_bin := read_entire_file("games/home/public/game.wasm");
    print("loaded game. size: %\n", wasm_bin.count);
    
    stack_size :: 8092;
    heap_size :: 8092 *12;
    
    //wasm_error := NewArray(128, u8);
    wasm_error : [128] u8;
    
    exported_symbols : [..] NativeSymbol;
    default_symbols := NativeSymbol.[
                                    .{ "memcmp", xx wasm_memcmp, "(III)i", null },
                                            .{ "wasm_write_string", xx wasm_write_string, "(IIi)", null},
                                     .{ "wasm_debug_break", xx wasm_debug_break, "()", null },
                                    ];
    for default_symbols  array_add(*exported_symbols, it);
        
    
    
    pool := alloc(POOL_SIZE);
    
    init_args := RuntimeInitArgs.{
        mem_alloc_type = .Pool,
        mem_alloc_option.pool = .{
            heap_buf = pool,
            heap_size = POOL_SIZE,
        },
        
        native_module_name = "env",
        native_symbols = exported_symbols.data,
        n_native_symbols = xx exported_symbols.count,
    };
    
    runtime_initialized := wasm_runtime_full_init(*init_args);
    print("Initialized WASM runtime: %\n", runtime_initialized);
    
    module := wasm_runtime_load(wasm_bin.data, xx wasm_bin.count, wasm_error.data, xx wasm_error.count); 
    print("Loaded test game: %\n", module.(bool));
    if !module  print("Error: %\n", wasm_error.(string));
    
    module_inst := wasm_runtime_instantiate(module, stack_size, heap_size, wasm_error.data, xx wasm_error.count);
    print("Initialized module: %\n", module_inst.(bool));
    if !module_inst  print("Error: %\n", wasm_error.(string));
    
    exec_env := wasm_runtime_create_exec_env(module_inst, stack_size);
    
    start_fn := wasm_runtime_lookup_function(module_inst, "main");
    if !start_fn  {
        print("start function not found!\n");
        return;
    }
    
    argv : [3] u32;
    print("executing wasm\n");
    result := wasm_runtime_call_wasm(exec_env, start_fn, 3, argv.data);
    print("executed wasm: %\n", result);
    
}

// functions to provide
wasm_write_string :: (env: wasm_exec_env_t, count: s64, data: s64, to_standard_error: s32) #c_call {
    module_inst := wasm_runtime_get_module_inst(env);
    if !wasm_runtime_validate_app_addr(module_inst, xx data, xx count)  return;
    
    s : string;
    
    s.count = count;
    s.data = xx wasm_runtime_addr_app_to_native(module_inst, xx data);
    write_string_unsynchronized(s, xx to_standard_error);
} // @TODO: write macro to generate the NativeSymbol for this automatically

wasm_debug_break :: (env: wasm_exec_env_t) #c_call {
    debug_break(); // @Incomplete: we should probably make use of WAMR's debugging facilities here.
}

wasm_memcmp :: (env: wasm_exec_env_t, dest: s64, source: s64, count: s64) -> s32 {
    
    module_inst := wasm_runtime_get_module_inst(env);
    if (!wasm_runtime_validate_app_addr(module_inst, xx dest, xx count)) return -1;
	if (!wasm_runtime_validate_app_addr(module_inst, xx source, xx count)) return -1;
    
    // do address conversion
    dest_native := wasm_runtime_addr_app_to_native(module_inst, xx dest);
    source_native := wasm_runtime_addr_app_to_native(module_inst, xx source);
    //return xx memcmp(dest, source, count);
    return 12;
} // @Incomplete: the actual memcmp api is expecing an s16. This is a problem for us because signedness will get messed up from the cast.

#import "wasm";

#import "Basic";
#import "File";