/* Kingdom Core: Home */


SERVER_CRED :: "Bearer_Token:<<Example Server Credential>>";

BUNDLE_LOCATION :: "./game.wasm";
TEXTURE_LOCATION :: "./texture.bmp";
MESHTEXTURE_LOCATION :: "./mesh.hxa";

main :: () {

	server: Server_Instance;
	settings: Protocol_Settings;

	assets, manifest := load_assets();
	
	iahp_server_init(settings, *server);

	while true {
		for conn, conn_id : * server.connections {
			if conn.transport_status == .Connected {
				// do connnected stuff
				if conn.protocol_status == {
					case .Initial;
						send_manifest(conn_id, SERVER_CRED, manifest, *server);
						conn.protocol_status = .Loading; // THIS SHOULD COME FROM A CLIENT SIDE MESSAGE
					// more to come
					case .Loading;
						// THIS SHOULD ONLY SEND THE MAIN BUNDLE
						for assets {
							hash, asset := it_index, it;
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

load_assets :: () -> Asset_Table, []Asset_Entry {
	assets : Asset_Table;
	manifest : [..]Asset_Entry;

	load_asset(BUNDLE_LOCATION, .Bundle, *assets, *manifest);
	// load_asset(TEXTURE_LOCATION, .Texture, *assets, *manifest);
	// load_asset(MESHTEXTURE_LOCATION, .Mesh_Texture, *assets, *manifest);

	return assets, manifest;
}

load_asset :: (file: string, type: Asset_Type, assets: *Asset_Table, manifest: *[..]Asset_Entry) {
	asset := read_entire_file(file);
	hash := sha256(asset);
	entry := Asset_Entry.{ type = type, size = asset.count, hash = hash };

	table_add(assets, hash, xx asset);
	array_add(manifest, entry);
}


#import "protocol";

#import "Basic";
#import "Hash_Table";
#import "File";
