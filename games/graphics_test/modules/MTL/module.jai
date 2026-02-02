/* Module code for MTL */

#module_parameters(MTL_GENERATE := false);

#if MTL_GENERATE {
    #run print("Module[MTL]: generating MTL bindings and inserting...\n");
    #load "generate.jai";
    #insert #run generate();
} else {
    #run print("Module[MTL]: loading cached MTL bindings \n");
    #load "MTL.jai";
}

#scope_file
#load "macros.jai";

#import "Basic";



/* 


load_these :: () -> string #compile_time {
    s : string;
    #if MTL_GENERATE {
        print("generating MTL.jai\n");
        s = "#load \"generate.jai\";\n #insert #run generate();";
    } else {
        print("loading cached MTL.jai\n");
        s = "#load \"MTL.jai\";";
    }
    return s;
}

#insert #run load_these();

*/
