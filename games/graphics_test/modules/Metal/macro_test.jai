#load "macros.jai";
DEBUG_PRINT_FROM_MACRO :: true;
DEBUG_PRINT_GENERATED_CODE :: true;

//MyStruct :: struct {
//    my_selector :: #insert #run METHOD("my_selector", #type () -> int);
//    second_selector :: () -> int { return 12; }
//}
//third_selector :: #insert #run METHOD(*MyStruct, "third_selector:", #type (x: int) -> int);

MyClass :: struct {
    baz :: () -> () { print("baz"); }
}
#insert #run METHOD(*MyClass, "doFoo:", #type (x: int, y: int) -> *u64);
#insert #run PROP(*MyClass, "bar", *void);

main :: () {
    //#run {
    //    print("type_info: %\n", type_info(type_of(MyStruct.my_selector)).*);
    //    print("type_info: %\n", type_info(type_of(MyStruct.second_selector)).*);
    //    print("type_info: %\n", type_info(type_of(third_selector)).*);
    //}

    //MyStruct.my_selector(null);
    mc : MyClass;
    doFoo(*mc, 12, 14);
    bar(*mc);
    setBar(*mc, null);
}

__macro_generated_selectors_st :: struct {
    doFoo_ : *void = ---;
    bar : *void = ---;
    setBar_ : *void = ---;
    baz_ : *void = ---;
}

__macro_generated_selectors : __macro_generated_selectors_st;
