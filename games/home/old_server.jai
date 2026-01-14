/* Kingdom Core: Demo Game: HOME: server */

Connection_Data :: struct {}
Connections : Table(u64, Connection_Data);

Stream_Data :: struct {}
Streams : Table(u64, Stream_Data);

RECEIVED_HELLO : bool;

Settings := q.QUIC_SETTINGS.{
	IsSet.__bitfield = xx q.IsSetFlags.PeerUnidiStreamCount,
	PeerUnidiStreamCount = 1,
};


main :: () {
	print("starting game server for HOME\n");
	address : q.QUIC_ADDR;
	
	#if OS == .WINDOWS  address.Ipv4 = .{sin_family=2, sin_port=8443, sin_addr=.{S_un.S_un_b=.{s_b1=127, s_b4=1}}}; // port not getting set properly on windows
	
	run("HOME", *address);
	print("Server is now listening\n");

	while main_loop := true {
		defer reset_temporary_storage();
		
		// actually run game here iterating over game data structures modified in real time by the
		// data received from players.
		// then broadcast game data to each player
		
		if RECEIVED_HELLO break main_loop;
	}
}

run :: (app_name: string, address: *q.QUIC_ADDR) {
	q.init(app_name, Settings);
	server : q.HQUIC;
	q.start_server(xx listener_handler, *server, address);
}

handle_connect :: (conn_id: u64) {}
handle_disconnect :: (conn_id: u64) {}

handle_game_data :: (conn_id: u64, data: []u8) {}

listener_handler :: (listener: q.HQUIC, context_pointer: *void, event: *q.QUIC_LISTENER_EVENT) -> q.QUIC_STATUS #c_call {
	push_context {
		print("listener haandler event.Type = %\n", event.Type);
		if event.Type == {
			case .NEW_CONNECTION;
				conn := event.NEW_CONNECTION.Connection;
				q.set_callback(conn, connection_handler);
				q.connection_set_configuration(conn);
			case .STOP_COMPLETE; print("Server shutting down.\n");
			case .DOS_MODE_CHANGED; assert(false, "DOS mode shouldn't be a consideration for us!");
			case; assert(false, "Unhandled listener event type!");
		}
	}
	return xx q.Quic_Status.SUCCESS;
}

connection_handler :: (conn: q.HQUIC, context_pointer: *void, event: *q.QUIC_CONNECTION_EVENT) -> q.QUIC_STATUS #c_call {
	push_context { // this may be a bad approach, actually, need to try and see
		print("connection handler event.Type = %\n", event.Type);
		if event.Type == {
		case .CONNECTED;
			handle_connect(conn.(u64));
			print("Player connected!\n");
	    case .SHUTDOWN_INITIATED_BY_TRANSPORT;
			print("Player disconnected by transport!\n");
	    case .SHUTDOWN_INITIATED_BY_PEER;
			print("Player chooses to disconnect!\n");
	    case .SHUTDOWN_COMPLETE;
			handle_disconnect(conn.(u64));
			print("Player disconnection complete!\n");
	    case .LOCAL_ADDRESS_CHANGED;
	    case .PEER_ADDRESS_CHANGED;
	    case .PEER_STREAM_STARTED;
			print("Player uploading data!\n");
			// handle_stream(conn.(u64), event.PEER_STREAM_STARTED.Stream);
			q.set_callback(event.PEER_STREAM_STARTED.Stream, stream_handler);
	    case .STREAMS_AVAILABLE;
	    case .PEER_NEEDS_STREAMS;
	    case .IDEAL_PROCESSOR_CHANGED;
	    case .DATAGRAM_STATE_CHANGED;
			if !event.DATAGRAM_STATE_CHANGED.SendEnabled {
				// CLOSE THE CONNECTION
			}
	    case .DATAGRAM_RECEIVED;
			buf := event.DATAGRAM_RECEIVED.Buffer;
			data := []u8.{count = buf.Length, data = buf.Buffer};
			handle_game_data(conn.(u64), data);
	    case .DATAGRAM_SEND_STATE_CHANGED;
	    case .RESUMED;
			assert(false, "We currently don't support session resumption!");
	    case .RESUMPTION_TICKET_RECEIVED;
			assert(false, "We currently don't support session resumption!");
	    case .PEER_CERTIFICATE_RECEIVED;
		case; assert(false, "Unhandled connection event!");
		}
	}
	return xx q.Quic_Status.SUCCESS;
}

stream_handler :: (stream: q.Stream, context_pointer: *void, event: *q.QUIC_STREAM_EVENT) -> q.QUIC_STATUS #c_call {
	push_context { // this may be a bad approach, actually, need to try and see
		print("received stream event: %\n", event.Type);
		if event.Type == .RECEIVE { // @Incomplete: This will break for a number of reasons
			s := "";
			s.count = event.RECEIVE.Buffers[0].Length;
			s.data = xx event.RECEIVE.Buffers[0].Buffer;

			print("Received: %\n", s);
			RECEIVED_HELLO = true;
		}
	}
	return xx q.Quic_Status.SUCCESS;
}


Context :: type_of(context);

#import "Basic";
#import "Hash_Table";
q :: #import "quic";
