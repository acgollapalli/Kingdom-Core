/*                            Kingdom Core: QUIC                            */

PROTOCOL_STRING :: "IHMP/1.0";
ALPN := QUIC_BUFFER.{ Length = PROTOCOL_STRING.count, Buffer = PROTOCOL_STRING };

Quic_Settings :: QUIC_SETTINGS;

quic_init :: (app_name: string, settings: QUIC_SETTINGS, cert_hash := "", is_client: bool ) {
	assert(Quic_Context == null);
	
	init_status := MsQuicOpenVersion(QUIC_API_VERSION_2, xx *Quic_Context);
	assert(succeeded(init_status), tprint("Failed to initialize QUIC. Status: %", init_status));

	app_name_c := to_c_string(app_name);
	defer free(app_name_c);

	// @Note: we may want to have multiple registrations for different
	// latency patterns etc. 
	registration_config := QUIC_REGISTRATION_CONFIG.{
		AppName = app_name_c
	};

	registration_status := Quic_Context.RegistrationOpen(*registration_config, *Quic_Registration);
	assert(succeeded(registration_status), tprint("Failed to create QUIC registration. Status: %", registration_status.(Quic_Status)));

	config_status := Quic_Context.ConfigurationOpen(Quic_Registration, *ALPN, 1,  *settings, size_of(QUIC_SETTINGS), xx *context, *Quic_Configuration);
	assert(succeeded(config_status), tprint("Failed to create QUIC configuration. Status: %", config_status.(Quic_Status)));

	cred_config : QUIC_CREDENTIAL_CONFIG;
	if is_client {
		cred_config.Type = .NONE;
		cred_config.Flags |= .NO_CERTIFICATE_VALIDATION | .CLIENT;
	} else {
		assert(cert_hash != "", "Must provide cert hash for servers!");
		quic_cert_hash := read_hex_string(cert_hash);

		cred_config.Type = .CERTIFICATE_HASH;
		cred_config.CertificateHash = *quic_cert_hash;
		print("Cert hash struct is: %\n", cred_config.CertificateHash.*);
	}

	cred_status := Quic_Context.ConfigurationLoadCredential(Quic_Configuration, *cred_config);
	assert(succeeded(cred_status), tprint("Failed to load QUIC credentials. Status: %\n", cred_status.(Quic_Status)));
}

quic_close :: () {
	assert(Quic_Context != null);
	
	Quic_Context.ConfigurationClose(Quic_Configuration);
	Quic_Context.RegistrationClose(Quic_Registration);
	MsQuicClose(Quic_Context);
}

Server :: HQUIC;

// @Note: these things both accept and return callbacks.
// It would be totally possible to just pass the handle and context back
// as a context function for a more native API. For a future improvment.
server_start :: (callback: QUIC_LISTENER_CALLBACK, address: *QUIC_ADDR, server_context: *void) -> Server {
	assert(Quic_Context != null);
	
	server: HQUIC;

	open_status := Quic_Context.ListenerOpen(Quic_Registration, xx callback, server_context, *server);
	assert(succeeded(open_status), tprint("Failed to open server listener!. Status: %", open_status));

	start_status := Quic_Context.ListenerStart(server, *ALPN, 1, address);
	assert(succeeded(start_status), tprint("Failed to start server listener!. Status: %", start_status));

	return server;
}

server_close :: (server: Server) {
	assert(Quic_Context != null);
	
	Quic_Context.ListenerClose(server);
};

connection_set_configuration :: (conn: HQUIC) {
	Quic_Context.ConnectionSetConfiguration(conn, Quic_Configuration);
}

Connection :: HQUIC;

// @Incomplete: We need to take the errors and status codes from quic so we can
// interpret them and turn them into actual enums
quic_connect :: (callback: QUIC_CONNECTION_CALLBACK_HANDLER, connection: *Connection, ctx_ptr: *void, address_family: QUIC_ADDRESS_FAMILY, server: string, port: u16) -> bool, Quic_Status {
	assert(Quic_Context != null);
	
	open_status := Quic_Context.ConnectionOpen(Quic_Registration, callback, ctx_ptr, connection);
	if !succeeded(open_status) {
		print("Failed to open client connection!. Status: %\n", open_status.(Quic_Status));
		return false, xx open_status;
	}

	server_c := to_c_string(server);
	defer free(server_c);
	start_status := Quic_Context.ConnectionStart(connection.*, Quic_Configuration, address_family, server_c, port);
	if !succeeded(start_status) && start_status.(Quic_Status) != .PENDING {
		print("Failed to start client connection!. Status: %\n", start_status.(Quic_Status));
		return false, xx start_status;
	}

	return true, .SUCCESS;
}

set_connection_callback :: (handle: HQUIC, handler: QUIC_CONNECTION_CALLBACK, server: *void) {
	assert(Quic_Context != null);
	Quic_Context.SetCallbackHandler(handle, xx handler, server);
}

set_stream_callback :: (handle: Stream, handler: QUIC_STREAM_CALLBACK, server: *void) {
	assert(Quic_Context != null);
	Quic_Context.SetCallbackHandler(handle, xx handler, server);
}

