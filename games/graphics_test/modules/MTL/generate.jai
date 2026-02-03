/* Generates Metal bindings from metal-cpp */

#scope_module

// TODO: HANDLE STRUCT PACKING:
// we may need to just remove the struct generation from this code and add it ourselves
generate :: () -> module: string {
    classes : [..]Class;
    structs : [..]Struct;
    selectors : [..]string;
    enums : [..]Enum;
    _enum_flags : [..]Enum;
    //defer array_free(classes);

    metal_files := file_list(METAL_CPP_DIRECTORY);
    quartz_files := file_list(QUARTZCORE_DIRECTORY);
    files := NewArray(metal_files.count + quartz_files.count, string);
    for metal_files files[it_index] = it;
    for quartz_files files[it_index + metal_files.count] = it;

    defer array_free(files);
    defer array_free(quartz_files);
    defer array_free(metal_files);

    array_reserve(*classes, 2*files.count);
    array_reserve(*selectors, 50*files.count);

    auto_release_temp(); // in outer scope because we don't want to release the strings til we're done!
    selector_struct : string;
    {
        context.allocator = temp;
        read_classes_and_enums_from_files(files, *classes, *enums, *structs, *_enum_flags);
        selector_struct = build_selector_struct();
    }

    for class : classes {
        for method : class.methods {
            if method.selector == "" {
                remove method;
            }
        }
    }

    for e : enums {
        if e.name == "MTLPixelFormat"  assert(e.members.count == 140);
    }

    builder : String_Builder;

    append(*builder, "/* Metal Wrappers generated from metal-cpp\n");
    append(*builder, "\t NOTE: While this library uses metal-cpp for code generation, \n");
    append(*builder, "\t it doesn't bind a separate C++ library, but calls the Objective C, \n");
    append(*builder, "\t system libraries directly. */\n\n");

    append(*builder, "#scope_export\n\n");

    for st : structs {
        struct_declaration := build_mtl_struct_declaration(st);
        append(*builder, struct_declaration);
        append(*builder, "\n");
    }

    for e : enums {
        enum_declaration := build_enum_declaration(e);
        append(*builder, enum_declaration);
        append(*builder, "\n");
    }

    for class: classes {
        class_declaration := build_class_declaration(class);
        append(*builder, class_declaration);
        append(*builder, "\n");
    }

     for e : _enum_flags {
        enum_flags_declaration := build_enum_declaration(e, is_flags=true);
        append(*builder, enum_flags_declaration);
        append(*builder, "\n");
    }
    
    append(*builder, additional_module_code);
    append(*builder, selector_struct);
    append(*builder, imports_to_insert);

    mtl_dot_jai := builder_to_string(*builder);

    write_entire_file(tprint("%/MTL.jai", #filepath), mtl_dot_jai);

    return mtl_dot_jai;
}

#scope_file

build_selector_struct :: () -> string {
    metal_file_name := tprint("%/%", METAL_CPP_DIRECTORY, "MTLHeaderBridge.hpp");
    metal_file := read_entire_file(metal_file_name);

    ca_file_name := tprint("%/%", QUARTZCORE_DIRECTORY, "CAPrivate.hpp");
    ca_file := read_entire_file(ca_file_name);

    selectors : [..]string;

    more_to_read := true;
    line : string;
    while reading_file := more_to_read {
        more_to_read, line, metal_file = split_from_left(metal_file, "\n");
        line = trim(line);
        if contains(line, "_MTL_PRIVATE_DEF_SEL") {
            _, _, selector := split_from_right(line, "_MTL_PRIVATE_DEF_SEL(");
            _, selector, _ = split_from_left(selector, ",");

            if !array_find(selectors, selector)  array_add(*selectors, selector);
        }
    }

    more_to_read = true;
    while reading_file := more_to_read {
        more_to_read, line, ca_file = split_from_left(ca_file, "\n");
        line = trim(line);
        if contains(line, "_CA_PRIVATE_DEF_SEL") {
            _, _, selector := split_from_right(line, "_CA_PRIVATE_DEF_SEL(");
            _, selector, _ = split_from_left(selector, ",");

            
            if !array_find(selectors, selector)  array_add(*selectors, selector);
        }
    }

    builder : String_Builder;
    append(*builder, "__generated_selectors :: struct #type_info_no_size_complaint {\n");
    for selector : selectors {
        append(*builder, "\t");
        append(*builder, selector);
        append(*builder, " : *void = ---;\n");
    }
    append(*builder, "}\n\n");

    return builder_to_string(*builder);
}

build_mtl_struct_declaration :: (st: Struct) -> string {
    builder : String_Builder;

    //print("building from struct: %\n", st);

    append(*builder, st.name);
    append(*builder, " :: struct {\n");

    for st.members {
        append(*builder, "\t");
        append(*builder, it.name);
        append(*builder, " : ");
        append(*builder, it.type);
        append(*builder, ";\n");
    }
    append(*builder, "}\n");

    return builder_to_string(*builder);
}

build_enum_declaration :: (e: Enum, is_flags := false) -> string {
    builder : String_Builder;

    append(*builder, e.name);
    append(*builder, " :: enum");
    if is_flags append(*builder, "_flags");
    append(*builder, " ");
    append(*builder, e.type);
    append(*builder, " {\n");

    prefix_len := e.non_ns_name.count;

    // handle stupid exceptions
    if contains(e.non_ns_name, "Options")  prefix_len -= 1;
    if contains(e.non_ns_name, "Stages")  prefix_len -= 1;
    if contains(e.non_ns_name, "ResourceOptions") prefix_len = 8;
    if contains(e.non_ns_name, "TextureType") prefix_len = 7;

    valid_short_form := true;
    short_form : string;
    {
        builder : String_Builder;

        for e.members {
            non_ns_name := slice(it.name, prefix_len, it.name.count - prefix_len);
            if non_ns_name[0] == #char "_" {
                non_ns_name = slice(non_ns_name, 1, non_ns_name.count -1);
            }
            
            if #char "0" <= non_ns_name[0] && non_ns_name[0] <= #char "9" {
                valid_short_form = false;
                break;
            }

            append(*builder, "\t");

            append(*builder, non_ns_name);
            if it.value {
                append(*builder, " :: ");
                append(*builder, it.value);
            }
            append(*builder, ";\n");
        }
        append(*builder, ";\n");
        short_form = builder_to_string(*builder);
    }

    append(*builder, short_form);

    for e.members {
        append(*builder, "\t");
        
        prefix := ifx contains(e.name, "MTL4") "MTL4" else "MTL";

        append(*builder, prefix);
        append(*builder, it.name);
        if it.value {
            append(*builder, " :: ");
            append(*builder, it.value);
        }
        append(*builder, ";\n");
    }

    append(*builder, "}\n");

    return builder_to_string(*builder);
}

