#scope_module

METHOD :: (parent: Code, name: string, type: Type, add_underscore := false, call := #caller_code) -> *Code_Ident #expand{

    Placeholder_Type :: struct {};

    template :: #code placeholder :: (self: *void)  {};

    body_template :: #code {
        _func: (obj: *void, selector: *void) -> Placeholder_Type #c_call;
        _func = xx objc_msgSend;
        return _func(self, __macro_generated_selectors.Placeholder);
    };

    #run {
        selector_name := ifx add_underscore then sprint("%_", name) else name; @METAL_SELECTOR 

        template_nodes := compiler_get_nodes(template);
        body_template_nodes := compiler_get_nodes(body_template);

        parent_nodes := compiler_get_nodes(parent);

        call_node := compiler_get_nodes(call);
        type_header : *Code_Procedure_Header;
        {
            assert(call_node.kind == .PROCEDURE_CALL);
            arg_2 := call_node.(*Code_Procedure_Call).arguments_unsorted[2];
            arg_2_expression := arg_2.expression;
            type_inst := ifx arg_2_expression.kind == .TYPE_INSTANTIATION {
                cast(*Code_Type_Instantiation, arg_2.expression);
            } else ifx arg_2_expression.kind == .DIRECTIVE_INSERT {
                directive_insert := cast(*Code_Directive_Insert, arg_2_expression);
                assert(directive_insert.expansion != null);
                cast(*Code_Type_Instantiation, directive_insert.expansion);
            }
            type_target := type_inst.type_directive_target;
            type_target_nodes := type_target.type_valued_expression;
            assert(type_target_nodes.kind == .PROCEDURE_HEADER);
            type_header = cast(*Code_Procedure_Header, type_target_nodes);
        }

        #if #exists(DEBUG_PRINT_FROM_MACRO) {
            {
                builder: String_Builder;
                print_expression(*builder, template_nodes);
                print("initial expression: %\n", builder_to_string(*builder));
            }
        }

        procedure_header: *Code_Procedure_Header;
        block: *Code_Block;

        // instantiate the procedure header
        {
            node := template_nodes;
            assert(node.kind == .DECLARATION);
            node.(*Code_Declaration).name = name;
            node = node.(*Code_Declaration).expression;
            assert(node.kind == .PROCEDURE_HEADER);
            procedure_header = node.(*Code_Procedure_Header);

            // copy over the arguments
            new_args := NewArray(type_header.arguments.count +1, *Code_Declaration, initialized = false);
            // set the self arg here
            new_args[0] = procedure_header.arguments[0];
            procedure_header.arguments = new_args;
            procedure_header.arguments[0].type_inst = xx parent_nodes;
            memcpy(new_args.data + 1, type_header.arguments.data, type_header.arguments.count * size_of(*Code_Declaration));

            // no need to copy the returns
            procedure_header.returns = type_header.returns;
        }

        {
            node := body_template_nodes;
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
            func_header.arguments[0].type_inst = xx parent_nodes;
            memcpy(new_args.data + 2, type_header.arguments.data, type_header.arguments.count * size_of(*Code_Declaration));
            
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
        }

        procedure_body := New(Code_Procedure_Body);
        procedure_body.block = block;
        procedure_body.header = procedure_header;

        procedure_header.body_or_null = procedure_body;

        #if #exists(DEBUG_PRINT_FROM_MACRO) {
            {
                builder: String_Builder;
                print_expression(*builder, template_nodes);
                print("final expression: %\n", builder_to_string(*builder));
            }
        }
    }
}

make_setter_name :: (prop_name: string) -> string {
    setter_name := sprint("get%", prop_name);
    setter_name[3] = to_upper(setter_name[3]);
    return setter_name;
}


PROP :: (parent: Code, prop_name: string, type: Type) #expand {
    METHOD(parent, prop_name, #insert #run tprint("#type () -> %;", type));
    METHOD(parent, #run make_setter_name(prop_name), #insert #run tprint("#type (prop: %) -> ();", type), true);
}


#import "Basic";
#import "Objective_C";
#import "Program_Print";  // For print_expression.
#import "Compiler";       // This defines compiler_get_nodes and compiler_get_code.
#import "String";
