/* Kingdom Core: Build all */

// build this file to build demo games.

build_all :: () {
	set_build_options_dc(.{do_output = false});

    w := compiler_create_workspace("Overall");

	add_build_file("games/home/first.jai", w);
}

#run build_all();

#import "Compiler";
