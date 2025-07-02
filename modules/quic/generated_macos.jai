//
// This file was auto-generated using the following command:
//
// jai modules/quic/generate.jai
//



ESTRPIPE :: 86;

ENOKEY :: 126;

ERROR_BASE :: 200000000;
TLS_ERROR_BASE :: 256 + ERROR_BASE;
CERT_ERROR_BASE :: 512 + ERROR_BASE;

FALSE :: 0;
TRUE :: 1;

QUIC_CERTIFICATE_FLAG_IGNORE_REVOCATION :: 0x00000080;
QUIC_CERTIFICATE_FLAG_IGNORE_UNKNOWN_CA :: 0x00000100;
QUIC_CERTIFICATE_FLAG_IGNORE_WRONG_USAGE :: 0x00000200;
QUIC_CERTIFICATE_FLAG_IGNORE_CERTIFICATE_CN_INVALID :: 0x00001000;
QUIC_CERTIFICATE_FLAG_IGNORE_CERTIFICATE_DATE_INVALID :: 0x00002000;
QUIC_CERTIFICATE_FLAG_IGNORE_WEAK_SIGNATURE :: 0x00010000;

QUIC_UINT62_MAX :: (1 << 62) - 1;

QUIC_MAX_ALPN_LENGTH :: 255;

QUIC_MAX_SNI_LENGTH :: 65535;

QUIC_MAX_RESUMPTION_APP_DATA_LENGTH :: 1000;

QUIC_STATELESS_RESET_KEY_LENGTH :: 32;

QUIC_MAX_TICKET_KEY_COUNT :: 16;

QUIC_TLS_SECRETS_MAX_SECRET_LEN :: 64;

QUIC_PARAM_PREFIX_GLOBAL :: 0x01000000;
QUIC_PARAM_PREFIX_REGISTRATION :: 0x02000000;
QUIC_PARAM_PREFIX_CONFIGURATION :: 0x03000000;
QUIC_PARAM_PREFIX_LISTENER :: 0x04000000;
QUIC_PARAM_PREFIX_CONNECTION :: 0x05000000;
QUIC_PARAM_PREFIX_TLS :: 0x06000000;
QUIC_PARAM_PREFIX_TLS_SCHANNEL :: 0x07000000;
QUIC_PARAM_PREFIX_STREAM :: 0x08000000;

QUIC_PARAM_HIGH_PRIORITY :: 0x40000000;

QUIC_PARAM_GLOBAL_RETRY_MEMORY_PERCENT :: 0x01000000;
QUIC_PARAM_GLOBAL_SUPPORTED_VERSIONS :: 0x01000001;
QUIC_PARAM_GLOBAL_LOAD_BALACING_MODE :: 0x01000002;
QUIC_PARAM_GLOBAL_PERF_COUNTERS :: 0x01000003;
QUIC_PARAM_GLOBAL_LIBRARY_VERSION :: 0x01000004;
QUIC_PARAM_GLOBAL_SETTINGS :: 0x01000005;
QUIC_PARAM_GLOBAL_GLOBAL_SETTINGS :: 0x01000006;

QUIC_PARAM_GLOBAL_LIBRARY_GIT_HASH :: 0x01000008;

QUIC_PARAM_GLOBAL_TLS_PROVIDER :: 0x0100000A;
QUIC_PARAM_GLOBAL_STATELESS_RESET_KEY :: 0x0100000B;
QUIC_PARAM_GLOBAL_STATISTICS_V2_SIZES :: 0x0100000C;

QUIC_PARAM_CONFIGURATION_SETTINGS :: 0x03000000;
QUIC_PARAM_CONFIGURATION_TICKET_KEYS :: 0x03000001;

QUIC_PARAM_CONFIGURATION_SCHANNEL_CREDENTIAL_ATTRIBUTE_W :: 0x03000003;

QUIC_PARAM_LISTENER_LOCAL_ADDRESS :: 0x04000000;
QUIC_PARAM_LISTENER_STATS :: 0x04000001;

QUIC_PARAM_DOS_MODE_EVENTS :: 0x04000004;

QUIC_PARAM_CONN_QUIC_VERSION :: 0x05000000;
QUIC_PARAM_CONN_LOCAL_ADDRESS :: 0x05000001;
QUIC_PARAM_CONN_REMOTE_ADDRESS :: 0x05000002;
QUIC_PARAM_CONN_IDEAL_PROCESSOR :: 0x05000003;
QUIC_PARAM_CONN_SETTINGS :: 0x05000004;
QUIC_PARAM_CONN_STATISTICS :: 0x05000005;
QUIC_PARAM_CONN_STATISTICS_PLAT :: 0x05000006;
QUIC_PARAM_CONN_SHARE_UDP_BINDING :: 0x05000007;
QUIC_PARAM_CONN_LOCAL_BIDI_STREAM_COUNT :: 0x05000008;
QUIC_PARAM_CONN_LOCAL_UNIDI_STREAM_COUNT :: 0x05000009;
QUIC_PARAM_CONN_MAX_STREAM_IDS :: 0x0500000A;
QUIC_PARAM_CONN_CLOSE_REASON_PHRASE :: 0x0500000B;
QUIC_PARAM_CONN_STREAM_SCHEDULING_SCHEME :: 0x0500000C;
QUIC_PARAM_CONN_DATAGRAM_RECEIVE_ENABLED :: 0x0500000D;
QUIC_PARAM_CONN_DATAGRAM_SEND_ENABLED :: 0x0500000E;

QUIC_PARAM_CONN_RESUMPTION_TICKET :: 0x05000010;
QUIC_PARAM_CONN_PEER_CERTIFICATE_VALID :: 0x05000011;
QUIC_PARAM_CONN_LOCAL_INTERFACE :: 0x05000012;
QUIC_PARAM_CONN_TLS_SECRETS :: 0x05000013;

QUIC_PARAM_CONN_STATISTICS_V2 :: 0x05000016;
QUIC_PARAM_CONN_STATISTICS_V2_PLAT :: 0x05000017;
QUIC_PARAM_CONN_ORIG_DEST_CID :: 0x05000018;
QUIC_PARAM_CONN_SEND_DSCP :: 0x05000019;

QUIC_PARAM_TLS_HANDSHAKE_INFO :: 0x06000000;
QUIC_PARAM_TLS_NEGOTIATED_ALPN :: 0x06000001;

QUIC_PARAM_STREAM_ID :: 0x08000000;
QUIC_PARAM_STREAM_0RTT_LENGTH :: 0x08000001;
QUIC_PARAM_STREAM_IDEAL_SEND_BUFFER_SIZE :: 0x08000002;
QUIC_PARAM_STREAM_PRIORITY :: 0x08000003;
QUIC_PARAM_STREAM_STATISTICS :: 0X08000004;

QUIC_API_VERSION_1 :: 1;
QUIC_API_VERSION_2 :: 2;

in_addr_t :: u32;

in_port_t :: u16;

socklen_t :: u32;

sa_family_t :: u8;

sockaddr :: struct {
    sa_len:    u8;
    sa_family: sa_family_t;
    sa_data:   [14] u8;
}

in_addr :: struct {
    s_addr: in_addr_t;
}

sockaddr_in :: struct {
    sin_len:    u8;
    sin_family: sa_family_t;
    sin_port:   in_port_t;
    sin_addr:   in_addr;
    sin_zero:   [8] u8;
}

in6_addr :: struct {
    __u6_addr: union {
        __u6_addr8:  [16] u8;
        __u6_addr16: [8] u16;
        __u6_addr32: [4] u32;
    };
}

sockaddr_in6 :: struct {
    sin6_len:      u8;
    sin6_family:   sa_family_t;
    sin6_port:     in_port_t;
    sin6_flowinfo: u32;
    sin6_addr:     in6_addr;
    sin6_scope_id: u32;
}

addrinfo :: struct {
    ai_flags:     s32;
    ai_family:    s32;
    ai_socktype:  s32;
    ai_protocol:  s32;
    ai_addrlen:   socklen_t;
    ai_canonname: *u8;
    ai_addr:      *sockaddr;
    ai_next:      *addrinfo;
}

_ENUM_FLAG_INTEGER_FOR_SIZE :: struct(S: u64) {}

// used as an approximation of std::underlying_type<T>
_ENUM_FLAG_SIZED_INTEGER :: struct(T: Type) {}

BOOLEAN :: u8;
IN_ADDR :: in_addr;
IN6_ADDR :: in6_addr;
ADDRINFO :: addrinfo;
QUIC_ADDRESS_FAMILY :: sa_family_t;

QUIC_ADDR :: union {
    Ip:   sockaddr;
    Ipv4: sockaddr_in;
    Ipv6: sockaddr_in6;
}

//
// Represents an IP address and (optionally) port number as a string.
//
QUIC_ADDR_STR :: struct {
    Address: [64] u8;
}

kevent :: struct {
    ident:  u64 #align 4;
    filter: s16;
    flags:  u16;
    fflags: u32;
    data:   s64 #align 4;
    udata:  *void #align 4;
}

kevent_ :: (kq: s32, changelist: *kevent, nchanges: s32, eventlist: *kevent, nevents: s32, timeout: *timespec) -> s32 #foreign libmsquic "kevent";

QUIC_EVENTQ :: s32;

QUIC_CQE :: kevent;

QUIC_EVENT_COMPLETION :: #type (Cqe: *QUIC_CQE) -> void #c_call;

QUIC_EVENT_COMPLETION_HANDLER :: QUIC_EVENT_COMPLETION;

QUIC_SQE :: struct {
    Handle:     u64;
    Completion: QUIC_EVENT_COMPLETION_HANDLER;
}

QUIC_HANDLE :: struct {}
HQUIC :: *QUIC_HANDLE;

//
// Represents a 62-bit integer.
//
QUIC_UINT62 :: u64;

QUIC_TLS_PROVIDER :: enum u32 {
    SCHANNEL :: 0;
    OPENSSL  :: 1;

    QUIC_TLS_PROVIDER_SCHANNEL :: SCHANNEL;
    QUIC_TLS_PROVIDER_OPENSSL  :: OPENSSL;
}

QUIC_EXECUTION_PROFILE :: enum u32 {
    LOW_LATENCY         :: 0;
    TYPE_MAX_THROUGHPUT :: 1;
    TYPE_SCAVENGER      :: 2;
    TYPE_REAL_TIME      :: 3;

    QUIC_EXECUTION_PROFILE_LOW_LATENCY         :: LOW_LATENCY;
    QUIC_EXECUTION_PROFILE_TYPE_MAX_THROUGHPUT :: TYPE_MAX_THROUGHPUT;
    QUIC_EXECUTION_PROFILE_TYPE_SCAVENGER      :: TYPE_SCAVENGER;
    QUIC_EXECUTION_PROFILE_TYPE_REAL_TIME      :: TYPE_REAL_TIME;
}

QUIC_LOAD_BALANCING_MODE :: enum u32 {
    DISABLED        :: 0;
    SERVER_ID_IP    :: 1;
    SERVER_ID_FIXED :: 2;
    COUNT           :: 3;

    QUIC_LOAD_BALANCING_DISABLED        :: DISABLED;
    QUIC_LOAD_BALANCING_SERVER_ID_IP    :: SERVER_ID_IP;
    QUIC_LOAD_BALANCING_SERVER_ID_FIXED :: SERVER_ID_FIXED;
    QUIC_LOAD_BALANCING_COUNT           :: COUNT;
}

QUIC_TLS_ALERT_CODES :: enum u32 {
    SUCCESS                 :: 65535;
    UNEXPECTED_MESSAGE      :: 10;
    BAD_CERTIFICATE         :: 42;
    UNSUPPORTED_CERTIFICATE :: 43;
    CERTIFICATE_REVOKED     :: 44;
    CERTIFICATE_EXPIRED     :: 45;
    CERTIFICATE_UNKNOWN     :: 46;
    ILLEGAL_PARAMETER       :: 47;
    UNKNOWN_CA              :: 48;
    ACCESS_DENIED           :: 49;
    INSUFFICIENT_SECURITY   :: 71;
    INTERNAL_ERROR          :: 80;
    USER_CANCELED           :: 90;
    CERTIFICATE_REQUIRED    :: 116;
    MAX                     :: 255;

    QUIC_TLS_ALERT_CODE_SUCCESS                 :: SUCCESS;
    QUIC_TLS_ALERT_CODE_UNEXPECTED_MESSAGE      :: UNEXPECTED_MESSAGE;
    QUIC_TLS_ALERT_CODE_BAD_CERTIFICATE         :: BAD_CERTIFICATE;
    QUIC_TLS_ALERT_CODE_UNSUPPORTED_CERTIFICATE :: UNSUPPORTED_CERTIFICATE;
    QUIC_TLS_ALERT_CODE_CERTIFICATE_REVOKED     :: CERTIFICATE_REVOKED;
    QUIC_TLS_ALERT_CODE_CERTIFICATE_EXPIRED     :: CERTIFICATE_EXPIRED;
    QUIC_TLS_ALERT_CODE_CERTIFICATE_UNKNOWN     :: CERTIFICATE_UNKNOWN;
    QUIC_TLS_ALERT_CODE_ILLEGAL_PARAMETER       :: ILLEGAL_PARAMETER;
    QUIC_TLS_ALERT_CODE_UNKNOWN_CA              :: UNKNOWN_CA;
    QUIC_TLS_ALERT_CODE_ACCESS_DENIED           :: ACCESS_DENIED;
    QUIC_TLS_ALERT_CODE_INSUFFICIENT_SECURITY   :: INSUFFICIENT_SECURITY;
    QUIC_TLS_ALERT_CODE_INTERNAL_ERROR          :: INTERNAL_ERROR;
    QUIC_TLS_ALERT_CODE_USER_CANCELED           :: USER_CANCELED;
    QUIC_TLS_ALERT_CODE_CERTIFICATE_REQUIRED    :: CERTIFICATE_REQUIRED;
    QUIC_TLS_ALERT_CODE_MAX                     :: MAX;
}

QUIC_CREDENTIAL_TYPE :: enum u32 {
    NONE                       :: 0;
    CERTIFICATE_HASH           :: 1;
    CERTIFICATE_HASH_STORE     :: 2;
    CERTIFICATE_CONTEXT        :: 3;
    CERTIFICATE_FILE           :: 4;
    CERTIFICATE_FILE_PROTECTED :: 5;
    CERTIFICATE_PKCS12         :: 6;

    QUIC_CREDENTIAL_TYPE_NONE                       :: NONE;
    QUIC_CREDENTIAL_TYPE_CERTIFICATE_HASH           :: CERTIFICATE_HASH;
    QUIC_CREDENTIAL_TYPE_CERTIFICATE_HASH_STORE     :: CERTIFICATE_HASH_STORE;
    QUIC_CREDENTIAL_TYPE_CERTIFICATE_CONTEXT        :: CERTIFICATE_CONTEXT;
    QUIC_CREDENTIAL_TYPE_CERTIFICATE_FILE           :: CERTIFICATE_FILE;
    QUIC_CREDENTIAL_TYPE_CERTIFICATE_FILE_PROTECTED :: CERTIFICATE_FILE_PROTECTED;
    QUIC_CREDENTIAL_TYPE_CERTIFICATE_PKCS12         :: CERTIFICATE_PKCS12;
}

QUIC_CREDENTIAL_FLAGS :: enum_flags u32 {
    NONE                                   :: 0x0;
    CLIENT                                 :: 0x1;
    LOAD_ASYNCHRONOUS                      :: 0x2;
    NO_CERTIFICATE_VALIDATION              :: 0x4;
    ENABLE_OCSP                            :: 0x8;
    INDICATE_CERTIFICATE_RECEIVED          :: 0x10;
    DEFER_CERTIFICATE_VALIDATION           :: 0x20;
    REQUIRE_CLIENT_AUTHENTICATION          :: 0x40;
    USE_TLS_BUILTIN_CERTIFICATE_VALIDATION :: 0x80;
    REVOCATION_CHECK_END_CERT              :: 0x100;
    REVOCATION_CHECK_CHAIN                 :: 0x200;
    REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT    :: 0x400;
    IGNORE_NO_REVOCATION_CHECK             :: 0x800;
    IGNORE_REVOCATION_OFFLINE              :: 0x1000;
    SET_ALLOWED_CIPHER_SUITES              :: 0x2000;
    USE_PORTABLE_CERTIFICATES              :: 0x4000;
    USE_SUPPLIED_CREDENTIALS               :: 0x8000;
    USE_SYSTEM_MAPPER                      :: 0x10000;
    CACHE_ONLY_URL_RETRIEVAL               :: 0x20000;
    REVOCATION_CHECK_CACHE_ONLY            :: 0x40000;
    INPROC_PEER_CERTIFICATE                :: 0x80000;
    SET_CA_CERTIFICATE_FILE                :: 0x100000;
    DISABLE_AIA                            :: 0x200000;

    QUIC_CREDENTIAL_FLAG_NONE                                   :: NONE;
    QUIC_CREDENTIAL_FLAG_CLIENT                                 :: CLIENT;
    QUIC_CREDENTIAL_FLAG_LOAD_ASYNCHRONOUS                      :: LOAD_ASYNCHRONOUS;
    QUIC_CREDENTIAL_FLAG_NO_CERTIFICATE_VALIDATION              :: NO_CERTIFICATE_VALIDATION;
    QUIC_CREDENTIAL_FLAG_ENABLE_OCSP                            :: ENABLE_OCSP;
    QUIC_CREDENTIAL_FLAG_INDICATE_CERTIFICATE_RECEIVED          :: INDICATE_CERTIFICATE_RECEIVED;
    QUIC_CREDENTIAL_FLAG_DEFER_CERTIFICATE_VALIDATION           :: DEFER_CERTIFICATE_VALIDATION;
    QUIC_CREDENTIAL_FLAG_REQUIRE_CLIENT_AUTHENTICATION          :: REQUIRE_CLIENT_AUTHENTICATION;
    QUIC_CREDENTIAL_FLAG_USE_TLS_BUILTIN_CERTIFICATE_VALIDATION :: USE_TLS_BUILTIN_CERTIFICATE_VALIDATION;
    QUIC_CREDENTIAL_FLAG_REVOCATION_CHECK_END_CERT              :: REVOCATION_CHECK_END_CERT;
    QUIC_CREDENTIAL_FLAG_REVOCATION_CHECK_CHAIN                 :: REVOCATION_CHECK_CHAIN;
    QUIC_CREDENTIAL_FLAG_REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT    :: REVOCATION_CHECK_CHAIN_EXCLUDE_ROOT;
    QUIC_CREDENTIAL_FLAG_IGNORE_NO_REVOCATION_CHECK             :: IGNORE_NO_REVOCATION_CHECK;
    QUIC_CREDENTIAL_FLAG_IGNORE_REVOCATION_OFFLINE              :: IGNORE_REVOCATION_OFFLINE;
    QUIC_CREDENTIAL_FLAG_SET_ALLOWED_CIPHER_SUITES              :: SET_ALLOWED_CIPHER_SUITES;
    QUIC_CREDENTIAL_FLAG_USE_PORTABLE_CERTIFICATES              :: USE_PORTABLE_CERTIFICATES;
    QUIC_CREDENTIAL_FLAG_USE_SUPPLIED_CREDENTIALS               :: USE_SUPPLIED_CREDENTIALS;
    QUIC_CREDENTIAL_FLAG_USE_SYSTEM_MAPPER                      :: USE_SYSTEM_MAPPER;
    QUIC_CREDENTIAL_FLAG_CACHE_ONLY_URL_RETRIEVAL               :: CACHE_ONLY_URL_RETRIEVAL;
    QUIC_CREDENTIAL_FLAG_REVOCATION_CHECK_CACHE_ONLY            :: REVOCATION_CHECK_CACHE_ONLY;
    QUIC_CREDENTIAL_FLAG_INPROC_PEER_CERTIFICATE                :: INPROC_PEER_CERTIFICATE;
    QUIC_CREDENTIAL_FLAG_SET_CA_CERTIFICATE_FILE                :: SET_CA_CERTIFICATE_FILE;
    QUIC_CREDENTIAL_FLAG_DISABLE_AIA                            :: DISABLE_AIA;
}

