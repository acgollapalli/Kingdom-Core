#scope_module

/* 
    Inserts a procedure with a name like the apple name you provide as well as the the 
    function signature you provide, and a body that calls the relevant ObjectiveC class

    ```
    METHOD(*MTL4CommandQueue, "commit:count:", #type (commandBuffers: **MTL4CommandBuffer, count: NSUInteger) -> ());
    ```
    becomes:
    ```
    commit :: (self: *MTL4CommandQueue, commandBuffers: **MTL4CommandBuffer, count: NSUInteger) { 
        ...
    }
    ```
    overloads are handled in the manner of jai, which is to say, something like 
    `renderCommandEncoderWithDescriptor:` and `renderCommandEncoderWithDescriptor:options:` 
    on MTL4CommandBuffer both resolve to procedures named `renderCommandEncoderWithDescriptor`.

    If the apple documentation has colons, you MUST include the colons. This includes trailing 
    colons.
    DO NOT attempt to use this inside of a struct. When you actually try to call the generated
    procedure, the compiler will complain about circular dependencies (at least as of beta version 0.2.24).

    The way that methods are currently handled in Metal.jai makes it annoying to read, and code using it annoying to read and write as well. So we just declare the class methods outside the actual struct. 
*/
METHOD :: (parent: Type, apple_name: string, procedure_signature: Type, call := #caller_code) -> string {
    method_declaration := generate_method_declaration(apple_name, call);
    
    #if DEBUG_PRINT_GENERATED_CODE  print("GENERATED METHOD: \n%\n\n", method_declaration);
    
    return method_declaration;
}

/* 
    Inserts two methods, a getter and a setter,  in the same manner as METHOD.

    Ex: providing an apple_name of `opaque` for *CAWindow will provide:
    ```
    opaque:: (self: *CAWindow) -> BOOL { ... }
    setOpaque :: (self: *CAWindow, prop: BOOL) -> () { ... }
    ```
    Do not attempt to use this inside of a struct, just like METHOD.
*/
PROP :: (parent: Type, apple_name: string, prop_type: Type) -> string {
    getter := tprint("#insert #run METHOD(%, \"%\", %);", parent, apple_name, tprint("#type () -> %", prop_type));
    setter := tprint("#insert #run METHOD(%, \"%\", %);", parent, make_setter_name(apple_name), tprint("#type (prop: %) -> ()", prop_type));

    builder: String_Builder;
    append(*builder, getter);
    append(*builder, "\n");
    append(*builder, setter);
    prop_declarations := builder_to_string(*builder);

    #if DEBUG_PRINT_GENERATED_CODE  print("GENERATED PROP METHODS: \n%\n\n", prop_declarations);

    return prop_declarations;
}

/* In case you want to declare the actual method yourself and just want to use a macro to insert the body

    DO NOT use this to generate a procedure body inside a struct. The compiler will complain of circular dependencies whenever you actually try to call the generated procedure (at least as of beta version 0.2.024). 
    
    This works:
    ```
    foo :: #insert #run METHOD_BODY(...);
    ```
    This does not:
    ```
    Bar :: struct {
        foo :: #insert #run METHOD_BODY(...);
    }
*/

METHOD_BODY :: (parent: Type, apple_name: string, procedure_signature: Type, call := #caller_code) -> string {
    method_body := generate_method_body(apple_name, call);
    
    #if DEBUG_PRINT_GENERATED_CODE  print("GENERATED METHOD BODY: \n%\n\n", method_body);
   
    return method_body;
}

#scope_file

SELECTOR_STRUCT_NAME :: "__macro_generated_selectors";

generate_method_declaration :: (apple_name: string, caller_code: Code) -> string #compile_time {
        procedure_name := make_procedure_name(apple_name);
        method_body := generate_method_body(apple_name, caller_code);

        builder: String_Builder;
        append(*builder, procedure_name);
        append(*builder, " :: ");
        append(*builder, method_body);
        return builder_to_string(*builder);
}

