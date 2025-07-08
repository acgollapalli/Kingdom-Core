/* Kingdom Core: Home */

main :: () {

	server: Server_Instance;
	settings: Protocol_Settings;
	
	iahp_server_init(settings, *server);

	while true {
		for server.connections {
			if it.status == {
				case .Connected;
				// do connnected stuff
				case .Shudown;
				// clean up
			}
		}
	}
	
}

#import "protocol";