QUIC_ALLOWED_CIPHER_SUITE_FLAGS :: enum_flags u32 {
    NONE                     :: 0x0;
    AES_128_GCM_SHA256       :: 0x1;
    AES_256_GCM_SHA384       :: 0x2;
    CHACHA20_POLY1305_SHA256 :: 0x4;

    QUIC_ALLOWED_CIPHER_SUITE_NONE                     :: NONE;
    QUIC_ALLOWED_CIPHER_SUITE_AES_128_GCM_SHA256       :: AES_128_GCM_SHA256;
    QUIC_ALLOWED_CIPHER_SUITE_AES_256_GCM_SHA384       :: AES_256_GCM_SHA384;
    QUIC_ALLOWED_CIPHER_SUITE_CHACHA20_POLY1305_SHA256 :: CHACHA20_POLY1305_SHA256;
}

QUIC_CERTIFICATE_HASH_STORE_FLAGS :: enum_flags u32 {
    NONE          :: 0x0;
    MACHINE_STORE :: 0x1;

    QUIC_CERTIFICATE_HASH_STORE_FLAG_NONE          :: NONE;
    QUIC_CERTIFICATE_HASH_STORE_FLAG_MACHINE_STORE :: MACHINE_STORE;
}

QUIC_CONNECTION_SHUTDOWN_FLAGS :: enum_flags u32 {
    NONE   :: 0x0;
    SILENT :: 0x1;

    QUIC_CONNECTION_SHUTDOWN_FLAG_NONE   :: NONE;
    QUIC_CONNECTION_SHUTDOWN_FLAG_SILENT :: SILENT;
}

QUIC_SERVER_RESUMPTION_LEVEL :: enum u32 {
    NO_RESUME          :: 0;
    RESUME_ONLY        :: 1;
    RESUME_AND_ZERORTT :: 2;

    QUIC_SERVER_NO_RESUME          :: NO_RESUME;
    QUIC_SERVER_RESUME_ONLY        :: RESUME_ONLY;
    QUIC_SERVER_RESUME_AND_ZERORTT :: RESUME_AND_ZERORTT;
}

QUIC_SEND_RESUMPTION_FLAGS :: enum_flags u32 {
    NONE  :: 0x0;
    FINAL :: 0x1;

    QUIC_SEND_RESUMPTION_FLAG_NONE  :: NONE;
    QUIC_SEND_RESUMPTION_FLAG_FINAL :: FINAL;
}

QUIC_STREAM_SCHEDULING_SCHEME :: enum u32 {
    FIFO        :: 0;
    ROUND_ROBIN :: 1;
    COUNT       :: 2;

    QUIC_STREAM_SCHEDULING_SCHEME_FIFO        :: FIFO;
    QUIC_STREAM_SCHEDULING_SCHEME_ROUND_ROBIN :: ROUND_ROBIN;
    QUIC_STREAM_SCHEDULING_SCHEME_COUNT       :: COUNT;
}

QUIC_STREAM_OPEN_FLAGS :: enum_flags u32 {
    NONE                :: 0x0;
    UNIDIRECTIONAL      :: 0x1;
    _0_RTT              :: 0x2;
    DELAY_ID_FC_UPDATES :: 0x4;

    QUIC_STREAM_OPEN_FLAG_NONE                :: NONE;
    QUIC_STREAM_OPEN_FLAG_UNIDIRECTIONAL      :: UNIDIRECTIONAL;
    QUIC_STREAM_OPEN_FLAG_0_RTT               :: _0_RTT;
    QUIC_STREAM_OPEN_FLAG_DELAY_ID_FC_UPDATES :: DELAY_ID_FC_UPDATES;
}

QUIC_STREAM_START_FLAGS :: enum_flags u32 {
    NONE                 :: 0x0;
    IMMEDIATE            :: 0x1;
    FAIL_BLOCKED         :: 0x2;
    SHUTDOWN_ON_FAIL     :: 0x4;
    INDICATE_PEER_ACCEPT :: 0x8;
    PRIORITY_WORK        :: 0x10;

    QUIC_STREAM_START_FLAG_NONE                 :: NONE;
    QUIC_STREAM_START_FLAG_IMMEDIATE            :: IMMEDIATE;
    QUIC_STREAM_START_FLAG_FAIL_BLOCKED         :: FAIL_BLOCKED;
    QUIC_STREAM_START_FLAG_SHUTDOWN_ON_FAIL     :: SHUTDOWN_ON_FAIL;
    QUIC_STREAM_START_FLAG_INDICATE_PEER_ACCEPT :: INDICATE_PEER_ACCEPT;
    QUIC_STREAM_START_FLAG_PRIORITY_WORK        :: PRIORITY_WORK;
}

QUIC_STREAM_SHUTDOWN_FLAGS :: enum_flags u32 {
    NONE          :: 0x0;
    GRACEFUL      :: 0x1;
    ABORT_SEND    :: 0x2;
    ABORT_RECEIVE :: 0x4;
    ABORT         :: 0x6;
    IMMEDIATE     :: 0x8;
    INLINE        :: 0x10;

    QUIC_STREAM_SHUTDOWN_FLAG_NONE          :: NONE;
    QUIC_STREAM_SHUTDOWN_FLAG_GRACEFUL      :: GRACEFUL;
    QUIC_STREAM_SHUTDOWN_FLAG_ABORT_SEND    :: ABORT_SEND;
    QUIC_STREAM_SHUTDOWN_FLAG_ABORT_RECEIVE :: ABORT_RECEIVE;
    QUIC_STREAM_SHUTDOWN_FLAG_ABORT         :: ABORT;
    QUIC_STREAM_SHUTDOWN_FLAG_IMMEDIATE     :: IMMEDIATE;
    QUIC_STREAM_SHUTDOWN_FLAG_INLINE        :: INLINE;
}

QUIC_RECEIVE_FLAGS :: enum_flags u32 {
    NONE   :: 0x0;
    _0_RTT :: 0x1;
    FIN    :: 0x2;

    QUIC_RECEIVE_FLAG_NONE  :: NONE;
    QUIC_RECEIVE_FLAG_0_RTT :: _0_RTT;
    QUIC_RECEIVE_FLAG_FIN   :: FIN;
}

QUIC_SEND_FLAGS :: enum_flags u32 {
    NONE              :: 0x0;
    ALLOW_0_RTT       :: 0x1;
    START             :: 0x2;
    FIN               :: 0x4;
    DGRAM_PRIORITY    :: 0x8;
    DELAY_SEND        :: 0x10;
    CANCEL_ON_LOSS    :: 0x20;
    PRIORITY_WORK     :: 0x40;
    CANCEL_ON_BLOCKED :: 0x80;

    QUIC_SEND_FLAG_NONE              :: NONE;
    QUIC_SEND_FLAG_ALLOW_0_RTT       :: ALLOW_0_RTT;
    QUIC_SEND_FLAG_START             :: START;
    QUIC_SEND_FLAG_FIN               :: FIN;
    QUIC_SEND_FLAG_DGRAM_PRIORITY    :: DGRAM_PRIORITY;
    QUIC_SEND_FLAG_DELAY_SEND        :: DELAY_SEND;
    QUIC_SEND_FLAG_CANCEL_ON_LOSS    :: CANCEL_ON_LOSS;
    QUIC_SEND_FLAG_PRIORITY_WORK     :: PRIORITY_WORK;
    QUIC_SEND_FLAG_CANCEL_ON_BLOCKED :: CANCEL_ON_BLOCKED;
}

QUIC_DATAGRAM_SEND_STATE :: enum u32 {
    UNKNOWN               :: 0;
    SENT                  :: 1;
    LOST_SUSPECT          :: 2;
    LOST_DISCARDED        :: 3;
    ACKNOWLEDGED          :: 4;
    ACKNOWLEDGED_SPURIOUS :: 5;
    CANCELED              :: 6;

    QUIC_DATAGRAM_SEND_UNKNOWN               :: UNKNOWN;
    QUIC_DATAGRAM_SEND_SENT                  :: SENT;
    QUIC_DATAGRAM_SEND_LOST_SUSPECT          :: LOST_SUSPECT;
    QUIC_DATAGRAM_SEND_LOST_DISCARDED        :: LOST_DISCARDED;
    QUIC_DATAGRAM_SEND_ACKNOWLEDGED          :: ACKNOWLEDGED;
    QUIC_DATAGRAM_SEND_ACKNOWLEDGED_SPURIOUS :: ACKNOWLEDGED_SPURIOUS;
    QUIC_DATAGRAM_SEND_CANCELED              :: CANCELED;
}

QUIC_REGISTRATION_CONFIG :: struct {
    AppName:          *u8;
    ExecutionProfile: QUIC_EXECUTION_PROFILE;
}

QUIC_CREDENTIAL_LOAD_COMPLETE :: #type (Configuration: HQUIC, Context: *void, Status: u32) -> void #c_call;

QUIC_CREDENTIAL_LOAD_COMPLETE_HANDLER :: QUIC_CREDENTIAL_LOAD_COMPLETE;

QUIC_CERTIFICATE_HASH :: struct {
    ShaHash: [20] u8;
}

QUIC_CERTIFICATE_HASH_STORE :: struct {
    Flags:     QUIC_CERTIFICATE_HASH_STORE_FLAGS;
    ShaHash:   [20] u8;
    StoreName: [128] u8;
}

QUIC_CERTIFICATE_FILE :: struct {
    PrivateKeyFile:  *u8;
    CertificateFile: *u8;
}

QUIC_CERTIFICATE_FILE_PROTECTED :: struct {
    PrivateKeyFile:     *u8;
    CertificateFile:    *u8;
    PrivateKeyPassword: *u8;
}

QUIC_CERTIFICATE_PKCS12 :: struct {
    Asn1Blob:           *u8;
    Asn1BlobLength:     u32;
    PrivateKeyPassword: *u8; // Optional: used if provided. Ignored if NULL
}

QUIC_CERTIFICATE :: void;
QUIC_CERTIFICATE_CHAIN :: void;

QUIC_CREDENTIAL_CONFIG :: struct {
    Type:                QUIC_CREDENTIAL_TYPE;
    Flags:               QUIC_CREDENTIAL_FLAGS;
    union {
        CertificateHash:          *QUIC_CERTIFICATE_HASH;
        CertificateHashStore:     *QUIC_CERTIFICATE_HASH_STORE;
        CertificateContext:       *QUIC_CERTIFICATE;
        CertificateFile:          *QUIC_CERTIFICATE_FILE;
        CertificateFileProtected: *QUIC_CERTIFICATE_FILE_PROTECTED;
        CertificatePkcs12:        *QUIC_CERTIFICATE_PKCS12;
    }

    Principal:           *u8;
    Reserved:            *void; // Currently unused
    AsyncHandler:        QUIC_CREDENTIAL_LOAD_COMPLETE_HANDLER; // Optional
    AllowedCipherSuites: QUIC_ALLOWED_CIPHER_SUITE_FLAGS; // Optional
    CaCertificateFile:   *u8; // Optional
}

//
// TLS New Session Ticket encryption key configuration.
//
QUIC_TICKET_KEY_CONFIG :: struct {
    Id:             [16] u8;
    Material:       [64] u8;
    MaterialLength: u8;
}

//
// A single contiguous buffer.
//
QUIC_BUFFER :: struct {
    Length: u32;

    Buffer: *u8;
}

//
// All the available information describing a new incoming connection.
//
QUIC_NEW_CONNECTION_INFO :: struct {
    QuicVersion:          u32;
    LocalAddress:         *QUIC_ADDR;
    RemoteAddress:        *QUIC_ADDR;
    CryptoBufferLength:   u32;
    ClientAlpnListLength: u16;
    ServerNameLength:     u16;
    NegotiatedAlpnLength: u8;

    CryptoBuffer:         *u8;

    ClientAlpnList:       *u8;

    NegotiatedAlpn:       *u8;

    ServerName:           *u8;
}

QUIC_TLS_PROTOCOL_VERSION :: enum u32 {
    UNKNOWN :: 0;
    _1_3    :: 12288;

    QUIC_TLS_PROTOCOL_UNKNOWN :: UNKNOWN;
    QUIC_TLS_PROTOCOL_1_3     :: _1_3;
}

QUIC_CIPHER_ALGORITHM :: enum u32 {
    NONE     :: 0;
    AES_128  :: 26126;
    AES_256  :: 26128;
    CHACHA20 :: 26130;

    QUIC_CIPHER_ALGORITHM_NONE     :: NONE;
    QUIC_CIPHER_ALGORITHM_AES_128  :: AES_128;
    QUIC_CIPHER_ALGORITHM_AES_256  :: AES_256;
    QUIC_CIPHER_ALGORITHM_CHACHA20 :: CHACHA20;
}

QUIC_HASH_ALGORITHM :: enum u32 {
    NONE    :: 0;
    SHA_256 :: 32780;
    SHA_384 :: 32781;

    QUIC_HASH_ALGORITHM_NONE    :: NONE;
    QUIC_HASH_ALGORITHM_SHA_256 :: SHA_256;
    QUIC_HASH_ALGORITHM_SHA_384 :: SHA_384;
}

QUIC_KEY_EXCHANGE_ALGORITHM :: enum u32 {
    NONE :: 0;
    QUIC_KEY_EXCHANGE_ALGORITHM_NONE :: NONE;
}

//
// See the following IANA registry for the TLS groups:
//   https://www.iana.org/assignments/tls-parameters/tls-parameters.xhtml#tls-parameters-8
//
QUIC_TLS_GROUP :: enum u32 {
    UNKNOWN            :: 0;
    SECP256R1          :: 23;
    SECP384R1          :: 24;
    X25519             :: 29;
    MLKEM512           :: 512;
    MLKEM768           :: 513;
    MLKEM1024          :: 514;
    SECP256R1MLKEM768  :: 4587;
    X25519MLKEM768     :: 4588;
    SECP384R1MLKEM1024 :: 4589;

    QUIC_TLS_GROUP_UNKNOWN            :: UNKNOWN;
    QUIC_TLS_GROUP_SECP256R1          :: SECP256R1;
    QUIC_TLS_GROUP_SECP384R1          :: SECP384R1;
    QUIC_TLS_GROUP_X25519             :: X25519;
    QUIC_TLS_GROUP_MLKEM512           :: MLKEM512;
    QUIC_TLS_GROUP_MLKEM768           :: MLKEM768;
    QUIC_TLS_GROUP_MLKEM1024          :: MLKEM1024;
    QUIC_TLS_GROUP_SECP256R1MLKEM768  :: SECP256R1MLKEM768;
    QUIC_TLS_GROUP_X25519MLKEM768     :: X25519MLKEM768;
    QUIC_TLS_GROUP_SECP384R1MLKEM1024 :: SECP384R1MLKEM1024;
}

QUIC_CIPHER_SUITE :: enum u32 {
    TLS_AES_128_GCM_SHA256       :: 4865;
    TLS_AES_256_GCM_SHA384       :: 4866;
    TLS_CHACHA20_POLY1305_SHA256 :: 4867;

    QUIC_CIPHER_SUITE_TLS_AES_128_GCM_SHA256       :: TLS_AES_128_GCM_SHA256;
    QUIC_CIPHER_SUITE_TLS_AES_256_GCM_SHA384       :: TLS_AES_256_GCM_SHA384;
    QUIC_CIPHER_SUITE_TLS_CHACHA20_POLY1305_SHA256 :: TLS_CHACHA20_POLY1305_SHA256;
}

QUIC_CONGESTION_CONTROL_ALGORITHM :: enum u32 {
    CUBIC :: 0;

    MAX   :: 1;

    QUIC_CONGESTION_CONTROL_ALGORITHM_CUBIC :: CUBIC;

    QUIC_CONGESTION_CONTROL_ALGORITHM_MAX   :: MAX;
}