build_class_declaration :: (class: Class) -> string {
    builder : String_Builder;
    struct_declaration := build_struct_declaration(class);
    append(*builder, struct_declaration);

    for method : class.methods {
        method_declaration := build_method_declaration(class, method);
        append(*builder, method_declaration);
    }

    append(*builder, "\n");
    return builder_to_string(*builder);
}

build_method_declaration :: (class: Class, method: Method) -> string {
    builder : String_Builder;
    append(*builder, method.name);
    append(*builder, " :: ");

    fn_type  : = build_fn_type(class, method);
    append(*builder, fn_type);

    append(*builder, " {\n\t");
    
    macro_fn_body := tprint("#insert #run METHOD_BODY(%.%, #type %);", SELECTOR_STRUCT_NAME, method.selector, fn_type);
    append(*builder, macro_fn_body);

    append(*builder, "\n}\n");

    return builder_to_string(*builder);
}

build_fn_type :: (class: Class, method: Method) -> string {
    builder : String_Builder;
    append(*builder, "(self: *");
    append(*builder, class.name);

    for arg : method.arguments {
        append(*builder, ", ");
        append(*builder, arg.name);
        append(*builder, ": ");
        append(*builder, arg.type);
    }
    append(*builder, ") -> ");
    append(*builder, method.return_type);
    return builder_to_string(*builder);
}

