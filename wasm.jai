/*  SDG                          Kingdom Core: WASM                               JJ */

wasm_exec :: (func_idx: u64, module: Wasm_Module) -> ok:bool, msg:string {
	stack : [..] Wasm_Stack_Entry; // @Incomplete reserve max_stack_size
	entries : [..] Type;
	frames : [..] Wasm_Stack_Frame;
	labels : [..] []Wasm_Label;
	trap: bool;

	current_function := func_idx;

	defer for frames free(it.locals_storage);

	while main_f := !trap {
		statement := module.functions[current_function];

		{ /* new stack frame for function call */
			new_frame : Wasm_Stack_Frame;
			{ /* init locals */
				array_resize(*new_frame.locals, statement.locals.count);
				new_frame.locals.count = statement.locals.count;
				new_frame.locals_storage = alloc(statement.locals_size);
				for statement.locals {
					if it_index == 0 continue;
					new_frame.locals[it_index] = new_frame.locals[it_index - 1] + size_of(it);
				}
			}
			new_frame.stack_length = stack.count;
			new_frame.statement = statement;
			array_add(*new_frame.locals, new_frame);
		}

		op_index := 0;
		while stmnt_f := op_index < statement.count {
			jumped := false;
			defer if !jumped op_index += 1;
			
			op := statement[op_index];
			if #complete op.instruction == {

				/* Control Flow Instructions */
				case .unreachable;
					trap = true;
					msg = "Reached the Unreachable Instruction. You assumed wrong, programmer.";
					break main_f;
				case .nop;
					continue;
				case .block;
					array_add(*labels, .{op_index, stack.count});
				case .loop;
					array_add(*labels, .{op_index, stack.count});
				case .if_;
					assert(stack.count != 0);
					operand := pop(stack)._s32; //pop_stack(*stack, s32); 
					
					if !operand {
						jumped = true;
						op_index = op.else_; // I THINK this is correct.
						continue; // else pushes the label
					}
					array_add(*labels, .{op_index, stack.count});
				case .else_;
					// @Incomplete(caleb): This should unwind the stack and check if there
					// is a return type
					array_add(*labels, .{op_index, stack.count});
				case .throw;
					assert(false); // not implemented (wasm 3.0)
				case .throw_ref;
					assert(false); // not implemented (wasm 3.0)
				case .end;
					// @Incomplete(caleb): This should unwind the stack and check if there
					// is a return type
					labels.count -= 1;
				case .br;
					jumped = true;
					op_index, stack.count = branch(op.label, labels, statement);
				case .br_if;
					operand := pop(stack)._s32; //pop_stack(*stack, s32);
					if operand {
						jumped = true;
						op_index, stack.count = branch(op.label, labels, statement);
					}
				case .br_table;
					operand := pop(stack)._u32; //pop_stack(*stack, u32);
					if operand >= op.labels.count {
						trap = true;
						msg = "bad branch label vector";
						break main_f;
						}
					br_label := op.labels[operand];				
					jumped = true;
					op_index, stack.count = branch(br_label, labels, statement);
				case .return_;
					assert(frames.count > 0);
					current_frame := frames[frames.count - 1];
					if current_frame.stack_length != stack.count {
						stack[current_frame.stack_length] = stack[stack.count -1];
						stack.count = current_frame.stack_length + 1;
					}
					frames.count -= 1;
					statement = current_frame.return_point;
					op_index = current_frame.op_index;
				case .call;
					current_function = op.func;
					continue main_f;
				case .call_indirect;
					operand := pop(stack)._s32; //pop_stack(*stack, s32);
					if operand >= module.tables.count {
						trap = true;
						msg = "bad call indirect index";
						break main_f;
					}
					table : *[][]Wasm_Funcref = module.tables[op.table];
					funcrefs := table.*[operand];
					
					funcref : Wasm_Funcref;
					found_funcref: bool;
					for funcrefs {
						if it.functype == module.types[op.type] {
							funcref = it;
							found_funcref = true;
						}
					}
					if !found_funcref {
						trap = true;
						msg = "bad call indirect funcref";
						break main_f;
					}

					if funcref.reftype == .Extern {
						// @Incomplete(caleb): figure out how to get input and output
						// types from type_info_struct
						assert(false);
					} else {
						current_function = funcref.index;
						continue main_f;
					}
				case .return_call;
					assert(false); // not implemented (wasm 3.0);
				case .return_call_indirect;
					assert(false); // not implemented(wasm 3.0);
				case .call_ref;
					assert(false); // not implemented(wasm 3.0);
				case .return_call_ref;
					assert(false); // not implemented(wasm 3.0);

				/* Parametric Instructions */
				case .drop;
					stack.count -= 1;
				case .select;
					operand := pop(stack)._s32; //pop_stack(*stack, s32);
					if operand  stack[stack.count -2] = stack[stack.count -1];
					stack.count -= 1;
				case .select_with_type;
					// @Incomplete(caleb): need some type checking here
					operand := pop(stack)._s32; //pop_stack(*stack, s32);
					if operand  stack[stack.count -2] = stack[stack.count -1];
					stack.count -= 1;
				
					
			}
		} 
	}
}

// can we insert this into the above somehow as a macro?
trap_assert :: (assertion: bool, message: string) {
	trap = assertion;
	if trap msg = message;
	if trap break main_f;
}

trap_assert_type :: (type: Type, message: string) {
	// check top of stack types
}

/*
pop_stack :: (stack: *[]u32, type: Type) -> Type {
	num_words := size_of(type) / 4;
	defer stack.count -= num_words;

	op_ptr := stack.data + stack.count - num_words;
	return << cast(elem_type) op_ptr;	
}
*/

// actually I don't think we need these at all
// I'm sure there's a more elegant way to do this, but I don't rightly know it.
/*
pop_stack :: (stack: *[]Wasm_Stack_Entry, type: Type) -> Type {

	stack_top := pop(stack);
	
	if type == {
		case u32;        return stack_top._u32;
		case s32;        return stack_top._s32;
		case float;      return stack_top._f32;
		case float32;    return stack_top._f32;
		case u64;        return stack_top._u64;
		case int;        return stack_top._s64;
		case float64;    return stack_top._f64;

		// simd type (v128)
		case v128;       return stack_top._v128;
		// case [16]u8;     return stack_op._u8x16;        
		// case [16]s8;     return stack_op._s8x16;
		// case [8]u16;     return stack_op._u16x8;
		// case [8]s16;     return stack_op._s16x8;
		// case [4]u32;     return stack_op._u32x4;
		// case [4]s32;     return stack_op._s32x4;
		// case [4]float32; return stack_op._f32x4;
		// case [2]u64;     return stack_op._u64x4;
		// case [2]s64;     return stack_op._s64x4;
		// case [2]float64; return stack_op._f64x4;

		case; assert(false); // invalid type
	}
}


push_stack :: (stack: *[]Wasm_Stack_Entry, type: Type, value: Any)  {
	stack_top : Wasm_Stack_Entry;
	defer array_add(stack, stack_top);

	if type == {
		case u32;        stack_top._u32 = value;
		case s32;        stack_top._s32 = value;
		case float;      stack_top._f32 = value;
		case float32;    stack_top._f32 = value;
		case u64;        stack_top._u64 = value;
		case int;        stack_top._s64 = value;
		case float64;    stack_top._f64 = value;

		// simd type (v128)
		case v128;       stack_top._v128 = value;
		// case [16]u8;     stack_op._u8x1 = value6;        
		// case [16]s8;     stack_op._s8x1 = value6;
		// case [8]u16;     stack_op._u16x = value8;
		// case [8]s16;     stack_op._s16x = value8;
		// case [4]u32;     stack_op._u32x = value4;
		// case [4]s32;     stack_op._s32x = value4;
		// case [4]float32; stack_op._f32x = value4;
		// case [2]u64;     stack_op._u64x = value4;
		// case [2]s64;     stack_op._s64x = value4;
		// case [2]float64; stack_op._f64x = value4;

		case; assert(false); // invalid type
	}
}
*/