//
// All the available information describing a handshake.
//
QUIC_HANDSHAKE_INFO :: struct {
    TlsProtocolVersion:   QUIC_TLS_PROTOCOL_VERSION;
    CipherAlgorithm:      QUIC_CIPHER_ALGORITHM;
    CipherStrength:       s32;
    Hash:                 QUIC_HASH_ALGORITHM;
    HashStrength:         s32;
    KeyExchangeAlgorithm: QUIC_KEY_EXCHANGE_ALGORITHM;
    KeyExchangeStrength:  s32;
    CipherSuite:          QUIC_CIPHER_SUITE;
    TlsGroup:             QUIC_TLS_GROUP; // Added in v2.5
}

//
// All statistics available to query about a connection.
//
QUIC_STATISTICS :: struct {
    CorrelationId: u64;
    __bitfield:    u8;
    /* 
        VersionNegotiation: u32; /* 1 bits */
        StatelessRetry: u32; /* 1 bits */
        ResumptionAttempted: u32; /* 1 bits */
        ResumptionSucceeded: u32; /* 1 bits */;
    */

    Rtt:           u32; // In microseconds
    MinRtt:        u32; // In microseconds
    MaxRtt:        u32; // In microseconds
    Timing:        struct {
        Start:              u64;
        InitialFlightEnd:   u64; // Processed all peer's Initial packets
        HandshakeFlightEnd: u64; // Processed all peer's Handshake packets
    };

    Handshake:     struct {
        ClientFlight1Bytes: u32; // Sum of TLS payloads
        ServerFlight1Bytes: u32; // Sum of TLS payloads
        ClientFlight2Bytes: u32; // Sum of TLS payloads
    };

    Send:          struct {
        PathMtu:                   u16; // Current path MTU.
        TotalPackets:              u64; // QUIC packets; could be coalesced into fewer UDP datagrams.
        RetransmittablePackets:    u64;
        SuspectedLostPackets:      u64;
        SpuriousLostPackets:       u64; // Actual lost is (SuspectedLostPackets - SpuriousLostPackets)
        TotalBytes:                u64; // Sum of UDP payloads
        TotalStreamBytes:          u64; // Sum of stream payloads
        CongestionCount:           u32; // Number of congestion events
        PersistentCongestionCount: u32; // Number of persistent congestion events
    };

    Recv:          struct {
        TotalPackets:       u64; // QUIC packets; could be coalesced into fewer UDP datagrams.
        ReorderedPackets:   u64; // Packets where packet number is less than highest seen.
        DroppedPackets:     u64; // Includes DuplicatePackets.
        DuplicatePackets:   u64;
        TotalBytes:         u64; // Sum of UDP payloads
        TotalStreamBytes:   u64; // Sum of stream payloads
        DecryptionFailures: u64; // Count of packet decryption failures.
        ValidAckFrames:     u64; // Count of receive ACK frames.
    };

    Misc:          struct {
        KeyUpdateCount: u32;
    };
}

//
// N.B. Consumers of this struct depend on it being the same for 32-bit and
// 64-bit systems. DO NOT include any fields that have different sizes on those
// platforms, such as size_t or pointers.
//
QUIC_STATISTICS_V2 :: struct {
    CorrelationId:                 u64;
    __bitfield:                    u32;
    /* 
        VersionNegotiation: u32; /* 1 bits */
        StatelessRetry: u32; /* 1 bits */
        ResumptionAttempted: u32; /* 1 bits */
        ResumptionSucceeded: u32; /* 1 bits */
        GreaseBitNegotiated: u32; /* 1 bits */ // Set if we negotiated the GREASE bit.
        EcnCapable: u32; /* 1 bits */
        EncryptionOffloaded: u32; /* 1 bits */ // At least one path successfully offloaded encryption
        RESERVED: u32; /* 25 bits */;
    */

    Rtt:                           u32; // In microseconds
    MinRtt:                        u32; // In microseconds
    MaxRtt:                        u32; // In microseconds

    TimingStart:                   u64;
    TimingInitialFlightEnd:        u64; // Processed all peer's Initial packets
    TimingHandshakeFlightEnd:      u64; // Processed all peer's Handshake packets

    HandshakeClientFlight1Bytes:   u32; // Sum of TLS payloads
    HandshakeServerFlight1Bytes:   u32; // Sum of TLS payloads
    HandshakeClientFlight2Bytes:   u32; // Sum of TLS payloads

    SendPathMtu:                   u16; // Current path MTU.
    SendTotalPackets:              u64; // QUIC packets; could be coalesced into fewer UDP datagrams.
    SendRetransmittablePackets:    u64;
    SendSuspectedLostPackets:      u64;
    SendSpuriousLostPackets:       u64; // Actual lost is (SuspectedLostPackets - SpuriousLostPackets)
    SendTotalBytes:                u64; // Sum of UDP payloads
    SendTotalStreamBytes:          u64; // Sum of stream payloads
    SendCongestionCount:           u32; // Number of congestion events
    SendPersistentCongestionCount: u32; // Number of persistent congestion events

    RecvTotalPackets:              u64; // QUIC packets; could be coalesced into fewer UDP datagrams.
    RecvReorderedPackets:          u64; // Packets where packet number is less than highest seen.
    RecvDroppedPackets:            u64; // Includes DuplicatePackets.
    RecvDuplicatePackets:          u64;
    RecvTotalBytes:                u64; // Sum of UDP payloads
    RecvTotalStreamBytes:          u64; // Sum of stream payloads
    RecvDecryptionFailures:        u64; // Count of packet decryption failures.
    RecvValidAckFrames:            u64; // Count of receive ACK frames.

    KeyUpdateCount:                u32;

    SendCongestionWindow:          u32; // Congestion window size

    DestCidUpdateCount:            u32; // Number of times the destionation CID changed.

    SendEcnCongestionCount:        u32; // Number of congestion events caused by ECN.

    HandshakeHopLimitTTL:          u8; // The TTL value in the initial packet of the handshake.

    RttVariance:                   u32; // In microseconds
}

QUIC_NETWORK_STATISTICS :: struct {
    BytesInFlight:    u32; // Bytes that were sent on the wire, but not yet acked
    PostedBytes:      u64; // Total bytes queued, but not yet acked. These may contain sent bytes that may have potentially lost too.
    IdealBytes:       u64; // Ideal number of bytes required to be available to  avoid limiting throughput
    SmoothedRTT:      u64; // Smoothed RTT value
    CongestionWindow: u32; // Congestion Window
    Bandwidth:        u64; // Estimated bandwidth
}

QUIC_LISTENER_STATISTICS :: struct {
    TotalAcceptedConnections:  u64;
    TotalRejectedConnections:  u64;

    BindingRecvDroppedPackets: u64;
}

QUIC_PERFORMANCE_COUNTERS :: enum u32 {
    CONN_CREATED          :: 0;
    CONN_HANDSHAKE_FAIL   :: 1;
    CONN_APP_REJECT       :: 2;
    CONN_RESUMED          :: 3;
    CONN_ACTIVE           :: 4;
    CONN_CONNECTED        :: 5;
    CONN_PROTOCOL_ERRORS  :: 6;
    CONN_NO_ALPN          :: 7;
    STRM_ACTIVE           :: 8;
    PKTS_SUSPECTED_LOST   :: 9;
    PKTS_DROPPED          :: 10;
    PKTS_DECRYPTION_FAIL  :: 11;
    UDP_RECV              :: 12;
    UDP_SEND              :: 13;
    UDP_RECV_BYTES        :: 14;
    UDP_SEND_BYTES        :: 15;
    UDP_RECV_EVENTS       :: 16;
    UDP_SEND_CALLS        :: 17;
    APP_SEND_BYTES        :: 18;
    APP_RECV_BYTES        :: 19;
    CONN_QUEUE_DEPTH      :: 20;
    CONN_OPER_QUEUE_DEPTH :: 21;
    CONN_OPER_QUEUED      :: 22;
    CONN_OPER_COMPLETED   :: 23;
    WORK_OPER_QUEUE_DEPTH :: 24;
    WORK_OPER_QUEUED      :: 25;
    WORK_OPER_COMPLETED   :: 26;
    PATH_VALIDATED        :: 27;
    PATH_FAILURE          :: 28;
    SEND_STATELESS_RESET  :: 29;
    SEND_STATELESS_RETRY  :: 30;
    CONN_LOAD_REJECT      :: 31;
    MAX                   :: 32;

    QUIC_PERF_COUNTER_CONN_CREATED          :: CONN_CREATED;
    QUIC_PERF_COUNTER_CONN_HANDSHAKE_FAIL   :: CONN_HANDSHAKE_FAIL;
    QUIC_PERF_COUNTER_CONN_APP_REJECT       :: CONN_APP_REJECT;
    QUIC_PERF_COUNTER_CONN_RESUMED          :: CONN_RESUMED;
    QUIC_PERF_COUNTER_CONN_ACTIVE           :: CONN_ACTIVE;
    QUIC_PERF_COUNTER_CONN_CONNECTED        :: CONN_CONNECTED;
    QUIC_PERF_COUNTER_CONN_PROTOCOL_ERRORS  :: CONN_PROTOCOL_ERRORS;
    QUIC_PERF_COUNTER_CONN_NO_ALPN          :: CONN_NO_ALPN;
    QUIC_PERF_COUNTER_STRM_ACTIVE           :: STRM_ACTIVE;
    QUIC_PERF_COUNTER_PKTS_SUSPECTED_LOST   :: PKTS_SUSPECTED_LOST;
    QUIC_PERF_COUNTER_PKTS_DROPPED          :: PKTS_DROPPED;
    QUIC_PERF_COUNTER_PKTS_DECRYPTION_FAIL  :: PKTS_DECRYPTION_FAIL;
    QUIC_PERF_COUNTER_UDP_RECV              :: UDP_RECV;
    QUIC_PERF_COUNTER_UDP_SEND              :: UDP_SEND;
    QUIC_PERF_COUNTER_UDP_RECV_BYTES        :: UDP_RECV_BYTES;
    QUIC_PERF_COUNTER_UDP_SEND_BYTES        :: UDP_SEND_BYTES;
    QUIC_PERF_COUNTER_UDP_RECV_EVENTS       :: UDP_RECV_EVENTS;
    QUIC_PERF_COUNTER_UDP_SEND_CALLS        :: UDP_SEND_CALLS;
    QUIC_PERF_COUNTER_APP_SEND_BYTES        :: APP_SEND_BYTES;
    QUIC_PERF_COUNTER_APP_RECV_BYTES        :: APP_RECV_BYTES;
    QUIC_PERF_COUNTER_CONN_QUEUE_DEPTH      :: CONN_QUEUE_DEPTH;
    QUIC_PERF_COUNTER_CONN_OPER_QUEUE_DEPTH :: CONN_OPER_QUEUE_DEPTH;
    QUIC_PERF_COUNTER_CONN_OPER_QUEUED      :: CONN_OPER_QUEUED;
    QUIC_PERF_COUNTER_CONN_OPER_COMPLETED   :: CONN_OPER_COMPLETED;
    QUIC_PERF_COUNTER_WORK_OPER_QUEUE_DEPTH :: WORK_OPER_QUEUE_DEPTH;
    QUIC_PERF_COUNTER_WORK_OPER_QUEUED      :: WORK_OPER_QUEUED;
    QUIC_PERF_COUNTER_WORK_OPER_COMPLETED   :: WORK_OPER_COMPLETED;
    QUIC_PERF_COUNTER_PATH_VALIDATED        :: PATH_VALIDATED;
    QUIC_PERF_COUNTER_PATH_FAILURE          :: PATH_FAILURE;
    QUIC_PERF_COUNTER_SEND_STATELESS_RESET  :: SEND_STATELESS_RESET;
    QUIC_PERF_COUNTER_SEND_STATELESS_RETRY  :: SEND_STATELESS_RETRY;
    QUIC_PERF_COUNTER_CONN_LOAD_REJECT      :: CONN_LOAD_REJECT;
    QUIC_PERF_COUNTER_MAX                   :: MAX;
}

QUIC_GLOBAL_SETTINGS :: struct {
    union {
        IsSetFlags: u64;
        IsSet:      struct {
            __bitfield: u64;
            /* 
                RetryMemoryLimit: u64; /* 1 bits */
                LoadBalancingMode: u64; /* 1 bits */
                FixedServerID: u64; /* 1 bits */
                RESERVED: u64; /* 61 bits */;
            */
        };
    }

    RetryMemoryLimit:  u16;
    LoadBalancingMode: u16;
    FixedServerID:     u32;
}

QUIC_SETTINGS :: struct {
    union {
        IsSetFlags: u64;
        IsSet:      struct {
            __bitfield: u64;
            /* 
                MaxBytesPerKey: u64; /* 1 bits */
                HandshakeIdleTimeoutMs: u64; /* 1 bits */
                IdleTimeoutMs: u64; /* 1 bits */
                MtuDiscoverySearchCompleteTimeoutUs: u64; /* 1 bits */
                TlsClientMaxSendBuffer: u64; /* 1 bits */
                TlsServerMaxSendBuffer: u64; /* 1 bits */
                StreamRecvWindowDefault: u64; /* 1 bits */
                StreamRecvBufferDefault: u64; /* 1 bits */
                ConnFlowControlWindow: u64; /* 1 bits */
                MaxWorkerQueueDelayUs: u64; /* 1 bits */
                MaxStatelessOperations: u64; /* 1 bits */
                InitialWindowPackets: u64; /* 1 bits */
                SendIdleTimeoutMs: u64; /* 1 bits */
                InitialRttMs: u64; /* 1 bits */
                MaxAckDelayMs: u64; /* 1 bits */
                DisconnectTimeoutMs: u64; /* 1 bits */
                KeepAliveIntervalMs: u64; /* 1 bits */
                CongestionControlAlgorithm: u64; /* 1 bits */
                PeerBidiStreamCount: u64; /* 1 bits */
                PeerUnidiStreamCount: u64; /* 1 bits */
                MaxBindingStatelessOperations: u64; /* 1 bits */
                StatelessOperationExpirationMs: u64; /* 1 bits */
                MinimumMtu: u64; /* 1 bits */
                MaximumMtu: u64; /* 1 bits */
                SendBufferingEnabled: u64; /* 1 bits */
                PacingEnabled: u64; /* 1 bits */
                MigrationEnabled: u64; /* 1 bits */
                DatagramReceiveEnabled: u64; /* 1 bits */
                ServerResumptionLevel: u64; /* 1 bits */
                MaxOperationsPerDrain: u64; /* 1 bits */
                MtuDiscoveryMissingProbeCount: u64; /* 1 bits */
                DestCidUpdateIdleTimeoutMs: u64; /* 1 bits */
                GreaseQuicBitEnabled: u64; /* 1 bits */
                EcnEnabled: u64; /* 1 bits */
                HyStartEnabled: u64; /* 1 bits */
                StreamRecvWindowBidiLocalDefault: u64; /* 1 bits */
                StreamRecvWindowBidiRemoteDefault: u64; /* 1 bits */
                StreamRecvWindowUnidiDefault: u64; /* 1 bits */
                RESERVED: u64; /* 26 bits */;
            */
        };
    }

    MaxBytesPerKey:                      u64;
    HandshakeIdleTimeoutMs:              u64;
    IdleTimeoutMs:                       u64;
    MtuDiscoverySearchCompleteTimeoutUs: u64;
    TlsClientMaxSendBuffer:              u32;
    TlsServerMaxSendBuffer:              u32;
    StreamRecvWindowDefault:             u32;
    StreamRecvBufferDefault:             u32;
    ConnFlowControlWindow:               u32;
    MaxWorkerQueueDelayUs:               u32;
    MaxStatelessOperations:              u32;
    InitialWindowPackets:                u32;
    SendIdleTimeoutMs:                   u32;
    InitialRttMs:                        u32;
    MaxAckDelayMs:                       u32;
    DisconnectTimeoutMs:                 u32;
    KeepAliveIntervalMs:                 u32;
    CongestionControlAlgorithm:          u16; // QUIC_CONGESTION_CONTROL_ALGORITHM
    PeerBidiStreamCount:                 u16;
    PeerUnidiStreamCount:                u16;
    MaxBindingStatelessOperations:       u16;
    StatelessOperationExpirationMs:      u16;
    MinimumMtu:                          u16;
    MaximumMtu:                          u16;
    __bitfield:                          u8;
    /* 
        SendBufferingEnabled: u8; /* 1 bits */
        PacingEnabled: u8; /* 1 bits */
        MigrationEnabled: u8; /* 1 bits */
        DatagramReceiveEnabled: u8; /* 1 bits */
        ServerResumptionLevel: u8; /* 2 bits */ // QUIC_SERVER_RESUMPTION_LEVEL
        GreaseQuicBitEnabled: u8; /* 1 bits */
        EcnEnabled: u8; /* 1 bits */;
    */

    MaxOperationsPerDrain:               u8;
    MtuDiscoveryMissingProbeCount:       u8;
    DestCidUpdateIdleTimeoutMs:          u32;
    union {
        Flags: u64;
        struct {
            __bitfield_1: u64;
            /* 
                HyStartEnabled: u64; /* 1 bits */
                ReservedFlags: u64; /* 63 bits */;
            */
        }
    }

    StreamRecvWindowBidiLocalDefault:    u32;
    StreamRecvWindowBidiRemoteDefault:   u32;
    StreamRecvWindowUnidiDefault:        u32;
}

QUIC_TLS_SECRETS :: struct {
    SecretLength:                 u8;
    IsSet:                        struct {
        __bitfield: u8;
        /* 
            ClientRandom: u8; /* 1 bits */
            ClientEarlyTrafficSecret: u8; /* 1 bits */
            ClientHandshakeTrafficSecret: u8; /* 1 bits */
            ServerHandshakeTrafficSecret: u8; /* 1 bits */
            ClientTrafficSecret0: u8; /* 1 bits */
            ServerTrafficSecret0: u8; /* 1 bits */;
        */
    };

    ClientRandom:                 [32] u8;
    ClientEarlyTrafficSecret:     [64] u8;
    ClientHandshakeTrafficSecret: [64] u8;
    ServerHandshakeTrafficSecret: [64] u8;
    ClientTrafficSecret0:         [64] u8;
    ServerTrafficSecret0:         [64] u8;
}

