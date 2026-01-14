#scope_module

//METHOD :: (name: string, type: Type, call := #caller_code) -> Code #compile_time {
//    return generate_method_code(name, type, call);
//}
//
//
//METHOD :: (parent: Code, name: string, type: Type, call := #caller_code) -> Code #compile_time {
//    return generate_method_code(name, type, call, parent);
//    
//}

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

//debug_print_macro :: (code: Code) {
//    nodes := compiler_get_nodes(code);
//    builder: String_Builder;
//    print_expression(*builder, template_nodes);
//    print("debug_expression: %\n", builder_to_string(*builder));
//}

//#run debug_print_macro(#code METHOD(*MTL4CommandBuffer, "renderCommandEncoderWithDescriptor:", #type(descriptor: *MTL4RenderPassDescriptor) -> *MTL4RenderCommandEncoder));

Placeholder_Type :: struct {};

template :: #code (self: *void)->void{};

body_template :: #code {
    _func: (obj: *void, selector: *void) -> Placeholder_Type #c_call;
    _func = xx objc_msgSend;
    return _func(self, __macro_generated_selectors.Placeholder);
};

get_type_header :: (call_node: *Code_Node, n: int) -> *Code_Procedure_Header {
   assert(call_node.kind == .PROCEDURE_CALL);
    arg_n := call_node.(*Code_Procedure_Call).arguments_unsorted[n];
    arg_n_expression := arg_n.expression;

    type_inst := ifx arg_n_expression.kind == .TYPE_INSTANTIATION {
        cast(*Code_Type_Instantiation, arg_n.expression);
    } else ifx arg_n_expression.kind == .DIRECTIVE_INSERT {
        directive_insert := cast(*Code_Directive_Insert, arg_n_expression);
        assert(directive_insert.expansion != null);
        cast(*Code_Type_Instantiation, directive_insert.expansion);
    } else { 
        assert(false, "arg_n_expression.kind == %\n", arg_n_expression.kind); 
        null; 
    }

    type_target := type_inst.type_directive_target;
    type_target_nodes := type_target.type_valued_expression;
    assert(type_target_nodes.kind == .PROCEDURE_HEADER);
    return cast(*Code_Procedure_Header, type_target_nodes);
}


// instantiate the procedure header
update_procedure_header :: (template_nodes: *Code_Node, type_header: *Code_Procedure_Header, parent_nodes: *Code_Node = null ) -> *Code_Procedure_Header {
    node := template_nodes;
    assert(node.kind == .PROCEDURE_HEADER);
    procedure_header: = node.(*Code_Procedure_Header);

    // copy over the arguments
    new_args := NewArray(type_header.arguments.count +1, *Code_Declaration, initialized = false);
    // set the self arg here
    new_args[0] = procedure_header.arguments[0];
    procedure_header.arguments = new_args;
    memcpy(new_args.data + 1, type_header.arguments.data, type_header.arguments.count * size_of(*Code_Declaration));

    // TODO: For some reason this is not working. It SHOULD change the type of the first argument
    if parent_nodes != null  procedure_header.arguments[0].type_inst.type_valued_expression = xx parent_nodes;
    

    // no need to copy the returns
    procedure_header.returns = type_header.returns;
    return procedure_header;
}


    // procedure body