branch :: (br_label: u32, labels: []Wasm_Label, statement: []Wasm_Operation) -> op_index: int, stack_length: int {
	
	// in order from the end from the labels array back
	branch_label := labels[labels.count - 1 - br_label];
	branch_point := statement[branch_label.statement];

	if branch_point.op == {
		case .block;
			return branch_point.end, branch_label.stack_length;
		case .if_;
			return branch_point.end, branch_label.stack_length;
		case .loop;
			return branch_index + 1, branch_label.stack_length; // don't want to add the label again
		case;
			print("Bad branch!! to op %", branch_point.op);
			assert(false);
	}
}



/*                               Typedefs and Enums                                  */

Wasm_Type :: enum u8 #specified {
	// positive numbers are type indices

	// numeric types
	i32            :: 0x7F;
	i64            :: 0x7E;
	f32            :: 0x7D;
	f64            :: 0x7C;
	v128_          :: 0x7B;

	// packed types
	i8             :: 0x78;
	i16            :: 0x77;

	// heap types
	noexn          :: 0x74;
	nofunc         :: 0x73;
	noextern       :: 0x72;
	none           :: 0x71;
	func           :: 0x70;
	extern         :: 0x6F;
	any            :: 0x6E;
	eq             :: 0x6D;
	i31            :: 0x6C;
	struct_        :: 0x6B;
	array          :: 0x6A;
	exn            :: 0x69;

	// reference types
	ref            :: 0x64;
	ref_null       :: 0x63;

	// composite type
	func           :: 0x60; // func [valtype*] → [valtype*]
	struct_field   :: 0x5F; // struct fieldtype* 
	array_index    :: 0x5E; // array fieldtype

	// recursive types (we probably aren't supporting these)
	subtype        :: 0x50;
	subtype_final  :: 0x4F;
	recursive_type :: 0x4E;

	// result type 
	result         :: 0x40;
}