generate_method_body :: (apple_name: string, caller_code: Code) -> string #compile_time {

    procedure_name := make_procedure_name(apple_name);
    selector := make_selector(apple_name);

    caller_nodes := compiler_get_nodes(caller_code);
    assert(caller_nodes.kind == .PROCEDURE_CALL);
    caller_proc := cast(*Code_Procedure_Call, caller_nodes);
    
    parent_type_expression := caller_proc.arguments_unsorted[0].expression;
    
    function_signature_expression := caller_proc.arguments_unsorted[2].expression;
    if function_signature_expression.kind == .DIRECTIVE_INSERT {
        directive := cast(*Code_Directive_Insert, function_signature_expression);
        assert(directive.expansion != null);
        function_signature_expression = directive.expansion;
    }
    assert(function_signature_expression.kind == .TYPE_INSTANTIATION);
    {
        function_signature_instantiation := cast(*Code_Type_Instantiation, function_signature_expression);
        if function_signature_instantiation.inst_flags & .TYPE_DIRECTIVE {
            function_signature_expression = function_signature_instantiation.type_directive_target;
        }
    }

    function_signature_returns: bool;
    function_signature_arguments: []*Code_Declaration;
    {
        function_signature_type := cast(*Code_Type_Instantiation, function_signature_expression);

        if function_signature_type.inst_flags & .TYPE_DIRECTIVE then function_signature_type = function_signature_type.type_directive_target;

        function_type_expression := function_signature_type.type_valued_expression;

        assert(function_type_expression.kind == .PROCEDURE_HEADER);
        function_procedure_header := cast(*Code_Procedure_Header, function_type_expression);

        function_return_count := function_procedure_header.returns.count;
        function_signature_returns = function_return_count > 0;

        function_signature_arguments = function_procedure_header.arguments;
    }

    function_signature_substring: string;
    {
        builder: String_Builder;
        print_expression(*builder, function_signature_expression);
        function_signature_string := builder_to_string(*builder);
        function_signature_substring = slice(function_signature_string, 1, function_signature_string.count -1);
    }

    function_declaration_and_header: string;
    {
        builder: String_Builder;
        append(*builder, "(self: ");
        print_expression(*builder, parent_type_expression);
        
        if function_signature_arguments.count > 0 append(*builder, ", ");
        
        append(*builder, function_signature_substring);
        function_declaration_and_header = builder_to_string(*builder);
    }

    _func_type_declaration : string;
    {
        builder: String_Builder;
        append(*builder, "_func: (obj: *void, selector: *void");

        if function_signature_arguments.count > 0 append(*builder, ", ");

        append(*builder, function_signature_substring);
        append(*builder, " #c_call;");
        _func_type_declaration = builder_to_string(*builder);
    }

    _func_equals_msgSend :: "_func = xx objc_msgSend;";

    _func_call : string;
    {
        builder: String_Builder;
        append(*builder, "_func(self, ");
        append(*builder, SELECTOR_STRUCT_NAME);
        append(*builder, ".");
        append(*builder, selector);
        
        for function_signature_arguments {
            append(*builder, ", ");
            append(*builder, it.name);
        }

        append(*builder, ");");
        _func_call = builder_to_string(*builder);
    }

    function_declaration : string;
    {
        builder: String_Builder;
        append(*builder, function_declaration_and_header);
        append(*builder, " {");

        append(*builder, "\n\t");
        append(*builder, _func_type_declaration);
        append(*builder, "\n\t");
        append(*builder, _func_equals_msgSend);
        append(*builder, "\n\t");

        if function_signature_returns  append(*builder, "return ");

        append(*builder, _func_call);
        append(*builder, "\n");
        append(*builder, "}");
        function_declaration = builder_to_string(*builder);
    }


    return function_declaration;
}

make_selector :: (name: string) -> string {
    name_copy := copy_string(name);
    replace_chars(name_copy, ":", #char "_");
    return name_copy;
}
make_apple_name :: make_selector; // TODO: Remove this once you remove the old metaprogramming code

make_procedure_name :: (name: string) -> string {
    found, split, _ :=  split_from_left(name, ":");
    return ifx found split else name;
}

make_setter_name :: (apple_name: string) -> string {
    getter_name := copy_string(make_procedure_name(apple_name));
    builder: String_Builder;
    append(*builder, "set");
    getter_name[0] = to_upper(getter_name[0]);
    append(*builder, getter_name);
    append(*builder, ":");
    return builder_to_string(*builder);
}

#import "Basic";
#import "Objective_C";
#import "Program_Print";  // For print_expression.
#import "Compiler";       // This defines compiler_get_nodes and compiler_get_code.
#import "String";
