/* SDG                           Kingdom Core: WASM                               JJ */

exec :: (func_idx: u64, module: Module) -> ok: bool, msg: string {
	stack : [..] Stack_Entry; // @Incomplete reserve max_stack_size
	frames : [..] Stack_Frame; // @Incomplete reserve max stack frames
	labels : [..] Label; // @incomplete reserve max labels
	trap: bool; // do we actually need this or can we just return?
	msg: string; // do we actually need this or can we just return the string?

	current_function := func_idx;

	assert(!current_function.is_import); // @Incomplete: handle embedder functions

	defer for frames free(it.locals_storage);

	while main_f := !trap {
		function := module.functions[current_function];
		statement := function.statement;

		{ /* new stack frame for function call */
			new_frame : Stack_Frame;
			{ /* init locals */
				// @Incomplete(caleb)
				// This fails to pass type checking because size_of is compile_time only
				// best bet is probably to instead use the Any type and the Type_Info struct
				// and go from there.
				array_resize(*new_frame.locals, function.locals.count);
				new_frame.locals.count = function.locals.count;
				new_frame.locals_storage = alloc(function.locals_size);
				for function.locals {
					local_ptr : *void;
					if it_index == 0  local_ptr = new_frame.locals_storage;
					else local_ptr = new_frame.locals[it_index - 1] + it.runtime_size;
					array_add(*new_frame.locals, local_ptr);
				}
			}
			new_frame.stack_length = stack.count;
			new_frame.return_point = statement;
			array_add(*frames, new_frame);
		} // defer cleanup
		// @Incomplete: cleanup stack frame in return or otherwise defer to after statement_f loop

		op_index := 0;
		while stmnt_f := op_index < statement.count {
			jumped := false;
			defer if !jumped op_index += 1;
			
			op := statement[op_index];
			if #complete op.instruction == {
				/* Control Flow Instructions */
				case .unreachable;
					Trap("Reached the Unreachable Instruction. You assumed wrong, programmer.");
				case .nop;
					continue;
				case .block;
					array_add(*labels, .{xx op_index, xx stack.count});
				case .loop;
					array_add(*labels, .{xx op_index, xx stack.count});
				case .if_;
					assert(stack.count != 0);
					operand := pop(*stack)._s32; //pop_stack(*stack, s32); 
					
					if !operand {
						jumped = true;
						op_index = op.else_; // I THINK this is correct.
						continue; // else pushes the label
					}
					array_add(*labels, .{xx op_index, xx stack.count});
				case .else_;
					// @Incomplete(caleb): This should unwind the stack and check if there
					// is a return type
					// also if we didn't jump here, then we need to account for that
					
					// if labels[labels.count -1].else_ == op_index // branch to end
					array_add(*labels, .{xx op_index, xx stack.count});
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
					operand := pop(*stack)._s32;
					if operand {
						jumped = true;
						op_index, stack.count = branch(op.label, labels, statement);
					}
				case .br_table;
					operand := pop(*stack)._u32;
					if operand >= op.labels.count  Trap("Bad branch label vector");
					else  operand = op.default_label;
					
					br_label := op.labels[operand];				
					jumped = true;
					op_index, stack.count = branch(br_label, labels, statement);
				case .return_;
					assert(frames.count > 0);
					current_frame := frames[frames.count - 1];
					// @Incomplete: What if the block does not have a return type
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
					operand := pop(*stack)._u32;
					if operand >= module.tables.count Trap("bad call indirect index");

					table : *[][]Funcref = module.tables[op.table];
					funcrefs := table.*[operand];
					
					funcref : Funcref;
					found_funcref: bool;
					for funcrefs {
						if it.functype == module.types[op.type] {
							funcref = it;
							found_funcref = true;
						}
					}
					if !found_funcref Trap("bad call indirect funcref");

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
					operand := pop(*stack)._s32;
					if operand  stack[stack.count -2] = stack[stack.count -1];
					stack.count -= 1;
				case .select_with_type;
					// @Incomplete(caleb): need some type checking here
					operand := pop(*stack)._s32;
					if operand  stack[stack.count -2] = stack[stack.count -1];
					stack.count -= 1;

				/* Variable Instructions */
				case .try_table;
					assert(false); // not implemented(wasm 3.0);
				case .local_get;
					assert(false);
					//local := frames[frames.count -1][op.idx];
					// @Incomplete: need to figure out locals to continue
					array_add(*stack, .{ });
				case .local_set;
					assert(false); // @Incomplete
				case .local_tee;
					assert(false); // @Incomplete
				case .global_get;
					assert(false); // @Incomplete
				case .global_set;
					assert(false); // @Incomplete

				/* Table Instructions (get and set) */
				case .table_get;
					assert(false); // @Incomplete
				case .table_set;
					assert(false); // @Incomplete

				/* Memory Instructions */
				case .i32_load;
					val, ok := load(s32, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
					array_add(*stack, .{_s32 = val});
				case .i64_load;
					val, ok := load(s64, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
					array_add(*stack, .{_s64 = val});
				case .f32_load;
					val, ok := load(float32, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
					array_add(*stack, .{_f32 = val});
				case .f64_load;
					val, ok := load(float64, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
					array_add(*stack, .{_f64 = val});
				case .i32_load8_s;
					val, ok := load(s8, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
					array_add(*stack, .{_s32 = cast(s32) val});
				case .i32_load8_u;
					val, ok := load(u8, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
					array_add(*stack, .{_s32 = cast(s32) val});
				case .i32_load16_s;
					val, ok := load(s16, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
					array_add(*stack, .{_s32 = cast(s32) val});
				case .i32_load16_u;
					val, ok := load(u16, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
					array_add(*stack, .{_s32 = cast(s32) val});
				case .i64_load8_s;
					val, ok := load(s8, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
					array_add(*stack, .{_s64 = cast(s64) val});
				case .i64_load8_u;
					val, ok := load(u8, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
					array_add(*stack, .{_s64 = cast(s64) val});
				case .i64_load16_s;
					val, ok := load(s16, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
					array_add(*stack, .{_s64 = cast(s64) val});
				case .i64_load16_u;
					val, ok := load(u16, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
					array_add(*stack, .{_s64 = cast(s64) val});
				case .i64_load32_s;
					val, ok := load(s32, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
					array_add(*stack, .{_s64 = cast(s64) val});
				case .i64_load32_u;
					val, ok := load(u32, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
					array_add(*stack, .{_s64 = cast(s64) val});
				case .i32_store;
					val := pop(*stack)._s32;
					ok := store(s32, val, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
				case .i64_store;
					val := pop(*stack)._s64;
					ok := store(s64, val, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
				case .f32_store;
					val := pop(*stack)._f32;
					ok := store(float32, val, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
				case .f64_store;
					val := pop(*stack)._f64;
					ok := store(float64, val, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
				case .i32_store8;
					val := pop(*stack)._s32;
					ok := store(s8, val, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
				case .i32_store16;
					val := pop(*stack)._s32;
					ok := store(s16, val, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
				case .i64_store8;
					val := pop(*stack)._s64;
					ok := store(s8, val, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
				case .i64_store16;
					val := pop(*stack)._s64;
					ok := store(s16, val, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
				case .i64_store32;
					val := pop(*stack)._s64;
					ok := store(s32, val, pop(*stack)._u64, op.offset, op.align, module.memory);
					if !ok Trap("Out of bounds memory access!");
				case .memory_size;
					array_add(*stack, .{ _s32 = cast (s32) (module.memory.count / 65_536)});
				case .memory_grow;
					// @Incomplete Need some kind of mutex here
					delta := pop(*stack)._s32;
					new_size := module.memory.count + delta * 65_536;
					array_resize(*module.memory, new_size); // need to add allocator!!!

				/* numeric instructions */
				case .i32_const; // maybe fallthrough here?
					array_add(*stack, op.const);
				case .i64_const;
					array_add(*stack, op.const);
				case .f32_const;
					array_add(*stack, op.const);
				case .f64_const;
					array_add(*stack, op.const);
				case .i32_eqz; // @incomplete: this is one of those areas where we should trap or validate before hand
					stack[stack.count - 1]._s32 = cast (s32) (0 == stack[stack.count - 1]._s32);
				case .i32_eq;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._s32 == stack[stack.count - 1]._s32);
					stack.count -= 1;
				case .i32_ne;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._s32 != stack[stack.count - 1]._s32);
					stack.count -= 1;
				case .i32_lt_s;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._s32 < stack[stack.count - 1]._s32);
					stack.count -= 1;
				case .i32_lt_u;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._u32 < stack[stack.count - 1]._u32);
					stack.count -= 1;
				case .i32_gt_s;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._s32 > stack[stack.count - 1]._s32);
					stack.count -= 1;
				case .i32_gt_u;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._u32 > stack[stack.count - 1]._u32);
					stack.count -= 1;
				case .i32_le_s;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._s32 <= stack[stack.count - 1]._s32);
					stack.count -= 1;
				case .i32_le_u;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._u32 <= stack[stack.count - 1]._u32);
					stack.count -= 1;
				case .i32_ge_s;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._s32 >= stack[stack.count - 1]._s32);
					stack.count -= 1;
				case .i32_ge_u;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._u32 >= stack[stack.count - 1]._u32);
					stack.count -= 1;
				case .i64_eqz; // @incomplete: this is one of those areas where we should trap or validate before hand
					stack[stack.count - 1]._s32 = cast (s32) (0 == stack[stack.count - 1]._s64);
				case .i64_eq;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._s64 == stack[stack.count - 1]._s64);
					stack.count -= 1;
				case .i64_ne;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._s64 != stack[stack.count - 1]._s64);
					stack.count -= 1;
				case .i64_lt_s;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._s64 < stack[stack.count - 1]._s64);
					stack.count -= 1;
				case .i64_lt_u;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._u64 < stack[stack.count - 1]._u64);
					stack.count -= 1;
				case .i64_gt_s;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._s64 > stack[stack.count - 1]._s64);
					stack.count -= 1;
				case .i64_gt_u;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._u64 > stack[stack.count - 1]._u64);
					stack.count -= 1;
				case .i64_le_s;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._s64 <= stack[stack.count - 1]._s64);
					stack.count -= 1;
				case .i64_le_u;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._u64 <= stack[stack.count - 1]._u64);
					stack.count -= 1;
				case .i64_ge_s;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._s64 >= stack[stack.count - 1]._s64);
					stack.count -= 1;
				case .i64_ge_u;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._u64 >= stack[stack.count - 1]._u64);
					stack.count -= 1;				
				case .f32_eq;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._f32 == stack[stack.count - 1]._f32);
					stack.count -= 1;
				case .f32_ne;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._f32 != stack[stack.count - 1]._f32);
					stack.count -= 1;
				case .f32_lt;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._f32 < stack[stack.count - 1]._f32);
					stack.count -= 1;
				case .f32_gt;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._f32 > stack[stack.count - 1]._f32);
					stack.count -= 1;
				case .f32_le;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._f32 <= stack[stack.count - 1]._f32);
					stack.count -= 1;
				case .f32_ge;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._f32 >= stack[stack.count - 1]._f32);
					stack.count -= 1;
				case .f64_eq;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._f64 == stack[stack.count - 1]._f64);
					stack.count -= 1;
				case .f64_ne;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._f64 != stack[stack.count - 1]._f64);
					stack.count -= 1;
				case .f64_lt;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._f64 < stack[stack.count - 1]._f64);
					stack.count -= 1;
				case .f64_gt;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._f64 > stack[stack.count - 1]._f64);
					stack.count -= 1;
				case .f64_le;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._f64 <= stack[stack.count - 1]._f64);
					stack.count -= 1;
				case .f64_ge;
					stack[stack.count - 2]._s32 = cast (s32) (stack[stack.count - 2]._f64 >= stack[stack.count - 1]._f64);
					stack.count -= 1;
				case .i32_ctz;
					// lifted from Basic with arm added
					x := stack[stack.count -1]._u32; 
					n: u8 = ---;
				    #if CPU == .X64 {
				        #asm {
				            tzcnt n, x;
				        }
					} else #if CPU == .ARM64 {
						assert(false); // not implemented
						// #asm {
						// 	rbit x, x;
						// 	clz n, x;
						// }
					}
					stack[stack.count -1]._s32 = cast (s32) n;
				case .i32_clz;
					x := stack[stack.count -1]._s32; 
					n: u8 = ---;
				    #if CPU == .X64 {
				        #asm {
				            lzcnt n, x;
				        }
					} else #if CPU == .ARM64 {
						assert(false); // not implemented yet
						// #asm {
						// 	clz n, x;
						// }
					}
					stack[stack.count -1]._s32 = cast (s32) n;
				case .i32_popcnt;
					x := stack[stack.count -1]._s32;
					n: u8 = ---;
					#if CPU == .X64 {
				        #asm {
				            popcnt n, x;
				        }
					} else #if CPU == .ARM64 {
						// we may actually just be better off without this inline assembly
						// vec4 :=  [4]s32.[x, 0, 0, 0];
						// v : v128 = xx vec4;
						// nv : v128 = ---;
						assert(false); // not implemented yet
						// #asm {
						// 	cnt nv, v;
						// 	addv n, nv;
						// }
					}
					stack[stack.count -1]._s32 = cast (s32) n;

					// @Incomplete: need to trap on overflow, divide by zero etc.
				case .i32_add;
					stack[stack.count -2]._s32 += stack[stack.count -1]._s32;
					stack.count -= 1;
				case .i32_sub;
					stack[stack.count -2]._s32 -= stack[stack.count -1]._s32;
					stack.count -= 1;
				case .i32_mul;
					stack[stack.count -2]._s32 *= stack[stack.count -1]._s32;
					stack.count -= 1;
				case .i32_div_s;
					if stack[stack.count -1]._s32 == 0  Trap("Divide by zero error!");
					stack[stack.count -2]._s32 /= stack[stack.count -1]._s32;
					stack.count -= 1;
				case .i32_div_u;
					if stack[stack.count -1]._u32 == 0  Trap("Divide by zero error!"); // maybe we could be more descriptive?
					stack[stack.count -2]._u32 /= stack[stack.count -1]._u32;
					stack.count -= 1;
				case .i32_rem_s;
					if stack[stack.count -1]._s32 != 0 {
						quotient := stack[stack.count -2]._s32 / stack[stack.count -1]._s32;
						remainder := stack[stack.count -2]._s32 - (quotient * stack[stack.count -1]._s32);
						stack[stack.count - 2]._s32 = remainder;
					}
					stack.count -= 1;
				case .i32_rem_u;
					stack[stack.count -2]._u32 %= stack[stack.count -1]._u32;
					stack.count -= 1;
				case .i32_and;
					stack[stack.count -2]._u32 &= stack[stack.count -1]._u32;
					stack.count -=1;
				case .i32_or;
					stack[stack.count -2]._u32 |= stack[stack.count -1]._u32;
					stack.count -=1;
				case .i32_xor;
					stack[stack.count -2]._u32 ^= stack[stack.count -1]._u32;
					stack.count -= 1;
				case .i32_shl;
					stack[stack.count - 2]._u32 <<= stack[stack.count -1]._u32;
					stack.count -= 1;
				case .i32_shr_s;
					neg := stack[stack.count - 2]._s32 < 0;
					if neg  stack[stack.count - 2]._s32 *= -1;
					
					stack[stack.count - 2]._u32 >>= stack[stack.count -1]._u32;
					if neg  stack[stack.count - 2]._s32 *= -1;
					stack.count -= 1;
				case .i32_shr_u;
					stack[stack.count - 2]._u32 >>= stack[stack.count -1]._u32;
					stack.count -= 1;
				case .i32_rotl;
					stack[stack.count - 2]._u32 <<<= stack[stack.count -1]._u32;
					stack.count -= 1;
				case .i32_rotr;
					stack[stack.count - 2]._u32 >>>= stack[stack.count -1]._u32;
					stack.count -= 1;
				case .i64_ctz;
					// lifted from Basic with arm added
					x := stack[stack.count -1]._u64; 
					n: u8 = ---;
				    #if CPU == .X64 {
				        #asm {
				            tzcnt n, x;
				        }
					} else #if CPU == .ARM64 {
						assert(false); // not implemented
						// #asm {
						// 	rbit x, x;
						// 	clz n, x;
						// }
					}
					stack[stack.count -1]._s64 = cast (s64) n;
				case .i64_clz;
					x := stack[stack.count -1]._s64; 
					n: u8 = ---;
				    #if CPU == .X64 {
				        #asm {
				            lzcnt n, x;
				        }
					} else #if CPU == .ARM64 {
						assert(false); // not implemented yet
						// #asm {
						// 	clz n, x;
						// }
					}
					stack[stack.count -1]._s64 = cast (s64) n;
				case .i64_popcnt;
					x := stack[stack.count -1]._s64;
					n: u8 = ---;
					#if CPU == .X64 {
				        #asm {
				            popcnt n, x;
				        }
					} else #if CPU == .ARM64 {
						// we may actually just be better off without this inline assembly
						// vec4 :=  [4]s64.[x, 0, 0, 0];
						// v : v128 = xx vec4;
						// nv : v128 = ---;
						assert(false); // not implemented yet
						// #asm {
						// 	cnt nv, v;
						// 	addv n, nv;
						// }
					}
					stack[stack.count -1]._s64 = cast (s64) n;
				case .i64_add;
					stack[stack.count -2]._s64 += stack[stack.count -1]._s64;
					stack.count -= 1;
				case .i64_sub;
					stack[stack.count -2]._s64 -= stack[stack.count -1]._s64;
					stack.count -= 1;
				case .i64_mul;
					stack[stack.count -2]._s64 *= stack[stack.count -1]._s64;
					stack.count -= 1;
				case .i64_div_s;
					if stack[stack.count -1]._s64 == 0  Trap("Divide by zero error!");
					stack[stack.count -2]._s64 /= stack[stack.count -1]._s64;
					stack.count -= 1;
				case .i64_div_u;
					if stack[stack.count -1]._u64 == 0  Trap("Divide by zero error!"); // maybe we could be more descriptive?
					stack[stack.count -2]._u64 /= stack[stack.count -1]._u64;
					stack.count -= 1;
				case .i64_rem_s;
					if stack[stack.count -1]._s64 != 0 {
						quotient := stack[stack.count -2]._s64 / stack[stack.count -1]._s64;
						remainder := stack[stack.count -2]._s64 - (quotient * stack[stack.count -1]._s64);
						stack[stack.count - 2]._s64 = remainder;
					}
					stack.count -= 1;
				case .i64_rem_u;
					stack[stack.count -2]._u64 %= stack[stack.count -1]._u64;
					stack.count -= 1;
				case .i64_and;
					stack[stack.count -2]._u64 &= stack[stack.count -1]._u64;
					stack.count -=1;
				case .i64_or;
					stack[stack.count -2]._u64 |= stack[stack.count -1]._u64;
					stack.count -=1;
				case .i64_xor;
					stack[stack.count -2]._u64 ^= stack[stack.count -1]._u64;
					stack.count -= 1;
				case .i64_shl;
					stack[stack.count - 2]._u64 <<= stack[stack.count -1]._u64;
					stack.count -= 1;
				case .i64_shr_s;
					neg := stack[stack.count - 2]._s64 < 0;
					if neg  stack[stack.count - 2]._s64 *= -1;
					
					stack[stack.count - 2]._u64 >>= stack[stack.count -1]._u64;
					if neg  stack[stack.count - 2]._s64 *= -1;
					stack.count -= 1;
				case .i64_shr_u;
					stack[stack.count - 2]._u64 >>= stack[stack.count -1]._u64;
					stack.count -= 1;
				case .i64_rotl;
					stack[stack.count - 2]._u64 <<<= stack[stack.count -1]._u64;
					stack.count -= 1;
				case .i64_rotr;
					stack[stack.count - 2]._u64 >>>= stack[stack.count -1]._u64;
					stack.count -= 1;
				case .f32_abs;
					stack[stack.count -1]._f32 = abs(stack[stack.count -1]._f32);
				case .f32_neg;
					stack[stack.count -1]._f32 *= -1;
				case .f32_ceil;
					stack[stack.count]._f32 = ceil(stack[stack.count]._f32);
				case .f32_floor;
					stack[stack.count]._f32 = floor(stack[stack.count]._f32);
				case .f32_trunc;
					if stack[stack.count]._f32 > 0  stack[stack.count]._f32 = floor(stack[stack.count]._f32);
					else  stack[stack.count]._f32 = ceil(stack[stack.count]._f32);
				case .f32_nearest;
					//@Incomplete: If there are instructions that do this that would be better
					f :=  stack[stack.count]._f32;
					if abs(ceil(f) - f) > abs(floor(f) -f)  stack[stack.count]._f32 = floor(f);
					else if abs(ceil(f) - f) < abs(floor(f) -f)  stack[stack.count]._f32 = ceil(f);
					else if ceil(f).(int) & 0x01  stack[stack.count]._f32 = floor(f);
					else  stack[stack.count]._f32 = ceil(f);
				case .f32_sqrt;
					stack[stack.count]._f32 = sqrt(stack[stack.count]._f32);
				case .f32_add;
					stack[stack.count -2]._f32 += stack[stack.count -1]._f32;
					stack.count -= 1;
				case .f32_sub;
					stack[stack.count -2]._f32 -= stack[stack.count -1]._f32;
					stack.count -= 1;
				case .f32_mul;
					stack[stack.count -2]._f32 *= stack[stack.count -1]._f32;
					stack.count -= 1;
				case .f32_div;
					stack[stack.count -2]._f32 /= stack[stack.count -1]._f32;
					stack.count -= 1;
				case .f32_min;
					stack[stack.count -2]._f32 = min(stack[stack.count -1]._f32, stack[stack.count -2]._f32);
					stack.count -= 1;
				case .f32_max;
					stack[stack.count -2]._f32 = max(stack[stack.count -1]._f32, stack[stack.count -2]._f32);
					stack.count -= 1;
				case .f32_copysign;
					if (stack[stack.count - 2]._f32 < 0) != (stack[stack.count - 2]._f32 < 0)  stack[stack.count -2]._f32 *= -1;
					stack.count -= 1;
				case .f64_abs;
					stack[stack.count -1]._f64 = abs(stack[stack.count -1]._f64);
				case .f64_neg;
					stack[stack.count -1]._f64 *= -1;
				case .f64_ceil;
					stack[stack.count]._f64 = ceil(stack[stack.count]._f64);
				case .f64_floor;
					stack[stack.count]._f64 = floor(stack[stack.count]._f64);
				case .f64_trunc;
					if stack[stack.count]._f64 > 0  stack[stack.count]._f64 = floor(stack[stack.count]._f64);
					else  stack[stack.count]._f64 = ceil(stack[stack.count]._f64);
				case .f64_nearest;
					f :=  stack[stack.count]._f64;
					if abs(ceil(f) - f) > abs(floor(f) -f)  stack[stack.count]._f64 = floor(f);
					else if abs(ceil(f) - f) < abs(floor(f) -f)  stack[stack.count]._f64 = ceil(f);
					else if ceil(f).(int) & 0x01  stack[stack.count]._f64 = floor(f);
					else  stack[stack.count]._f64 = ceil(f);
				case .f64_sqrt;
					stack[stack.count]._f64 = sqrt(stack[stack.count]._f64);
				case .f64_add;
					stack[stack.count -2]._f64 += stack[stack.count -1]._f64;
					stack.count -= 1;
				case .f64_sub;
					stack[stack.count -2]._f64 -= stack[stack.count -1]._f64;
					stack.count -= 1;
				case .f64_mul;
					stack[stack.count -2]._f64 *= stack[stack.count -1]._f64;
					stack.count -= 1;
				case .f64_div;
					stack[stack.count -2]._f64 /= stack[stack.count -1]._f64;
					stack.count -= 1;
				case .f64_min;
					stack[stack.count -2]._f64 = min(stack[stack.count -1]._f64, stack[stack.count -2]._f64);
					stack.count -= 1;
				case .f64_max;
					stack[stack.count -2]._f64 = max(stack[stack.count -1]._f64, stack[stack.count -2]._f64);
					stack.count -= 1;
				case .f64_copysign;
					//@Incomplete: If there are instructions that do this that would be better
					if (stack[stack.count - 2]._f64 < 0) != (stack[stack.count - 2]._f64 < 0)  stack[stack.count -2]._f64 *= -1;
					stack.count -= 1;

				// @Incomplete Some of these may need traps for out of bounds values
				case .i32_wrap_i64; stack[stack.count -1]._s32 = xx stack[stack.count -1]._s64;
				case .i32_trunc_f32_s; 
					stack[stack.count -1]._s32 = xx stack[stack.count -1]._f32;
				case .i32_trunc_f32_u;
					stack[stack.count -1]._u32 = xx stack[stack.count -1]._f32;
				case .i32_trunc_f64_s;
					stack[stack.count -1]._s32 = xx stack[stack.count -1]._f32;
				case .i32_trunc_f64_u;
					stack[stack.count - 1]._u32 = xx stack[stack.count -1]._f32; 
				case .i64_extend_i32_s;
					stack[stack.count -1]._s64 = xx stack[stack.count -1]._s32; 
				case .i64_extend_i32_u;
					stack[stack.count -1]._u64 = xx stack[stack.count -1]._u32; 
				case .i64_trunc_f32_s;
					stack[stack.count -1]._s64 = xx stack[stack.count -1]._f32;
				case .i64_trunc_f32_u;
					stack[stack.count -1]._u64 = xx stack[stack.count -1]._f32;
				case .i64_trunc_f64_s;
					stack[stack.count -1]._s64 = xx stack[stack.count -1]._f64;
				case .i64_trunc_f64_u;
					stack[stack.count -1]._u64 = xx stack[stack.count -1]._f64;
				case .f32_convert_i32_s;
					stack[stack.count -1]._s32 = xx stack[stack.count -1]._f32;
				case .f32_convert_i32_u;
					stack[stack.count -1]._u32 = xx stack[stack.count -1]._f32;
				case .f32_convert_i64_s;
					stack[stack.count -1]._s64 = xx stack[stack.count -1]._f32;
				case .f32_convert_i64_u;
					stack[stack.count -1]._u64 = xx stack[stack.count -1]._f32;
				case .f32_demote_f64;
					stack[stack.count -1]._f32 = xx stack[stack.count -1]._f64;
				case .f64_convert_i32_s;
					stack[stack.count -1]._s32 = xx stack[stack.count -1]._f64;
				case .f64_convert_i32_u;
					stack[stack.count -1]._u32 = xx stack[stack.count -1]._f64;
				case .f64_convert_i64_s;
					stack[stack.count -1]._s64 = xx stack[stack.count -1]._f64;
				case .f64_convert_i64_u;
					stack[stack.count -1]._u64 = xx stack[stack.count -1]._f64;
				case .f64_promote_f32;
					stack[stack.count -1]._f64 = xx stack[stack.count -1]._f32;
				case .i32_reinterpret_f32;
					// no-op
				case .i64_reinterpret_f64;
					// no-op
				case .f32_reinterpret_i32;
					// no-op
				case .f64_reinterpret_i64;
					// no-op
				case .i32_extend8_s;
					stack[stack.count -1]._s32 = xx stack[stack.count -1]._s8;
				case .i32_extend16_s;
					stack[stack.count -1]._s32 = xx stack[stack.count -1]._s16;
				case .i64_extend8_s;
					stack[stack.count -1]._s64 = xx stack[stack.count -1]._s8;
				case .i64_extend16_s;
					stack[stack.count -1]._s64 = xx stack[stack.count -1]._s16;
				case .i64_extend32_s;
					stack[stack.count -1]._s64 = xx stack[stack.count -1]._s32;

				/* Reference Instructions */
				case .ref_null;
					new_entry : Stack_Entry;
					array_add(*stack, new_entry);
				case .ref_is_null;
					stack[stack.count -1]._s32 = cast (s32) (stack[stack.count -1]._s64 == 0);
				case .ref_func;
					// The only thing that should be able to use a funcref is call_indirect
					// and that expects a u32 in our implementation, so we just push the immediate
					// to the stack
					stack[stack.count -1]._u32 = op.func;
				case .ref_eq;
					assert(false); // not implemented (Wasm 3.0)
				case .ref_as_non_null;
					assert(false); // not implemented (Wasm 3.0)
				case .br_on_null;
					assert(false); // not implemented (Wasm 3.0)
				case .br_on_non_null;
					assert(false); // not implemented (Wasm 3.0)

				/* Instructions with OpCodes */
				case .aggregate_op;
					assert(false); // not implemented (Wasm 3.0)
				case .table_op; // Looking at these instructions, this name kinda sucks
					if #complete cast (Table_Opcode) op.opcode == {
						// The default auto_cast (xx) behavior is to saturate
						case .i32_trunc_sat_f32_s;
							stack[stack.count -1]._s32 = xx stack[stack.count -1]._f32;
						case .i32_trunc_sat_f32_u;
							stack[stack.count -1]._u32 = xx stack[stack.count -1]._f32;
						case .i32_trunc_sat_f64_s;
							stack[stack.count -1]._s32 = xx stack[stack.count -1]._f64;
						case .i32_trunc_sat_f64_u;
							stack[stack.count -1]._u32 = xx stack[stack.count -1]._f64;
						case .i64_trunc_sat_f32_s;
							stack[stack.count -1]._s64 = xx stack[stack.count -1]._f32;
						case .i64_trunc_sat_f32_u;
							stack[stack.count -1]._u64 = xx stack[stack.count -1]._f32;
						case .i64_trunc_sat_f64_s;
							stack[stack.count -1]._s64 = xx stack[stack.count -1]._f64;
						case .i64_trunc_sat_f64_u;
							stack[stack.count -1]._u64 = xx stack[stack.count -1]._f64;
						case .memory_init;
						case .data_drop;
						case .memory_copy;
						case .memory_fill;
						case .table_init;
						case .elem_drop;
						case .table_copy;
						case .table_grow;
						case .table_size;
						case .table_fill;
					}
				case .vector_op;
				case .atomic_op;
				
			}
		} 
	}
	return trap, msg;
}