Wasm_Instruction :: enum u8 #specified {
	unreachable          :: 0x00; // [𝑡* 1] → [𝑡* 2] 
	nop                  :: 0x01; // [] → [] 
	block                :: 0x02; // [𝑡* 1] → [𝑡* 2] 
	loop                 :: 0x03; // [𝑡* 1] → [𝑡* 2] 
	if_                  :: 0x04; // [𝑡* 1 i32] → [𝑡* 2] 
	else_                :: 0x05;
	throw                :: 0x08; // [𝑡* 1 𝑡* 𝑥] → [𝑡* 2] 
	throw_ref            :: 0x0A; // [𝑡* 1 exnref] → [𝑡* 2] 
	end                  :: 0x0B;
	br                   :: 0x0C; // [𝑡* 1 𝑡*] → [𝑡* 2] 
	br_if                :: 0x0D; // [𝑡* i32] → [𝑡*] 
	br_table             :: 0x0E; // [𝑡* 1 𝑡* i32] → [𝑡* 2] 
	return_               :: 0x0F; // [𝑡* 1 𝑡*] → [𝑡* 2] 
	call                 :: 0x10; // [𝑡* 1] → [𝑡* 2] 
	call_indirect        :: 0x11; // [𝑡* 1 i32] → [𝑡* 2] 
	return_call          :: 0x12; // [𝑡* 1] → [𝑡* 2] 
	return_call_indirect :: 0x13; // [𝑡* 1 i32] → [𝑡* 2] 
	call_ref             :: 0x14; // [𝑡* 1 (ref null 𝑥)] → [𝑡* 2] 
	return_call_ref      :: 0x15; // [𝑡* 1 (ref null 𝑥)] → [𝑡* 2] 
	drop                 :: 0x1A; // [𝑡] → [] 
	select               :: 0x1B; // [𝑡 𝑡 i32] → [𝑡] 
	select_with_type     :: 0x1C; // [𝑡 𝑡 i32] → [𝑡] 
	try_table            :: 0x1F; // [𝑡* 1] → [𝑡* 2] 
	local_get            :: 0x20; // [] → [𝑡] 
	local_set            :: 0x21; // [𝑡] → [] 
	local_tee            :: 0x22; // [𝑡] → [𝑡] 
	global_get           :: 0x23; // [] → [𝑡] 
	global_set           :: 0x24; // [𝑡] → [] 
	table_get            :: 0x25; // [i32] → [𝑡] 
	table_set            :: 0x26; // [i32 𝑡] → [] 
	i32_load             :: 0x28; // [i32] → d[i32] 
	i64_load             :: 0x29; // [i32] → [i64] 
	f32_load             :: 0x2A; // [i32] → [f32] 
	f64_load             :: 0x2B; // [i32] → [f64] 
	i32_load8_s          :: 0x2C; // [i32] → [i32] 
	i32_load8_u          :: 0x2D; // [i32] → [i32] 
	i32_load16_s         :: 0x2E; // [i32] → [i32] 
	i32_load16_u         :: 0x2F; // [i32] → [i32] 
	i64_load8_s          :: 0x30; // [i32] → [i64] 
	i64_load8_u          :: 0x31; // [i32] → [i64] 
	i64_load16_s         :: 0x32; // [i32] → [i64] 
	i64_load16_u         :: 0x33; // [i32] → [i64] 
	i64_load32_s         :: 0x34; // [i32] → [i64] 
	i64_load32_u         :: 0x35; // [i32] → [i64] 
	i32_store            :: 0x36; // [i32 i32] → [] 
	i64_store            :: 0x37; // [i32 i64] → [] 
	f32_store            :: 0x38; // [i32 f32] → [] 
	f64_store            :: 0x39; // [i32 f64] → [] 
	i32_store8           :: 0x3A; // [i32 i32] → [] 
	i32_store16          :: 0x3B; // [i32 i32] → [] 
	i64_store8           :: 0x3C; // [i32 i64] → [] 
	i64_store16          :: 0x3D; // [i32 i64] → [] 
	i64_store32          :: 0x3E; // [i32 i64] → [] 
	memory_size          :: 0x3F; // [] → [i32] 
	memory_grow          :: 0x40; // [i32] → [i32] 
	i32_const            :: 0x41; // [] → [i32] 
	i64_const            :: 0x42; // [] → [i64] 
	f32_const            :: 0x43; // [] → [f32] 
	f64_const            :: 0x44; // [] → [f64] 
	i32_eqz              :: 0x45; // [i32] → [i32] 
	i32_eq               :: 0x46; // [i32 i32] → [i32] 
	i32_ne               :: 0x47; // [i32 i32] → [i32] 
	i32_lt_s             :: 0x48; // [i32 i32] → [i32] 
	i32_lt_u             :: 0x49; // [i32 i32] → [i32] 
	i32_gt_s             :: 0x4A; // [i32 i32] → [i32] 
	i32_gt_u             :: 0x4B; // [i32 i32] → [i32] 
	i32_le_s             :: 0x4C; // [i32 i32] → [i32] 
	i32_le_u             :: 0x4D; // [i32 i32] → [i32] 
	i32_ge_s             :: 0x4E; // [i32 i32] → [i32] 
	i32_ge_u             :: 0x4F; // [i32 i32] → [i32] 
	i64_eqz              :: 0x50; // [i64] → [i32] 
	i64_eq               :: 0x51; // [i64 i64] → [i32] 
	i64_ne               :: 0x52; // [i64 i64] → [i32] 
	i64_lt_s             :: 0x53; // [i64 i64] → [i32] 
	i64_lt_u             :: 0x54; // [i64 i64] → [i32] 
	i64_gt_s             :: 0x55; // [i64 i64] → [i32] 
	i64_gt_u             :: 0x56; // [i64 i64] → [i32] 
	i64_le_s             :: 0x57; // [i64 i64] → [i32] 
	i64_le_u             :: 0x58; // [i64 i64] → [i32] 
	i64_ge_s             :: 0x59; // [i64 i64] → [i32] 
	i64_ge_u             :: 0x5A; // [i64 i64] → [i32] 
	f32_eq               :: 0x5B; // [f32 f32] → [i32] 
	f32_ne               :: 0x5C; // [f32 f32] → [i32] 
	f32_lt               :: 0x5D; // [f32 f32] → [i32] 
	f32_gt               :: 0x5E; // [f32 f32] → [i32] 
	f32_le               :: 0x5F; // [f32 f32] → [i32] 
	f32_ge               :: 0x60; // [f32 f32] → [i32] 
	f64_eq               :: 0x61; // [f64 f64] → [i32] 
	f64_ne               :: 0x62; // [f64 f64] → [i32] 
	f64_lt               :: 0x63; // [f64 f64] → [i32] 
	f64_gt               :: 0x64; // [f64 f64] → [i32] 
	f64_le               :: 0x65; // [f64 f64] → [i32] 
	f64_ge               :: 0x66; // [f64 f64] → [i32] 
	i32_clz              :: 0x67; // [i32] → [i32] 
	i32_ctz              :: 0x68; // [i32] → [i32] 
	i32_popcnt           :: 0x69; // [i32] → [i32] 
	i32_add              :: 0x6A; // [i32 i32] → [i32] 
	i32_sub              :: 0x6B; // [i32 i32] → [i32] 
	i32_mul              :: 0x6C; // [i32 i32] → [i32] 
	i32_div_s            :: 0x6D; // [i32 i32] → [i32] 
	i32_div_u            :: 0x6E; // [i32 i32] → [i32] 
	i32_rem_s            :: 0x6F; // [i32 i32] → [i32] 
	i32_rem_u            :: 0x70; // [i32 i32] → [i32] 
	i32_and              :: 0x71; // [i32 i32] → [i32] 
	i32_or               :: 0x72; // [i32 i32] → [i32] 
	i32_xor              :: 0x73; // [i32 i32] → [i32] 
	i32_shl              :: 0x74; // [i32 i32] → [i32] 
	i32_shr_s            :: 0x75; // [i32 i32] → [i32] 
	i32_shr_u            :: 0x76; // [i32 i32] → [i32] 
	i32_rotl             :: 0x77; // [i32 i32] → [i32] 
	i32_rotr             :: 0x78; // [i32 i32] → [i32] 
	i64_clz              :: 0x79; // [i64] → [i64] 
	i64_ctz              :: 0x7A; // [i64] → [i64] 
	i64_popcnt           :: 0x7B; // [i64] → [i64] 
	i64_add              :: 0x7C; // [i64 i64] → [i64] 
	i64_sub              :: 0x7D; // [i64 i64] → [i64] 
	i64_mul              :: 0x7E; // [i64 i64] → [i64] 
	i64_div_s            :: 0x7F; // [i64 i64] → [i64] 
	i64_div_u            :: 0x80; // [i64 i64] → [i64] 
	i64_rem_s            :: 0x81; // [i64 i64] → [i64] 
	i64_rem_u            :: 0x82; // [i64 i64] → [i64] 
	i64_and              :: 0x83; // [i64 i64] → [i64] 
	i64_or               :: 0x84; // [i64 i64] → [i64] 
	i64_xor              :: 0x85; // [i64 i64] → [i64] 
	i64_shl              :: 0x86; // [i64 i64] → [i64] 
	i64_shr_s            :: 0x87; // [i64 i64] → [i64] 
	i64_shr_u            :: 0x88; // [i64 i64] → [i64] 
	i64_rotl             :: 0x89; // [i64 i64] → [i64] 
	i64_rotr             :: 0x8A; // [i64 i64] → [i64] 
	f32_abs              :: 0x8B; // [f32] → [f32] 
	f32_neg              :: 0x8C; // [f32] → [f32] 
	f32_ceil             :: 0x8D; // [f32] → [f32] 
	f32_floor            :: 0x8E; // [f32] → [f32] 
	f32_trunc            :: 0x8F; // [f32] → [f32] 
	f32_nearest          :: 0x90; // [f32] → [f32] 
	f32_sqrt             :: 0x91; // [f32] → [f32] 
	f32_add              :: 0x92; // [f32 f32] → [f32] 
	f32_sub              :: 0x93; // [f32 f32] → [f32] 
	f32_mul              :: 0x94; // [f32 f32] → [f32] 
	f32_div              :: 0x95; // [f32 f32] → [f32] 
	f32_min              :: 0x96; // [f32 f32] → [f32] 
	f32_max              :: 0x97; // [f32 f32] → [f32] 
	f32_copysign         :: 0x98; // [f32 f32] → [f32] 
	f64_abs              :: 0x99; // [f64] → [f64] 
	f64_neg              :: 0x9A; // [f64] → [f64] 
	f64_ceil             :: 0x9B; // [f64] → [f64] 
	f64_floor            :: 0x9C; // [f64] → [f64] 
	f64_trunc            :: 0x9D; // [f64] → [f64] 
	f64_nearest          :: 0x9E; // [f64] → [f64] 
	f64_sqrt             :: 0x9F; // [f64] → [f64] 
	f64_add              :: 0xA0; // [f64 f64] → [f64] 
	f64_sub              :: 0xA1; // [f64 f64] → [f64] 
	f64_mul              :: 0xA2; // [f64 f64] → [f64] 
	f64_div              :: 0xA3; // [f64 f64] → [f64] 
	f64_min              :: 0xA4; // [f64 f64] → [f64] 
	f64_max              :: 0xA5; // [f64 f64] → [f64] 
	f64_copysign         :: 0xA6; // [f64 f64] → [f64] 
	i32_wrap_i64         :: 0xA7; // [i64] → [i32] 
	i32_trunc_f32_s      :: 0xA8; // [f32] → [i32] 
	i32_trunc_f32_u      :: 0xA9; // [f32] → [i32] 
	i32_trunc_f64_s      :: 0xAA; // [f64] → [i32] 
	i32_trunc_f64_u      :: 0xAB; // [f64] → [i32] 
	i64_extend_i32_s     :: 0xAC; // [i32] → [i64] 
	i64_extend_i32_u     :: 0xAD; // [i32] → [i64] 
	i64_trunc_f32_s      :: 0xAE; // [f32] → [i64] 
	i64_trunc_f32_u      :: 0xAF; // [f32] → [i64] 
	i64_trunc_f64_s      :: 0xB0; // [f64] → [i64] 
	i64_trunc_f64_u      :: 0xB1; // [f64] → [i64] 
	f32_convert_i32_s    :: 0xB2; // [i32] → [f32] 
	f32_convert_i32_u    :: 0xB3; // [i32] → [f32] 
	f32_convert_i64_s    :: 0xB4; // [i64] → [f32] 
	f32_convert_i64_u    :: 0xB5; // [i64] → [f32] 
	f32_demote_f64       :: 0xB6; // [f64] → [f32] 
	f64_convert_i32_s    :: 0xB7; // [i32] → [f64] 
	f64_convert_i32_u    :: 0xB8; // [i32] → [f64] 
	f64_convert_i64_s    :: 0xB9; // [i64] → [f64] 
	f64_convert_i64_u    :: 0xBA; // [i64] → [f64] 
	f64_promote_f32      :: 0xBB; // [f32] → [f64] 
	i32_reinterpret_f32  :: 0xBC; // [f32] → [i32] 
	i64_reinterpret_f64  :: 0xBD; // [f64] → [i64] 
	f32_reinterpret_i32  :: 0xBE; // [i32] → [f32] 
	f64_reinterpret_i64  :: 0xBF; // [i64] → [f64] 
	i32_extend8_s        :: 0xC0; // [i32] → [i32] 
	i32_extend16_s       :: 0xC1; // [i32] → [i32] 
	i64_extend8_s        :: 0xC2; // [i64] → [i64] 
	i64_extend16_s       :: 0xC3; // [i64] → [i64] 
	i64_extend32_s       :: 0xC4; // [i64] → [i64] 
	ref_null             :: 0xD0; // [] → [(ref null ht)] 
	ref_is_null          :: 0xD1; // [(ref null ht)] → [i32] 
	ref_func             :: 0xD2; // [] → [ref ht] 
	ref_eq               :: 0xD3; // [eqref eqref] → [i32] 
	ref_as_non_null      :: 0xD4; // [(ref null ht)] → [(ref ht)] 
	br_on_null           :: 0xD5; // [𝑡* (ref null ht)] → [𝑡* (ref ht)] 
	br_on_non_null       :: 0xD6; // [𝑡* (ref null ht)] → [𝑡*] 
	aggregate_op         :: 0xFB; // probably will not implement
	table_op             :: 0xFC; // MAY implment
	vector_op            :: 0xFD; // MUST implement
	atomic_op            :: 0xFE; // MUST implement
}


