/* Kingdom Core: IAHP Protocol */

// Some Notes:
//
// All ints are 64 bits (standard for this lang)
// All hashes are 256 bits using SHA-256
// All structs should be packed

/* Messages between client and server */
Control_Code :: enum int {
	Initial;
	Main;
	Handoff;
	Control;
}

Message_Data :: struct (type: Type) {
	offset: int;
}

Message_Array :: struct (type: Type) {
	count: int;
	offset: int;
}

Message_Table_Entry :: struct (key_type: Type, val_type: Type) {
	key: Message_Data(key_type);
	val: Message_Data(val_type);
}

Message_Table :: struct (key_type: Type, val_type: Type) {
	entries: Message_Array(Message_Table_Entry(key_type, val_type));
}

// @Incomplete: I'm worried about a lack of bounds checks here
get_message_data :: (message: $M, data: Message_Data) -> data.type {
	data_ptr :=  *message._data + data.offset;
	return data_ptr.(*d.type).*;
}

get_message_array :: (message: $M, array: Message_Array) -> []array.type {
	ara : []array.type;
	ara.count = array.count;
	ara.data = xx (*message._data + array.offset);

	return ara;
}

get_message_table :: (message: $M, table: Message_Table) -> Table(table.key_type, table.val_type) {
	entries := get_message_array(message, table.entries);

	table : Table(table.key_type, table.val_type);
	init(*table, entries.count);

	for entries {
		key := get_message_data(message, it.key);
		val := get_message_data(message, it.val);
		table_add(*table, key, val);
	}

	return table;
}

/* Assets */ 
// It's an open question whether these should be allowed to be external urls or
// pass ultimately from the same server as the root bundle.
// Although with anycast these days I'm not sure how much it matters. Datagrams can
// be passed through a realtime server and the rest can be proxied to an asset manager
// with a view into the overall state of a large game spread accross multiple servers.
// It's reasonable for a large game to develop their QUIC implementation to operate
// this way, and part of the reason we initially started building our own QUIC implementation
Asset_Type :: enum int {
	Raw;
	Player_Data;
	Bundle;
	Mesh;
	Texture;
	Mesh_Texture;
	Shader;
	Audio;
	Video;
}

// note: if the program being accessed is expecting some kind of wallet, this data would
// be coming from there;
Player_Data :: Message_Table(u8, u8); // just a table of strings or blobs in the _data

Asset_Origin :: enum int {
	Server;
	URI;    // not yet supported
	IPFS;   // not yet supported
	Client; // not yet supported
}

Asset_Entry :: struct {
	type: Asset_Type;
	size: int; // if the server sends a size of 0 then this means that the asset is safe to unload
	hash: SHA_256_Hash;
	origin: Asset_Origin;
}
#assert(size_of([50]Asset_Entry) == size_of(Asset_Entry)*50);

Message :: struct {
	type: Control_Code;
}

/* Initial Manifest data */
// can be called more than once in order to update manifests
Initial_Message :: struct {
	#as using _msg : Message;
	type = .Initial;
	credential: Message_Array(u8); // A wallet address or public key. Not currently Used.
    bundle_hash: SHA_256_Hash;
	manifest: Message_Array(Asset_Entry); // just a list of assets for now. meant to be dynamic.
	_data: void; // placeholder for data
}

/* WASM bundle data or other assets */
Main_Message :: struct {
	#as using _msg : Message;
	type = .Main;
	hash: SHA_256_Hash;
	_data: void; // This contains asset data
}

Handoff_Operation :: enum int {
	Main_Control; // This program now has the main control
	Transfer_Control; // This program is to take full control
	Handoff_Complete; // This program has now given up control
}

/* Hand off messages to let the server know the control state of the client */
Handoff_Message :: struct {
	#as using _msg : Message;
	type = .Handoff;
	other_party: Message_Array(u8); // a URL string for the third party;
	op_code: Handoff_Operation;
}

Control_Operation :: enum int {
	Status;      // Server wants to know the client status (or vice versa)
	Status_Response;
	Passthrough; // Pass through data reliably
	Shutdown;    // Shutdown
}

