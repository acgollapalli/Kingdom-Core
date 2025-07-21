/* Kingdom Core: Home */


SERVER_CRED :: "Bearer_Token:<<Example Server Credential";

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
						conn.protocol_status = .Loading;
					// more to come
				}
				
				 
			} else {
				// handle cleanup
			}
		}
	}
	
}

load_assets :: () -> Table(SHA_256_Hash, []u8), []Asset_Entry {
	assets : Table(SHA_256_Hash, []u8);
	manifest : [..]Asset_Entry;

	load_asset(BUNDLE_LOCATION, .Bundle, *assets, *manifest);
	load_asset(TEXTURE_LOCATION, .Texture, *assets, *manifest);
	load_asset(MESHTEXTURE_LOCATION, .Mesh_Texture, *assets, *manifest);
}

load_asset :: (file: string, type: Asset_Type, assets: *Table(SHA_256_Hash, []u8), manifest: *[..]Asset_Entry) {
	asset := read_entire_file(file);
	hash := sha256(asset);
	entry := Asset_Entry.{ type = type, size = asset.count, hash = hash };

	table_add(hash, asset);
	array_add(entry);
}


#import "protocol";

#import "Basic";
#import "Hash_Table";