Wasm_Table_Opcode :: enum u32 #specified {
	i32_trunc_sat_f32_s :: 0x00; // [f32] → [i32] validation execution
	i32_trunc_sat_f32_u :: 0x01; // [f32] → [i32] validation execution
	i32_trunc_sat_f64_s :: 0x02; // [f64] → [i32] validation execution
	i32_trunc_sat_f64_u :: 0x03; // [f64] → [i32] validation execution
	i64_trunc_sat_f32_s :: 0x04; // [f32] → [i64] validation execution
	i64_trunc_sat_f32_u :: 0x05; // [f32] → [i64] validation execution
	i64_trunc_sat_f64_s :: 0x06; // [f64] → [i64] validation execution
	i64_trunc_sat_f64_u :: 0x07; // [f64] → [i64] validation execution
	memory_init         :: 0x08; // [i32 i32 i32] → [] validation execution
	data_drop           :: 0x09; // [] → [] validation execution
	memory_copy         :: 0x0A; // [i32 i32 i32] → [] validation execution
	memory_fill         :: 0x0B; // [i32 i32 i32] → [] validation execution
	table_init          :: 0x0C; // [i32 i32 i32] → [] validation execution
	elem_drop           :: 0x0D; // [] → [] validation execution
	table_copy          :: 0x0E; // [i32 i32 i32] → [] validation execution
	table_grow          :: 0x0F; // [𝑡 i32] → [i32] validation execution
	table_size          :: 0x10; // [] → [i32] validation execution
	table_fill          :: 0x11; // [i32 𝑡 i32] → [] 
}