build_struct_declaration :: (class: Class) -> string {
    declaration : string;
    if class.superclass {
        declaration = tprint("% :: struct { using #as _: %; }\n", class.name, class.superclass);
    } else {
        declaration = tprint("% :: struct {}\n", class.name);
    }
    if class.name == "CAMetalLayer" declaration = "CAMetalLayer :: struct { using #as calayer: CALayer; _priv: *_CAMetalLayerPrivate; }\n _CAMetalLayerPrivate :: struct {}\n";

    return declaration;
}

debug_files :: string.[
];

ignore_files :: string.[
    // these only have structs or methods
    //"./metal-cpp/Metal/MTLTypes.hpp",
    //"./metal-cpp/Metal/MTLGPUAddress.hpp",
    //"./metal-cpp/Metal/Metal.hpp",
    //"./metal-cpp/Metal/MTLAccelerationStructureTypes.hpp",

    // these only have enums
    //"./metal-cpp/Metal/MTLDataType.hpp",
    //"./metal-cpp/Metal/MTLPixelFormat.hpp",
    //"./metal-cpp/Metal/MTLIOCompressor.hpp", // this one has some private functions we may want later

    // we don't need these
    "./metal-cpp/Metal/MTLPrivate.hpp",
    "./metal-cpp/Metal/MTLVersion.hpp", // we MAY want the defines in this one
    "./metal-cpp/Metal/MTLHeaderBridge.hpp", // list of selectors
    "./metal-cpp/Metal/MTLDefines.hpp", 

];