QUIC_STREAM_STATISTICS :: struct {
    ConnBlockedBySchedulingUs:        u64;
    ConnBlockedByPacingUs:            u64;
    ConnBlockedByAmplificationProtUs: u64;
    ConnBlockedByCongestionControlUs: u64;
    ConnBlockedByFlowControlUs:       u64;
    StreamBlockedByIdFlowControlUs:   u64;
    StreamBlockedByFlowControlUs:     u64;
    StreamBlockedByAppUs:             u64;
}

//
// Functions for associating application contexts with QUIC handles. MsQuic
// provides no explicit synchronization between parallel calls to these
// functions.
//
QUIC_SET_CONTEXT_FN :: #type (Handle: HQUIC, Context: *void) -> void #c_call;

QUIC_GET_CONTEXT_FN :: #type (Handle: HQUIC) -> *void #c_call;

//
// Sets the event handler for the QUIC handle. The type of the handler must be
// appropriate for the type of the handle. MsQuic provides no explicit
// synchronization between parallel calls to this function or the ones above.
//
QUIC_SET_CALLBACK_HANDLER_FN :: #type (Handle: HQUIC, Handler: *void, Context: *void) -> void #c_call;

// Schannel-specific Configuration parameter
QUIC_SCHANNEL_CREDENTIAL_ATTRIBUTE_W :: struct {
    Attribute:    u64;
    BufferLength: u64;
    Buffer:       *void;
}

QUIC_SET_PARAM_FN :: #type (Handle: HQUIC, Param: u32, BufferLength: u32, Buffer: *void) -> u32 #c_call;

QUIC_GET_PARAM_FN :: #type (Handle: HQUIC, Param: u32, BufferLength: *u32, Buffer: *void) -> u32 #c_call;

//
// Opens a new registration.
//
QUIC_REGISTRATION_OPEN_FN :: #type (Config: *QUIC_REGISTRATION_CONFIG, Registration: *HQUIC) -> u32 #c_call;

//
// Closes the registration. This function synchronizes the cleanup of all
// child objects. It does this by blocking until all those child objects have
// been closed by the application.
// N.B. This function will deadlock if called in any MsQuic callbacks.
//
QUIC_REGISTRATION_CLOSE_FN :: #type (Registration: HQUIC) -> void #c_call;

//
// Calls shutdown for all connections in this registration. Don't call on a
// MsQuic callback thread or it might deadlock.
//
QUIC_REGISTRATION_SHUTDOWN_FN :: #type (Registration: HQUIC, Flags: QUIC_CONNECTION_SHUTDOWN_FLAGS, ErrorCode: QUIC_UINT62) -> void #c_call;

//
// Opens a new configuration.
//
QUIC_CONFIGURATION_OPEN_FN :: #type (Registration: HQUIC, AlpnBuffers: *QUIC_BUFFER, AlpnBufferCount: u32, Settings: *QUIC_SETTINGS, SettingsSize: u32, Context: *void, Configuration: *HQUIC) -> u32 #c_call;

//
// Closes an existing configuration.
//
QUIC_CONFIGURATION_CLOSE_FN :: #type (Configuration: HQUIC) -> void #c_call;

//
// Loads the credentials based on the input configuration.
//
QUIC_CONFIGURATION_LOAD_CREDENTIAL_FN :: #type (Configuration: HQUIC, CredConfig: *QUIC_CREDENTIAL_CONFIG) -> u32 #c_call;

//
// Listener Context Interface.
//
QUIC_LISTENER_EVENT_TYPE :: enum u32 {
    NEW_CONNECTION   :: 0;
    STOP_COMPLETE    :: 1;
    DOS_MODE_CHANGED :: 2;

    QUIC_LISTENER_EVENT_NEW_CONNECTION   :: NEW_CONNECTION;
    QUIC_LISTENER_EVENT_STOP_COMPLETE    :: STOP_COMPLETE;
    QUIC_LISTENER_EVENT_DOS_MODE_CHANGED :: DOS_MODE_CHANGED;
}

QUIC_LISTENER_EVENT :: struct {
    Type: QUIC_LISTENER_EVENT_TYPE;
    union {
        NEW_CONNECTION:   struct {
            Info:       *QUIC_NEW_CONNECTION_INFO;
            Connection: HQUIC;
        };

        STOP_COMPLETE:    struct {
            __bitfield: BOOLEAN;
            /* 
                AppCloseInProgress: BOOLEAN; /* 1 bits */
                RESERVED: BOOLEAN; /* 7 bits */;
            */
        };

        DOS_MODE_CHANGED: struct {
            __bitfield: BOOLEAN;
            /* 
                DosModeEnabled: BOOLEAN; /* 1 bits */
                RESERVED: BOOLEAN; /* 7 bits */;
            */
        };
    }
}

QUIC_LISTENER_CALLBACK :: #type (Listener: HQUIC, Context: *void, Event: *QUIC_LISTENER_EVENT) -> u32 #c_call;

QUIC_LISTENER_CALLBACK_HANDLER :: QUIC_LISTENER_CALLBACK;

//
// Opens a new listener.
//
QUIC_LISTENER_OPEN_FN :: #type (Registration: HQUIC, Handler: QUIC_LISTENER_CALLBACK_HANDLER, Context: *void, Listener: *HQUIC) -> u32 #c_call;

//
// Closes an existing listener.
//
QUIC_LISTENER_CLOSE_FN :: #type (Listener: HQUIC) -> void #c_call;

//
// Starts the listener processing incoming connections.
//
QUIC_LISTENER_START_FN :: #type (Listener: HQUIC, AlpnBuffers: *QUIC_BUFFER, AlpnBufferCount: u32, LocalAddress: *QUIC_ADDR) -> u32 #c_call;

//
// Asynchronously stops the listener from processing incoming connections.
//
QUIC_LISTENER_STOP_FN :: #type (Listener: HQUIC) -> void #c_call;

//
// Connections
//
QUIC_CONNECTION_EVENT_TYPE :: enum u32 {
    CONNECTED                       :: 0;
    SHUTDOWN_INITIATED_BY_TRANSPORT :: 1;
    SHUTDOWN_INITIATED_BY_PEER      :: 2;
    SHUTDOWN_COMPLETE               :: 3;
    LOCAL_ADDRESS_CHANGED           :: 4;
    PEER_ADDRESS_CHANGED            :: 5;
    PEER_STREAM_STARTED             :: 6;
    STREAMS_AVAILABLE               :: 7;
    PEER_NEEDS_STREAMS              :: 8;
    IDEAL_PROCESSOR_CHANGED         :: 9;
    DATAGRAM_STATE_CHANGED          :: 10;
    DATAGRAM_RECEIVED               :: 11;
    DATAGRAM_SEND_STATE_CHANGED     :: 12;
    RESUMED                         :: 13;
    RESUMPTION_TICKET_RECEIVED      :: 14;
    PEER_CERTIFICATE_RECEIVED       :: 15;

    QUIC_CONNECTION_EVENT_CONNECTED                       :: CONNECTED;
    QUIC_CONNECTION_EVENT_SHUTDOWN_INITIATED_BY_TRANSPORT :: SHUTDOWN_INITIATED_BY_TRANSPORT;
    QUIC_CONNECTION_EVENT_SHUTDOWN_INITIATED_BY_PEER      :: SHUTDOWN_INITIATED_BY_PEER;
    QUIC_CONNECTION_EVENT_SHUTDOWN_COMPLETE               :: SHUTDOWN_COMPLETE;
    QUIC_CONNECTION_EVENT_LOCAL_ADDRESS_CHANGED           :: LOCAL_ADDRESS_CHANGED;
    QUIC_CONNECTION_EVENT_PEER_ADDRESS_CHANGED            :: PEER_ADDRESS_CHANGED;
    QUIC_CONNECTION_EVENT_PEER_STREAM_STARTED             :: PEER_STREAM_STARTED;
    QUIC_CONNECTION_EVENT_STREAMS_AVAILABLE               :: STREAMS_AVAILABLE;
    QUIC_CONNECTION_EVENT_PEER_NEEDS_STREAMS              :: PEER_NEEDS_STREAMS;
    QUIC_CONNECTION_EVENT_IDEAL_PROCESSOR_CHANGED         :: IDEAL_PROCESSOR_CHANGED;
    QUIC_CONNECTION_EVENT_DATAGRAM_STATE_CHANGED          :: DATAGRAM_STATE_CHANGED;
    QUIC_CONNECTION_EVENT_DATAGRAM_RECEIVED               :: DATAGRAM_RECEIVED;
    QUIC_CONNECTION_EVENT_DATAGRAM_SEND_STATE_CHANGED     :: DATAGRAM_SEND_STATE_CHANGED;
    QUIC_CONNECTION_EVENT_RESUMED                         :: RESUMED;
    QUIC_CONNECTION_EVENT_RESUMPTION_TICKET_RECEIVED      :: RESUMPTION_TICKET_RECEIVED;
    QUIC_CONNECTION_EVENT_PEER_CERTIFICATE_RECEIVED       :: PEER_CERTIFICATE_RECEIVED;
}

QUIC_CONNECTION_EVENT :: struct {
    Type: QUIC_CONNECTION_EVENT_TYPE;
    union {
        CONNECTED:                       struct {
            SessionResumed:       BOOLEAN;

            NegotiatedAlpnLength: u8;

            NegotiatedAlpn:       *u8;
        };

        SHUTDOWN_INITIATED_BY_TRANSPORT: struct {
            Status:    u32;
            ErrorCode: QUIC_UINT62; // Wire format error code.
        };

        SHUTDOWN_INITIATED_BY_PEER:      struct {
            ErrorCode: QUIC_UINT62;
        };

        SHUTDOWN_COMPLETE:               struct {
            __bitfield: BOOLEAN;
            /* 
                HandshakeCompleted: BOOLEAN; /* 1 bits */
                PeerAcknowledgedShutdown: BOOLEAN; /* 1 bits */
                AppCloseInProgress: BOOLEAN; /* 1 bits */;
            */
        };

        LOCAL_ADDRESS_CHANGED:           struct {
            Address: *QUIC_ADDR;
        };

        PEER_ADDRESS_CHANGED:            struct {
            Address: *QUIC_ADDR;
        };

        PEER_STREAM_STARTED:             struct {
            Stream: HQUIC;
            Flags:  QUIC_STREAM_OPEN_FLAGS;
        };

        STREAMS_AVAILABLE:               struct {
            BidirectionalCount:  u16;
            UnidirectionalCount: u16;
        };

        PEER_NEEDS_STREAMS:              struct {
            Bidirectional: BOOLEAN;
        };

        IDEAL_PROCESSOR_CHANGED:         struct {
            IdealProcessor: u16;
            PartitionIndex: u16;
        };

        DATAGRAM_STATE_CHANGED:          struct {
            SendEnabled:   BOOLEAN;
            MaxSendLength: u16;
        };

        DATAGRAM_RECEIVED:               struct {
            Buffer: *QUIC_BUFFER;
            Flags:  QUIC_RECEIVE_FLAGS;
        };

        DATAGRAM_SEND_STATE_CHANGED:     struct {
            ClientContext: *void; /* inout */
            State:         QUIC_DATAGRAM_SEND_STATE;
        };

        RESUMED:                         struct {
            ResumptionStateLength: u16;
            ResumptionState:       *u8;
        };

        RESUMPTION_TICKET_RECEIVED:      struct {
            ResumptionTicketLength: u32;

            ResumptionTicket:       *u8;
        };

        PEER_CERTIFICATE_RECEIVED:       struct {
            Certificate:        *QUIC_CERTIFICATE; // Peer certificate (platform specific). Valid only during QUIC_CONNECTION_EVENT_PEER_CERTIFICATE_RECEIVED callback.
            DeferredErrorFlags: u32; // Bit flag of errors (only valid with QUIC_CREDENTIAL_FLAG_DEFER_CERTIFICATE_VALIDATION) - Schannel only, zero otherwise.
            DeferredStatus:     u32; // Most severe error status (only valid with QUIC_CREDENTIAL_FLAG_DEFER_CERTIFICATE_VALIDATION)
            Chain:              *QUIC_CERTIFICATE_CHAIN; // Peer certificate chain (platform specific). Valid only during QUIC_CONNECTION_EVENT_PEER_CERTIFICATE_RECEIVED callback.
        };
    }
}

QUIC_CONNECTION_CALLBACK :: #type (Connection: HQUIC, Context: *void, Event: *QUIC_CONNECTION_EVENT) -> u32 #c_call;

QUIC_CONNECTION_CALLBACK_HANDLER :: QUIC_CONNECTION_CALLBACK;

//
// Opens a new connection.
//
QUIC_CONNECTION_OPEN_FN :: #type (Registration: HQUIC, Handler: QUIC_CONNECTION_CALLBACK_HANDLER, Context: *void, Connection: *HQUIC) -> u32 #c_call;

QUIC_CONNECTION_OPEN_IN_PARTITION_FN :: #type (Registration: HQUIC, PartitionIndex: u16, Handler: QUIC_CONNECTION_CALLBACK_HANDLER, Context: *void, Connection: *HQUIC) -> u32 #c_call;

//
// Closes an existing connection.
//
QUIC_CONNECTION_CLOSE_FN :: #type (Connection: HQUIC) -> void #c_call;

//
// Starts the shutdown process on the connection. This immediately and silently
// shuts down any open streams; which will trigger callbacks for
// QUIC_CONNECTION_EVENT_STREAM_CLOSED events. Does nothing if already shutdown.
// Can be passed either a connection or stream handle.
//
QUIC_CONNECTION_SHUTDOWN_FN :: #type (Connection: HQUIC, Flags: QUIC_CONNECTION_SHUTDOWN_FLAGS, ErrorCode: QUIC_UINT62) -> void #c_call;

//
// Uses the QUIC (client) handle to start a connection attempt to the
// remote server. Can be passed either a connection or stream handle.
//
QUIC_CONNECTION_START_FN :: #type (Connection: HQUIC, Configuration: HQUIC, Family: QUIC_ADDRESS_FAMILY, ServerName: *u8, ServerPort: u16) -> u32 #c_call;

//
// Sets the (server-side) configuration handle for the connection. This must be
// called on an accepted connection in order to proceed with the QUIC handshake.
//
QUIC_CONNECTION_SET_CONFIGURATION_FN :: #type (Connection: HQUIC, Configuration: HQUIC) -> u32 #c_call;

//
// Uses the QUIC (server) handle to send a resumption ticket to the remote
// client, optionally with app-specific data useful during resumption.
//
QUIC_CONNECTION_SEND_RESUMPTION_FN :: #type (Connection: HQUIC, Flags: QUIC_SEND_RESUMPTION_FLAGS, DataLength: u16, ResumptionData: *u8) -> u32 #c_call;

//
// Uses the QUIC (server) handle to complete resumption ticket validation.
// This must be called after server app handles ticket validation and then
// return QUIC_STATUS_PENDING.
//
QUIC_CONNECTION_COMP_RESUMPTION_FN :: #type (Connection: HQUIC, Result: BOOLEAN) -> u32 #c_call;

//
// Uses the QUIC (client) handle to complete certificate validation.
// This must be called after client app handles certificate validation
// and then return QUIC_STATUS_PENDING. The TlsAlert value is ignored if Result
// equals TRUE (recommend just pass QUIC_TLS_ALERT_CODE_SUCCESS).
//
QUIC_CONNECTION_COMP_CERT_FN :: #type (Connection: HQUIC, Result: BOOLEAN, TlsAlert: QUIC_TLS_ALERT_CODES) -> u32 #c_call;

//
// Streams
//
QUIC_STREAM_EVENT_TYPE :: enum u32 {
    START_COMPLETE         :: 0;
    RECEIVE                :: 1;
    SEND_COMPLETE          :: 2;
    PEER_SEND_SHUTDOWN     :: 3;
    PEER_SEND_ABORTED      :: 4;
    PEER_RECEIVE_ABORTED   :: 5;
    SEND_SHUTDOWN_COMPLETE :: 6;
    SHUTDOWN_COMPLETE      :: 7;
    IDEAL_SEND_BUFFER_SIZE :: 8;
    PEER_ACCEPTED          :: 9;
    CANCEL_ON_LOSS         :: 10;

    QUIC_STREAM_EVENT_START_COMPLETE         :: START_COMPLETE;
    QUIC_STREAM_EVENT_RECEIVE                :: RECEIVE;
    QUIC_STREAM_EVENT_SEND_COMPLETE          :: SEND_COMPLETE;
    QUIC_STREAM_EVENT_PEER_SEND_SHUTDOWN     :: PEER_SEND_SHUTDOWN;
    QUIC_STREAM_EVENT_PEER_SEND_ABORTED      :: PEER_SEND_ABORTED;
    QUIC_STREAM_EVENT_PEER_RECEIVE_ABORTED   :: PEER_RECEIVE_ABORTED;
    QUIC_STREAM_EVENT_SEND_SHUTDOWN_COMPLETE :: SEND_SHUTDOWN_COMPLETE;
    QUIC_STREAM_EVENT_SHUTDOWN_COMPLETE      :: SHUTDOWN_COMPLETE;
    QUIC_STREAM_EVENT_IDEAL_SEND_BUFFER_SIZE :: IDEAL_SEND_BUFFER_SIZE;
    QUIC_STREAM_EVENT_PEER_ACCEPTED          :: PEER_ACCEPTED;
    QUIC_STREAM_EVENT_CANCEL_ON_LOSS         :: CANCEL_ON_LOSS;
}

