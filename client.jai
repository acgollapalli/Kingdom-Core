/* Kingdom Core: Client */

PLAYER_CRED :: "Bearer_Token:<<Example Client Credential>>";
HOMEPAGE :: "127.0.0.1";
POOL_SIZE :: 512 * 1024 *12;
STACK_SIZE :: 8092;
HEAP_SIZE :: 8092 *12;
BUNDLE_LOCATION :: "./games/home/public/game.wasm";

main :: () {

	client: Client_Instance;
	settings: Protocol_Settings;
	iahp_client_init(settings, *client);
    assets : Asset_Table;
    manifest : [..]Asset_Entry;
    bundle_hash: SHA_256_Hash;
    
	address := IP_Address.{
        family = .IPv4,
        address.IPv4 = .[127,0,0,1],
        port = 1443
    };
    
    settings.app_name = "Client";
    settings.quic_settings = .{
        IsSet.__bitfield = xx q.IsSetFlags.PeerUnidiStreamCount | q.IsSetFlags.PeerBidiStreamCount,
        PeerUnidiStreamCount = 100,
        PeerBidiStreamCount = 100,
    };
    
    
	// conn_ok, conn_id := client_connect(address, *client);
	conn_ok, conn_id := client_connect(HOMEPAGE,64288, *client);
	send_manifest(conn_id, PLAYER_CRED, bundle_hash, manifest, *client);
    
    while true {}
    
	/*
	while true {
		// read messages
		for conn, conn_id: * client.connections { // value, key := it, it_index
			if conn.transport_status != .Connected  continue; // @Incomplete: probably need to cleanup here

			for *stream, stream_id: * conn.streams {
				if stream.finished {
					buf := coalesce_stream(stream);
					msg_ptr := buf.data.(*Message);

					if msg_ptr.type == {
						case .Initial;
                        initial_msg := msg_ptr.(*Initial_Message);
                        print("Got initial message: %\n", initial_msg.*);
							
							if conn.protocol_status == .Initial {
								server_cred := get_message_array(initial_msg, initial_msg.credential);
								if !verify_credentials(server_cred) client_close_connection(conn_id, client);
							}
							
							server_manifest := get_message_array(initial_msg, initial_msg.manifest);
							for entry: server_manifest {
								if entry.size > 0 && seek_index(conn.manifest, entry) < 0  array_add(*conn.manifest, .{ asset_entry = entry });
								else for conn.manifest {
									if hash_eq(it.hash, entry.hash) {
										free(it.msg_ptr); // you know...  it's probably fine
										remove it;
										break;
									}
								}
							}
							if conn.protocol_status == .Initial  conn.protocol_status == .Loading;
							
						case .Main;
							main_msg := msg_ptr.(*Main_Message);
							idx := seek_index(conn.manifest, main_msg);
							assert(idx >= 0);

							conn.manifest[idx].msg_ptr = msg_ptr;
							conn.manifest[idx].data = *main_msg._data;
							

							// seek in array
						case .Handoff;
							// Will handle later
						case .Control;
							control_msg := msg_ptr.(*Control_Message);
							control_data : []u8;
							if buf.count >= size_of(Control_Message) {
								control_data.data = buf.data + size_of(Control_Message);
								control_data.count = buf.count - size_of(Control_Message);
							}

							if control_msg.operation == {
								case .Status;
									status := get_status();
									response := Control_Message.{ operation = .Status_Response };
								case .Passthrough;
									// to be handled later;
								case .Shutdown;
									// something needs to let the wasm guest know here.
									client_close_connection(conn_id, client);
							}
					}
				}
			}
            
            // actually execute stuff.
            // @Incomplete: This should be happening in a separate thread
            if conn.protocol_status == {
                case .Initial;
                case .Loading;
                case .Slave;
                case .Master;
                case .Shutdown;
            }
		}
       	
	}
*/
}

verify_credentials :: (cred: []u8) -> bool { return true; }

Client_Status :: struct { }
get_status :: () -> Client_Status { status : Client_Status; return status; }

exec_wasm :: (wasm_bin: []u8) {
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
    
    module_inst := wasm_runtime_instantiate(module, STACK_SIZE, HEAP_SIZE, wasm_error.data, xx wasm_error.count);
    print("Initialized module: %\n", module_inst.(bool));
    if !module_inst  print("Error: %\n", wasm_error.(string));
    
    exec_env := wasm_runtime_create_exec_env(module_inst, STACK_SIZE);
    
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

Asset_Table :: Table(SHA_256_Hash, []u8, hash => hash[0], hash_eq);


#import "protocol";
#import "wasm";
q :: #import "quic";

#import "Basic";
#import "Hash_Table"; // should NOT have to import this here. @TODO: report to Jon
#import "File";