read_classes_and_enums_from_files :: (files: []string, classes: *[..]Class, enums: *[..]Enum, structs: *[..]Struct, _enum_flags: *[..]Enum) {
    for file_name : files {
        for ignore_files  if file_name == it  continue file_name;
        //print("reading file: %\n", file_name);
        //debug_num_classes_found := 0;
        //defer assert( debug_num_classes_found > 0);

        in_debug_file := false;
        for debug_files  in_debug_file ||= file_name == it;
        
        file := read_entire_file(file_name);

        namespace : string;
        last_method : *Method;
        reading_enum := false;
        reading_struct := false;
        reading_enum_flags := false;

        more_to_read := true;
        line : string;
        while reading_file := more_to_read {
            more_to_read, line, file = split_from_left(file, "\n");
            if in_debug_file  print("reading_line: ^%\n", line);
            if begins_with(line, "namespace") {
                // ex: "namespace MTL4"
                _, _, rest_of_line := split_from_left(line, " ");
                namespace = trim(rest_of_line);
            }
            if begins_with(line, "class") {
                // ex: "class RenderCommandEncoder : public NS::Referencing<RenderCommandEncoder, CommandEncoder>"
                class : Class;
                class.namespace = namespace;
                class.methods.allocator = context.default_allocator;

                more_in_line := true;
                keyword : string;
                while reading_line := more_in_line {
                    more_in_line, keyword, line = split_from_left(line, " ");

                    if keyword == "class" || 
                       keyword == "public" ||
                       keyword == ":" || 
                       keyword == "const"
                    then continue reading_line;

                    if !class.name {
                        if contains(keyword, ";") continue reading_file; // this means the line is a forward declaration

                        class.name = sprint("%%", namespace, keyword);
                    } else if ends_with(keyword, ">") {
                        if contains(keyword, "<") continue reading_line; // this means that there is no superclass eg: "NS::Referencing<ClassName>

                        superclass := trim_right(keyword, ">");
                        if contains(superclass, "::") superclass = regularize_type(superclass);
                        else superclass = sprint("%%", namespace, superclass);
                        class.superclass = superclass;
                    }
                }

                //debug_num_classes_found += 1;
                array_add(classes, class);
                continue reading_file;
            }

            if begins_with(line, "_MTL_INLINE") || begins_with(line, "_CA_INLINE"){
                // ex: "_MTL_INLINE NS::UInteger MTL4::ArgumentTableDescriptor::maxSamplerStateBindCount() const"
                // ex: "_MTL_INLINE void MTL::Device::convertSparseTileRegions(const MTL::Region* tileRegions, MTL::Region* pixelRegions, MTL::Size tileSize, NS::UInteger numRegions)"

                if contains(line, "^") {
                    print("we're not yet able to parse the following declaration! in file: % \n\t%\n", file_name, line);
                    last_method = null;
                    continue reading_file;
                }

                method : Method;

                more_in_line := true;
                keyword : string;
                separator := " ";

                class : *Class;
                ns: string;
                class_name: string;
                method_name: string;

                while reading_line := more_in_line  {
                    more_in_line, keyword, line = split_from_left(line, separator);
                    line = trim(line);

                   if contains(line, "alloc()") ||
                      contains(line, "init()")
                   then continue reading_file;

                   if keyword == "_MTL_INLINE" || 
                      keyword == "_CA_INLINE" ||
                      keyword == "const"
                   then continue reading_line;

                    if !method.return_type {
                        if contains(keyword, "(") {
                            continue reading_file; // that means this is a constructor
                        } else {
                            method.return_type = regularize_type(keyword);
                        }
                        separator = "::";
                        continue reading_line;
                    }

                    if !ns {
                        ns = keyword;
                        continue reading_line;
                    }

                    if !class_name {
                        class_name = sprint("%%", ns,keyword);
                        separator = "(";
                        continue reading_line;
                    }

                    if !class {
                        method.name = keyword;
                        separator = ")";
                        
                        // find the pointer to our class
                        for * classes.* {
                            if it.namespace == ns && it.name == class_name {
                                class = it;
                                break;
                            }
                        }
                        if !class continue reading_file;
                        assert(class != null);

                        continue reading_line;
                    }

                    // mapping arguments
                    if separator == ")" {
                        assert(class != null);
                        if !keyword  break reading_line;

                        more_in_pairs := true;
                        pairs := keyword;
                        pair : string;
                        while reading_pairs := more_in_pairs {
                            more_in_pairs, pair, pairs = split_from_left(pairs, ",");

                            argument : Argument;

                            more_in_pair := true;
                            arg_keyword : string;
                            while reading_pair := more_in_pair {
                                more_in_pair, arg_keyword, pair = split_from_left(pair, " ");

                                if arg_keyword == "const" || arg_keyword == "const*" continue reading_pair;

                                if !argument.type {
                                    argument.type = regularize_type(arg_keyword);
                                    continue reading_pair;
                                }

                                if !argument.name {
                                    if contains(arg_keyword, "[]") {
                                        argument.name = slice(arg_keyword, 0, arg_keyword.count -2);
                                        argument.type = sprint("*%", argument.type);
                                    } else {
                                        if arg_keyword == "string" arg_keyword = sprint("_%", arg_keyword);
                                        argument.name = arg_keyword;
                                    }
                                }
                            }
                            array_add(*method.arguments, argument);
                        }
                    }
                }

                assert(class != null);
                array_add(*class.methods, method);
                last_method = *class.methods[class.methods.count - 1];
                continue reading_file;
            }
            
            if (contains(line, "_MTL_PRIVATE_SEL(") || contains(line, "_CA_PRIVATE_SEL(")) && last_method {
                _, _, selector := split_from_right(line, "(");
                _, selector, _ = split_from_left(selector, ")");
                assert(selector != "");
                last_method.selector = selector;
                continue reading_file;
            }

            if begins_with(line, "_MTL_ENUM") || begins_with(line, "_CA_ENUM") {
                /* ex: 
                    _MTL_ENUM(NS::UInteger, PixelFormat) {
                        PixelFormatInvalid = 0,
                        PixelFormatA8Unorm = 1,
                        ...
                    }
                */
 
                //print("found enum %\n", line);
                reading_enum = true;
                _enum : Enum;

                _, _, type_and_name := split_from_right(line, "(");
                _, type_and_name, _ = split_from_left(type_and_name, ")");
                found, type, name := split_from_left(type_and_name, ", ");
                assert(found);

                _enum.non_ns_name = name;
                _enum.name = sprint("%%", namespace, name);
                _enum.type = regularize_type(type);

                array_add(enums, _enum);
                continue reading_file;
            }

            if reading_enum {
                    e := enums.*[enums.count -1];

                line = trim(line);
                if begins_with(line, "}") {
                   reading_enum = false;
                   continue reading_file;
                } else {
                    _, name, value := split_from_left(line, "=");
                    name = trim(name);
                    value = trim(value);
                    if value {
                        value = slice(value, 0, value.count -1);
                    } else if contains(name, ",") {
                        name = slice(name, 0, name.count -1);
                    }
                    if value == "NS::UIntegerMax" value = "0xFFFFFFFFFFFFFFFF";

                    if name {
                        array_add(*enums.*[enums.count -1].members, { name, value });
                    }
                }
                continue reading_file;
            }

            if begins_with(line, "struct") && !contains(line, ";") {
                st : Struct;
                _, _, name := split_from_right(line, " ");
                st.name = sprint("%%", namespace, name);

                reading_struct = true;
                array_add(structs, st);
                continue reading_file;
            }

            if reading_struct {
                line = trim(line);
                
                if begins_with(line, "{")  continue reading_file;

                if begins_with(line, "}") {
                    reading_struct = false;
                    continue reading_file;
                }             
                
                if contains(line, "(") continue reading_file;

                _, type, name := split_from_left(line, " ");
                type = trim(type);
                type = regularize_type(type);

                name = trim(name);
                if contains(name, ";") name = slice(name, 0, name.count -1);

                found_brackets, name_no_brackets, bracket_expression :=  split_from_left(name, "[");
                if found_brackets {
                    name = name_no_brackets;
                    type = sprint("[%%", bracket_expression, type);
                }

                if name {
                    array_add(*structs.*[structs.count -1].members, { name, type });
                    assert(type != "");
                }
                continue reading_file;
            }

            if begins_with(line, "_MTL_OPTIONS") ||begins_with(line, "_CA_OPTIONS") {
                /* ex: 
                    _MTL_ENUM(NS::UInteger, PixelFormat) {
                        PixelFormatInvalid = 0,
                        PixelFormatA8Unorm = 1,
                        ...
                    }
                */
 
                reading_enum_flags = true;
                _enum : Enum;

                _, _, type_and_name := split_from_right(line, "(");
                _, type_and_name, _ = split_from_left(type_and_name, ")");
                found, type, name := split_from_left(type_and_name, ", ");
                assert(found);

                _enum.non_ns_name = name;
                _enum.name = sprint("%%", namespace, name);
                _enum.type = regularize_type(type);

                array_add(_enum_flags, _enum);
                continue reading_file;
            }

            if reading_enum_flags {

                line = trim(line);
                if begins_with(line, "}") {
                   reading_enum_flags = false;
                   continue reading_file;
                } else {
                    _, name, value := split_from_left(line, "=");
                    name = trim(name);
                    value = trim(value);
                    value = slice(value, 0, value.count -1);

                    if name {
                        assert(value != "");
                        array_add(*_enum_flags.*[_enum_flags.count -1].members, { name, value });
                    }

                }
                continue reading_file;
            }
        }
    }
}