Control_Message :: struct {
	#as using _msg : Message;
	type = .Control;
	operation: Control_Operation;
	_data: void;
}


/* Protocol Implementation */
Protocol_Status :: enum int {
	Initial; // We do not yet have a manifest
	Loading; // We have a manifest, but we don't yet have a bundle
	Slave;   // We have a bundle, and the program is running as a slave
	Master;  // We have a bundle, and the program is running as a master
	Shutdown; // We've let the server know that the bundle is shutdown on the client-side
}

Protocol_Settings :: struct {
	app_name: string;
	address: Address;
	certificate_hash: string;
	quic_settings: Quic_Settings;
}

/* Server Stuff */

Connection_Status :: enum int {
    Pending;
	Connected;
	Shutting_Down_Transport;
	Shutting_Down_From_Client;
	Shutdown;
}

Timestamp :: Apollo_Time;


Realtime_Data :: struct {
	data: []u8;
	timestamp: Timestamp;
}

Stream_State :: struct {
	data: [..][]u8;
	total_size: int;
	finished: bool;
}

coalesce_stream :: (stream_state: *Stream_State) -> []u8{
	data := alloc(stream_state.total_size);

	offset := 0;
	for stream_state.data {
		memcpy(data + offset, it.data, it.count);
		offset += it.count;
		
		array_free(it);
	}

	return .{ count = offset, data = data };
}

Asset_State :: struct {
    type: Asset_Type;
    data: []u8;
}

Connection_State :: struct {
	time_joined: Timestamp;
	transport_status: Connection_Status;
	protocol_status: Protocol_Status;
	session_resumed: bool;
	realtime_data: Ring_Buffer(10, Realtime_Data);
	streams: Table(Stream, Stream_State);
	streams_available: struct {
		bidirectional: int; // u16 in QUIC
		unidirectional: int;
	}; // useful for knowing whether you can send more assets
	//manifest: Table(SHA_256_Hash, Asset_Entry);//Reified_Manifest;
    manifest: Reified_Manifest;
    bundle_hash: SHA_256_Hash;
};

Reified_Manifest :: [..] struct {
		#as using asset_entry: Asset_Entry;
		msg_ptr: *Message;
		data: *void;
};

Server_Instance :: struct {
	instance_id: Server;
	connections: Table(Connection, Connection_State);
	streams: Table(Stream, Connection); 
}

iahp_server_init :: (settings: Protocol_Settings, server: *Server_Instance) {
	quic_init(settings.app_name, settings.quic_settings, settings.certificate_hash, true);
	quic_address := convert_address(settings.address); //@Incomplete: need to define this function
	server.instance_id = server_start(server_listener_callback, *quic_address, xx server);
    print("Started QUIC server.\n");
}

server_listener_callback :: (listener: HQUIC, server_instance: *void, event: *QUIC_LISTENER_EVENT) -> QUIC_STATUS #c_call {
	push_context {
		print("listener handler event.Type = %\n", event.Type);
		if event.Type == {
			case .NEW_CONNECTION;
				conn := event.NEW_CONNECTION.Connection;
				set_connection_callback(conn, server_connection_handler, server_instance);
            connection_set_configuration(conn);
			case .STOP_COMPLETE; print("Server shutting down.\n");
			case .DOS_MODE_CHANGED; assert(false, "DOS mode shouldn't be a consideration for us!");
			case; assert(false, "Unhandled listener event type!");
		}
	}
	return xx Quic_Status.SUCCESS;
}


