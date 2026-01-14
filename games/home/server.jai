/* Kingdom Core: Home */


SERVER_CRED :: "Bearer_Token:<<Example Server Credential>>";

BUNDLE_LOCATION :: "./game.wasm";
TEXTURE_LOCATION :: "./texture.bmp";
MESHTEXTURE_LOCATION :: "./mesh.hxa";

main :: () {
    
    /* Basic Init Things */
    address := IP_Address.{
        family = .IPv4,
        address.IPv4 = .[0,0,0,0],
        port = 8444
    };

	server: Server_Instance;
	settings := Protocol_Settings.{
        app_name = "home_game",
        address = address,
        quic_settings = .{
            IsSet.__bitfield = xx q.IsSetFlags.PeerUnidiStreamCount | q.IsSetFlags.PeerBidiStreamCount,
            PeerUnidiStreamCount = 100,
            PeerBidiStreamCount = 100,
        }
        
    }; //@Incomplete: These should come from a config file
    
	assets : Asset_Table;
	manifest : [..]Asset_Entry;
	
    bundle, bundle_hash := load_asset(BUNDLE_LOCATION, .Bundle);
    table_add(*assets, bundle_hash, bundle);
    array_add(*manifest, .{ type = .Bundle, size = bundle.count, hash = bundle_hash });
	
	iahp_server_init(settings, *server);
    //while true {}
    
    while true {
		for * server.connections {
            conn, conn_id := it, it_index;
            
            //print("handling conn_id % in state %, protocol state %.\n", conn, conn.transport_status, conn.protocol_status);
			if conn.transport_status == .Connected {
				// do connnected stuff
				if conn.protocol_status == {
					case .Initial;
                    print("sending manifest!\n");
						send_manifest(conn_id, SERVER_CRED, bundle_hash, manifest, *server);
						conn.protocol_status = .Loading; // THIS SHOULD COME FROM A CLIENT SIDE MESSAGE
					// more to come
					case .Loading;
                    // THIS SHOULD ONLY SEND THE MAIN BUNDLE
                    print("sending assets!\n");
						for assets {
                        hash, asset := it_index, it;
                        print("sending asset: %\n", hash);
							send_main(conn_id, hash, asset, *server);
						}
						conn.protocol_status = .Master; // THIS SHOULD COME FROM A CLIENT SIDE MESSAGE

				}
				
				 
			} else {
				// handle cleanup
			}
		}
	}

	
}

Asset_Table :: Table(SHA_256_Hash, []u8, hash => hash[0], hash_eq);

load_asset :: (file: string, type: Asset_Type, assets: *Asset_Table, manifest: *[..]Asset_Entry) {
	asset := read_entire_file(file);
	hash := sha256(asset);
	entry := Asset_Entry.{ type = type, size = asset.count, hash = hash };

	table_add(assets, hash, xx asset);
	array_add(manifest, entry);
}

load_asset :: (file: string, type: Asset_Type) -> [] u8, SHA_256_Hash {
    asset := read_entire_file(file);
	hash := sha256(asset);
	
    return xx asset, hash;
}



#import "protocol";
q :: #import "quic";

#import "Basic";
#import "Hash_Table";
#import "File";
