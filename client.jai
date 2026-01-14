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
    //assets : Asset_Table;
    manifest : [..]Asset_Entry;
    bundle_hash: SHA_256_Hash;
    
    
	address := IP_Address.{
        family = .IPv4,
        address.IPv4 = .[127,0,0,1],
        port = 8443
    };
    
    settings.app_name = "Client";
    settings.quic_settings = .{
        IsSet.__bitfield = xx q.IsSetFlags.PeerUnidiStreamCount | q.IsSetFlags.PeerBidiStreamCount | q.IsSetFlags.KeepAliveIntervalMs,
        PeerUnidiStreamCount = 100,
        PeerBidiStreamCount = 100,
        KeepAliveIntervalMs = 50,
    };
    
    
	iahp_client_init(settings, *client);
	// conn_ok, conn_id := client_connect(address, *client);
	conn_ok, conn_id := client_connect(HOMEPAGE,8444, *client);
	send_manifest(conn_id, PLAYER_CRED, bundle_hash, manifest, *client);
    
    //while true {}
    
	
	while true {
		// read messages
		for *conn, conn_id: * client.connections { // value, key := it, it_index
			if conn.transport_status != .Connected  continue; // @Incomplete: probably need to cleanup here

			for *stream, stream_id: * conn.streams {
				if stream.finished {
					buf := coalesce_stream(stream);
                    //defer free(buf.data);
					msg_ptr := buf.data.(*Message);
                    print("RECEIVED MESSAGE OF TYPE: %\n", msg_ptr.type);

					if msg_ptr.type == {
						case .Initial;
                        defer array_free(buf);
                        initial_msg := msg_ptr.(*Initial_Message);
                        print("Got initial message: %\n", formatStruct(initial_msg.*, use_long_form_if_more_than_this_many_members=-1));
                        
                        // set up initial connection state, but only if this is a message modifying the 
                        // bundle hash
                        if conn.protocol_status == .Initial {
                            server_cred := get_message_array(initial_msg, initial_msg.credential);
                            if !verify_credentials(server_cred) client_close_connection(conn_id, client);
                            conn.bundle_hash = initial_msg.bundle_hash;
                            conn.protocol_status == .Loading;
                        } else {
                            assert(hash_eq(conn.bundle_hash,initial_msg.bundle_hash)); // @Incomplete: we do not support reloading the bundle as I don't know how we should impletement that yet.
                        }
                        
                        server_manifest := get_message_array(initial_msg, initial_msg.manifest);
                        print("RECEIVED_MANIFEST_OF SIZE: %\n", server_manifest.count);
                        for entry: server_manifest {
                            table_entry := table_find_pointer(*conn.manifest, entry.hash);
                            if table_entry != null && entry.size > 0  asset_free(table_entry);
                            else if table_entry == null  {
                                table_add(*conn.manifest, entry.hash, .{ asset_entry = entry });
                                print("adding entry: %\n", entry.hash);
                            }
                        }
                        
                        assert(table_contains(*conn.manifest, conn.bundle_hash)); // @Incomplete: we need to return a protocol error if this is not the case.
                        
                        print("number of entries in manifest: %\n", conn.manifest.count);
                        
                        case .Main;
                        main_msg := msg_ptr.(*Main_Message);
                        print("Got main message: %\n", formatStruct(main_msg.*, use_long_form_if_more_than_this_many_members=-1));
                        table_entry := table_find_pointer(*conn.manifest, main_msg.hash);
                        //print("number of entries in manifest: %\n", conn.manifest.count);
                        assert(table_entry != null);
                        
                        // reify manifest entry (load the asset);
                        if table_entry.type == .Raw || table_entry.type == .Bundle {
                            manifest_size_correct := table_entry.size == stream.total_size - size_of(Main_Message);
                            assert(manifest_size_correct); // @Incomplete: this will need to be a protocol error
                            
                            table_entry.data = *main_msg._data;
                        } else assert(false); // not handled yet
						
                        print("total size of asset: % bytes\n", stream.total_size - size_of(Main_Message));
                        
                        if hash_eq(main_msg.hash, conn.bundle_hash)  conn.protocol_status = .Loaded;
                        assert(conn.protocol_status == .Loaded, "hash_eq returned: % hashes don't match % vs %",hash_eq(main_msg.hash, conn.bundle_hash), main_msg.hash, conn.bundle_hash);
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
                    
                    // free stream state data receiver-side
                    for stream.data  array_free(it);
                    table_remove(*conn.streams, stream_id);
                    table_remove(*client.streams, stream_id);
                       
				}
                
			}
            
            // actually execute stuff.
            // @Incomplete: This should be happening in a separate thread
            if conn.protocol_status == {
                case .Initial;
                case .Loading;
                
                case .Loaded;
                found_bundle,bundle_entry := table_find(*conn.manifest, conn.bundle_hash);
                bundle_bin := []u8.{ count = bundle_entry.size, data = bundle_entry.data };
                assert(found_bundle);
                print("Executing bundle!\n");
                exec_wasm(bundle_bin);
                conn.protocol_status = .Master; // @Incomplete: this will change once we actually figure out changeover logic
                
                case .Slave;
                case .Master;
                case .Shutdown;
            }
		}
       	
	}

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