server_connection_handler :: (conn: HQUIC, server_instance_ptr: *void, event: *QUIC_CONNECTION_EVENT) -> QUIC_STATUS #c_call {
	push_context {
		print("received connection event: %\n", event.Type);
	
		server_instance := cast (*Server_Instance) server_instance_ptr;
		conn_table_ptr := *server_instance.connections;
		conn_state := find_or_add(conn_table_ptr, conn);
        
        if event.Type == {
            case .CONNECTED;
			conn_state.* = .{ 
                time_joined = current_time_consensus(),
                transport_status = .Connected,
                session_resumed = xx event.CONNECTED.SessionResumed 
            };
			print("Player connected!\n");
            case .SHUTDOWN_INITIATED_BY_TRANSPORT;
			conn_state.transport_status = .Shutting_Down_Transport;
			print("Player disconnected by transport!\n");
	    case .SHUTDOWN_INITIATED_BY_PEER;
			conn_state.transport_status = .Shutting_Down_From_Client;
			print("Player chooses to disconnect!\n");
	    case .SHUTDOWN_COMPLETE;
			conn_state.transport_status = .Shutdown;
			print("Player disconnection complete!\n");
	    case .LOCAL_ADDRESS_CHANGED;
	    case .PEER_ADDRESS_CHANGED;
	    case .PEER_STREAM_STARTED;
			print("Player uploading data!\n");
			// handle_stream(conn.(u64), event.PEER_STREAM_STARTED.Stream);
			stream := event.PEER_STREAM_STARTED.Stream;
			set_stream_callback(stream, server_stream_handler, server_instance);
			table_add(*server_instance.streams, stream, conn);
	    case .STREAMS_AVAILABLE;
			conn_state.streams_available = .{
				bidirectional = event.STREAMS_AVAILABLE.BidirectionalCount,
				unidirectional = event.STREAMS_AVAILABLE.UnidirectionalCount
			};
	    case .PEER_NEEDS_STREAMS;
			// will handle when necessary
	    case .IDEAL_PROCESSOR_CHANGED;
	    case .DATAGRAM_STATE_CHANGED;
			if !event.DATAGRAM_STATE_CHANGED.SendEnabled {
				// CLOSE THE CONNECTION
			}
	    case .DATAGRAM_RECEIVED;
			buf := event.DATAGRAM_RECEIVED.Buffer;
			data := array_copy([]u8.{count = buf.Length, data = buf.Buffer}); // need to make a copy because buffers are currently allocated by MsQuic
			ringbuf_add(*conn_state.realtime_data, .{ data=data, timestamp = current_time_consensus() });
	    case .DATAGRAM_SEND_STATE_CHANGED;
	    case .RESUMED;
			assert(false, "We currently don't support session resumption!");
	    case .RESUMPTION_TICKET_RECEIVED;
			assert(false, "We currently don't support session resumption!");
	    case .PEER_CERTIFICATE_RECEIVED;
		case; assert(false, "Unhandled connection event!");
		}
	}
	return xx Quic_Status.SUCCESS;
}

server_stream_handler :: (stream: Stream, server_instance_ptr: *void, event: *QUIC_STREAM_EVENT) -> QUIC_STATUS #c_call {

	push_context { // this may be a bad approach, actually, need to try and see
		print("received stream event: %\n", event.Type);
	

		server_instance := cast (*Server_Instance) server_instance_ptr;
		_, conn_id := table_find(*server_instance.streams, stream);
		_, conn := table_find(*server_instance.connections, conn_id);
		stream_state := table_find_pointer(*conn.streams, stream); // @Incomplete: holy indirection, batman!
		if event.Type == {

			case .RECEIVE;
				if event.RECEIVE.BufferCount == 0 {
					stream_state.finished = true;
					return xx Quic_Status.SUCCESS;
				}

				for i : 0..event.RECEIVE.BufferCount -1 { // we only expect one buffer at a time
					buf := event.RECEIVE.Buffers[i];
					array_add(*stream_state.data, array_copy([]u8.{ count = buf.Length, data = buf.Buffer}));
				}

				if event.RECEIVE.Flags & .FIN  stream_state.finished = true;

				stream_state.total_size = xx event.RECEIVE.AbsoluteOffset;

				print("Received: % bytes on stream: %\n", event.RECEIVE.TotalBufferLength, stream);
		}
	}
	return xx Quic_Status.SUCCESS;
}

/* client functions */
Client_Instance :: Server_Instance; // right now these are essentially the same;
 
