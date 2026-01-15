/* originally written by roeyb1 as part of his sgpu library (which sort of inspired me to try this in metal) */

#scope_export

compile_shader :: (shader_path: string, output_directory: string = "", debug_symbols: bool = false) -> bool, [] u8 {
    if !global_session then create_global_session();

    auto_release_temp();

    filename := shader_path;
    source_dir := path_strip_filename(shader_path);

    options := get_platform_options(debug_symbols);
    target_desc := get_platform_target_description(options);
    session := get_session(options, target_desc, .[ source_dir ]);
    if !session  return false .{};
    defer slang.ISlangUnknown_release(session);

    diagnostic_blob: *slang.IBlob;
    slang_module := slang.ISession_loadModule(session, temp_c_string(shader_path), *diagnostic_blob);
    if diagnostic_blob then log_diagnostic_blob(diagnostic_blob);
    if !slang_module then return false, .{};

    entry_points: [..] *slang.IEntryPoint;
    entry_points.allocator = temp;
    {
        main := array_add(*entry_points);
        slang.IModule_findEntryPointByName(slang_module, "main", main);
    }

    components: [..] *slang.IComponentType;
    components.allocator = temp;
    array_add(*components, slang_module);
    for entry_points {
        array_add(*components, it);
    }

    composed_program: *slang.IComponentType;
    slang.ISession_createCompositeComponentType(session, components.data, components.count, *composed_program, *diagnostic_blob);
    if diagnostic_blob then log_diagnostic_blob(diagnostic_blob);
    if !composed_program then return false, .{};
    defer slang.ISlangUnknown_release(composed_program);

    linked_program: *slang.IComponentType;
    slang.IComponentType_link(composed_program, *linked_program);
    if diagnostic_blob then log_diagnostic_blob(diagnostic_blob);
    if !linked_program then return false, .{};

    platform_code: *slang.IBlob;
    slang.IComponentType_getEntryPointCode(linked_program, 0, 0, *platform_code, *diagnostic_blob);
    if diagnostic_blob then log_diagnostic_blob(diagnostic_blob);

    platform_code_raw: [] u8 = NewArray(xx slang.ISlangBlob_getBufferSize(platform_code), u8);

    memcpy(platform_code_raw.data, slang.ISlangBlob_getBufferPointer(platform_code), platform_code_raw.count);

    slang.ISlangUnknown_release(platform_code);

    if output_directory {
        output_path := tprint("%/%.%", output_directory, path_strip_extension(filename), PLATFORM_EXTENSION);

        write_entire_file(output_path, platform_code_raw.data, platform_code_raw.count);
    }

    return true, platform_code_raw;
}

compile_to_slang_ir :: (shader_path: string, output_directory: string = "", debug_symbols: bool = false) -> bool, [] u8 {
    if !global_session then create_global_session();

    auto_release_temp();

    filename := shader_path;
    source_dir := path_strip_filename(shader_path);

    options := get_platform_options(debug_symbols);
    target_desc := get_platform_target_description(options);
    session := get_session(options, target_desc, .[ source_dir ]);
    if !session return false, .{};
    defer slang.ISlangUnknown_release(session);

    diagnostic_blob: *slang.IBlob;
    slang_module := slang.ISession_loadModule(session, temp_c_string(shader_path), *diagnostic_blob);
    if diagnostic_blob then log_diagnostic_blob(diagnostic_blob);
    if !slang_module then return false, .{};

    slang_code : *slang.IBlob;
    slang.IModule_serialize(slang_module, *serialized_blob);
    if !serialized_blob then return false, .{};

    slang_code_raw: [] u8 = NewArray(xx slang.ISlangBlob_getBufferSize(slang_code), u8);

    memcpy(slang_code_raw.data, slang.ISlangBlob_getBufferPointer(slang_code), slang_code_raw.count);

    slang.ISlangUnknown_release(slang_code);

    if output_directory {
        output_path := tprint("%/%.%", output_directory, path_strip_extension(filename), "slv");

        write_entire_file(output_path, slang_code_raw.data, slang_code_raw.count);
    }

    return true, slang_ir_raw;
}

