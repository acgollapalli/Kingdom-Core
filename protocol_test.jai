/* protocol test */
SERVER_CRED :: "Bearer_Token:<<Example Server Credential>>";
BUNDLE_LOCATION :: "./games/home/public/game.wasm";

main :: () {
    
    mock_message, bundle : []u8;
    bundle_hash : SHA_256_Hash;
    defer array_free(mock_message);
    {
        assets : Asset_Table;
        manifest : [..]Asset_Entry;
        
        // load bundle
        bundle, bundle_hash = load_asset(BUNDLE_LOCATION, .Bundle);
        table_add(*assets, bundle_hash, bundle);
        array_add(*manifest, .{ type = .Bundle, size = bundle.count, hash = bundle_hash });
        
        
        initial_message, initial_data := construct_initial_message(SERVER_CRED, bundle_hash, manifest);
        
        mock_message = NewArray(size_of(Initial_Message) + initial_data.count, u8);
        memcpy(mock_message.data, *initial_message, size_of(Initial_Message));
        memcpy(mock_message.data + size_of(Initial_Message), initial_data.data, initial_data.count);
    }
    
    {
    	message := mock_message.data.(*Message);
        assert(message.type == .Initial, "Something is fucked!");
        initial_message := message.(*Initial_Message);
        print("Initial Message: % \n", initial_message.*);
        
        assert(hash_eq(initial_message.bundle_hash, bundle_hash), "bundle_hashes do not match in initial message!");
        credential := get_message_array(initial_message, initial_message.credential).(string);
        assert(credential == SERVER_CRED);
        manifest_array := get_message_array(initial_message, initial_message.manifest);
        bundle_entry := manifest_array[0];
        assert(bundle_entry.type == .Bundle);
        assert(bundle_entry.size == bundle.count);
        assert(hash_eq(bundle_entry.hash, bundle_hash));
        print("bundle_entry hash % == bundle_hash %\n", bundle_entry.hash, bundle_hash);
    }
    print("everything works!\n");
}

load_asset :: (file: string, type: Asset_Type) -> [] u8, SHA_256_Hash {
    asset := read_entire_file(file);
	hash := sha256(asset);
	
    return xx asset, hash;
}


Asset_Table :: Table(SHA_256_Hash, []u8, hash => hash[0], hash_eq);


#import "protocol";

#import "Basic";
#import "File";
#import "Hash_Table";