// change names to work with types defined in Objective_C module
regularize_type :: (keyword: string) -> string {
    type_name := keyword;

    if type_name == "void" return "()";

    if contains(type_name, "::") {
        _, ns, type := split_from_left(type_name, "::");
        type_name = sprint("%%", ns, type);
    }

    // handle pointers
    while ends_with(type_name, "*") type_name = sprint("*%", slice(type_name, 0, type_name.count - 1));

    if type_name == "uint8_t"  type_name = "u8";
    if type_name == "uint16_t"  type_name = "u16";
    if type_name == "uint32_t"  type_name = "u32";
    if type_name == "uint64_t"  type_name = "u64";


    if type_name == "int8_t"  type_name = "s8";
    if type_name == "int16_t"  type_name = "s16";
    if type_name == "int32_t"  type_name = "s32";
    if type_name == "int64_t"  type_name = "s64";

    if type_name == "double" type_name = "float64";

    assert(type_name != "int");

    return type_name;
}


Class :: struct {
    name : string;
    superclass : string;
    namespace : string;
    methods : [..] Method;
}


Method :: struct {
    name : string;
    return_type : string;
    arguments : [..] Argument;
    selector : string;
}

Argument :: struct { 
    name: string; 
    type: string;
}

Enum :: struct {
    non_ns_name : string;
    name : string;
    type : string;
    members : [..] EnumMember;
}

