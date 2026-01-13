#load "macros.jai";
DEBUG_PRINT_FROM_MACRO :: true;

MyStruct :: struct {
    my_selector :: #insert #run METHOD("my_selector", #type () -> int);
    second_selector :: () -> int { return 12; }
}

main :: () {
    #run {
        print("type_info: %\n", type_info(type_of(MyStruct.my_selector)).*);
        print("type_info: %\n", type_info(type_of(MyStruct.second_selector)).*);
    }

    MyStruct.my_selector(null);
}