QUIC_STREAM_EVENT :: struct {
    Type: QUIC_STREAM_EVENT_TYPE;
    union {
        START_COMPLETE:         struct {
            Status:     u32;
            ID:         QUIC_UINT62;
            __bitfield: BOOLEAN;
            /* 
                PeerAccepted: BOOLEAN; /* 1 bits */
                RESERVED: BOOLEAN; /* 7 bits */;
            */
        };

        RECEIVE:                struct {
            AbsoluteOffset:    u64; /* in */
            TotalBufferLength: u64; /* inout */

            Buffers:           *QUIC_BUFFER; /* in */

            BufferCount:       u32; /* in */
            Flags:             QUIC_RECEIVE_FLAGS; /* in */
        };

        SEND_COMPLETE:          struct {
            Canceled:      BOOLEAN;
            ClientContext: *void;
        };

        PEER_SEND_ABORTED:      struct {
            ErrorCode: QUIC_UINT62;
        };

        PEER_RECEIVE_ABORTED:   struct {
            ErrorCode: QUIC_UINT62;
        };

        SEND_SHUTDOWN_COMPLETE: struct {
            Graceful: BOOLEAN;
        };

        SHUTDOWN_COMPLETE:      struct {
            ConnectionShutdown:    BOOLEAN;
            __bitfield:            BOOLEAN;
            /* 
                AppCloseInProgress: BOOLEAN; /* 1 bits */
                ConnectionShutdownByApp: BOOLEAN; /* 1 bits */
                ConnectionClosedRemotely: BOOLEAN; /* 1 bits */
                RESERVED: BOOLEAN; /* 5 bits */;
            */

            ConnectionErrorCode:   QUIC_UINT62;
            ConnectionCloseStatus: u32;
        };

        IDEAL_SEND_BUFFER_SIZE: struct {
            ByteCount: u64;
        };

        CANCEL_ON_LOSS:         struct {
            ErrorCode: QUIC_UINT62; /* out */
        };
    }
}

QUIC_STREAM_CALLBACK :: #type (Stream: HQUIC, Context: *void, Event: *QUIC_STREAM_EVENT) -> u32 #c_call;

QUIC_STREAM_CALLBACK_HANDLER :: QUIC_STREAM_CALLBACK;

//
// Opens a stream on the given connection.
//
QUIC_STREAM_OPEN_FN :: #type (Connection: HQUIC, Flags: QUIC_STREAM_OPEN_FLAGS, Handler: QUIC_STREAM_CALLBACK_HANDLER, Context: *void, Stream: *HQUIC) -> u32 #c_call;

//
// Closes a stream handle.
//
QUIC_STREAM_CLOSE_FN :: #type (Stream: HQUIC) -> void #c_call;

//
// Starts processing the stream.
//
QUIC_STREAM_START_FN :: #type (Stream: HQUIC, Flags: QUIC_STREAM_START_FLAGS) -> u32 #c_call;

//
// Shuts the stream down as specified, and waits for graceful
// shutdowns to complete. Does nothing if already shut down.
//
QUIC_STREAM_SHUTDOWN_FN :: #type (Stream: HQUIC, Flags: QUIC_STREAM_SHUTDOWN_FLAGS, ErrorCode: QUIC_UINT62) -> u32 #c_call;

//
// Sends data on an open stream.
//
QUIC_STREAM_SEND_FN :: #type (Stream: HQUIC, Buffers: *QUIC_BUFFER, BufferCount: u32, Flags: QUIC_SEND_FLAGS, ClientSendContext: *void) -> u32 #c_call;

//
// Completes a previously pended receive callback.
//
QUIC_STREAM_RECEIVE_COMPLETE_FN :: #type (Stream: HQUIC, BufferLength: u64) -> void #c_call;

//
// Enables or disables stream receive callbacks.
//
QUIC_STREAM_RECEIVE_SET_ENABLED_FN :: #type (Stream: HQUIC, IsEnabled: BOOLEAN) -> u32 #c_call;

//
// Sends an unreliable datagram on the connection. Note, the total payload
// of the send must fit in a single QUIC packet.
//
QUIC_DATAGRAM_SEND_FN :: #type (Connection: HQUIC, Buffers: *QUIC_BUFFER, BufferCount: u32, Flags: QUIC_SEND_FLAGS, ClientSendContext: *void) -> u32 #c_call;

//
// Version 2 API Function Table. Returned from MsQuicOpenVersion when Version
// is 2. Also returned from MsQuicOpen2.
//
QUIC_API_TABLE :: struct {
    SetContext:                                   QUIC_SET_CONTEXT_FN;
    GetContext:                                   QUIC_GET_CONTEXT_FN;
    SetCallbackHandler:                           QUIC_SET_CALLBACK_HANDLER_FN;

    SetParam:                                     QUIC_SET_PARAM_FN;
    GetParam:                                     QUIC_GET_PARAM_FN;

    RegistrationOpen:                             QUIC_REGISTRATION_OPEN_FN;
    RegistrationClose:                            QUIC_REGISTRATION_CLOSE_FN;
    RegistrationShutdown:                         QUIC_REGISTRATION_SHUTDOWN_FN;

    ConfigurationOpen:                            QUIC_CONFIGURATION_OPEN_FN;
    ConfigurationClose:                           QUIC_CONFIGURATION_CLOSE_FN;

    ConfigurationLoadCredential:                  QUIC_CONFIGURATION_LOAD_CREDENTIAL_FN;

    ListenerOpen:                                 QUIC_LISTENER_OPEN_FN;
    ListenerClose:                                QUIC_LISTENER_CLOSE_FN;
    ListenerStart:                                QUIC_LISTENER_START_FN;
    ListenerStop:                                 QUIC_LISTENER_STOP_FN;

    ConnectionOpen:                               QUIC_CONNECTION_OPEN_FN;
    ConnectionClose:                              QUIC_CONNECTION_CLOSE_FN;
    ConnectionShutdown:                           QUIC_CONNECTION_SHUTDOWN_FN;
    ConnectionStart:                              QUIC_CONNECTION_START_FN;

    ConnectionSetConfiguration:                   QUIC_CONNECTION_SET_CONFIGURATION_FN;
    ConnectionSendResumptionTicket:               QUIC_CONNECTION_SEND_RESUMPTION_FN;

    StreamOpen:                                   QUIC_STREAM_OPEN_FN;
    StreamClose:                                  QUIC_STREAM_CLOSE_FN;
    StreamStart:                                  QUIC_STREAM_START_FN;
    StreamShutdown:                               QUIC_STREAM_SHUTDOWN_FN;
    StreamSend:                                   QUIC_STREAM_SEND_FN;
    StreamReceiveComplete:                        QUIC_STREAM_RECEIVE_COMPLETE_FN;
    StreamReceiveSetEnabled:                      QUIC_STREAM_RECEIVE_SET_ENABLED_FN;

    DatagramSend:                                 QUIC_DATAGRAM_SEND_FN;

    ConnectionResumptionTicketValidationComplete: QUIC_CONNECTION_COMP_RESUMPTION_FN; // Available from v2.2
    ConnectionCertificateValidationComplete:      QUIC_CONNECTION_COMP_CERT_FN; // Available from v2.2

    ConnectionOpenInPartition:                    QUIC_CONNECTION_OPEN_IN_PARTITION_FN; // Available from v2.5
}

MsQuicOpenVersion :: (Version: u32, QuicApi: **void) -> u32 #foreign libmsquic;

//
// Cleans up the function table returned from MsQuicOpenVersion and releases the
// reference on the API.
//
MsQuicClose :: (QuicApi: *void) -> void #foreign libmsquic;

MsQuicOpenVersionFn :: #type (Version: u32, QuicApi: **void) -> u32 #c_call;

MsQuicCloseFn :: #type (QuicApi: *void) -> void #c_call;

#scope_file

#import "Basic"; // For assert