compile_slang_ir_to_platform :: (slang_ir: []u8, output_directory: string = "", debug_symbols: bool = false) -> bool, [] u8 {
    if !global_session then create_global_session();

    auto_release_temp();

    options := get_platform_options(debug_symbols);
    target_desc := get_platform_target_description(options);
    session := get_session(options, target_desc, .[]);
    if !session return false, .{};
    defer slang.ISlangUnknown_release(session);

    diagnostic_blob: *slang.IBlob;
    slang_code := slang.slang_createBlob(slang_ir.data, xx slang_ir.count);
   
    module_version : s64; //slang.SlangInt;
    compiler_version : *u8;
    module_name : *u8;
    slang.ISession_loadModuleInfoFromIRBlob(session, slang_code, *module_version, *compiler_version, *module_name);
    slang_module := slang.ISession_loadModuleFromIRBlob(session, module_name, null, slang_code, *diagnostic_blob); 
    if diagnostic_blob then log_diagnostic_blob(diagnostic_blob);
    if !slang_module then return false, .{};

    entry_points: [..] *slang.IEntryPoint;
    entry_points.allocator = temp;
    {
        main := array_add(*entry_points);
        slang.IModule_findEntryPointByName(slang_module, "main", main);
    }

    components: [..] *slang.IComponentType;
    components.allocator = temp;
    array_add(*components, slang_module);
    for entry_points {
        array_add(*components, it);
    }

    composed_program: *slang.IComponentType;
    slang.ISession_createCompositeComponentType(session, components.data, components.count, *composed_program, *diagnostic_blob);
    if diagnostic_blob then log_diagnostic_blob(diagnostic_blob);
    if !composed_program then return false, .{};
    defer slang.ISlangUnknown_release(composed_program);

    linked_program: *slang.IComponentType;
    slang.IComponentType_link(composed_program, *linked_program);
    if diagnostic_blob then log_diagnostic_blob(diagnostic_blob);
    if !linked_program then return false, .{};

    platform_code: *slang.IBlob;
    slang.IComponentType_getEntryPointCode(linked_program, 0, 0, *platform_code, *diagnostic_blob);
    if diagnostic_blob then log_diagnostic_blob(diagnostic_blob);

    platform_code_raw: [] u8 = NewArray(xx slang.ISlangBlob_getBufferSize(platform_code), u8);

    memcpy(platform_code_raw.data, slang.ISlangBlob_getBufferPointer(platform_code), platform_code_raw.count);

    slang.ISlangUnknown_release(platform_code);

    if output_directory {
        output_path := tprint("%/%.%", output_directory, path_strip_extension(to_string(module_name)), PLATFORM_EXTENSION);

        write_entire_file(output_path, platform_code_raw.data, platform_code_raw.count);
    }

    return true, platform_code_raw;
}



#scope_file

log_diagnostic_blob :: (blob: *slang.IBlob) {
    diagnostic_string := string.{
        data = slang.ISlangBlob_getBufferPointer(blob),
        count = xx slang.ISlangBlob_getBufferSize(blob),
    };

    // #todo: how to pass shader compilation failures up to the user.
    log_error("%", diagnostic_string);

    slang.ISlangUnknown_release(blob);
}

create_global_session :: () {
    result := slang.slang_createGlobalSession(slang.SLANG_API_VERSION, *global_session);
    assert(slang.SLANG_SUCCEEDED(result));
}

