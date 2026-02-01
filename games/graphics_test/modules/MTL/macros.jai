#import "Compiler";
#import "Basic";
#import "Program_Print";  // For print_expression.

SELECTOR_STRUCT_NAME :: "__selectors";

METHOD_BODY :: (selector: Code, procedure_signature: Type, call := #caller_code) -> string {
    caller_nodes := compiler_get_nodes(call);
    assert(caller_nodes.kind == .PROCEDURE_CALL);
    caller_proc := cast(*Code_Procedure_Call, caller_nodes);
    
    parent_type_expression := caller_proc.arguments_unsorted[0].expression;
    
    selector_expression := caller_proc.arguments_unsorted[0].expression;
    function_signature_expression := caller_proc.arguments_unsorted[1].expression;
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

    _func_type_declaration : string;
    {
        builder: String_Builder;
        append(*builder, "_func: (");
        first_arg, rest_of_args : string;
        if contains(function_signature_substring, ","){
            _, first_arg, rest_of_args = split_from_left(function_signature_substring, ",");
        } else {
            _, first_arg, rest_of_args = split_from_left(function_signature_substring, ")");
            rest_of_args = tprint(")%", rest_of_args);
        }
        append(*builder, first_arg);
        append(*builder, ", selector: *void");

        if function_signature_arguments.count > 0 append(*builder, ", ");

        append(*builder, rest_of_args);
        append(*builder, " #c_call;");
        _func_type_declaration = builder_to_string(*builder);
    }

    _func_equals_msgSend :: "_func = xx objc_msgSend;";

    _func_call : string;
    {
        builder: String_Builder;
        append(*builder, "_func(");
        append(*builder, function_signature_arguments[0].name);
        append(*builder, ", ");
        print_expression(*builder, selector_expression);
        
        for 1..function_signature_arguments.count-1 {
            append(*builder, ", ");
            append(*builder, function_signature_arguments[it].name);
        }

        append(*builder, ");");
        _func_call = builder_to_string(*builder);
    }

    function_declaration : string;
    {
        builder: String_Builder;

        append(*builder, "\n\t");
        append(*builder, _func_type_declaration);
        append(*builder, "\n\t");
        append(*builder, _func_equals_msgSend);
        append(*builder, "\n\t");

        if function_signature_returns  append(*builder, "return ");

        append(*builder, _func_call);
        append(*builder, "\n");
        function_declaration = builder_to_string(*builder);
    }

    print("generated method body: \n%\n\n", function_declaration);

    return function_declaration;
}