// @Incomplete I guarantee that some of the annoyances here can be sorted out with some kind of
// allocator under the hood
load :: ($type: Type, local_addr: u64, offset: u64, alignment: u32, memory: []u8) -> type, bool {
	addr := local_addr + offset;
	alignment_mask := (~cast(u64)0) << alignment; // I THINK this is correct
	addr &= alignment_mask;
	if addr + size_of(type) >= cast(u64)memory.count return 0, false;
	else return << cast (*type) (memory.data + addr), true; // @Incomplete: we want the REAL pointer to be aligned that way as well!
}

store :: ($type: Type, value: $T, local_addr: u64, offset: u64, alignment: u32, memory: []u8) -> bool {
	addr := local_addr + offset;
	alignment_mask := (~cast(u64)0) << alignment; // I THINK this is correct
	addr &= alignment_mask;
	if addr + size_of(type) >= cast(u64)memory.count return false;
	else << cast (*type) (memory.data + addr) = cast,no_check (type) value; 
	return true;
}

branch :: (br_label: u32, labels: []Label, statement: []Operation) -> op_index: int, stack_length: int {
	// in order from the end from the labels array back
	branch_label := labels[labels.count - 1 - br_label];
	branch_point := statement[branch_label.statement];

	if branch_point.instruction == {
		case .block;
			return branch_point.end, branch_label.stack_length;
		case .if_;
			return branch_point.end, branch_label.stack_length;
		case .loop;
			return branch_label.statement + 1, branch_label.stack_length; // don't want to add the label again
		case;
			print("Bad branch!! to op %", branch_point.instruction);
			assert(false);
	}
	return -1, -1; // @Incomplete: not a great solution for traps
}