Wasm_Vector_Opcode :: enum u32 #specified {
	v128_load                           :: 0x00; // [i32] → [v128] 
	v128_load8x8_s                      :: 0x01; // [i32] → [v128] 
	v128_load8x8_u                      :: 0x02; // [i32] → [v128] 
	v128_load16x4_s                     :: 0x03; // [i32] → [v128] 
	v128_load16x4_u                     :: 0x04; // [i32] → [v128] 
	v128_load32x2_s                     :: 0x05; // [i32] → [v128] 
	v128_load32x2_u                     :: 0x06; // [i32] → [v128] 
	v128_load8_splat                    :: 0x07; // [i32] → [v128] 
	v128_load16_splat                   :: 0x08; // [i32] → [v128] 
	v128_load32_splat                   :: 0x09; // [i32] → [v128] 
	v128_load64_splat                   :: 0x0A; // [i32] → [v128] 
	v128_store                          :: 0x0B; // [i32 v128] → [] 
	v128_const                          :: 0x0C; // [] → [v128] 
	i8x16_shuffle                       :: 0x0D; // [v128 v128] → [v128] 
	i8x16_swizzle                       :: 0x0E; // [v128 v128] → [v128] 
	i8x16_splat                         :: 0x0F; // [i32] → [v128] 
	i16x8_splat                         :: 0x10; // [i32] → [v128] 
	i32x4_splat                         :: 0x11; // [i32] → [v128] 
	i64x2_splat                         :: 0x12; // [i64] → [v128] 
	f32x4_splat                         :: 0x13; // [f32] → [v128] 
	f64x2_splat                         :: 0x14; // [f64] → [v128] 
	i8x16_extract_lane_s                :: 0x15; // [v128] → [i32] 
	i8x16_extract_lane_u                :: 0x16; // [v128] → [i32] 
	i8x16_replace_lane                  :: 0x17; // [v128 i32] → [v128] 
	i16x8_extract_lane_s                :: 0x18; // [v128] → [i32] 
	i16x8_extract_lane_u                :: 0x19; // [v128] → [i32] 
	i16x8_replace_lane                  :: 0x1A; // [v128 i32] → [v128] 
	i32x4_extract_lane                  :: 0x1B; // [v128] → [i32] 
	i32x4_replace_lane                  :: 0x1C; // [v128 i32] → [v128] 
	i64x2_extract_lane                  :: 0x1D; // [v128] → [i64] 
	i64x2_replace_lane                  :: 0x1E; // [v128 i64] → [v128] 
	f32x4_extract_lane                  :: 0x1F; // [v128] → [f32] 
	f32x4_replace_lane                  :: 0x20; // [v128 f32] → [v128] 
	f64x2_extract_lane                  :: 0x21; // [v128] → [f64] 
	f64x2_replace_lane                  :: 0x22; // [v128 f64] → [v128] 
	i8x16_eq                            :: 0x23; // [v128 v128] → [v128] 
	i8x16_ne                            :: 0x24; // [v128 v128] → [v128] 
	i8x16_lt_s                          :: 0x25; // [v128 v128] → [v128] 
	i8x16_lt_u                          :: 0x26; // [v128 v128] → [v128] 
	i8x16_gt_s                          :: 0x27; // [v128 v128] → [v128] 
	i8x16_gt_u                          :: 0x28; // [v128 v128] → [v128] 
	i8x16_le_s                          :: 0x29; // [v128 v128] → [v128] 
	i8x16_le_u                          :: 0x2A; // [v128 v128] → [v128] 
	i8x16_ge_s                          :: 0x2B; // [v128 v128] → [v128] 
	i8x16_ge_u                          :: 0x2C; // [v128 v128] → [v128] 
	i16x8_eq                            :: 0x2D; // [v128 v128] → [v128] 
	i16x8_ne                            :: 0x2E; // [v128 v128] → [v128] 
	i16x8_lt_s                          :: 0x2F; // [v128 v128] → [v128] 
	i16x8_lt_u                          :: 0x30; // [v128 v128] → [v128] 
	i16x8_gt_s                          :: 0x31; // [v128 v128] → [v128] 
	i16x8_gt_u                          :: 0x32; // [v128 v128] → [v128] 
	i16x8_le_s                          :: 0x33; // [v128 v128] → [v128] 
	i16x8_le_u                          :: 0x34; // [v128 v128] → [v128] 
	i16x8_ge_s                          :: 0x35; // [v128 v128] → [v128] 
	i16x8_ge_u                          :: 0x36; // [v128 v128] → [v128] 
	i32x4_eq                            :: 0x37; // [v128 v128] → [v128] 
	i32x4_ne                            :: 0x38; // [v128 v128] → [v128] 
	i32x4_lt_s                          :: 0x39; // [v128 v128] → [v128] 
	i32x4_lt_u                          :: 0x3A; // [v128 v128] → [v128] 
	i32x4_gt_s                          :: 0x3B; // [v128 v128] → [v128] 
	i32x4_gt_u                          :: 0x3C; // [v128 v128] → [v128] 
	i32x4_le_s                          :: 0x3D; // [v128 v128] → [v128] 
	i32x4_le_u                          :: 0x3E; // [v128 v128] → [v128] 
	i32x4_ge_s                          :: 0x3F; // [v128 v128] → [v128] 
	i32x4_ge_u                          :: 0x40; // [v128 v128] → [v128] 
	f32x4_eq                            :: 0x41; // [v128 v128] → [v128] 
	f32x4_ne                            :: 0x42; // [v128 v128] → [v128] 
	f32x4_lt                            :: 0x43; // [v128 v128] → [v128] 
	f32x4_gt                            :: 0x44; // [v128 v128] → [v128] 
	f32x4_le                            :: 0x45; // [v128 v128] → [v128] 
	f32x4_ge                            :: 0x46; // [v128 v128] → [v128] 
	f64x2_eq                            :: 0x47; // [v128 v128] → [v128] 
	f64x2_ne                            :: 0x48; // [v128 v128] → [v128] 
	f64x2_lt                            :: 0x49; // [v128 v128] → [v128] 
	f64x2_gt                            :: 0x4A; // [v128 v128] → [v128] 
	f64x2_le                            :: 0x4B; // [v128 v128] → [v128] 
	f64x2_ge                            :: 0x4C; // [v128 v128] → [v128] 
	v128_not                            :: 0x4D; // [v128] → [v128] 
	v128_and                            :: 0x4E; // [v128 v128] → [v128] 
	v128_andnot                         :: 0x4F; // [v128 v128] → [v128] 
	v128_or                             :: 0x50; // [v128 v128] → [v128] 
	v128_xor                            :: 0x51; // [v128 v128] → [v128] 
	v128_bitselect                      :: 0x52; // [v128 v128 v128] → [v128] 
	v128_any_true                       :: 0x53; // [v128] → [i32] 
	v128_load8_lane                     :: 0x54; // [i32 v128] → [v128] 
	v128_load16_lane                    :: 0x55; // [i32 v128] → [v128] 
	v128_load32_lane                    :: 0x56; // [i32 v128] → [v128] 
	v128_load64_lane                    :: 0x57; // [i32 v128] → [v128] 
	v128_store8_lane                    :: 0x58; // [i32 v128] → [] 
	v128_store16_lane                   :: 0x59; // [i32 v128] → [] 
	v128_store32_lane                   :: 0x5A; // [i32 v128] → [] 
	v128_store64_lane                   :: 0x5B; // [i32 v128] → [] 
	v128_load32_zero                    :: 0x5C; // [i32] → [v128] 
	v128_load64_zero                    :: 0x5D; // [i32] → [v128] 
	f32x4_demote_f64x2_zero             :: 0x5E; // [v128] → [v128] 
	f64x2_promote_low_f32x4             :: 0x5F; // [v128] → [v128] 
	i8x16_abs                           :: 0x60; // [v128] → [v128] 
	i8x16_neg                           :: 0x61; // [v128] → [v128] 
	i8x16_popcnt                        :: 0x62; // [v128] → [v128] 
	i8x16_all_true                      :: 0x63; // [v128] → [i32] 
	i8x16_bitmask                       :: 0x64; // [v128] → [i32] 
	i8x16_narrow_i16x8_s                :: 0x65; // [v128 v128] → [v128] 
	i8x16_narrow_i16x8_u                :: 0x66; // [v128 v128] → [v128] 
	f32x4_ceil                          :: 0x67; // [v128] → [v128] 
	f32x4_floor                         :: 0x68; // [v128] → [v128] 
	f32x4_trunc                         :: 0x69; // [v128] → [v128] 
	f32x4_nearest                       :: 0x6A; // [v128] → [v128] 
	i8x16_shl                           :: 0x6B; // [v128 i32] → [v128] 
	i8x16_shr_s                         :: 0x6C; // [v128 i32] → [v128] 
	i8x16_shr_u                         :: 0x6D; // [v128 i32] → [v128] 
	i8x16_add                           :: 0x6E; // [v128 v128] → [v128] 
	i8x16_add_sat_s                     :: 0x6F; // [v128 v128] → [v128] 
	i8x16_add_sat_u                     :: 0x70; // [v128 v128] → [v128] 
	i8x16_sub                           :: 0x71; // [v128 v128] → [v128] 
	i8x16_sub_sat_s                     :: 0x72; // [v128 v128] → [v128] 
	i8x16_sub_sat_u                     :: 0x73; // [v128 v128] → [v128] 
	f64x2_ceil                          :: 0x74; // [v128] → [v128] 
	f64x2_floor                         :: 0x75; // [v128] → [v128] 
	i8x16_min_s                         :: 0x76; // [v128 v128] → [v128] 
	i8x16_min_u                         :: 0x77; // [v128 v128] → [v128] 
	i8x16_max_s                         :: 0x78; // [v128 v128] → [v128] 
	i8x16_max_u                         :: 0x79; // [v128 v128] → [v128] 
	f64x2_trunc                         :: 0x7A; // [v128] → [v128] 
	i8x16_avgr_u                        :: 0x7B; // [v128 v128] → [v128] 
	i16x8_extadd_pairwise_i8x16_s       :: 0x7C; // [v128] → [v128] 
	i16x8_extadd_pairwise_i8x16_u       :: 0x7D; // [v128] → [v128] 
	i32x4_extadd_pairwise_i16x8_s       :: 0x7E; // [v128] → [v128] 
	i32x4_extadd_pairwise_i16x8_u       :: 0x7F; // [v128] → [v128]
    
    // NOTE(caleb): multibyte op-codes here
	i16x8_abs                           :: 0x8001; // [v128] → [v128] 
	i16x8_neg                           :: 0x8101; // [v128] → [v128] 
	i16x8_q15mulr_sat_s                 :: 0x8201; // [v128 v128] → [v128] 
	i16x8_all_true                      :: 0x8301; // [v128] → [i32] 
	i16x8_bitmask                       :: 0x8401; // [v128] → [i32] 
	i16x8_narrow_i32x4_s                :: 0x8501; // [v128 v128] → [v128] 
	i16x8_narrow_i32x4_u                :: 0x8601; // [v128 v128] → [v128] 
	i16x8_extend_low_i8x16_s            :: 0x8701; // [v128] → [v128] 
	i16x8_extend_high_i8x16_s           :: 0x8801; // [v128] → [v128] 
	i16x8_extend_low_i8x16_u            :: 0x8901; // [v128] → [v128] 
	i16x8_extend_high_i8x16_u           :: 0x8A01; // [v128] → [v128] 
	i16x8_shl                           :: 0x8B01; // [v128 i32] → [v128] 
	i16x8_shr_s                         :: 0x8C01; // [v128 i32] → [v128] 
	i16x8_shr_u                         :: 0x8D01; // [v128 i32] → [v128] 
	i16x8_add                           :: 0x8E01; // [v128 v128] → [v128] 
	i16x8_add_sat_s                     :: 0x8F01; // [v128 v128] → [v128] 
	i16x8_add_sat_u                     :: 0x9001; // [v128 v128] → [v128] 
	i16x8_sub                           :: 0x9101; // [v128 v128] → [v128] 
	i16x8_sub_sat_s                     :: 0x9201; // [v128 v128] → [v128] 
	i16x8_sub_sat_u                     :: 0x9301; // [v128 v128] → [v128] 
	f64x2_nearest                       :: 0x9401; // [v128] → [v128] 
	i16x8_mul                           :: 0x9501; // [v128 v128] → [v128] 
	i16x8_min_s                         :: 0x9601; // [v128 v128] → [v128] 
	i16x8_min_u                         :: 0x9701; // [v128 v128] → [v128] 
	i16x8_max_s                         :: 0x9801; // [v128 v128] → [v128] 
	i16x8_max_u                         :: 0x9901; // [v128 v128] → [v128] 
	i16x8_avgr_u                        :: 0x9B01; // [v128 v128] → [v128] 
	i16x8_extmul_low_i8x16_s            :: 0x9C01; // [v128 v128] → [v128] 
	i16x8_extmul_high_i8x16_s           :: 0x9D01; // [v128 v128] → [v128] 
	i16x8_extmul_low_i8x16_u            :: 0x9E01; // [v128 v128] → [v128] 
	i16x8_extmul_high_i8x16_u           :: 0x9F01; // [v128 v128] → [v128] 
	i32x4_abs                           :: 0xA001; // [v128] → [v128] 
	i32x4_neg                           :: 0xA101; // [v128] → [v128] 
	i32x4_all_true                      :: 0xA301; // [v128] → [i32] 
	i32x4_bitmask                       :: 0xA401; // [v128] → [i32] 
	i32x4_extend_low_i16x8_s            :: 0xA701; // [v128] → [v128] 
	i32x4_extend_high_i16x8_s           :: 0xA801; // [v128] → [v128] 
	i32x4_extend_low_i16x8_u            :: 0xA901; // [v128] → [v128] 
	i32x4_extend_high_i16x8_u           :: 0xAA01; // [v128] → [v128] 
	i32x4_shl                           :: 0xAB01; // [v128 i32] → [v128] 
	i32x4_shr_s                         :: 0xAC01; // [v128 i32] → [v128] 
	i32x4_shr_u                         :: 0xAD01; // [v128 i32] → [v128] 
	i32x4_add                           :: 0xAE01; // [v128 v128] → [v128] 
	i32x4_sub                           :: 0xB101; // [v128 v128] → [v128] 
	i32x4_mul                           :: 0xB501; // [v128 v128] → [v128] 
	i32x4_min_s                         :: 0xB601; // [v128 v128] → [v128] 
	i32x4_min_u                         :: 0xB701; // [v128 v128] → [v128] 
	i32x4_max_s                         :: 0xB801; // [v128 v128] → [v128] 
	i32x4_max_u                         :: 0xB901; // [v128 v128] → [v128] 
	i32x4_dot_i16x8_s                   :: 0xBA01; // [v128 v128] → [v128] 
	i32x4_extmul_low_i16x8_s            :: 0xBC01; // [v128 v128] → [v128] 
	i32x4_extmul_high_i16x8_s           :: 0xBD01; // [v128 v128] → [v128] 
	i32x4_extmul_low_i16x8_u            :: 0xBE01; // [v128 v128] → [v128] 
	i32x4_extmul_high_i16x8_u           :: 0xBF01; // [v128 v128] → [v128] 
	i64x2_abs                           :: 0xC001; // [v128] → [v128] 
	i64x2_neg                           :: 0xC101; // [v128] → [v128] 
	i64x2_all_true                      :: 0xC301; // [v128] → [i32] 
	i64x2_bitmask                       :: 0xC401; // [v128] → [i32] 
	i64x2_extend_low_i32x4_s            :: 0xC701; // [v128] → [v128] 
	i64x2_extend_high_i32x4_s           :: 0xC801; // [v128] → [v128] 
	i64x2_extend_low_i32x4_u            :: 0xC901; // [v128] → [v128] 
	i64x2_extend_high_i32x4_u           :: 0xCA01; // [v128] → [v128] 
	i64x2_shl                           :: 0xCB01; // [v128 i32] → [v128] 
	i64x2_shr_s                         :: 0xCC01; // [v128 i32] → [v128] 
	i64x2_shr_u                         :: 0xCD01; // [v128 i32] → [v128] 
	i64x2_add                           :: 0xCE01; // [v128 v128] → [v128] 
	i64x2_sub                           :: 0xD101; // [v128 v128] → [v128] 
	i64x2_mul                           :: 0xD501; // [v128 v128] → [v128] 
	i64x2_eq                            :: 0xD601; // [v128 v128] → [v128] 
	i64x2_ne                            :: 0xD701; // [v128 v128] → [v128] 
	i64x2_lt_s                          :: 0xD801; // [v128 v128] → [v128] 
	i64x2_gt_s                          :: 0xD901; // [v128 v128] → [v128] 
	i64x2_le_s                          :: 0xDA01; // [v128 v128] → [v128] 
	i64x2_ge_s                          :: 0xDB01; // [v128 v128] → [v128] 
	i64x2_extmul_low_i32x4_s            :: 0xDC01; // [v128 v128] → [v128] 
	i64x2_extmul_high_i32x4_s           :: 0xDD01; // [v128 v128] → [v128] 
	i64x2_extmul_low_i32x4_u            :: 0xDE01; // [v128 v128] → [v128] 
	i64x2_extmul_high_i32x4_u           :: 0xDF01; // [v128 v128] → [v128] 
	f32x4_abs                           :: 0xE001; // [v128] → [v128] 
	f32x4_neg                           :: 0xE101; // [v128] → [v128] 
	f32x4_sqrt                          :: 0xE301; // [v128] → [v128] 
	f32x4_add                           :: 0xE401; // [v128 v128] → [v128] 
	f32x4_sub                           :: 0xE501; // [v128 v128] → [v128] 
	f32x4_mul                           :: 0xE601; // [v128 v128] → [v128] 
	f32x4_div                           :: 0xE701; // [v128 v128] → [v128] 
	f32x4_min                           :: 0xE801; // [v128 v128] → [v128] 
	f32x4_max                           :: 0xE901; // [v128 v128] → [v128] 
	f32x4_pmin                          :: 0xEA01; // [v128 v128] → [v128] 
	f32x4_pmax                          :: 0xEB01; // [v128 v128] → [v128] 
	f64x2_abs                           :: 0xEC01; // [v128] → [v128] 
	f64x2_neg                           :: 0xED01; // [v128] → [v128] 
	f64x2_sqrt                          :: 0xEF01; // [v128] → [v128] 
	f64x2_add                           :: 0xF001; // [v128 v128] → [v128] 
	f64x2_sub                           :: 0xF101; // [v128 v128] → [v128] 
	f64x2_mul                           :: 0xF201; // [v128 v128] → [v128] 
	f64x2_div                           :: 0xF301; // [v128 v128] → [v128] 
	f64x2_min                           :: 0xF401; // [v128 v128] → [v128] 
	f64x2_max                           :: 0xF501; // [v128 v128] → [v128] 
	f64x2_pmin                          :: 0xF601; // [v128 v128] → [v128] 
	f64x2_pmax                          :: 0xF701; // [v128 v128] → [v128] 
	i32x4_trunc_sat_f32x4_s             :: 0xF801; // [v128] → [v128] 
	i32x4_trunc_sat_f32x4_u             :: 0xF901; // [v128] → [v128] 
	f32x4_convert_i32x4_s               :: 0xFA01; // [v128] → [v128] 
	f32x4_convert_i32x4_u               :: 0xFB01; // [v128] → [v128] 
	i32x4_trunc_sat_f64x2_s_zero        :: 0xFC01; // [v128] → [v128] 
	i32x4_trunc_sat_f64x2_u_zero        :: 0xFD01; // [v128] → [v128] 
	f64x2_convert_low_i32x4_s           :: 0xFE01; // [v128] → [v128] 
	f64x2_convert_low_i32x4_u           :: 0xFF01; // [v128] → [v128] 
	i8x16_relaxed_swizzle               :: 0x8002; // [v128 v128] → [v128] 
	i32x4_relaxed_trunc_f32x4_s         :: 0x8102; // [v128] → [v128] 
	i32x4_relaxed_trunc_f32x4_u         :: 0x8202; // [v128] → [v128] 
	i32x4_relaxed_trunc_f64x2_s         :: 0x8302; // [v128] → [v128] 
	i32x4_relaxed_trunc_f64x2_u         :: 0x8402; // [v128] → [v128] 
	f32x4_relaxed_madd                  :: 0x8502; // [v128 v128 v128] → [v128] 
	f32x4_relaxed_nmadd                 :: 0x8602; // [v128 v128 v128] → [v128] 
	f64x2_relaxed_madd                  :: 0x8702; // [v128 v128 v128] → [v128] 
	f64x2_relaxed_nmadd                 :: 0x8802; // [v128 v128 v128] → [v128] 
	i8x16_relaxed_laneselect            :: 0x8902; // [v128 v128 v128] → [v128] 
	i16x8_relaxed_laneselect            :: 0x8A02; // [v128 v128 v128] → [v128] 
	i32x4_relaxed_laneselect            :: 0x8B02; // [v128 v128 v128] → [v128] 
	i64x2_relaxed_laneselect            :: 0x8C02; // [v128 v128 v128] → [v128] 
	f32x4_relaxed_min                   :: 0x8D02; // [v128 v128] → [v128] 
	f32x4_relaxed_max                   :: 0x8E02; // [v128 v128] → [v128] 
	f64x2_relaxed_min                   :: 0x8F02; // [v128 v128] → [v128] 
	f64x2_relaxed_max                   :: 0x9002; // [v128 v128] → [v128] 
	i16x8_relaxed_q15mulr_s             :: 0x9102; // [v128 v128] → [v128] 
	i16x8_relaxed_dot_i8x16_i7x16_s     :: 0x9202; // [v128 v128] → [v128] 
	i32x4_relaxed_dot_i8x16_i7x16_add_s :: 0x9302; // [v128 v128 v128] → [v128] 
}


