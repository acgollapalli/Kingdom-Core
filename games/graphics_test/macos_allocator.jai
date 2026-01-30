/* GPU Memory allocator for macos:
    This memory allocator always returns GPU memory addresses, except when allocating heaps.

    We MIGHT ship our own version of preload with modified allocator hints. But it'd screw up
    compiler updates, and I don't want deal with that. It'd definitely be a thing where we
    actually just want to ask in the discord on what the best way to do this is.
*/

#scope_export

allocator :: Allocator.{allocator_proc, null}

#scope_module

SizeClass :: using enum {
    BS_Small;
    BS_HalfK;
    BS_1K;
    BS_2K;
}

NUM_SIZE_CLASSES :: #run () -> s64 {
    enum_type_info := cast(*Type_Info_Enum, type_info(BlockSize));
    return enum_type_info.names.count;
}

Heap :: struct {
    mtl_heap : *MTL4Heap;
    heap_start_gpu : *void;
    heap_start_cpu : *void;
    start_offset : u64;
    free_lists : [NUM_SIZE_CLASSES]*void;
}

#import "Metal";