datagram_send :: (conn: HQUIC, buf: [][]u8) -> Quic_Status {
	assert(Quic_Context != null);
	
	quic_buf : [..]QUIC_BUFFER;
	quic_buff.allocator = temp; // not perfect. Sometimes quic can hold onto the buffers if result is not COMPLETE

	for buf  array_add(*quic_buf, .{ Length = xx it.count, Buffer = it.data });

	result := Quic_Context.DatagramSend(conn, quic_buf.data, xx quic_buf.count, .DGRAM_PRIORITY, *context);
	return result.(Quic_Status);
}


Stream :: HQUIC;

stream_open :: (conn: HQUIC, open_flags: QUIC_STREAM_OPEN_FLAGS, start_flags: QUIC_STREAM_START_FLAGS, handler: QUIC_STREAM_CALLBACK, context_ptr := null) -> Quic_Status, Stream {
	assert(Quic_Context != null);
	
	stream : HQUIC;
	result : QUIC_STATUS;
	result = Quic_Context.StreamOpen(conn, open_flags, xx handler, context_ptr, *stream);

	if result.(Quic_Status) == .SUCCESS {
		result = Quic_Context.StreamStart(stream, start_flags);	
	}
	
	return result.(Quic_Status), stream;
}

stream_send :: (stream: Stream, buffers: [][]u8, flags: QUIC_SEND_FLAGS) -> Quic_Status {
	assert(Quic_Context != null);
	
	quic_buf : [..]QUIC_BUFFER;
	quic_buf.allocator = temp;

	for buffers  array_add(*quic_buf, .{ Length = xx it.count, Buffer = it.data });

	result := Quic_Context.StreamSend(stream, quic_buf.data, xx quic_buf.count, flags, *context);
	return result.(Quic_Status);
}

// for QUIC_SETTINGS
IsSetFlags :: enum_flags u64 {
    MaxBytesPerKey; 
    HandshakeIdleTimeoutMs; 
    IdleTimeoutMs; 
    MtuDiscoverySearchCompleteTimeoutUs; 
    TlsClientMaxSendBuffer; 
    TlsServerMaxSendBuffer; 
    StreamRecvWindowDefault; 
    StreamRecvBufferDefault; 
    ConnFlowControlWindow; 
    MaxWorkerQueueDelayUs; 
    MaxStatelessOperations; 
    InitialWindowPackets; 
    SendIdleTimeoutMs; 
    InitialRttMs; 
    MaxAckDelayMs; 
    DisconnectTimeoutMs; 
    KeepAliveIntervalMs; 
    CongestionControlAlgorithm; 
    PeerBidiStreamCount; 
    PeerUnidiStreamCount; 
    MaxBindingStatelessOperations; 
    StatelessOperationExpirationMs; 
    MinimumMtu; 
    MaximumMtu; 
    SendBufferingEnabled; 
    PacingEnabled; 
    MigrationEnabled; 
    DatagramReceiveEnabled; 
    ServerResumptionLevel; 
    MaxOperationsPerDrain; 
    MtuDiscoveryMissingProbeCount; 
    DestCidUpdateIdleTimeoutMs; 
    GreaseQuicBitEnabled; 
    EcnEnabled; 
    HyStartEnabled; 
    StreamRecvWindowBidiLocalDefault; 
    StreamRecvWindowBidiRemoteDefault; 
    StreamRecvWindowUnidiDefault; 
}

SettingsFlags :: enum_flags u8 {
    SendBufferingEnabled :: 1; 
    PacingEnabled :: 2;
    MigrationEnabled :: 4 ;
    DatagramReceiveEnabled :: 8;
    // ServerResumptionLevel: u8;  // QUIC_SERVER_RESUMPTION_LEVEL
    GreaseQuicBitEnabled :: 64;
    EcnEnabled :: 128; 
}

MiscFlags :: enum_flags u8 {
	HyStartEnabled; 
}

read_hex_string :: (hex: string) -> QUIC_CERTIFICATE_HASH {
	hash : QUIC_CERTIFICATE_HASH;
	for hex {
		print("char: %\n", it);
		quarter_word : u8;
		if it <= 31  continue;
		
		if it <= "9" {
			quarter_word = it - "0";
		} else if it <= "F" {
			print("it - \"A\" = % \n", it - "A" + 10);
			quarter_word = it - "A" + 10; 
		} else if it <= "f" {
			quarter_word = it - "a" + 10;
		}

		print("quarter_word = %\n", formatInt(quarter_word, base=16));
		if !(it_index % 2)  quarter_word <<= 4; 

		print("quarter_word = %\n", formatInt(quarter_word, base=16));
		
		hash.ShaHash[it_index / 2] |= quarter_word;
		print("hash is now %, at index %\n", hash, it_index);
	}
	return hash;
}

Address :: struct {
	family: enum {
		IPv4;
		IPv6;
	};
	address: union {
		IPv4: IPv4_Address;
		IPv6: IPv6_Address;
	};
	port: u16;
}

IPv4_Address :: [4]u8;
IPv6_Address :: [8]u16;

#scope_file

Quic_Context : *QUIC_API_TABLE;
Quic_Registration : HQUIC;
Quic_Configuration: HQUIC;

#if OS == .WINDOWS {
	#load "windows.jai";
} else #if OS == .LINUX {
	#load "linux.jai";
} else #if OS == .MACOS {
	#load "macos.jai";
}
#import "File";

