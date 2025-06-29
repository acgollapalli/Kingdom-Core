/* Kingdom Core: client */

IS_CONNECTED : bool;
HELLO_STREAM_STARTED: bool;
HELLO_STREAM_START_COMPLETE: bool;
HELLO_SENT: bool;
HELLO_STREAM_ENDED: bool;

main :: () {
	print("starting client\n");

	quic.init("Quic client!", .{});
	conn : quic.HQUIC;
	stream : quic.Stream;
	result : quic.Quic_Status;
	// quic.connect( xx connection_callback, *conn, 2, "127.0.0.1", 8443);
	quic.connect( xx connection_callback, *conn, 2, "127.0.0.1", 64288); // the port doesn't get set properly server-side

	while main_loop := true {
		defer reset_temporary_storage();
		
		if !HELLO_STREAM_STARTED {
			result, stream = quic.stream_open(conn, .UNIDIRECTIONAL, .NONE, stream_callback);
			print("result of opening stream %\n", result.(quic.Quic_Status));
			assert(quic.succeeded(result));
			HELLO_STREAM_STARTED = true; 
		}

		if HELLO_STREAM_START_COMPLETE && !HELLO_SENT {
			buf := "HELLO WORLD";
			buf_buf : [][]u8 = .[xx buf];
			quic.stream_send(stream, buf_buf, .FIN);
			HELLO_SENT = true;
		}

		if HELLO_STREAM_ENDED break main_loop;
	}

	// quic.close();
}

connection_callback :: (conn: quic.HQUIC, ctx: *void, event: *quic.QUIC_CONNECTION_EVENT) -> quic.QUIC_STATUS #c_call {
	push_context {
		print("connection handler event.Type = %\n", event.Type);
		if event.Type == {
			case .CONNECTED;
				print("Connected!");
				IS_CONNECTED = true;
		}
		return xx quic.Quic_Status.SUCCESS;
	}
}

stream_callback :: (stream: quic.HQUIC, context_pointer: *void, event: *quic.QUIC_STREAM_EVENT) -> quic.QUIC_STATUS #c_call {
	push_context {
		print("stream handler event.Type = %\n", event.Type);

		if event.Type == {
			case .START_COMPLETE;
				HELLO_STREAM_START_COMPLETE = true;
			case .SHUTDOWN_COMPLETE;
				HELLO_STREAM_ENDED = true;
				print("HELLO STREAM ENDED IS NOW TRUE\n");
		}
	}
	
	return xx quic.Quic_Status.SUCCESS;
}


Context :: type_of(context);

#import "Basic";
quic :: #import "quic"(IS_CLIENT=true);
