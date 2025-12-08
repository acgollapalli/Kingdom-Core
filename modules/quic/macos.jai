/* Kingdom Core: QUIC: MacOS */

QUIC_STATUS :: u32;

succeeded :: inline status => status <= 0;

U32_MAX :u32:   0xffff_ffff;

// ERROR_BASE       : QUIC_STATUS : 200000000;                       // 0xBEBC200
// TLS_ERROR_BASE   : QUIC_STATUS : 256 + ERROR_BASE;                // 0xBEBC300
// CERT_ERROR_BASE  : QUIC_STATUS : 512 + ERROR_BASE;                // 0xBEBC400

QUIC_STATUS_TLS_ALERT :: Alert => (0xff & Alert) + TLS_ERROR_BASE;
QUIC_STATUS_CERT_ERROR :: Val => Val + CERT_ERROR_BASE;

Quic_Status :: enum QUIC_STATUS {
	SUCCESS                 :: 0;                // 0
	PENDING                 :: U32_MAX - 1;      // -2
	CONTINUE                :: U32_MAX;          // -1
	OUT_OF_MEMORY           :: ENOMEM;           // 12
	INVALID_PARAMETER       :: EINVAL;           // 22
	INVALID_STATE           :: EPERM;            // 1
	NOT_SUPPORTED           :: EOPNOTSUPP;       // 95   (102 on macOS)
	NOT_FOUND               :: ENOENT;           // 2
	FILE_NOT_FOUND          :: NOT_FOUND;           // 2
	BUFFER_TOO_SMALL        :: EOVERFLOW;        // 75   (84 on macOS)
	HANDSHAKE_FAILURE       :: ECONNABORTED;     // 103  (53 on macOS)
	ABORTED                 :: ECANCELED;        // 125  (89 on macOS)
	ADDRESS_IN_USE          :: EADDRINUSE;       // 98   (48 on macOS)
	INVALID_ADDRESS         :: EAFNOSUPPORT;     // 97   (47 on macOS)
	CONNECTION_TIMEOUT      :: ETIMEDOUT;        // 110  (60 on macOS)
	CONNECTION_IDLE         :: ETIME;            // 62   (101 on macOS)
	INTERNAL_ERROR          :: EIO;              // 5
	CONNECTION_REFUSED      :: ECONNREFUSED;     // 111  (61 on macOS)
	PROTOCOL_ERROR          :: EPROTO;           // 71   (100 on macOS)
	VER_NEG_ERROR           :: EPROTONOSUPPORT;  // 93   (43 on macOS)
	UNREACHABLE             :: EHOSTUNREACH;     // 113  (65 on macOS)
	TLS_ERROR               :: ENOKEY;           // 126
	USER_CANCELED           :: EOWNERDEAD;       // 130  (105 on macOS)
	ALPN_NEG_FAILURE        :: ENOPROTOOPT;      // 92   (42 on macOS)
	STREAM_LIMIT_REACHED    :: ESTRPIPE;         // 86
	ALPN_IN_USE             :: EPROTOTYPE;       // 91   (41 on macOS)
	ADDRESS_NOT_AVAILABLE   :: EADDRNOTAVAIL;    // 99   (47 on macOS)
	CLOSE_NOTIFY            :: #run QUIC_STATUS_TLS_ALERT(0);        // 0xBEBC300 - Close notify
	BAD_CERTIFICATE         :: #run QUIC_STATUS_TLS_ALERT(42);       // 0xBEBC32A - Bad Certificate
	UNSUPPORTED_CERTIFICATE :: #run QUIC_STATUS_TLS_ALERT(43);       // 0xBEBC32B - Unsupported Certficiate
	REVOKED_CERTIFICATE     :: #run QUIC_STATUS_TLS_ALERT(44);       // 0xBEBC32C - Revoked Certificate
	EXPIRED_CERTIFICATE     :: #run QUIC_STATUS_TLS_ALERT(45);       // 0xBEBC32D - Expired Certificate
	UNKNOWN_CERTIFICATE     :: #run QUIC_STATUS_TLS_ALERT(46);       // 0xBEBC32E - Unknown Certificate
	REQUIRED_CERTIFICATE    :: #run QUIC_STATUS_TLS_ALERT(116);      // 0xBEBC374 - Required Certificate

	CERT_EXPIRED            :: #run QUIC_STATUS_CERT_ERROR(1);       // 0xBEBC401
	CERT_UNTRUSTED_ROOT     :: #run QUIC_STATUS_CERT_ERROR(2);       // 0xBEBC402
	CERT_NO_CERT            :: #run QUIC_STATUS_CERT_ERROR(3);       // 0xBEBC403
}

convert_address :: (address: Address) -> QUIC_ADDR, QUIC_ADDRESS_FAMILY {
	quic_addr : QUIC_ADDR;
	quic_address_family : QUIC_ADDRESS_FAMILY;
	if address.family == {
		case .IPv4;
        quic_address_family = AF_INET;
        nbyte_order_port : u16;
        {
            port := address.port;
            nbarray : [2]u8 = xx (*port);
            nbarray_0 := nbarray[0];
            nbarray[0] = nbarray[1];
            nbarray[1] = nbarray_0;
            nbyte_order_port = nbarray.data.(*u16).*;
        }
			quic_addr.Ipv4 = .{
				sin_len = size_of(sockaddr_in),
				sin_family = AF_INET,
            sin_port = nbyte_order_port, //address.port,
				sin_addr = (*address.address.IPv4).(*in_addr).*
			};
		case .IPv6;
			quic_address_family = AF_INET_6;
			quic_addr.Ipv6 = .{
				sin6_len = size_of(sockaddr_in6),
				sin6_family = AF_INET_6,
				sin6_port = address.port,
				sin6_addr.__u6_addr.__u6_addr16 = address.address.IPv6,
        };
	}
    
        print("setting port: %\n", quic_addr.Ipv4.sin_port);
	return quic_addr, quic_address_family; 
}

AF_INET :: 2;
AF_INET_6 :: 30;

#load "generated_macos.jai";