iahp_client_init :: (settings: Protocol_Settings, server: *Client_Instance) {
	quic_init(settings.app_name, settings.quic_settings, is_client=true);
}


client_connect ::  (address: Address, client: *Client_Instance) -> bool, Connection {
	conn : Connection_State;
	quic_address_family := convert_address_family(address.family);
	quic_address_string := convert_address_to_string(address);

	result, code := quic_connect(client_connection_callback, *conn.connection_id, quic_address_family, quic_address_string, address.port);
	if succeeded(result)  table_add(*client.connections, conn.connection_id, conn);
	
	return result, conn.connection_id;
}

client_connect :: (address_string: string, address_port : u16 = 1443, client: *Client_Instance) -> bool, Connection {
	conn : Connection_State;
	connection_id : Connection;

	connected, code := quic_connect(client_connection_callback, *connection_id, xx client, 2, address_string, address_port);
    assert(connected);
	if connected  table_add(*client.connections, connection_id, conn);
	
	return connected, connection_id;
}

client_close_connection :: (conn_id: Connection, client: Client_Instance) {}; //@Incomplete;

client_connection_callback ::  (conn: HQUIC, client_instance_ptr: *void, event: *QUIC_CONNECTION_EVENT) -> QUIC_STATUS #c_call {
	push_context {

		client_instance := cast (*Client_Instance) client_instance_ptr;
		conn_table_ptr := *client_instance.connections;
        print("reading conn_state. Table size is: %.\n", conn_table_ptr.count);
		conn_state := find_or_add(conn_table_ptr, conn);
	
		print("connection handler event.Type = %\n", event.Type);
		if event.Type == {
        case .CONNECTED;
            conn_state.* = .{ 
                time_joined = current_time_consensus(),
                transport_status = .Connected,
                session_resumed = xx event.CONNECTED.SessionResumed
            };
			print("Player connected!\n");
	    case .SHUTDOWN_INITIATED_BY_TRANSPORT;
			conn_state.transport_status = .Shutting_Down_Transport;
			print("Player disconnected by transport!\n");
	    case .SHUTDOWN_INITIATED_BY_PEER;
			conn_state.transport_status = .Shutting_Down_From_Client;
			print("Player chooses to disconnect!\n");
	    case .SHUTDOWN_COMPLETE;
			conn_state.transport_status = .Shutdown;
			print("Player disconnection complete!\n");
	    case .LOCAL_ADDRESS_CHANGED;
	    case .PEER_ADDRESS_CHANGED;
	    case .PEER_STREAM_STARTED;
			print("Player uploading data!\n");
			// handle_stream(conn.(u64), event.PEER_STREAM_STARTED.Stream);
			stream := event.PEER_STREAM_STARTED.Stream;
			set_stream_callback(stream, server_stream_handler, client_instance);
            print("adding stream!\n");
			table_add(*client_instance.streams, stream, conn);
	    case .STREAMS_AVAILABLE;
			conn_state.streams_available = .{
				bidirectional = event.STREAMS_AVAILABLE.BidirectionalCount,
				unidirectional = event.STREAMS_AVAILABLE.UnidirectionalCount
			};
	    case .PEER_NEEDS_STREAMS;
			// will handle when necessary
	    case .IDEAL_PROCESSOR_CHANGED;
	    case .DATAGRAM_STATE_CHANGED;
			if !event.DATAGRAM_STATE_CHANGED.SendEnabled {
				// CLOSE THE CONNECTION
			}
	    case .DATAGRAM_RECEIVED;
			buf := event.DATAGRAM_RECEIVED.Buffer;
			data := array_copy([]u8.{count = buf.Length, data = buf.Buffer}); // need to make a copy because buffers are currently allocated by MsQuic
			ringbuf_add(*conn_state.realtime_data, .{ data=data, timestamp = current_time_consensus() });
	    case .DATAGRAM_SEND_STATE_CHANGED;
	    case .RESUMED;
			assert(false, "We currently don't support session resumption!");
	    case .RESUMPTION_TICKET_RECEIVED;
			assert(false, "We currently don't support session resumption!");
	    case .PEER_CERTIFICATE_RECEIVED;
		case; assert(false, "Unhandled connection event!");
		}
	}
	return xx Quic_Status.SUCCESS;
}