#if OS == .WINDOWS || OS == .LINUX {
    PLATFORM_EXTENSION :: "spv";

    get_platform_options :: (debug_symbols: bool) -> [..] slang.CompilerOptionEntry {
            options: [..] slang.CompilerOptionEntry;
        options.allocator = temp;
        array_add(*options, .{
            slang.CompilerOptionName.Language, .{
                slang.CompilerOptionValueKind.String, 0, 0, "slang", null
            }
        });

        array_add(*options, .{
            slang.CompilerOptionName.Capability, .{
                slang.CompilerOptionValueKind.Int, xx slang.IGlobalSession_findCapability(global_session, "spirv_1_6"), 0, null, null
            }
        });
        array_add(*options, .{
            slang.CompilerOptionName.GLSLForceScalarLayout, .{
                slang.CompilerOptionValueKind.Int, 1, 0, null, null
            }
        });
        array_add(*options, .{
            slang.CompilerOptionName.VulkanInvertY, .{
                slang.CompilerOptionValueKind.Int, 1, 0, null, null
            }
        });

        if debug_symbols {
            array_add(*options, .{
                slang.CompilerOptionName.DebugInformation, .{
                    slang.CompilerOptionValueKind.Int, 2, 0, null, null
                }
            });
        }
        return options;
    }

    get_platform_target_description :: (options: []slang.CompilerOptionEntry) -> slang.TargetDesc {
            target_desc := slang.TargetDesc.{
            format = .SLANG_SPIRV,
            profile = slang.IGlobalSession_findProfile(global_session, "sm_6_0"),
            forceGLSLScalarBufferLayout = true,
            flags = xx slang.SLANG_TARGET_FLAG.GENERATE_SPIRV_DIRECTLY,
            compilerOptionEntries = options.data,
            compilerOptionEntryCount = xx options.count,
        };
    }
} else #if OS == .MACOS {
    PLATFORM_EXTENSION :: "metallib";

    get_platform_options :: (debug_symbols: bool) -> [..] slang.CompilerOptionEntry {
        options: [..] slang.CompilerOptionEntry;
        options.allocator = temp;
        array_add(*options, .{
            slang.CompilerOptionName.Language, .{
                slang.CompilerOptionValueKind.String, 0, 0, "slang", null
            }
        });

        array_add(*options, .{
            slang.CompilerOptionName.Capability, .{
                slang.CompilerOptionValueKind.Int, xx slang.IGlobalSession_findCapability(global_session, "metallib"), 0, null, null
            }
        });
        array_add(*options, .{
            slang.CompilerOptionName.GLSLForceScalarLayout, .{
                slang.CompilerOptionValueKind.Int, 1, 0, null, null
            }
        });
        //array_add(*options, .{
        //    slang.CompilerOptionName.VulkanInvertY, .{
        //        slang.CompilerOptionValueKind.Int, 1, 0, null, null
        //    }
        //});

        if debug_symbols {
            array_add(*options, .{
                slang.CompilerOptionName.DebugInformation, .{
                    slang.CompilerOptionValueKind.Int, 2, 0, null, null
                }
            });
        }
        return options;
    }

    get_platform_target_description :: (options: []slang.CompilerOptionEntry) -> slang.TargetDesc {
        return slang.TargetDesc.{
            format = .METAL_LIB,
            profile = slang.IGlobalSession_findProfile(global_session, "sm_6_6"),
            forceGLSLScalarBufferLayout = true,
            compilerOptionEntries = options.data,
            compilerOptionEntryCount = xx options.count,
        };
    }
}

get_session :: (options: []slang.CompilerOptionEntry, target_desc: slang.TargetDesc, search_paths: []string) -> *slang.ISession {
    search_paths_c : [] *u8;
    {
        context.allocator = temp;
        search_paths_c = NewArray(search_paths.count, *u8);
    }
    for search_paths  search_paths_c[it_index] = temp_c_string(it);

    session_desc := slang.SessionDesc.{
        targets = *target_desc,
        targetCount = 1,
        defaultMatrixLayoutMode = .ROW_MAJOR,
        searchPaths = search_paths_c.data,
        searchPathCount = 1,
        compilerOptionEntries = options.data,
        compilerOptionEntryCount = xx options.count,
    };

    session: *slang.ISession;
    slang.IGlobalSession_createSession(global_session, *session_desc, *session);
    return session;
}


global_session: *slang.IGlobalSession;

slang :: #import "slang";
#import "File";
#import "Basic";
#import "String";
