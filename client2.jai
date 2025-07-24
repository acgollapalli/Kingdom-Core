/* Kingdom Core: Client */

PLAYER_CRED :: "Bearer_Token:<<Example Client Credential>>";
HOMEPAGE :: "127.0.0.1";

main :: () {

	client: Client_Instance;
	settings: Protocol_Settings;
	iahp_client_init(settings, *client);

	manifest : [..]Asset_Entry;

	conn_ok, conn_id := client_connect(HOMEPAGE, client = *client);
	send_manifest(conn_id, PLAYER_CRED, manifest, *client);
	
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
		}

		
	}
}

verify_credentials :: (cred: []u8) -> bool { return true; }

Client_Status :: struct { }
get_status :: () -> Client_Status { status : Client_Status; return status; }

#import "protocol";

#import "Basic";
#import "Hash_Table"; // should NOT have to import this here. @TODO: report to Jon