EnumMember :: struct {
    name: string;
    value: string;
}

Struct :: struct {
    name: string;
    members: [..]Argument;
}

METAL_CPP_DIRECTORY :: #run sprint("%%", #filepath, "metal-cpp/Metal");
QUARTZCORE_DIRECTORY :: #run sprint("%%", #filepath, "metal-cpp/QuartzCore");

#import "Basic";
#import "File";
#import "String";
#import "File_Utilities";

additional_module_code :: #string END

NSFastEnumeration :: struct {};
task_id_token_t :: struct {};
NSNumber :: struct {};

// TODO: make it so the parser can read these or just implement them here
PackedFloat3 :: struct {}
PackedFloatQuaternion :: struct {}

init_mtl :: () {
    if __selectors.accelerationStructureCommandEncoder return;

    init_objective_c_selector_struct(*__selectors);

    assert(__selectors.supportsFamily_ != null);
}



MTLTimestamp :: u64;
MTLGPUAddress :: u64;

MTLCoordinate2D :: MTLSamplePosition;


// we can't handle these yet, but they're block items
MTLNewRenderPipelineStateWithReflectionCompletionHandler :: *void;
MTLSharedEventNotificationBlock :: *void;
MTLNewRenderPipelineStateCompletionHandler :: *void;
MTLNewLibraryCompletionHandler :: *void;
MTLNewDynamicLibraryCompletionHandler :: *void;
MTLNewComputePipelineStateWithReflectionCompletionHandler :: *void;
MTLNewComputePipelineStateCompletionHandler :: *void;
MTLIOCommandBufferHandler :: *void;
MTLDrawablePresentedHandler :: *void;
MTLCommandBufferHandler :: *void;
MTL4NewMachineLearningPipelineStateCompletionHandler :: *void;
MTL4NewBinaryFunctionCompletionHandler :: *void;
MTL4CommitFeedbackHandler :: *void;

MTLAutoreleasedComputePipelineReflection :: *MTLComputePipelineReflection;
MTLAutoreleasedRenderPipelineReflection :: *MTLRenderPipelineReflection;
MTLAutoreleasedArgument :: *MTLArgument;

// These are opaque
IOSurfaceRef :: *void;
CGColorSpaceRef :: *void;


// borrowed from the code that ships with the compiler
MTLCreateSystemDefaultDevice :: () -> *MTLDevice #foreign Metal;
MTLCopyAllDevices :: () -> *NSArray(id) #foreign Metal;
MTLDeviceNotificationName :: *NSString;
MTLDeviceWasAddedNotification: MTLDeviceNotificationName;
MTLDeviceRemovalRequestedNotification: MTLDeviceNotificationName;
MTLDeviceWasRemovedNotification: MTLDeviceNotificationName;
MTLRemoveDeviceObserver :: (observer: id) -> () #foreign Metal;
Metal :: #library,system,link_always "Metal";  // We were having some problems on Mac, so, try this.. .

#scope_file

__selectors: __generated_selectors;

END

imports_to_insert :: #string END 

#import "Objective_C";
#import "macos";

END