Wasm_Atomic_Opcode :: enum u32 #specified {
	notify              :: 0x00; // [i32 i32]→[i32]
	wait32              :: 0x01; // [i32 i32 i64]→[i32]
	wait64              :: 0x02; // [i32 i64 i64]→[i32]
	fence               :: 0x03; // []→[] //@Note: Original opcode is 0x0300 but leb128 doesn't seem right
	i32_load            :: 0x10; // [i32]→[i32]
	i64_load            :: 0x11; // [i32]→[i64]
	i32_load8_u         :: 0x12; // [i32]→[i32]
	i32_load16_u        :: 0x13; // [i32]→[i32]
	i64_load8_u         :: 0x14; // [i32]→[i64]
	i64_load16_u        :: 0x15; // [i32]→[i64]
	i64_load32_u        :: 0x16; // [i32]→[i64]
	i32_store           :: 0x17; // [i32 i32]→[]
	i64_store           :: 0x18; // [i32 i64]→[]
	i32_store8          :: 0x19; // [i32 i32]→[]
	i32_store16         :: 0x1A; // [i32 i32]→[]
	i64_store8          :: 0x1B; // [i32 i64]→[]
	i64_store16         :: 0x1C; // [i32 i64]→[]
	i64_store32         :: 0x1D; // [i32 i64]→[]
	i32_rmw_add         :: 0x1E; // [i32 i32]→[i32]
	i64_rmw_add         :: 0x1F; // [i32 i64]→[i64]
	i32_rmw8_add_u      :: 0x20; // [i32 i32]→[i32]
	i32_rmw16_add_u     :: 0x21; // [i32 i32]→[i32]
	i64_rmw8_add_u      :: 0x22; // [i32 i64]→[i64]
	i64_rmw16_add_u     :: 0x23; // [i32 i64]→[i64]
	i64_rmw32_add_u     :: 0x24; // [i32 i64]→[i64]
	i32_rmw_sub         :: 0x25; // [i32 i32]→[i32]
	i64_rmw_sub         :: 0x26; // [i32 i64]→[i64]
	i32_rmw8_sub_u      :: 0x27; // [i32 i32]→[i32]
	i32_rmw16_sub_u     :: 0x28; // [i32 i32]→[i32]
	i64_rmw8_sub_u      :: 0x29; // [i32 i64]→[i64]
	i64_rmw16_sub_u     :: 0x2A; // [i32 i64]→[i64]
	i64_rmw32_sub_u     :: 0x2B; // [i32 i64]→[i64]
	i32_rmw_and         :: 0x2C; // [i32 i32]→[i32]
	i64_rmw_and         :: 0x2D; // [i32 i64]→[i64]
	i32_rmw8_and_u      :: 0x2E; // [i32 i32]→[i32]
	i32_rmw16_and_u     :: 0x2F; // [i32 i32]→[i32]
	i64_rmw8_and_u      :: 0x30; // [i32 i64]→[i64]
	i64_rmw16_and_u     :: 0x31; // [i32 i64]→[i64]
	i64_rmw32_and_u     :: 0x32; // [i32 i64]→[i64]
	i32_rmw_or          :: 0x33; // [i32 i32]→[i32]
	i64_rmw_or          :: 0x34; // [i32 i64]→[i64]
	i32_rmw8_or_u       :: 0x35; // [i32 i32]→[i32]
	i32_rmw16_or_u      :: 0x36; // [i32 i32]→[i32]
	i64_rmw8_or_u       :: 0x37; // [i32 i64]→[i64]
	i64_rmw16_or_u      :: 0x38; // [i32 i64]→[i64]
	i64_rmw32_or_u      :: 0x39; // [i32 i64]→[i64]
	i32_rmw_xor         :: 0x3A; // [i32 i32]→[i32]
	i64_rmw_xor         :: 0x3B; // [i32 i64]→[i64]
	i32_rmw8_xor_u      :: 0x3C; // [i32 i32]→[i32]
	i32_rmw16_xor_u     :: 0x3D; // [i32 i32]→[i32]
	i64_rmw8_xor_u      :: 0x3E; // [i32 i64]→[i64]
	i64_rmw16_xor_u     :: 0x3F; // [i32 i64]→[i64]
	i64_rmw32_xor_u     :: 0x40; // [i32 i64]→[i64]
	i32_rmw_xchg        :: 0x41; // [i32 i32]→[i32]
	i64_rmw_xchg        :: 0x42; // [i32 i64]→[i64]
	i32_rmw8_xchg_u     :: 0x43; // [i32 i32]→[i32]
	i32_rmw16_xchg_u    :: 0x44; // [i32 i32]→[i32]
	i64_rmw8_xchg_u     :: 0x45; // [i32 i64]→[i64]
	i64_rmw16_xchg_u    :: 0x46; // [i32 i64]→[i64]
	i64_rmw32_xchg_u    :: 0x47; // [i32 i64]→[i64]
	i32_rmw_cmpxchg     :: 0x48; // [i32 i32 i32]→[i32]
	i64_rmw_cmpxchg     :: 0x49; // [i32 i64 i64]→[i64]
	i32_rmw8_cmpxchg_u  :: 0x4A; // [i32 i32 i32]→[i32]
	i32_rmw16_cmpxchg_u :: 0x4B; // [i32 i32 i32]→[i32]
	i64_rmw8_cmpxchg_u  :: 0x4C; // [i32 i64 i64]→[i64]
	i64_rmw16_cmpxchg_u :: 0x4D; // [i32 i64 i64]→[i64]
	i64_rmw32_cmpxchg_u :: 0x4E; // [i32 i64 i64]→[i64]
}