#run {
    {
        info := type_info(sockaddr);
        for info.members {
            if it.name == {
                case "sa_len";
                    assert(it.offset_in_bytes == 0, "sockaddr.sa_len has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "sockaddr.sa_len has unexpected size % instead of 1", it.type.runtime_size);
                case "sa_family";
                    assert(it.offset_in_bytes == 1, "sockaddr.sa_family has unexpected offset % instead of 1", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "sockaddr.sa_family has unexpected size % instead of 1", it.type.runtime_size);
                case "sa_data";
                    assert(it.offset_in_bytes == 2, "sockaddr.sa_data has unexpected offset % instead of 2", it.offset_in_bytes);
                    assert(it.type.runtime_size == 14, "sockaddr.sa_data has unexpected size % instead of 14", it.type.runtime_size);
            }
        }
        assert(size_of(sockaddr) == 16, "sockaddr has size % instead of 16", size_of(sockaddr));
    }

    {
        info := type_info(in_addr);
        for info.members {
            if it.name == {
                case "s_addr";
                    assert(it.offset_in_bytes == 0, "in_addr.s_addr has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "in_addr.s_addr has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(in_addr) == 4, "in_addr has size % instead of 4", size_of(in_addr));
    }

    {
        info := type_info(sockaddr_in);
        for info.members {
            if it.name == {
                case "sin_len";
                    assert(it.offset_in_bytes == 0, "sockaddr_in.sin_len has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "sockaddr_in.sin_len has unexpected size % instead of 1", it.type.runtime_size);
                case "sin_family";
                    assert(it.offset_in_bytes == 1, "sockaddr_in.sin_family has unexpected offset % instead of 1", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "sockaddr_in.sin_family has unexpected size % instead of 1", it.type.runtime_size);
                case "sin_port";
                    assert(it.offset_in_bytes == 2, "sockaddr_in.sin_port has unexpected offset % instead of 2", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "sockaddr_in.sin_port has unexpected size % instead of 2", it.type.runtime_size);
                case "sin_addr";
                    assert(it.offset_in_bytes == 4, "sockaddr_in.sin_addr has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "sockaddr_in.sin_addr has unexpected size % instead of 4", it.type.runtime_size);
                case "sin_zero";
                    assert(it.offset_in_bytes == 8, "sockaddr_in.sin_zero has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "sockaddr_in.sin_zero has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(sockaddr_in) == 16, "sockaddr_in has size % instead of 16", size_of(sockaddr_in));
    }

    {
        info := type_info(in6_addr);
        for info.members {
            if it.name == {
                case "__u6_addr";
                    assert(it.offset_in_bytes == 0, "in6_addr.__u6_addr has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 16, "in6_addr.__u6_addr has unexpected size % instead of 16", it.type.runtime_size);
            }
        }
        assert(size_of(in6_addr) == 16, "in6_addr has size % instead of 16", size_of(in6_addr));
    }

    {
        info := type_info(sockaddr_in6);
        for info.members {
            if it.name == {
                case "sin6_len";
                    assert(it.offset_in_bytes == 0, "sockaddr_in6.sin6_len has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "sockaddr_in6.sin6_len has unexpected size % instead of 1", it.type.runtime_size);
                case "sin6_family";
                    assert(it.offset_in_bytes == 1, "sockaddr_in6.sin6_family has unexpected offset % instead of 1", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "sockaddr_in6.sin6_family has unexpected size % instead of 1", it.type.runtime_size);
                case "sin6_port";
                    assert(it.offset_in_bytes == 2, "sockaddr_in6.sin6_port has unexpected offset % instead of 2", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "sockaddr_in6.sin6_port has unexpected size % instead of 2", it.type.runtime_size);
                case "sin6_flowinfo";
                    assert(it.offset_in_bytes == 4, "sockaddr_in6.sin6_flowinfo has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "sockaddr_in6.sin6_flowinfo has unexpected size % instead of 4", it.type.runtime_size);
                case "sin6_addr";
                    assert(it.offset_in_bytes == 8, "sockaddr_in6.sin6_addr has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 16, "sockaddr_in6.sin6_addr has unexpected size % instead of 16", it.type.runtime_size);
                case "sin6_scope_id";
                    assert(it.offset_in_bytes == 24, "sockaddr_in6.sin6_scope_id has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "sockaddr_in6.sin6_scope_id has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(sockaddr_in6) == 28, "sockaddr_in6 has size % instead of 28", size_of(sockaddr_in6));
    }

    {
        info := type_info(addrinfo);
        for info.members {
            if it.name == {
                case "ai_flags";
                    assert(it.offset_in_bytes == 0, "addrinfo.ai_flags has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "addrinfo.ai_flags has unexpected size % instead of 4", it.type.runtime_size);
                case "ai_family";
                    assert(it.offset_in_bytes == 4, "addrinfo.ai_family has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "addrinfo.ai_family has unexpected size % instead of 4", it.type.runtime_size);
                case "ai_socktype";
                    assert(it.offset_in_bytes == 8, "addrinfo.ai_socktype has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "addrinfo.ai_socktype has unexpected size % instead of 4", it.type.runtime_size);
                case "ai_protocol";
                    assert(it.offset_in_bytes == 12, "addrinfo.ai_protocol has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "addrinfo.ai_protocol has unexpected size % instead of 4", it.type.runtime_size);
                case "ai_addrlen";
                    assert(it.offset_in_bytes == 16, "addrinfo.ai_addrlen has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "addrinfo.ai_addrlen has unexpected size % instead of 4", it.type.runtime_size);
                case "ai_canonname";
                    assert(it.offset_in_bytes == 24, "addrinfo.ai_canonname has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "addrinfo.ai_canonname has unexpected size % instead of 8", it.type.runtime_size);
                case "ai_addr";
                    assert(it.offset_in_bytes == 32, "addrinfo.ai_addr has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "addrinfo.ai_addr has unexpected size % instead of 8", it.type.runtime_size);
                case "ai_next";
                    assert(it.offset_in_bytes == 40, "addrinfo.ai_next has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "addrinfo.ai_next has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(addrinfo) == 48, "addrinfo has size % instead of 48", size_of(addrinfo));
    }

    {
        info := type_info(QUIC_ADDR);
        for info.members {
            if it.name == {
                case "Ip";
                    assert(it.offset_in_bytes == 0, "QUIC_ADDR.Ip has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 16, "QUIC_ADDR.Ip has unexpected size % instead of 16", it.type.runtime_size);
                case "Ipv4";
                    assert(it.offset_in_bytes == 0, "QUIC_ADDR.Ipv4 has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 16, "QUIC_ADDR.Ipv4 has unexpected size % instead of 16", it.type.runtime_size);
                case "Ipv6";
                    assert(it.offset_in_bytes == 0, "QUIC_ADDR.Ipv6 has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 28, "QUIC_ADDR.Ipv6 has unexpected size % instead of 28", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_ADDR) == 28, "QUIC_ADDR has size % instead of 28", size_of(QUIC_ADDR));
    }

    {
        info := type_info(QUIC_ADDR_STR);
        for info.members {
            if it.name == {
                case "Address";
                    assert(it.offset_in_bytes == 0, "QUIC_ADDR_STR.Address has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 64, "QUIC_ADDR_STR.Address has unexpected size % instead of 64", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_ADDR_STR) == 64, "QUIC_ADDR_STR has size % instead of 64", size_of(QUIC_ADDR_STR));
    }

    {
        info := type_info(kevent);
        for info.members {
            if it.name == {
                case "ident";
                    assert(it.offset_in_bytes == 0, "kevent.ident has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "kevent.ident has unexpected size % instead of 8", it.type.runtime_size);
                case "filter";
                    assert(it.offset_in_bytes == 8, "kevent.filter has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "kevent.filter has unexpected size % instead of 2", it.type.runtime_size);
                case "flags";
                    assert(it.offset_in_bytes == 10, "kevent.flags has unexpected offset % instead of 10", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "kevent.flags has unexpected size % instead of 2", it.type.runtime_size);
                case "fflags";
                    assert(it.offset_in_bytes == 12, "kevent.fflags has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "kevent.fflags has unexpected size % instead of 4", it.type.runtime_size);
                case "data";
                    assert(it.offset_in_bytes == 16, "kevent.data has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "kevent.data has unexpected size % instead of 8", it.type.runtime_size);
                case "udata";
                    assert(it.offset_in_bytes == 24, "kevent.udata has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "kevent.udata has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(kevent) == 32, "kevent has size % instead of 32", size_of(kevent));
    }

    {
        info := type_info(QUIC_SQE);
        for info.members {
            if it.name == {
                case "Handle";
                    assert(it.offset_in_bytes == 0, "QUIC_SQE.Handle has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_SQE.Handle has unexpected size % instead of 8", it.type.runtime_size);
                case "Completion";
                    assert(it.offset_in_bytes == 8, "QUIC_SQE.Completion has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_SQE.Completion has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_SQE) == 16, "QUIC_SQE has size % instead of 16", size_of(QUIC_SQE));
    }

    {
        info := type_info(QUIC_REGISTRATION_CONFIG);
        for info.members {
            if it.name == {
                case "AppName";
                    assert(it.offset_in_bytes == 0, "QUIC_REGISTRATION_CONFIG.AppName has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_REGISTRATION_CONFIG.AppName has unexpected size % instead of 8", it.type.runtime_size);
                case "ExecutionProfile";
                    assert(it.offset_in_bytes == 8, "QUIC_REGISTRATION_CONFIG.ExecutionProfile has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_REGISTRATION_CONFIG.ExecutionProfile has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_REGISTRATION_CONFIG) == 16, "QUIC_REGISTRATION_CONFIG has size % instead of 16", size_of(QUIC_REGISTRATION_CONFIG));
    }

    {
        info := type_info(QUIC_CERTIFICATE_HASH);
        for info.members {
            if it.name == {
                case "ShaHash";
                    assert(it.offset_in_bytes == 0, "QUIC_CERTIFICATE_HASH.ShaHash has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 20, "QUIC_CERTIFICATE_HASH.ShaHash has unexpected size % instead of 20", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_CERTIFICATE_HASH) == 20, "QUIC_CERTIFICATE_HASH has size % instead of 20", size_of(QUIC_CERTIFICATE_HASH));
    }

    {
        info := type_info(QUIC_CERTIFICATE_HASH_STORE);
        for info.members {
            if it.name == {
                case "Flags";
                    assert(it.offset_in_bytes == 0, "QUIC_CERTIFICATE_HASH_STORE.Flags has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_CERTIFICATE_HASH_STORE.Flags has unexpected size % instead of 4", it.type.runtime_size);
                case "ShaHash";
                    assert(it.offset_in_bytes == 4, "QUIC_CERTIFICATE_HASH_STORE.ShaHash has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 20, "QUIC_CERTIFICATE_HASH_STORE.ShaHash has unexpected size % instead of 20", it.type.runtime_size);
                case "StoreName";
                    assert(it.offset_in_bytes == 24, "QUIC_CERTIFICATE_HASH_STORE.StoreName has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 128, "QUIC_CERTIFICATE_HASH_STORE.StoreName has unexpected size % instead of 128", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_CERTIFICATE_HASH_STORE) == 152, "QUIC_CERTIFICATE_HASH_STORE has size % instead of 152", size_of(QUIC_CERTIFICATE_HASH_STORE));
    }

    {
        info := type_info(QUIC_CERTIFICATE_FILE);
        for info.members {
            if it.name == {
                case "PrivateKeyFile";
                    assert(it.offset_in_bytes == 0, "QUIC_CERTIFICATE_FILE.PrivateKeyFile has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_CERTIFICATE_FILE.PrivateKeyFile has unexpected size % instead of 8", it.type.runtime_size);
                case "CertificateFile";
                    assert(it.offset_in_bytes == 8, "QUIC_CERTIFICATE_FILE.CertificateFile has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_CERTIFICATE_FILE.CertificateFile has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_CERTIFICATE_FILE) == 16, "QUIC_CERTIFICATE_FILE has size % instead of 16", size_of(QUIC_CERTIFICATE_FILE));
    }

    {
        info := type_info(QUIC_CERTIFICATE_FILE_PROTECTED);
        for info.members {
            if it.name == {
                case "PrivateKeyFile";
                    assert(it.offset_in_bytes == 0, "QUIC_CERTIFICATE_FILE_PROTECTED.PrivateKeyFile has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_CERTIFICATE_FILE_PROTECTED.PrivateKeyFile has unexpected size % instead of 8", it.type.runtime_size);
                case "CertificateFile";
                    assert(it.offset_in_bytes == 8, "QUIC_CERTIFICATE_FILE_PROTECTED.CertificateFile has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_CERTIFICATE_FILE_PROTECTED.CertificateFile has unexpected size % instead of 8", it.type.runtime_size);
                case "PrivateKeyPassword";
                    assert(it.offset_in_bytes == 16, "QUIC_CERTIFICATE_FILE_PROTECTED.PrivateKeyPassword has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_CERTIFICATE_FILE_PROTECTED.PrivateKeyPassword has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_CERTIFICATE_FILE_PROTECTED) == 24, "QUIC_CERTIFICATE_FILE_PROTECTED has size % instead of 24", size_of(QUIC_CERTIFICATE_FILE_PROTECTED));
    }

    {
        info := type_info(QUIC_CERTIFICATE_PKCS12);
        for info.members {
            if it.name == {
                case "Asn1Blob";
                    assert(it.offset_in_bytes == 0, "QUIC_CERTIFICATE_PKCS12.Asn1Blob has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_CERTIFICATE_PKCS12.Asn1Blob has unexpected size % instead of 8", it.type.runtime_size);
                case "Asn1BlobLength";
                    assert(it.offset_in_bytes == 8, "QUIC_CERTIFICATE_PKCS12.Asn1BlobLength has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_CERTIFICATE_PKCS12.Asn1BlobLength has unexpected size % instead of 4", it.type.runtime_size);
                case "PrivateKeyPassword";
                    assert(it.offset_in_bytes == 16, "QUIC_CERTIFICATE_PKCS12.PrivateKeyPassword has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_CERTIFICATE_PKCS12.PrivateKeyPassword has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_CERTIFICATE_PKCS12) == 24, "QUIC_CERTIFICATE_PKCS12 has size % instead of 24", size_of(QUIC_CERTIFICATE_PKCS12));
    }

    {
        info := type_info(QUIC_CREDENTIAL_CONFIG);
        for info.members {
            if it.name == {
                case "Type";
                    assert(it.offset_in_bytes == 0, "QUIC_CREDENTIAL_CONFIG.Type has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_CREDENTIAL_CONFIG.Type has unexpected size % instead of 4", it.type.runtime_size);
                case "Flags";
                    assert(it.offset_in_bytes == 4, "QUIC_CREDENTIAL_CONFIG.Flags has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_CREDENTIAL_CONFIG.Flags has unexpected size % instead of 4", it.type.runtime_size);
                case "Principal";
                    assert(it.offset_in_bytes == 16, "QUIC_CREDENTIAL_CONFIG.Principal has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_CREDENTIAL_CONFIG.Principal has unexpected size % instead of 8", it.type.runtime_size);
                case "Reserved";
                    assert(it.offset_in_bytes == 24, "QUIC_CREDENTIAL_CONFIG.Reserved has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_CREDENTIAL_CONFIG.Reserved has unexpected size % instead of 8", it.type.runtime_size);
                case "AsyncHandler";
                    assert(it.offset_in_bytes == 32, "QUIC_CREDENTIAL_CONFIG.AsyncHandler has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_CREDENTIAL_CONFIG.AsyncHandler has unexpected size % instead of 8", it.type.runtime_size);
                case "AllowedCipherSuites";
                    assert(it.offset_in_bytes == 40, "QUIC_CREDENTIAL_CONFIG.AllowedCipherSuites has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_CREDENTIAL_CONFIG.AllowedCipherSuites has unexpected size % instead of 4", it.type.runtime_size);
                case "CaCertificateFile";
                    assert(it.offset_in_bytes == 48, "QUIC_CREDENTIAL_CONFIG.CaCertificateFile has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_CREDENTIAL_CONFIG.CaCertificateFile has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_CREDENTIAL_CONFIG) == 56, "QUIC_CREDENTIAL_CONFIG has size % instead of 56", size_of(QUIC_CREDENTIAL_CONFIG));
    }

    {
        info := type_info(QUIC_TICKET_KEY_CONFIG);
        for info.members {
            if it.name == {
                case "Id";
                    assert(it.offset_in_bytes == 0, "QUIC_TICKET_KEY_CONFIG.Id has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 16, "QUIC_TICKET_KEY_CONFIG.Id has unexpected size % instead of 16", it.type.runtime_size);
                case "Material";
                    assert(it.offset_in_bytes == 16, "QUIC_TICKET_KEY_CONFIG.Material has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 64, "QUIC_TICKET_KEY_CONFIG.Material has unexpected size % instead of 64", it.type.runtime_size);
                case "MaterialLength";
                    assert(it.offset_in_bytes == 80, "QUIC_TICKET_KEY_CONFIG.MaterialLength has unexpected offset % instead of 80", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "QUIC_TICKET_KEY_CONFIG.MaterialLength has unexpected size % instead of 1", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_TICKET_KEY_CONFIG) == 81, "QUIC_TICKET_KEY_CONFIG has size % instead of 81", size_of(QUIC_TICKET_KEY_CONFIG));
    }

    {
        info := type_info(QUIC_BUFFER);
        for info.members {
            if it.name == {
                case "Length";
                    assert(it.offset_in_bytes == 0, "QUIC_BUFFER.Length has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_BUFFER.Length has unexpected size % instead of 4", it.type.runtime_size);
                case "Buffer";
                    assert(it.offset_in_bytes == 8, "QUIC_BUFFER.Buffer has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_BUFFER.Buffer has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_BUFFER) == 16, "QUIC_BUFFER has size % instead of 16", size_of(QUIC_BUFFER));
    }

    {
        info := type_info(QUIC_NEW_CONNECTION_INFO);
        for info.members {
            if it.name == {
                case "QuicVersion";
                    assert(it.offset_in_bytes == 0, "QUIC_NEW_CONNECTION_INFO.QuicVersion has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_NEW_CONNECTION_INFO.QuicVersion has unexpected size % instead of 4", it.type.runtime_size);
                case "LocalAddress";
                    assert(it.offset_in_bytes == 8, "QUIC_NEW_CONNECTION_INFO.LocalAddress has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_NEW_CONNECTION_INFO.LocalAddress has unexpected size % instead of 8", it.type.runtime_size);
                case "RemoteAddress";
                    assert(it.offset_in_bytes == 16, "QUIC_NEW_CONNECTION_INFO.RemoteAddress has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_NEW_CONNECTION_INFO.RemoteAddress has unexpected size % instead of 8", it.type.runtime_size);
                case "CryptoBufferLength";
                    assert(it.offset_in_bytes == 24, "QUIC_NEW_CONNECTION_INFO.CryptoBufferLength has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_NEW_CONNECTION_INFO.CryptoBufferLength has unexpected size % instead of 4", it.type.runtime_size);
                case "ClientAlpnListLength";
                    assert(it.offset_in_bytes == 28, "QUIC_NEW_CONNECTION_INFO.ClientAlpnListLength has unexpected offset % instead of 28", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "QUIC_NEW_CONNECTION_INFO.ClientAlpnListLength has unexpected size % instead of 2", it.type.runtime_size);
                case "ServerNameLength";
                    assert(it.offset_in_bytes == 30, "QUIC_NEW_CONNECTION_INFO.ServerNameLength has unexpected offset % instead of 30", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "QUIC_NEW_CONNECTION_INFO.ServerNameLength has unexpected size % instead of 2", it.type.runtime_size);
                case "NegotiatedAlpnLength";
                    assert(it.offset_in_bytes == 32, "QUIC_NEW_CONNECTION_INFO.NegotiatedAlpnLength has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "QUIC_NEW_CONNECTION_INFO.NegotiatedAlpnLength has unexpected size % instead of 1", it.type.runtime_size);
                case "CryptoBuffer";
                    assert(it.offset_in_bytes == 40, "QUIC_NEW_CONNECTION_INFO.CryptoBuffer has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_NEW_CONNECTION_INFO.CryptoBuffer has unexpected size % instead of 8", it.type.runtime_size);
                case "ClientAlpnList";
                    assert(it.offset_in_bytes == 48, "QUIC_NEW_CONNECTION_INFO.ClientAlpnList has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_NEW_CONNECTION_INFO.ClientAlpnList has unexpected size % instead of 8", it.type.runtime_size);
                case "NegotiatedAlpn";
                    assert(it.offset_in_bytes == 56, "QUIC_NEW_CONNECTION_INFO.NegotiatedAlpn has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_NEW_CONNECTION_INFO.NegotiatedAlpn has unexpected size % instead of 8", it.type.runtime_size);
                case "ServerName";
                    assert(it.offset_in_bytes == 64, "QUIC_NEW_CONNECTION_INFO.ServerName has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_NEW_CONNECTION_INFO.ServerName has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_NEW_CONNECTION_INFO) == 72, "QUIC_NEW_CONNECTION_INFO has size % instead of 72", size_of(QUIC_NEW_CONNECTION_INFO));
    }

    {
        info := type_info(QUIC_HANDSHAKE_INFO);
        for info.members {
            if it.name == {
                case "TlsProtocolVersion";
                    assert(it.offset_in_bytes == 0, "QUIC_HANDSHAKE_INFO.TlsProtocolVersion has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_HANDSHAKE_INFO.TlsProtocolVersion has unexpected size % instead of 4", it.type.runtime_size);
                case "CipherAlgorithm";
                    assert(it.offset_in_bytes == 4, "QUIC_HANDSHAKE_INFO.CipherAlgorithm has unexpected offset % instead of 4", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_HANDSHAKE_INFO.CipherAlgorithm has unexpected size % instead of 4", it.type.runtime_size);
                case "CipherStrength";
                    assert(it.offset_in_bytes == 8, "QUIC_HANDSHAKE_INFO.CipherStrength has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_HANDSHAKE_INFO.CipherStrength has unexpected size % instead of 4", it.type.runtime_size);
                case "Hash";
                    assert(it.offset_in_bytes == 12, "QUIC_HANDSHAKE_INFO.Hash has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_HANDSHAKE_INFO.Hash has unexpected size % instead of 4", it.type.runtime_size);
                case "HashStrength";
                    assert(it.offset_in_bytes == 16, "QUIC_HANDSHAKE_INFO.HashStrength has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_HANDSHAKE_INFO.HashStrength has unexpected size % instead of 4", it.type.runtime_size);
                case "KeyExchangeAlgorithm";
                    assert(it.offset_in_bytes == 20, "QUIC_HANDSHAKE_INFO.KeyExchangeAlgorithm has unexpected offset % instead of 20", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_HANDSHAKE_INFO.KeyExchangeAlgorithm has unexpected size % instead of 4", it.type.runtime_size);
                case "KeyExchangeStrength";
                    assert(it.offset_in_bytes == 24, "QUIC_HANDSHAKE_INFO.KeyExchangeStrength has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_HANDSHAKE_INFO.KeyExchangeStrength has unexpected size % instead of 4", it.type.runtime_size);
                case "CipherSuite";
                    assert(it.offset_in_bytes == 28, "QUIC_HANDSHAKE_INFO.CipherSuite has unexpected offset % instead of 28", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_HANDSHAKE_INFO.CipherSuite has unexpected size % instead of 4", it.type.runtime_size);
                case "TlsGroup";
                    assert(it.offset_in_bytes == 32, "QUIC_HANDSHAKE_INFO.TlsGroup has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_HANDSHAKE_INFO.TlsGroup has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_HANDSHAKE_INFO) == 36, "QUIC_HANDSHAKE_INFO has size % instead of 36", size_of(QUIC_HANDSHAKE_INFO));
    }

    {
        info := type_info(QUIC_STATISTICS);
        for info.members {
            if it.name == {
                case "CorrelationId";
                    assert(it.offset_in_bytes == 0, "QUIC_STATISTICS.CorrelationId has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS.CorrelationId has unexpected size % instead of 8", it.type.runtime_size);
                case "__bitfield";
                    assert(it.offset_in_bytes == 8, "QUIC_STATISTICS.__bitfield has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "QUIC_STATISTICS.__bitfield has unexpected size % instead of 1", it.type.runtime_size);
                case "Rtt";
                    assert(it.offset_in_bytes == 12, "QUIC_STATISTICS.Rtt has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS.Rtt has unexpected size % instead of 4", it.type.runtime_size);
                case "MinRtt";
                    assert(it.offset_in_bytes == 16, "QUIC_STATISTICS.MinRtt has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS.MinRtt has unexpected size % instead of 4", it.type.runtime_size);
                case "MaxRtt";
                    assert(it.offset_in_bytes == 20, "QUIC_STATISTICS.MaxRtt has unexpected offset % instead of 20", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS.MaxRtt has unexpected size % instead of 4", it.type.runtime_size);
                case "Timing";
                    assert(it.offset_in_bytes == 24, "QUIC_STATISTICS.Timing has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 24, "QUIC_STATISTICS.Timing has unexpected size % instead of 24", it.type.runtime_size);
                case "Handshake";
                    assert(it.offset_in_bytes == 48, "QUIC_STATISTICS.Handshake has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 12, "QUIC_STATISTICS.Handshake has unexpected size % instead of 12", it.type.runtime_size);
                case "Send";
                    assert(it.offset_in_bytes == 64, "QUIC_STATISTICS.Send has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 64, "QUIC_STATISTICS.Send has unexpected size % instead of 64", it.type.runtime_size);
                case "Recv";
                    assert(it.offset_in_bytes == 128, "QUIC_STATISTICS.Recv has unexpected offset % instead of 128", it.offset_in_bytes);
                    assert(it.type.runtime_size == 64, "QUIC_STATISTICS.Recv has unexpected size % instead of 64", it.type.runtime_size);
                case "Misc";
                    assert(it.offset_in_bytes == 192, "QUIC_STATISTICS.Misc has unexpected offset % instead of 192", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS.Misc has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_STATISTICS) == 200, "QUIC_STATISTICS has size % instead of 200", size_of(QUIC_STATISTICS));
    }

    {
        info := type_info(QUIC_STATISTICS_V2);
        for info.members {
            if it.name == {
                case "CorrelationId";
                    assert(it.offset_in_bytes == 0, "QUIC_STATISTICS_V2.CorrelationId has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.CorrelationId has unexpected size % instead of 8", it.type.runtime_size);
                case "__bitfield";
                    assert(it.offset_in_bytes == 8, "QUIC_STATISTICS_V2.__bitfield has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS_V2.__bitfield has unexpected size % instead of 4", it.type.runtime_size);
                case "Rtt";
                    assert(it.offset_in_bytes == 12, "QUIC_STATISTICS_V2.Rtt has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS_V2.Rtt has unexpected size % instead of 4", it.type.runtime_size);
                case "MinRtt";
                    assert(it.offset_in_bytes == 16, "QUIC_STATISTICS_V2.MinRtt has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS_V2.MinRtt has unexpected size % instead of 4", it.type.runtime_size);
                case "MaxRtt";
                    assert(it.offset_in_bytes == 20, "QUIC_STATISTICS_V2.MaxRtt has unexpected offset % instead of 20", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS_V2.MaxRtt has unexpected size % instead of 4", it.type.runtime_size);
                case "TimingStart";
                    assert(it.offset_in_bytes == 24, "QUIC_STATISTICS_V2.TimingStart has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.TimingStart has unexpected size % instead of 8", it.type.runtime_size);
                case "TimingInitialFlightEnd";
                    assert(it.offset_in_bytes == 32, "QUIC_STATISTICS_V2.TimingInitialFlightEnd has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.TimingInitialFlightEnd has unexpected size % instead of 8", it.type.runtime_size);
                case "TimingHandshakeFlightEnd";
                    assert(it.offset_in_bytes == 40, "QUIC_STATISTICS_V2.TimingHandshakeFlightEnd has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.TimingHandshakeFlightEnd has unexpected size % instead of 8", it.type.runtime_size);
                case "HandshakeClientFlight1Bytes";
                    assert(it.offset_in_bytes == 48, "QUIC_STATISTICS_V2.HandshakeClientFlight1Bytes has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS_V2.HandshakeClientFlight1Bytes has unexpected size % instead of 4", it.type.runtime_size);
                case "HandshakeServerFlight1Bytes";
                    assert(it.offset_in_bytes == 52, "QUIC_STATISTICS_V2.HandshakeServerFlight1Bytes has unexpected offset % instead of 52", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS_V2.HandshakeServerFlight1Bytes has unexpected size % instead of 4", it.type.runtime_size);
                case "HandshakeClientFlight2Bytes";
                    assert(it.offset_in_bytes == 56, "QUIC_STATISTICS_V2.HandshakeClientFlight2Bytes has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS_V2.HandshakeClientFlight2Bytes has unexpected size % instead of 4", it.type.runtime_size);
                case "SendPathMtu";
                    assert(it.offset_in_bytes == 60, "QUIC_STATISTICS_V2.SendPathMtu has unexpected offset % instead of 60", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "QUIC_STATISTICS_V2.SendPathMtu has unexpected size % instead of 2", it.type.runtime_size);
                case "SendTotalPackets";
                    assert(it.offset_in_bytes == 64, "QUIC_STATISTICS_V2.SendTotalPackets has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.SendTotalPackets has unexpected size % instead of 8", it.type.runtime_size);
                case "SendRetransmittablePackets";
                    assert(it.offset_in_bytes == 72, "QUIC_STATISTICS_V2.SendRetransmittablePackets has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.SendRetransmittablePackets has unexpected size % instead of 8", it.type.runtime_size);
                case "SendSuspectedLostPackets";
                    assert(it.offset_in_bytes == 80, "QUIC_STATISTICS_V2.SendSuspectedLostPackets has unexpected offset % instead of 80", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.SendSuspectedLostPackets has unexpected size % instead of 8", it.type.runtime_size);
                case "SendSpuriousLostPackets";
                    assert(it.offset_in_bytes == 88, "QUIC_STATISTICS_V2.SendSpuriousLostPackets has unexpected offset % instead of 88", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.SendSpuriousLostPackets has unexpected size % instead of 8", it.type.runtime_size);
                case "SendTotalBytes";
                    assert(it.offset_in_bytes == 96, "QUIC_STATISTICS_V2.SendTotalBytes has unexpected offset % instead of 96", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.SendTotalBytes has unexpected size % instead of 8", it.type.runtime_size);
                case "SendTotalStreamBytes";
                    assert(it.offset_in_bytes == 104, "QUIC_STATISTICS_V2.SendTotalStreamBytes has unexpected offset % instead of 104", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.SendTotalStreamBytes has unexpected size % instead of 8", it.type.runtime_size);
                case "SendCongestionCount";
                    assert(it.offset_in_bytes == 112, "QUIC_STATISTICS_V2.SendCongestionCount has unexpected offset % instead of 112", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS_V2.SendCongestionCount has unexpected size % instead of 4", it.type.runtime_size);
                case "SendPersistentCongestionCount";
                    assert(it.offset_in_bytes == 116, "QUIC_STATISTICS_V2.SendPersistentCongestionCount has unexpected offset % instead of 116", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS_V2.SendPersistentCongestionCount has unexpected size % instead of 4", it.type.runtime_size);
                case "RecvTotalPackets";
                    assert(it.offset_in_bytes == 120, "QUIC_STATISTICS_V2.RecvTotalPackets has unexpected offset % instead of 120", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.RecvTotalPackets has unexpected size % instead of 8", it.type.runtime_size);
                case "RecvReorderedPackets";
                    assert(it.offset_in_bytes == 128, "QUIC_STATISTICS_V2.RecvReorderedPackets has unexpected offset % instead of 128", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.RecvReorderedPackets has unexpected size % instead of 8", it.type.runtime_size);
                case "RecvDroppedPackets";
                    assert(it.offset_in_bytes == 136, "QUIC_STATISTICS_V2.RecvDroppedPackets has unexpected offset % instead of 136", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.RecvDroppedPackets has unexpected size % instead of 8", it.type.runtime_size);
                case "RecvDuplicatePackets";
                    assert(it.offset_in_bytes == 144, "QUIC_STATISTICS_V2.RecvDuplicatePackets has unexpected offset % instead of 144", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.RecvDuplicatePackets has unexpected size % instead of 8", it.type.runtime_size);
                case "RecvTotalBytes";
                    assert(it.offset_in_bytes == 152, "QUIC_STATISTICS_V2.RecvTotalBytes has unexpected offset % instead of 152", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.RecvTotalBytes has unexpected size % instead of 8", it.type.runtime_size);
                case "RecvTotalStreamBytes";
                    assert(it.offset_in_bytes == 160, "QUIC_STATISTICS_V2.RecvTotalStreamBytes has unexpected offset % instead of 160", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.RecvTotalStreamBytes has unexpected size % instead of 8", it.type.runtime_size);
                case "RecvDecryptionFailures";
                    assert(it.offset_in_bytes == 168, "QUIC_STATISTICS_V2.RecvDecryptionFailures has unexpected offset % instead of 168", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.RecvDecryptionFailures has unexpected size % instead of 8", it.type.runtime_size);
                case "RecvValidAckFrames";
                    assert(it.offset_in_bytes == 176, "QUIC_STATISTICS_V2.RecvValidAckFrames has unexpected offset % instead of 176", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STATISTICS_V2.RecvValidAckFrames has unexpected size % instead of 8", it.type.runtime_size);
                case "KeyUpdateCount";
                    assert(it.offset_in_bytes == 184, "QUIC_STATISTICS_V2.KeyUpdateCount has unexpected offset % instead of 184", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS_V2.KeyUpdateCount has unexpected size % instead of 4", it.type.runtime_size);
                case "SendCongestionWindow";
                    assert(it.offset_in_bytes == 188, "QUIC_STATISTICS_V2.SendCongestionWindow has unexpected offset % instead of 188", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS_V2.SendCongestionWindow has unexpected size % instead of 4", it.type.runtime_size);
                case "DestCidUpdateCount";
                    assert(it.offset_in_bytes == 192, "QUIC_STATISTICS_V2.DestCidUpdateCount has unexpected offset % instead of 192", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS_V2.DestCidUpdateCount has unexpected size % instead of 4", it.type.runtime_size);
                case "SendEcnCongestionCount";
                    assert(it.offset_in_bytes == 196, "QUIC_STATISTICS_V2.SendEcnCongestionCount has unexpected offset % instead of 196", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS_V2.SendEcnCongestionCount has unexpected size % instead of 4", it.type.runtime_size);
                case "HandshakeHopLimitTTL";
                    assert(it.offset_in_bytes == 200, "QUIC_STATISTICS_V2.HandshakeHopLimitTTL has unexpected offset % instead of 200", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "QUIC_STATISTICS_V2.HandshakeHopLimitTTL has unexpected size % instead of 1", it.type.runtime_size);
                case "RttVariance";
                    assert(it.offset_in_bytes == 204, "QUIC_STATISTICS_V2.RttVariance has unexpected offset % instead of 204", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STATISTICS_V2.RttVariance has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_STATISTICS_V2) == 208, "QUIC_STATISTICS_V2 has size % instead of 208", size_of(QUIC_STATISTICS_V2));
    }

    {
        info := type_info(QUIC_NETWORK_STATISTICS);
        for info.members {
            if it.name == {
                case "BytesInFlight";
                    assert(it.offset_in_bytes == 0, "QUIC_NETWORK_STATISTICS.BytesInFlight has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_NETWORK_STATISTICS.BytesInFlight has unexpected size % instead of 4", it.type.runtime_size);
                case "PostedBytes";
                    assert(it.offset_in_bytes == 8, "QUIC_NETWORK_STATISTICS.PostedBytes has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_NETWORK_STATISTICS.PostedBytes has unexpected size % instead of 8", it.type.runtime_size);
                case "IdealBytes";
                    assert(it.offset_in_bytes == 16, "QUIC_NETWORK_STATISTICS.IdealBytes has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_NETWORK_STATISTICS.IdealBytes has unexpected size % instead of 8", it.type.runtime_size);
                case "SmoothedRTT";
                    assert(it.offset_in_bytes == 24, "QUIC_NETWORK_STATISTICS.SmoothedRTT has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_NETWORK_STATISTICS.SmoothedRTT has unexpected size % instead of 8", it.type.runtime_size);
                case "CongestionWindow";
                    assert(it.offset_in_bytes == 32, "QUIC_NETWORK_STATISTICS.CongestionWindow has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_NETWORK_STATISTICS.CongestionWindow has unexpected size % instead of 4", it.type.runtime_size);
                case "Bandwidth";
                    assert(it.offset_in_bytes == 40, "QUIC_NETWORK_STATISTICS.Bandwidth has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_NETWORK_STATISTICS.Bandwidth has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_NETWORK_STATISTICS) == 48, "QUIC_NETWORK_STATISTICS has size % instead of 48", size_of(QUIC_NETWORK_STATISTICS));
    }

    {
        info := type_info(QUIC_LISTENER_STATISTICS);
        for info.members {
            if it.name == {
                case "TotalAcceptedConnections";
                    assert(it.offset_in_bytes == 0, "QUIC_LISTENER_STATISTICS.TotalAcceptedConnections has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_LISTENER_STATISTICS.TotalAcceptedConnections has unexpected size % instead of 8", it.type.runtime_size);
                case "TotalRejectedConnections";
                    assert(it.offset_in_bytes == 8, "QUIC_LISTENER_STATISTICS.TotalRejectedConnections has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_LISTENER_STATISTICS.TotalRejectedConnections has unexpected size % instead of 8", it.type.runtime_size);
                case "BindingRecvDroppedPackets";
                    assert(it.offset_in_bytes == 16, "QUIC_LISTENER_STATISTICS.BindingRecvDroppedPackets has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_LISTENER_STATISTICS.BindingRecvDroppedPackets has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_LISTENER_STATISTICS) == 24, "QUIC_LISTENER_STATISTICS has size % instead of 24", size_of(QUIC_LISTENER_STATISTICS));
    }

    {
        info := type_info(QUIC_GLOBAL_SETTINGS);
        for info.members {
            if it.name == {
                case "RetryMemoryLimit";
                    assert(it.offset_in_bytes == 8, "QUIC_GLOBAL_SETTINGS.RetryMemoryLimit has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "QUIC_GLOBAL_SETTINGS.RetryMemoryLimit has unexpected size % instead of 2", it.type.runtime_size);
                case "LoadBalancingMode";
                    assert(it.offset_in_bytes == 10, "QUIC_GLOBAL_SETTINGS.LoadBalancingMode has unexpected offset % instead of 10", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "QUIC_GLOBAL_SETTINGS.LoadBalancingMode has unexpected size % instead of 2", it.type.runtime_size);
                case "FixedServerID";
                    assert(it.offset_in_bytes == 12, "QUIC_GLOBAL_SETTINGS.FixedServerID has unexpected offset % instead of 12", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_GLOBAL_SETTINGS.FixedServerID has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_GLOBAL_SETTINGS) == 16, "QUIC_GLOBAL_SETTINGS has size % instead of 16", size_of(QUIC_GLOBAL_SETTINGS));
    }

    {
        info := type_info(QUIC_SETTINGS);
        for info.members {
            if it.name == {
                case "MaxBytesPerKey";
                    assert(it.offset_in_bytes == 8, "QUIC_SETTINGS.MaxBytesPerKey has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_SETTINGS.MaxBytesPerKey has unexpected size % instead of 8", it.type.runtime_size);
                case "HandshakeIdleTimeoutMs";
                    assert(it.offset_in_bytes == 16, "QUIC_SETTINGS.HandshakeIdleTimeoutMs has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_SETTINGS.HandshakeIdleTimeoutMs has unexpected size % instead of 8", it.type.runtime_size);
                case "IdleTimeoutMs";
                    assert(it.offset_in_bytes == 24, "QUIC_SETTINGS.IdleTimeoutMs has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_SETTINGS.IdleTimeoutMs has unexpected size % instead of 8", it.type.runtime_size);
                case "MtuDiscoverySearchCompleteTimeoutUs";
                    assert(it.offset_in_bytes == 32, "QUIC_SETTINGS.MtuDiscoverySearchCompleteTimeoutUs has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_SETTINGS.MtuDiscoverySearchCompleteTimeoutUs has unexpected size % instead of 8", it.type.runtime_size);
                case "TlsClientMaxSendBuffer";
                    assert(it.offset_in_bytes == 40, "QUIC_SETTINGS.TlsClientMaxSendBuffer has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.TlsClientMaxSendBuffer has unexpected size % instead of 4", it.type.runtime_size);
                case "TlsServerMaxSendBuffer";
                    assert(it.offset_in_bytes == 44, "QUIC_SETTINGS.TlsServerMaxSendBuffer has unexpected offset % instead of 44", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.TlsServerMaxSendBuffer has unexpected size % instead of 4", it.type.runtime_size);
                case "StreamRecvWindowDefault";
                    assert(it.offset_in_bytes == 48, "QUIC_SETTINGS.StreamRecvWindowDefault has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.StreamRecvWindowDefault has unexpected size % instead of 4", it.type.runtime_size);
                case "StreamRecvBufferDefault";
                    assert(it.offset_in_bytes == 52, "QUIC_SETTINGS.StreamRecvBufferDefault has unexpected offset % instead of 52", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.StreamRecvBufferDefault has unexpected size % instead of 4", it.type.runtime_size);
                case "ConnFlowControlWindow";
                    assert(it.offset_in_bytes == 56, "QUIC_SETTINGS.ConnFlowControlWindow has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.ConnFlowControlWindow has unexpected size % instead of 4", it.type.runtime_size);
                case "MaxWorkerQueueDelayUs";
                    assert(it.offset_in_bytes == 60, "QUIC_SETTINGS.MaxWorkerQueueDelayUs has unexpected offset % instead of 60", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.MaxWorkerQueueDelayUs has unexpected size % instead of 4", it.type.runtime_size);
                case "MaxStatelessOperations";
                    assert(it.offset_in_bytes == 64, "QUIC_SETTINGS.MaxStatelessOperations has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.MaxStatelessOperations has unexpected size % instead of 4", it.type.runtime_size);
                case "InitialWindowPackets";
                    assert(it.offset_in_bytes == 68, "QUIC_SETTINGS.InitialWindowPackets has unexpected offset % instead of 68", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.InitialWindowPackets has unexpected size % instead of 4", it.type.runtime_size);
                case "SendIdleTimeoutMs";
                    assert(it.offset_in_bytes == 72, "QUIC_SETTINGS.SendIdleTimeoutMs has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.SendIdleTimeoutMs has unexpected size % instead of 4", it.type.runtime_size);
                case "InitialRttMs";
                    assert(it.offset_in_bytes == 76, "QUIC_SETTINGS.InitialRttMs has unexpected offset % instead of 76", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.InitialRttMs has unexpected size % instead of 4", it.type.runtime_size);
                case "MaxAckDelayMs";
                    assert(it.offset_in_bytes == 80, "QUIC_SETTINGS.MaxAckDelayMs has unexpected offset % instead of 80", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.MaxAckDelayMs has unexpected size % instead of 4", it.type.runtime_size);
                case "DisconnectTimeoutMs";
                    assert(it.offset_in_bytes == 84, "QUIC_SETTINGS.DisconnectTimeoutMs has unexpected offset % instead of 84", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.DisconnectTimeoutMs has unexpected size % instead of 4", it.type.runtime_size);
                case "KeepAliveIntervalMs";
                    assert(it.offset_in_bytes == 88, "QUIC_SETTINGS.KeepAliveIntervalMs has unexpected offset % instead of 88", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.KeepAliveIntervalMs has unexpected size % instead of 4", it.type.runtime_size);
                case "CongestionControlAlgorithm";
                    assert(it.offset_in_bytes == 92, "QUIC_SETTINGS.CongestionControlAlgorithm has unexpected offset % instead of 92", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "QUIC_SETTINGS.CongestionControlAlgorithm has unexpected size % instead of 2", it.type.runtime_size);
                case "PeerBidiStreamCount";
                    assert(it.offset_in_bytes == 94, "QUIC_SETTINGS.PeerBidiStreamCount has unexpected offset % instead of 94", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "QUIC_SETTINGS.PeerBidiStreamCount has unexpected size % instead of 2", it.type.runtime_size);
                case "PeerUnidiStreamCount";
                    assert(it.offset_in_bytes == 96, "QUIC_SETTINGS.PeerUnidiStreamCount has unexpected offset % instead of 96", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "QUIC_SETTINGS.PeerUnidiStreamCount has unexpected size % instead of 2", it.type.runtime_size);
                case "MaxBindingStatelessOperations";
                    assert(it.offset_in_bytes == 98, "QUIC_SETTINGS.MaxBindingStatelessOperations has unexpected offset % instead of 98", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "QUIC_SETTINGS.MaxBindingStatelessOperations has unexpected size % instead of 2", it.type.runtime_size);
                case "StatelessOperationExpirationMs";
                    assert(it.offset_in_bytes == 100, "QUIC_SETTINGS.StatelessOperationExpirationMs has unexpected offset % instead of 100", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "QUIC_SETTINGS.StatelessOperationExpirationMs has unexpected size % instead of 2", it.type.runtime_size);
                case "MinimumMtu";
                    assert(it.offset_in_bytes == 102, "QUIC_SETTINGS.MinimumMtu has unexpected offset % instead of 102", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "QUIC_SETTINGS.MinimumMtu has unexpected size % instead of 2", it.type.runtime_size);
                case "MaximumMtu";
                    assert(it.offset_in_bytes == 104, "QUIC_SETTINGS.MaximumMtu has unexpected offset % instead of 104", it.offset_in_bytes);
                    assert(it.type.runtime_size == 2, "QUIC_SETTINGS.MaximumMtu has unexpected size % instead of 2", it.type.runtime_size);
                case "__bitfield";
                    assert(it.offset_in_bytes == 106, "QUIC_SETTINGS.__bitfield has unexpected offset % instead of 106", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "QUIC_SETTINGS.__bitfield has unexpected size % instead of 1", it.type.runtime_size);
                case "MaxOperationsPerDrain";
                    assert(it.offset_in_bytes == 107, "QUIC_SETTINGS.MaxOperationsPerDrain has unexpected offset % instead of 107", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "QUIC_SETTINGS.MaxOperationsPerDrain has unexpected size % instead of 1", it.type.runtime_size);
                case "MtuDiscoveryMissingProbeCount";
                    assert(it.offset_in_bytes == 108, "QUIC_SETTINGS.MtuDiscoveryMissingProbeCount has unexpected offset % instead of 108", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "QUIC_SETTINGS.MtuDiscoveryMissingProbeCount has unexpected size % instead of 1", it.type.runtime_size);
                case "DestCidUpdateIdleTimeoutMs";
                    assert(it.offset_in_bytes == 112, "QUIC_SETTINGS.DestCidUpdateIdleTimeoutMs has unexpected offset % instead of 112", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.DestCidUpdateIdleTimeoutMs has unexpected size % instead of 4", it.type.runtime_size);
                case "StreamRecvWindowBidiLocalDefault";
                    assert(it.offset_in_bytes == 128, "QUIC_SETTINGS.StreamRecvWindowBidiLocalDefault has unexpected offset % instead of 128", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.StreamRecvWindowBidiLocalDefault has unexpected size % instead of 4", it.type.runtime_size);
                case "StreamRecvWindowBidiRemoteDefault";
                    assert(it.offset_in_bytes == 132, "QUIC_SETTINGS.StreamRecvWindowBidiRemoteDefault has unexpected offset % instead of 132", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.StreamRecvWindowBidiRemoteDefault has unexpected size % instead of 4", it.type.runtime_size);
                case "StreamRecvWindowUnidiDefault";
                    assert(it.offset_in_bytes == 136, "QUIC_SETTINGS.StreamRecvWindowUnidiDefault has unexpected offset % instead of 136", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_SETTINGS.StreamRecvWindowUnidiDefault has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_SETTINGS) == 144, "QUIC_SETTINGS has size % instead of 144", size_of(QUIC_SETTINGS));
    }

    {
        info := type_info(QUIC_TLS_SECRETS);
        for info.members {
            if it.name == {
                case "SecretLength";
                    assert(it.offset_in_bytes == 0, "QUIC_TLS_SECRETS.SecretLength has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "QUIC_TLS_SECRETS.SecretLength has unexpected size % instead of 1", it.type.runtime_size);
                case "IsSet";
                    assert(it.offset_in_bytes == 1, "QUIC_TLS_SECRETS.IsSet has unexpected offset % instead of 1", it.offset_in_bytes);
                    assert(it.type.runtime_size == 1, "QUIC_TLS_SECRETS.IsSet has unexpected size % instead of 1", it.type.runtime_size);
                case "ClientRandom";
                    assert(it.offset_in_bytes == 2, "QUIC_TLS_SECRETS.ClientRandom has unexpected offset % instead of 2", it.offset_in_bytes);
                    assert(it.type.runtime_size == 32, "QUIC_TLS_SECRETS.ClientRandom has unexpected size % instead of 32", it.type.runtime_size);
                case "ClientEarlyTrafficSecret";
                    assert(it.offset_in_bytes == 34, "QUIC_TLS_SECRETS.ClientEarlyTrafficSecret has unexpected offset % instead of 34", it.offset_in_bytes);
                    assert(it.type.runtime_size == 64, "QUIC_TLS_SECRETS.ClientEarlyTrafficSecret has unexpected size % instead of 64", it.type.runtime_size);
                case "ClientHandshakeTrafficSecret";
                    assert(it.offset_in_bytes == 98, "QUIC_TLS_SECRETS.ClientHandshakeTrafficSecret has unexpected offset % instead of 98", it.offset_in_bytes);
                    assert(it.type.runtime_size == 64, "QUIC_TLS_SECRETS.ClientHandshakeTrafficSecret has unexpected size % instead of 64", it.type.runtime_size);
                case "ServerHandshakeTrafficSecret";
                    assert(it.offset_in_bytes == 162, "QUIC_TLS_SECRETS.ServerHandshakeTrafficSecret has unexpected offset % instead of 162", it.offset_in_bytes);
                    assert(it.type.runtime_size == 64, "QUIC_TLS_SECRETS.ServerHandshakeTrafficSecret has unexpected size % instead of 64", it.type.runtime_size);
                case "ClientTrafficSecret0";
                    assert(it.offset_in_bytes == 226, "QUIC_TLS_SECRETS.ClientTrafficSecret0 has unexpected offset % instead of 226", it.offset_in_bytes);
                    assert(it.type.runtime_size == 64, "QUIC_TLS_SECRETS.ClientTrafficSecret0 has unexpected size % instead of 64", it.type.runtime_size);
                case "ServerTrafficSecret0";
                    assert(it.offset_in_bytes == 290, "QUIC_TLS_SECRETS.ServerTrafficSecret0 has unexpected offset % instead of 290", it.offset_in_bytes);
                    assert(it.type.runtime_size == 64, "QUIC_TLS_SECRETS.ServerTrafficSecret0 has unexpected size % instead of 64", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_TLS_SECRETS) == 354, "QUIC_TLS_SECRETS has size % instead of 354", size_of(QUIC_TLS_SECRETS));
    }

    {
        info := type_info(QUIC_STREAM_STATISTICS);
        for info.members {
            if it.name == {
                case "ConnBlockedBySchedulingUs";
                    assert(it.offset_in_bytes == 0, "QUIC_STREAM_STATISTICS.ConnBlockedBySchedulingUs has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STREAM_STATISTICS.ConnBlockedBySchedulingUs has unexpected size % instead of 8", it.type.runtime_size);
                case "ConnBlockedByPacingUs";
                    assert(it.offset_in_bytes == 8, "QUIC_STREAM_STATISTICS.ConnBlockedByPacingUs has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STREAM_STATISTICS.ConnBlockedByPacingUs has unexpected size % instead of 8", it.type.runtime_size);
                case "ConnBlockedByAmplificationProtUs";
                    assert(it.offset_in_bytes == 16, "QUIC_STREAM_STATISTICS.ConnBlockedByAmplificationProtUs has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STREAM_STATISTICS.ConnBlockedByAmplificationProtUs has unexpected size % instead of 8", it.type.runtime_size);
                case "ConnBlockedByCongestionControlUs";
                    assert(it.offset_in_bytes == 24, "QUIC_STREAM_STATISTICS.ConnBlockedByCongestionControlUs has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STREAM_STATISTICS.ConnBlockedByCongestionControlUs has unexpected size % instead of 8", it.type.runtime_size);
                case "ConnBlockedByFlowControlUs";
                    assert(it.offset_in_bytes == 32, "QUIC_STREAM_STATISTICS.ConnBlockedByFlowControlUs has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STREAM_STATISTICS.ConnBlockedByFlowControlUs has unexpected size % instead of 8", it.type.runtime_size);
                case "StreamBlockedByIdFlowControlUs";
                    assert(it.offset_in_bytes == 40, "QUIC_STREAM_STATISTICS.StreamBlockedByIdFlowControlUs has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STREAM_STATISTICS.StreamBlockedByIdFlowControlUs has unexpected size % instead of 8", it.type.runtime_size);
                case "StreamBlockedByFlowControlUs";
                    assert(it.offset_in_bytes == 48, "QUIC_STREAM_STATISTICS.StreamBlockedByFlowControlUs has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STREAM_STATISTICS.StreamBlockedByFlowControlUs has unexpected size % instead of 8", it.type.runtime_size);
                case "StreamBlockedByAppUs";
                    assert(it.offset_in_bytes == 56, "QUIC_STREAM_STATISTICS.StreamBlockedByAppUs has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_STREAM_STATISTICS.StreamBlockedByAppUs has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_STREAM_STATISTICS) == 64, "QUIC_STREAM_STATISTICS has size % instead of 64", size_of(QUIC_STREAM_STATISTICS));
    }

    {
        info := type_info(QUIC_SCHANNEL_CREDENTIAL_ATTRIBUTE_W);
        for info.members {
            if it.name == {
                case "Attribute";
                    assert(it.offset_in_bytes == 0, "QUIC_SCHANNEL_CREDENTIAL_ATTRIBUTE_W.Attribute has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_SCHANNEL_CREDENTIAL_ATTRIBUTE_W.Attribute has unexpected size % instead of 8", it.type.runtime_size);
                case "BufferLength";
                    assert(it.offset_in_bytes == 8, "QUIC_SCHANNEL_CREDENTIAL_ATTRIBUTE_W.BufferLength has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_SCHANNEL_CREDENTIAL_ATTRIBUTE_W.BufferLength has unexpected size % instead of 8", it.type.runtime_size);
                case "Buffer";
                    assert(it.offset_in_bytes == 16, "QUIC_SCHANNEL_CREDENTIAL_ATTRIBUTE_W.Buffer has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_SCHANNEL_CREDENTIAL_ATTRIBUTE_W.Buffer has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_SCHANNEL_CREDENTIAL_ATTRIBUTE_W) == 24, "QUIC_SCHANNEL_CREDENTIAL_ATTRIBUTE_W has size % instead of 24", size_of(QUIC_SCHANNEL_CREDENTIAL_ATTRIBUTE_W));
    }

    {
        info := type_info(QUIC_LISTENER_EVENT);
        for info.members {
            if it.name == {
                case "Type";
                    assert(it.offset_in_bytes == 0, "QUIC_LISTENER_EVENT.Type has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_LISTENER_EVENT.Type has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_LISTENER_EVENT) == 24, "QUIC_LISTENER_EVENT has size % instead of 24", size_of(QUIC_LISTENER_EVENT));
    }

    {
        info := type_info(QUIC_CONNECTION_EVENT);
        for info.members {
            if it.name == {
                case "Type";
                    assert(it.offset_in_bytes == 0, "QUIC_CONNECTION_EVENT.Type has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_CONNECTION_EVENT.Type has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_CONNECTION_EVENT) == 32, "QUIC_CONNECTION_EVENT has size % instead of 32", size_of(QUIC_CONNECTION_EVENT));
    }

    {
        info := type_info(QUIC_STREAM_EVENT);
        for info.members {
            if it.name == {
                case "Type";
                    assert(it.offset_in_bytes == 0, "QUIC_STREAM_EVENT.Type has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 4, "QUIC_STREAM_EVENT.Type has unexpected size % instead of 4", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_STREAM_EVENT) == 40, "QUIC_STREAM_EVENT has size % instead of 40", size_of(QUIC_STREAM_EVENT));
    }

    {
        info := type_info(QUIC_API_TABLE);
        for info.members {
            if it.name == {
                case "SetContext";
                    assert(it.offset_in_bytes == 0, "QUIC_API_TABLE.SetContext has unexpected offset % instead of 0", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.SetContext has unexpected size % instead of 8", it.type.runtime_size);
                case "GetContext";
                    assert(it.offset_in_bytes == 8, "QUIC_API_TABLE.GetContext has unexpected offset % instead of 8", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.GetContext has unexpected size % instead of 8", it.type.runtime_size);
                case "SetCallbackHandler";
                    assert(it.offset_in_bytes == 16, "QUIC_API_TABLE.SetCallbackHandler has unexpected offset % instead of 16", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.SetCallbackHandler has unexpected size % instead of 8", it.type.runtime_size);
                case "SetParam";
                    assert(it.offset_in_bytes == 24, "QUIC_API_TABLE.SetParam has unexpected offset % instead of 24", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.SetParam has unexpected size % instead of 8", it.type.runtime_size);
                case "GetParam";
                    assert(it.offset_in_bytes == 32, "QUIC_API_TABLE.GetParam has unexpected offset % instead of 32", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.GetParam has unexpected size % instead of 8", it.type.runtime_size);
                case "RegistrationOpen";
                    assert(it.offset_in_bytes == 40, "QUIC_API_TABLE.RegistrationOpen has unexpected offset % instead of 40", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.RegistrationOpen has unexpected size % instead of 8", it.type.runtime_size);
                case "RegistrationClose";
                    assert(it.offset_in_bytes == 48, "QUIC_API_TABLE.RegistrationClose has unexpected offset % instead of 48", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.RegistrationClose has unexpected size % instead of 8", it.type.runtime_size);
                case "RegistrationShutdown";
                    assert(it.offset_in_bytes == 56, "QUIC_API_TABLE.RegistrationShutdown has unexpected offset % instead of 56", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.RegistrationShutdown has unexpected size % instead of 8", it.type.runtime_size);
                case "ConfigurationOpen";
                    assert(it.offset_in_bytes == 64, "QUIC_API_TABLE.ConfigurationOpen has unexpected offset % instead of 64", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.ConfigurationOpen has unexpected size % instead of 8", it.type.runtime_size);
                case "ConfigurationClose";
                    assert(it.offset_in_bytes == 72, "QUIC_API_TABLE.ConfigurationClose has unexpected offset % instead of 72", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.ConfigurationClose has unexpected size % instead of 8", it.type.runtime_size);
                case "ConfigurationLoadCredential";
                    assert(it.offset_in_bytes == 80, "QUIC_API_TABLE.ConfigurationLoadCredential has unexpected offset % instead of 80", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.ConfigurationLoadCredential has unexpected size % instead of 8", it.type.runtime_size);
                case "ListenerOpen";
                    assert(it.offset_in_bytes == 88, "QUIC_API_TABLE.ListenerOpen has unexpected offset % instead of 88", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.ListenerOpen has unexpected size % instead of 8", it.type.runtime_size);
                case "ListenerClose";
                    assert(it.offset_in_bytes == 96, "QUIC_API_TABLE.ListenerClose has unexpected offset % instead of 96", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.ListenerClose has unexpected size % instead of 8", it.type.runtime_size);
                case "ListenerStart";
                    assert(it.offset_in_bytes == 104, "QUIC_API_TABLE.ListenerStart has unexpected offset % instead of 104", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.ListenerStart has unexpected size % instead of 8", it.type.runtime_size);
                case "ListenerStop";
                    assert(it.offset_in_bytes == 112, "QUIC_API_TABLE.ListenerStop has unexpected offset % instead of 112", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.ListenerStop has unexpected size % instead of 8", it.type.runtime_size);
                case "ConnectionOpen";
                    assert(it.offset_in_bytes == 120, "QUIC_API_TABLE.ConnectionOpen has unexpected offset % instead of 120", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.ConnectionOpen has unexpected size % instead of 8", it.type.runtime_size);
                case "ConnectionClose";
                    assert(it.offset_in_bytes == 128, "QUIC_API_TABLE.ConnectionClose has unexpected offset % instead of 128", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.ConnectionClose has unexpected size % instead of 8", it.type.runtime_size);
                case "ConnectionShutdown";
                    assert(it.offset_in_bytes == 136, "QUIC_API_TABLE.ConnectionShutdown has unexpected offset % instead of 136", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.ConnectionShutdown has unexpected size % instead of 8", it.type.runtime_size);
                case "ConnectionStart";
                    assert(it.offset_in_bytes == 144, "QUIC_API_TABLE.ConnectionStart has unexpected offset % instead of 144", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.ConnectionStart has unexpected size % instead of 8", it.type.runtime_size);
                case "ConnectionSetConfiguration";
                    assert(it.offset_in_bytes == 152, "QUIC_API_TABLE.ConnectionSetConfiguration has unexpected offset % instead of 152", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.ConnectionSetConfiguration has unexpected size % instead of 8", it.type.runtime_size);
                case "ConnectionSendResumptionTicket";
                    assert(it.offset_in_bytes == 160, "QUIC_API_TABLE.ConnectionSendResumptionTicket has unexpected offset % instead of 160", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.ConnectionSendResumptionTicket has unexpected size % instead of 8", it.type.runtime_size);
                case "StreamOpen";
                    assert(it.offset_in_bytes == 168, "QUIC_API_TABLE.StreamOpen has unexpected offset % instead of 168", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.StreamOpen has unexpected size % instead of 8", it.type.runtime_size);
                case "StreamClose";
                    assert(it.offset_in_bytes == 176, "QUIC_API_TABLE.StreamClose has unexpected offset % instead of 176", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.StreamClose has unexpected size % instead of 8", it.type.runtime_size);
                case "StreamStart";
                    assert(it.offset_in_bytes == 184, "QUIC_API_TABLE.StreamStart has unexpected offset % instead of 184", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.StreamStart has unexpected size % instead of 8", it.type.runtime_size);
                case "StreamShutdown";
                    assert(it.offset_in_bytes == 192, "QUIC_API_TABLE.StreamShutdown has unexpected offset % instead of 192", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.StreamShutdown has unexpected size % instead of 8", it.type.runtime_size);
                case "StreamSend";
                    assert(it.offset_in_bytes == 200, "QUIC_API_TABLE.StreamSend has unexpected offset % instead of 200", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.StreamSend has unexpected size % instead of 8", it.type.runtime_size);
                case "StreamReceiveComplete";
                    assert(it.offset_in_bytes == 208, "QUIC_API_TABLE.StreamReceiveComplete has unexpected offset % instead of 208", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.StreamReceiveComplete has unexpected size % instead of 8", it.type.runtime_size);
                case "StreamReceiveSetEnabled";
                    assert(it.offset_in_bytes == 216, "QUIC_API_TABLE.StreamReceiveSetEnabled has unexpected offset % instead of 216", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.StreamReceiveSetEnabled has unexpected size % instead of 8", it.type.runtime_size);
                case "DatagramSend";
                    assert(it.offset_in_bytes == 224, "QUIC_API_TABLE.DatagramSend has unexpected offset % instead of 224", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.DatagramSend has unexpected size % instead of 8", it.type.runtime_size);
                case "ConnectionResumptionTicketValidationComplete";
                    assert(it.offset_in_bytes == 232, "QUIC_API_TABLE.ConnectionResumptionTicketValidationComplete has unexpected offset % instead of 232", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.ConnectionResumptionTicketValidationComplete has unexpected size % instead of 8", it.type.runtime_size);
                case "ConnectionCertificateValidationComplete";
                    assert(it.offset_in_bytes == 240, "QUIC_API_TABLE.ConnectionCertificateValidationComplete has unexpected offset % instead of 240", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.ConnectionCertificateValidationComplete has unexpected size % instead of 8", it.type.runtime_size);
                case "ConnectionOpenInPartition";
                    assert(it.offset_in_bytes == 248, "QUIC_API_TABLE.ConnectionOpenInPartition has unexpected offset % instead of 248", it.offset_in_bytes);
                    assert(it.type.runtime_size == 8, "QUIC_API_TABLE.ConnectionOpenInPartition has unexpected size % instead of 8", it.type.runtime_size);
            }
        }
        assert(size_of(QUIC_API_TABLE) == 256, "QUIC_API_TABLE has size % instead of 256", size_of(QUIC_API_TABLE));
    }
}


libmsquic :: #library "macos/arm64/libmsquic";

#import "POSIX";