/*                                      Parsing                                      */
parse :: (module_bin: []u8) -> Module, bool {
	magic_number := module_bin;
	magic_number.count = 4;
	if magic_number.(string) != "\0asm" {
		print("Magic number at start of module = % and not \"\\0asm\" ", magic_number);
		return .{}, false;
	}

	version := magic_number;
	version.data += 4;
	print("Wasm version = %", version.([]u8));

	module: Module;
	ok := true;
	or_return :: () #expand {
		if !`ok  `return .{}, false;
	}
	
	exports : struct {
		main: u32;		
	}

	cursor := 8;
	while cursor < module_bin.count {
		section_id :=                 BYTE();
		section_length :=             LEB128(u32);

		if #complete section_id.(Section_Id) == {
			case .Custom;
				cursor += section_length;
				continue;
			case .Type;
				if module.types  return .{}, false;
				module.types, cursor, ok = read_types(module_bin, cursor);     or_return();
				continue; 
			case .Import;
				imports_length := LEB128(u32);
				
				for 0..imports_length-1 {
					import_module, import_name : string;
					import_module, cursor, ok  = read_string(module_bin, cursor);              or_return();
					import_name, cursor, ok    = read_string(module_bin, cursor);              or_return();
					
					import_type := BYTE().(Import_Type);

					if import_type == {
						case .Function;
							type_idx := LEB128(u32);
							fn_ptr := link_function(import_module, import_name);
							array_add(*module.functions, .{ is_import = true, type = module.types[type_idx], pointer = fn_ptr});
						case .Table;
							import.table.reftype = BYTE().(Funcref_Reftype);
							has_max := BYTE();
							import.table.min = LEB128(u32);
							if has_max import.table.max = LEB128(u32);
							array_add(*import_tables, import);
						case .Memory;
							has_max := BYTE();
							import.memory.min = LEB128(u32);
							if has_max import.memory.max = LEB128(u32);
							array_add(*import_memories, import);
						case .Global;
							import.global.valtype = BYTE().(Value_Type);
							import.global.mutable = BYTE().(bool);
							array_add(*import_globals, import);
					}
				}
			case .Function;
			case .Table;
			case .Memory;
			case .Global;
			case .Export;
			case .Start;
			case .Element;
			case .Code_;
			case .Data;
			case .Data_Count;
		}
	
	}

		
	return .{}, true;
} // @Incomplete(caleb)