update_procedure_body :: (body_template_nodes: *Code_Node, type_header: *Code_Procedure_Header, selector_name: string, parent_nodes: *Code_Node = null) -> *Code_Block {
    node := body_template_nodes;
    block: *Code_Block;
    assert(node.kind == .BLOCK);
    block = node.(*Code_Block);
    assert(block.statements.count == 3);

    node = block.statements[0];
    assert(node.kind == .DECLARATION);
    node = node.(*Code_Declaration).type_inst;
    assert(node.(*Code_Type_Instantiation).type_valued_expression != null);
    node = node.(*Code_Type_Instantiation).type_valued_expression;
    assert(node.kind == .PROCEDURE_HEADER);
    func_header := node.(*Code_Procedure_Header);

    // copy over the arguments for the _func definition
    new_args := NewArray(type_header.arguments.count +2, *Code_Declaration, initialized = false);
    // set the self arg here
    new_args[0] = func_header.arguments[0];
    new_args[1] = func_header.arguments[1];
    func_header.arguments = new_args;
    memcpy(new_args.data + 2, type_header.arguments.data, type_header.arguments.count * size_of(*Code_Declaration));

    if parent_nodes != null  func_header.arguments[0].type_inst.type_valued_expression = xx parent_nodes;
   
    func_header.returns = type_header.returns;

    node = block.statements[2];
    node = node.(*Code_Return).arguments_unsorted[0].expression;

    msgsend := node.(*Code_Procedure_Call);
    msgsend_args := msgsend.arguments_unsorted;

    // set selector name
    node = node.(*Code_Procedure_Call).arguments_unsorted[1].expression;
    assert(node.kind == .BINARY_OPERATOR);
    node = node.(*Code_Binary_Operator).right;
    assert(node.kind == .IDENT);
    node.(*Code_Ident).name = selector_name;

    // set the rest of the arguments
    new_msgsend_args := NewArray(type_header.arguments.count + 2, Code_Argument);
    new_msgsend_args[0] = msgsend_args[0];
    new_msgsend_args[1] = msgsend_args[1];
    for type_header.arguments {
        ident := New(Code_Ident);
        ident.name = it.name;
        new_msgsend_args[it_index + 2].expression = ident;
    }
    msgsend.arguments_unsorted = new_msgsend_args;

    node = block.statements[block.statements.count -1];
    print("node.kind of block end is %\n", node.kind);
    print("node.arguments of block end is %\n", node.(*Code_Return).arguments_unsorted);
    ret_arg :=  node.(*Code_Return).arguments_unsorted[0];
    print("return_arg %\n", ret_arg.expression.*);
    if type_header.returns.count == 0 block.statements[block.statements.count -1] = ret_arg.expression;
    return block;
}

// it's unfortunate that we can't specify the type of the Objective_C object we're calling
// here, but the compiler complains about circular dependencies when we try to only provide the
// procedure body in method, and it complains about missing struct members when we try to provide
// the declaration so the self property in the thing is always a *void
// ... it's not as though you couldn't just xx whatever pointer type you wanted to the self
// argument anyway
generate_method_code :: (name: string, type: Type, call : Code) -> Code #compile_time {
    selector_name := make_apple_name(name); @METAL_SELECTOR 
    procedure_name := make_procedure_name(name);

    template_nodes := compiler_get_nodes(template);
    body_template_nodes := compiler_get_nodes(body_template);
    call_node := compiler_get_nodes(call);

    #if #exists(DEBUG_PRINT_FROM_MACRO) {
        {
            builder: String_Builder;
            print_expression(*builder, template_nodes);
            print("initial expression: %\n", builder_to_string(*builder));
        }
    }

    type_header := get_type_header(call_node, 1);
    procedure_header := update_procedure_header(template_nodes, type_header);
    block := update_procedure_body(body_template_nodes, type_header, selector_name);

    procedure_body := New(Code_Procedure_Body);
    procedure_body.block = block;
    procedure_body.header = procedure_header;

    procedure_header.body_or_null = procedure_body;

    //#if #exists(DEBUG_PRINT_FROM_MACRO) {
        {
            builder: String_Builder;
            print_expression(*builder, template_nodes);
            print("final expression: %\n", builder_to_string(*builder));
            //return builder_to_string(*builder);
        }
    //}

    return compiler_get_code(template_nodes);
}

generate_method_code :: (name: string, type: Type, call : Code, parent: Code) -> Code #compile_time {
    selector_name := make_apple_name(name); @METAL_SELECTOR 
    procedure_name := make_procedure_name(name);

    template_nodes := compiler_get_nodes(template);
    body_template_nodes := compiler_get_nodes(body_template);
    call_node := compiler_get_nodes(call);

    parent_nodes := compiler_get_nodes(parent);

    #if #exists(DEBUG_PRINT_FROM_MACRO) {
        {
            builder: String_Builder;
            print_expression(*builder, template_nodes);
            print("initial expression: %\n", builder_to_string(*builder));
        }
    }

    type_header := get_type_header(call_node, 2);
    procedure_header := update_procedure_header(template_nodes, type_header, parent_nodes);
    block := update_procedure_body(body_template_nodes, type_header, selector_name, parent_nodes);

    procedure_body := New(Code_Procedure_Body);
    procedure_body.block = block;
    procedure_body.header = procedure_header;

    procedure_header.body_or_null = procedure_body;

    //#if #exists(DEBUG_PRINT_FROM_MACRO) {
        {
            builder: String_Builder;
            print_expression(*builder, template_nodes);
            print("final expression: %\n", builder_to_string(*builder));
            //return builder_to_string(*builder);
        }
    //}

    return compiler_get_code(template_nodes);
}


#import "Basic";
#import "Objective_C";
#import "Program_Print";  // For print_expression.
#import "Compiler";       // This defines compiler_get_nodes and compiler_get_code.
#import "String";