/* functions for both */

// maybe these should take server instances
send_message :: (conn: Connection, m: *$T/Message, msg_data: []u8, client: *Client_Instance) -> Stream {
	result, stream := stream_open(conn, .UNIDIRECTIONAL, .NONE, server_stream_handler, context_ptr = xx client);
	
	buf : [2][]u8;
	
	buf[0].count = size_of(T);
	buf[0].data = xx m;

	buf[1] = msg_data;
	
	result = stream_send(stream, buf, .FIN); // we'll need to see and make sure that large files are handled fine this way

	// if we wanted to keep track of the streams, this would be the place to do it.
	assert(result == .SUCCESS || result == .PENDING);

	return stream;
}

send_realtime :: (conn: Connection, buf: [][]u8) {
	result := datagram_send(conn, buf);
	if !succeeded(result)  print("Sending datagram failed with status: %", result); // should not crash here
}

construct_initial_message :: (credential: string, bundle_hash: SHA_256_Hash, manifest: []Asset_Entry) -> Initial_Message, []u8 {
    initial_message := Initial_Message.{
        credential = .{ count = credential.count },
        bundle_hash = bundle_hash,
        manifest = .{ count = manifest.count, offset = credential.count }
    };

    // @Note: We could do this without the copies thanks to scatter gather
    // we'll free this once we know that msquic has copied the message to its buffers
    d_size := credential.count + size_of(Asset_Entry) * manifest.count;
    initial_d := NewArray(d_size, u8);
    memcpy(initial_d.data, credential.data, credential.count);
    memcpy(initial_d.data + credential.count, manifest.data, manifest.count * size_of(Asset_Entry));
    return initial_message, initial_d;
}

send_manifest :: (conn: Connection, credential: string, bundle_hash: SHA_256_Hash, manifest: []Asset_Entry, client_instance: *Client_Instance) {
    initial_message, initial_d := construct_initial_message(credential, bundle_hash, manifest);
	defer array_free(initial_d);

    stream := send_message(conn, *initial_message, initial_d, client_instance);
}

hash_eq :: (a: SHA_256_Hash, b: SHA_256_Hash) -> bool {
	is_equal := true;
	for 0..7  is_equal &&= a[it] == b[it] ;
	
	return is_equal;
}

seek_index :: (manifest: Reified_Manifest, main_msg: $T) -> int {
	hash := main_msg.hash;
	idx := -1;
	for manifest {
		if hash_eq(it.hash, hash) {
			idx = it_index;
			break;
		}
	}

	return idx;
}

send_main :: (conn: Connection, hash: SHA_256_Hash, data: []u8, client_instance: *Client_Instance) {
	msg := Main_Message.{ hash = hash };
	send_message(conn, *msg, data, client_instance);
}

/* Wasm Functions Available to the Bundle */


/* Misc */

SHA_256_Hash :: [8]u32;
sha256 :: crypto.sha256_base;

/* Ring Buffer (to be moved somewhere else) */
Ring_Buffer :: struct(N: int, T: Type) {
	data: [N]T;
	count: int;
	index: int;
}

ringbuf_consume :: (buf: *Ring_Buffer) -> buf.T {
	if buf.count > 0 {
		idx := buf.index;
		buf.index = (buf.index + 1) % buf.N;
		buf.count -= 1;

		return buf.data[idx];
	}

	return .{};
}

ringbuf_add :: (buf: *Ring_Buffer, foo: buf.T) {
	open_slot := (buf.count + buf.index) % buf.N;
	buf.data[open_slot] = foo;
	
	if buf.count < buf.N - 1  buf.count += 1;
}

IP_Address :: Address; // @Incomplete: I hate this. It should be IP_Address everywhere or Address everywhere

#import "Basic";
#import "Hash_Table";
#import "quic";
crypto :: #import "jai-crypto";
