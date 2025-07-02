/*                            Kingdom Core: QUIC                            */

// @Note: We don't actually bother to compile msquic here, because they
// decided to use Powershell (and a _special_ branch of powershell at that)
// as their build system. Instead we just include the binaries. We are very
// sorry.

// As stated in the readme though, we'd like to replace this with a much
// simpler, in-house implementation of QUIC eventually though.

// Before generating, init the git submodule and follow the build instructions
// in the msquic readme.

// Supported Platforms for the generator:
// Windows: x64
// Linux: x64
// MacOS: arm64

declaration_visitor :: (declaration: *Declaration, parent: *Declaration) -> Declaration_Visit_Result {
	if declaration.kind == .ENUM {
		// print("FOUND ENUM: %\n", declaration.name);
		enum_decl := declaration.(*Enum);
		if ends_with(enum_decl.name, "FLAGS") {
			// print("SETTING FLAGS FOR %\n", declaration.name);
			enum_decl.flags |= .IS_ENUM_FLAGS;
			enum_decl.flags |= .VALUES_IN_HEX;
		}

		// print("set flags: %\n", enum_decl.flags);
	}

	return .STOP;
}


generate_bindings :: () -> bool {
    output_filename: string;
    opts: Generate_Bindings_Options;
    {
        using opts;

        #if OS == .WINDOWS {
            output_filename          = "generated_windows.jai";
            strip_flags = 0;
	        array_add(*libpaths,       "msquic/artifacts/bin/windows");
	        array_add(*libnames,      "msquic");
			footer = WINDOWS_FOOTER;
        } else #if OS == .LINUX {
            output_filename          = "generated_linux.jai";
            strip_flags = 0;
	        array_add(*libpaths,       "linux");
        } else #if OS == .MACOS {
            output_filename          = "generated_macos.jai";
            strip_flags = 0;
	        array_add(*libpaths,       "msquic/artifacts/bin/macos/arm64_Debug_quictls");
	        array_add(*libnames,      "libmsquic");
			footer = MACOS_FOOTER;
        } else {
            assert(false);
        }

        // array_add(*libnames,      "msquic");
		// array_add(*include_paths, "msquic/src/inc");
        array_add(*source_files,  "msquic/src/inc/msquic.h");
        array_add(*extra_clang_arguments, "-x", "c++", "-DWIN32_LEAN_AND_MEAN");
        // array_add(*extra_clang_arguments, "-x", "c++");
		//array_add(*strip_prefixes, "QUIC", "MsQuic");
		generate_library_declarations = false;

		array_add(*generate_enums_from_macros_with_prefixes,
			"QUIC_STATUS" // does not actually work on windows
		);

		array_add(*system_types_to_include,
			"ADDRESS_FAMILY",
			"OVERLAPPED_ENTRY",
			"_OVERLAPPED_ENTRY",
			"SOCKADDR_INET",
			"_SOCKADDR_INET",
			"LPOVERLAPPED",
			"SOCKADDR_IN",
			"SOCKADDR_IN6",
			"_OVERLAPPED",
			"sockaddr_in",
			"sockaddr_in6",
			"IN_ADDR",
			"IN6_ADDR",
			"SCOPE_ID",
			"in_addr",
			"in6_addr",
			"PVOID",
			"SOCKADDR_IN6_LH",
			"addrinfo",
			"in_addr_t",
			"in_port_t",
			"kevent",
			"sa_family_t",
			"sockaddr",
			"socklen_t",
		);

        // strip_flags &= ~(Strip_Flags.CONSTRUCTORS | .DESTRUCTORS);
        strip_flags |= .INLINED_FUNCTIONS;

		visitor = declaration_visitor;
    }

    return generate_bindings(opts, output_filename);
}

main :: () {
	generate_bindings();
}

#run main();

WINDOWS_FOOTER :: #string END

msquic :: #library "windows/msquic";

#import "Windows";

END


MACOS_FOOTER :: #string END

libmsquic :: #library "macos/arm64/libmsquic";

#import "POSIX";

END

#import "Basic";
#import "Bindings_Generator";
#import "Compiler";
#import "String";
