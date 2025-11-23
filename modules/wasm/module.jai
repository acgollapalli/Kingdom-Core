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