read_types :: (module_bin: []u8, current_position: int) -> []Type_, int, bool {
	cursor := current_position;
	
	// @Incomplete: Should have some messages here or something
	NOT_IMPLEMENTED :: () #expand {
		`return .{}, 0 ,false; // WebAssembly 3.0 types
	}
	
	types_length := LEB128(u32);
	types:= NewArray(types_length, Type_); // @Incomplete: Don't forget to push a context with an arena for all this!
	while cursor < module_bin.count && types.count < types_length {
		type_kind := BYTE().(Value_Type);
		if type_kind == {
			// positive numbers are type indices

			// numeric types
			case .i32;                  #through;         
			case .i64;                  #through;         
			case .f32;                  #through;         
			case .f64;                  #through;         
			case .v128_;                #through;         
			// packed types
			case .i8;                   #through;
			case .i16;
				types.count += 1;
				types[types.count - 1].type = type_kind;
			// heap types
			case .noexn;                NOT_IMPLEMENTED();
			case .nofunc;               NOT_IMPLEMENTED();
			case .noextern;             NOT_IMPLEMENTED();
			case .none;                 NOT_IMPLEMENTED();
			case .func_;
			
			case .extern;
		
			case .any;                  NOT_IMPLEMENTED();
			case .eq;                   NOT_IMPLEMENTED();
			case .i31;                  NOT_IMPLEMENTED();
			case .struct_;              NOT_IMPLEMENTED();
			case .array;                NOT_IMPLEMENTED();
			case .exn;                  NOT_IMPLEMENTED();
		
			// reference types
			case .ref;                  NOT_IMPLEMENTED();
			case .ref_null;             NOT_IMPLEMENTED();
		
			// composite type
			case .comp_func;
				args, c, ok := read_types(module_bin, cursor);
				if ok cursor = c;
				else return .{}, 0, false;
			
				return_values, c2, ok2 := read_types(module_bin, cursor);
				if ok2 cursor = c2;
				else return .{}, 0, false;

				types.count += 1;
				types[types.count - 1] = .{ type = type_kind, args = args, return_values = return_values, };             
			case .struct_field;         NOT_IMPLEMENTED();
			case .array_index;          NOT_IMPLEMENTED();
		
			// recursive types (we probably aren't supporting these)
			case .subtype;              NOT_IMPLEMENTED();
			case .subtype_final;        NOT_IMPLEMENTED(); 
			case .recursive_type;       NOT_IMPLEMENTED();
			// result type 
			case .result;
				types.count += 1;
				result_type, cursor, ok := read_types(module_bin, cursor);
				types[types.count - 1] = .{ type = type_kind, result_type = result_type };
			case;                      NOT_IMPLEMENTED();
		}
	}
	if types_length == types.count  return types, cursor, true;
	else return  .{}, 0, false;
}

read_string :: (module_bin: []u8, current_position: int) -> string, int, bool {
	cursor := current_position;
	len := LEB128(u32);
	if module_bin.count < cursor + len return .{}, 0, false;

	s : string.{ data = module_bin.data + cursor, count = len_mod };
	return copy_string(s); // we have to copy here so we can deallocate the original data.
}

slice :: (array: []$T, start: int, len: int) -> []T{
	return .{
		data = array.data + start,
		count = min(len, array.count - start),
	};
}

// @Incomplete: we could probably use polymorphism here instead
read_leb_128 :: ($T: Type, input: []u8) -> T, int {
	out: T;
	count : int;

	for input {
		mask : T = it & 0x7f;
		mask <<= it_index.(T) * 7;
		out |= mask;
		count = it_index + 1;
		if !(it & 0x80) break;
	}
	#if T == s32 || T == s64 {
		if out & (1 << (count * 7 - 1))  out |= ~(0).(s32) << (count * 7);
	}
	return out, count;
}


/*                                 Typedefs and Enums                                */

Value_Type :: enum u8 #specified {
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
	func_          :: 0x70;
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
	comp_func      :: 0x60; // func [valtype*] → [valtype*]
	struct_field   :: 0x5F; // struct fieldtype* 
	array_index    :: 0x5E; // array fieldtype

	// recursive types (we probably aren't supporting these)
	subtype        :: 0x50;
	subtype_final  :: 0x4F;
	recursive_type :: 0x4E;

	// result type 
	result         :: 0x40;
}


Instruction :: enum u8 #specified {
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
	i32_load             :: 0x28; // [i32] → [i32] 
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


Table_Opcode :: enum u32 #specified {
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


Vector_Opcode :: enum u32 #specified {
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


Atomic_Opcode :: enum u32 #specified {
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
Section_Id :: enum u8 #specified {
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

Import :: struct {};

Operation :: struct {
	instruction: Instruction;
	opcode: u32;
	using literals: union {
		struct {
			else_: u32;	
			end: u32;
		};
		label: u32; 
		struct {
			labels: []u32;
			default_label: u32;
		}
		func: u32;
		struct { // x, y for call_indirect
			table: u32;
			type: u32;
		};
		idx: u32; // immediate index (localidx, globalidx, tableidx)
		struct { // memarg: { offset: u32 | u64, align: u32 }
			offset: u64;
			align: u32;
		};
		const: Stack_Entry;
	}	
}

// Statement :: []Operation

Local_Function :: struct {
	locals: []Type_;
	locals_size: int;
	statement: []Operation;
}

Import_Function_Pointer :: #type ([]Stack_Entry) -> []Stack_Entry;

Import_Function :: struct {
	type: Type_;
	//pointer: Import_Function_Pointer;
	pointer: *void;
}

Function :: struct {
	is_import := false;
	using _: union {
		using local: Local_Function;
		using import: Import_Function;
	}
}

Function_Type :: struct {
	args: []Type_;
	return_values: []Type_;
}

Limits :: struct {
	min: u32;
	max: u32; // may need to be u64 with memory64
}

Reftype :: enum u8 {
	funcref :: 0x70;
	externref :: 0x6F;
}

Table_Type :: struct {
	reftype: Reftype;
	using limits: Limits;
}

Funcref_Table :: [..]u32; // @Improve: These are function_indices and we may want to make them u64
Externref_Table :: [..]*void;

Table :: struct {
	using _: Table_Type;
	union {
		funcref : Funcref_Table;
		externref : Externref_Table;
	} 
}

Memory_Type :: struct {
	using limits: Limits;
	shared: bool; // @Incomplete IDK if jai's compiler will add this part
}

Global_Type :: struct {
	valtype: Value_Type;
	mutable: bool;
}

Type_ :: struct {
	type : Value_Type; // In retrospect, this is not a great name
	union {
		using function: Function_Type;
		result_type: []Type_;
		// using table: Table_Type;
		// using memory: Memory_Type;
		// using global: Global_Type;
	}
	
}

Import_Type :: enum u8 {
	Function   :: 0x01;
	Table      :: 0x02;
	Memory     :: 0x03;
	Global     :: 0x04;
}

operator == :: (a: Type_, b: Type_) -> bool {
	if a.type != b.type return false;
	if a.type == .comp_func {
		if a.args.count != b.args.count return false;
		for a.args {
			if it != b.args[it_index] return false;
		}
		if a.return_values.count != b.return_values.count return false;
		for a.return_values {
			if it != b.return_values[it_index] return false;
		}
	} else if a.type == .result {
		if a.result_type.count != b.result_type.count return false;
		for a.result_type {
			if it != b.result_type[it_index] return false;
		}
	}
	return true;
}

Module :: struct {
	memory: [..] u8;
	// memory.allocator == page by page allocator
	functions: [..]Function;
	tables: []*void; // tables of various type.
	types: []Type_;
}

Stack_Frame :: struct {
	locals: [..] *void;
	locals_storage: *void;
	return_point: []Operation;
	op_index: int;
	stack_length: int;
	return_type: Type;
}

// @Improvement maybe make these u32?
Label :: struct {
	statement: u32;
	stack_length: int;
}

Stack_Entry :: union {
	_u8: u8;
	_s8: s8;
	_u16: u16;
	_s16: s16;
	_u32: u32;
	_s32: s32;
	_f32: float32;
	_u64: u64;
	_s64: s64;
	_f64: float64;
	// _v128: v128; // v128 doesn't do anything yet so... we're not gonna worry about it.
	_v128: union {
		_2xf64: [2]float64;
		_2xu64: [2]u64;
		_2xs64: [2]s64;
		_4xf32: [4]float32;
		_4xu32: [4]u32;
		_4xs32: [4]s32;
		_8xu16: [8]u16;
		_8xs16: [8]s16;
		_16xu8: [16]u8;
		_16xs8: [16]s8;
	};
}

/* Macros */
Trap :: (msg: string) #expand {
	`trap = true;
	`msg = msg;
	break `main_f; 
}

// @Incomplete: no bounds checks here
LEB128 :: ($T: Type) -> T #expand {
	val, len := read_leb_128(T, slice(`module_bin,`cursor, 5));
	`cursor += len;
	return val;
}

// @Incomplete: no bounds checks here
BYTE :: () -> u8 #expand {
	val := `module_bin[`cursor];
	`cursor += 1;
	return val;
}

/* Not sure where to put this */
// @Incomplete
link_function :: (module: string, name: string) -> *void {
	return .{};
}

/* @Note(caleb): This module is meant to be used as a library. But for testing and
   and ease of compilation, I've added a main function */
main :: () {
	args := get_command_line_arguments();
	if args.count > 1 {
		module := parse(cast([]u8) read_entire_file(args[0]));
		start : u64;
		// @Incomplete get start here
		exec(start, module);
	}
	else print("Please specify a wasm binary file to run!\n");
}

/*                                      Imports                                     */
#import "Basic";
#import "Math";
#import "File";
//#import "String";