// The sections in a compiled wasm module
// Each of these amounts to the first byte
Wasm_Section_Id :: enum u8 #specified {
    Custom     :: 0;
    Type       :: 1;
    Import     :: 2;
    Function   :: 3;
	Table      :: 4;
	Memory     :: 5;
	Global     :: 6;
    Export     :: 7;
	Start      :: 8;
	Element    :: 9;
    Code_      :: 10;
    Data       :: 11;
	Data_Count :: 12;
}

Wasm_Function_Type :: struct {};
Wasm_Import :: struct {};

Wasm_Operation :: struct {
	instruction: Wasm_Instruction;
	opcode: u32;
	using literals: union {
		struct {
			else_: u32;	
			end: u32;
		};
		label: u32; 
		labels: []u32;
		func: u32;
		struct {
			table: u32;
			type: u32;
		}
	}	
}

Wasm_Function :: struct {
	locals: []Type;
	locals_size: int;
	statement: []Wasm_Operation;
}

Wasm_Module :: struct {
	memory: [..] u8;
	// memory.allocator == page by page allocator
	functions: []Wasm_Function;
	tables: []*void; // tables of various type.
	types: []Type;
}

Wasm_Stack_Frame :: struct {
	locals: [..] *void;
	locals_storage: *void;
	return_point: []Wasm_Statement;
	op_index: int;
	stack_length: int;
	return_type: Type;
}

// @Improvement maybe make these u32?
Wasm_Label :: struct {
	statement: u32;
	stack_length: int;
}

// Table
Funcref_Reftype :: enum u32 {
	Module;
	Extern;
}

Wasm_Funcref :: struct {
	reftype: Funcref_Reftype;
	functype: Type;
	union {
		index: u32;
		func_addr: *void;
	}
}

Wasm_Stack_Entry :: union {
	_u32: u32;
	_s32: s32;
	_f32: float32;
	_u64: u64;
	_s64: s64;
	_f64: float64;
	_v128: v128;
}
