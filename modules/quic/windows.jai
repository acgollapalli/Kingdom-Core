/* Kingdom Core: QUIC: Windows */

QUIC_STATUS :: HRESULT;

succeeded :: inline status => status >= 0;


Quic_Error :: enum HRESULT {
    ERROR_QUIC_HANDSHAKE_FAILURE    :: 0x80410000;
    ERROR_QUIC_VER_NEG_FAILURE      :: 0x80410001;
    ERROR_QUIC_USER_CANCELED        :: 0x80410002;
    ERROR_QUIC_INTERNAL_ERROR       :: 0x80410003;
    ERROR_QUIC_PROTOCOL_VIOLATION   :: 0x80410004;
    ERROR_QUIC_CONNECTION_IDLE      :: 0x80410005;
    ERROR_QUIC_CONNECTION_TIMEOUT   :: 0x80410006;
    ERROR_QUIC_ALPN_NEG_FAILURE     :: 0x80410007;
    ERROR_QUIC_STREAM_LIMIT_REACHED :: 0x80410008;
    ERROR_QUIC_ALPN_IN_USE          :: 0x80410009;
};

QUIC_TLS_ALERT_HRESULT_PREFIX   : HRESULT : 0x80410100;

QUIC_STATUS_TLS_ALERT :: Alert => (QUIC_TLS_ALERT_HRESULT_PREFIX | (0xff & Alert));

ENUM_HEX_BUG_FIXED :: false; 

#if ENUM_HEX_BUG_FIXED {
    Quic_Status :: enum HRESULT {
        SUCCESS                 :: 0x0;
        PENDING                 :: 0x703e5;
        CONTINUE                :: 0x704de;
        OUT_OF_MEMORY           :: 0x8007000e;
        INVALID_PARAMETER       :: 0x80070057;
        INVALID_STATE           :: 0x8007139f;
        NOT_SUPPORTED           :: 0x80004002;
        NOT_FOUND               :: 0x80070490;
        FILE_NOT_FOUND          :: 0x80070002;
        BUFFER_TOO_SMALL        :: 0x8007007a;
        HANDSHAKE_FAILURE       :: 0x80410000;
        ABORTED                 :: 0x80004004;
        ADDRESS_IN_USE          :: 0x80072740;
        INVALID_ADDRESS         :: 0x80072741;
        CONNECTION_TIMEOUT      :: 0x80410006;
        CONNECTION_IDLE         :: 0x80410005;
        UNREACHABLE             :: 0x800704d0;
        INTERNAL_ERROR          :: 0x80410003;
        CONNECTION_REFUSED      :: 0x800704c9;
        PROTOCOL_ERROR          :: 0x80410004;
        VER_NEG_ERROR           :: 0x80410001;
        TLS_ERROR               :: 0x80072b18;
        USER_CANCELED           :: 0x80410002;
        ALPN_NEG_FAILURE        :: 0x80410007;
        STREAM_LIMIT_REACHED    :: 0x80410008;
        ALPN_IN_USE             :: 0x80410009;
        CLOSE_NOTIFY            :: #run QUIC_STATUS_TLS_ALERT(0);    // Close notify
        BAD_CERTIFICATE         :: #run QUIC_STATUS_TLS_ALERT(42);   // Bad Certificate
        UNSUPPORTED_CERTIFICATE :: #run QUIC_STATUS_TLS_ALERT(43);   // Unsupported Certficiate
        REVOKED_CERTIFICATE     :: #run QUIC_STATUS_TLS_ALERT(44);   // Revoked Certificate
        EXPIRED_CERTIFICATE     :: #run QUIC_STATUS_TLS_ALERT(45);   // Expired Certificate
        UNKNOWN_CERTIFICATE     :: #run QUIC_STATUS_TLS_ALERT(46);   // Unknown Certificate
        REQUIRED_CERTIFICATE    :: #run QUIC_STATUS_TLS_ALERT(116);  // Required Certificate
        CERT_EXPIRED            :: 0x800B0101;
        CERT_UNTRUSTED_ROOT     :: 0x800B0109;
        CERT_NO_CERT            :: 0x8009030E;
    }
} else {
    fix_hex_bug :: (h: s32) -> s32 { return h; };

    Quic_Status :: enum HRESULT {
        SUCCESS                 :: 0x0;
        PENDING                 :: 0x703e5;
        CONTINUE                :: 0x704de;
        OUT_OF_MEMORY           :: #run fix_hex_bug(0x8007000e);
        INVALID_PARAMETER       :: #run fix_hex_bug(0x80070057);
        INVALID_STATE           :: #run fix_hex_bug(0x8007139f);
        NOT_SUPPORTED           :: #run fix_hex_bug(0x80004002);
        NOT_FOUND               :: #run fix_hex_bug(0x80070490);
        FILE_NOT_FOUND          :: #run fix_hex_bug(0x80070002);
        BUFFER_TOO_SMALL        :: #run fix_hex_bug(0x8007007a);
        HANDSHAKE_FAILURE       :: #run fix_hex_bug(0x80410000);
        ABORTED                 :: #run fix_hex_bug(0x80004004);
        ADDRESS_IN_USE          :: #run fix_hex_bug(0x80072740);
        INVALID_ADDRESS         :: #run fix_hex_bug(0x80072741);
        CONNECTION_TIMEOUT      :: #run fix_hex_bug(0x80410006);
        CONNECTION_IDLE         :: #run fix_hex_bug(0x80410005);
        UNREACHABLE             :: #run fix_hex_bug(0x800704d0);
        INTERNAL_ERROR          :: #run fix_hex_bug(0x80410003);
        CONNECTION_REFUSED      :: #run fix_hex_bug(0x800704c9);
        PROTOCOL_ERROR          :: #run fix_hex_bug(0x80410004);
        VER_NEG_ERROR           :: #run fix_hex_bug(0x80410001);
        TLS_ERROR               :: #run fix_hex_bug(0x80072b18);
        USER_CANCELED           :: #run fix_hex_bug(0x80410002);
        ALPN_NEG_FAILURE        :: #run fix_hex_bug(0x80410007);
        STREAM_LIMIT_REACHED    :: #run fix_hex_bug(0x80410008);
        ALPN_IN_USE             :: #run fix_hex_bug(0x80410009);
        CLOSE_NOTIFY            :: #run QUIC_STATUS_TLS_ALERT(0);    // Close notify
        BAD_CERTIFICATE         :: #run QUIC_STATUS_TLS_ALERT(42);   // Bad Certificate
        UNSUPPORTED_CERTIFICATE :: #run QUIC_STATUS_TLS_ALERT(43);   // Unsupported Certficiate
        REVOKED_CERTIFICATE     :: #run QUIC_STATUS_TLS_ALERT(44);   // Revoked Certificate
        EXPIRED_CERTIFICATE     :: #run QUIC_STATUS_TLS_ALERT(45);   // Expired Certificate
        UNKNOWN_CERTIFICATE     :: #run QUIC_STATUS_TLS_ALERT(46);   // Unknown Certificate
        REQUIRED_CERTIFICATE    :: #run QUIC_STATUS_TLS_ALERT(116);  // Required Certificate
        CERT_EXPIRED            :: #run fix_hex_bug(0x800B0101);
        CERT_UNTRUSTED_ROOT     :: #run fix_hex_bug(0x800B0109);
        CERT_NO_CERT            :: #run fix_hex_bug(0x8009030E);
    }
}
#load "generated_windows.jai";

