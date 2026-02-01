#scope_module
#load "generate.jai";
#load "macros.jai";

#import "Objective_C";
#import "macos";

#scope_export

    #insert #run generate();

NSFastEnumeration :: struct {};
task_id_token_t :: struct {};
NSNumber :: struct {};

// TODO: make it so the parser can read these or just implement them here
PackedFloat3 :: struct {}
PackedFloatQuaternion :: struct {}

init_mtl :: () {
    if __selectors.accelerationStructureCommandEncoder return;

    init_objective_c_selector_struct(*__selectors);

    assert(__selectors.supportsFamily_ != null);
}


__selectors: __generated_selectors;

MTLTimestamp :: u64;
MTLGPUAddress :: u64;

MTLCoordinate2D :: MTLSamplePosition;


// we can't handle these yet, but they're block items
MTLNewRenderPipelineStateWithReflectionCompletionHandler :: *void;
MTLSharedEventNotificationBlock :: *void;
MTLNewRenderPipelineStateCompletionHandler :: *void;
MTLNewLibraryCompletionHandler :: *void;
MTLNewDynamicLibraryCompletionHandler :: *void;
MTLNewComputePipelineStateWithReflectionCompletionHandler :: *void;
MTLNewComputePipelineStateCompletionHandler :: *void;
MTLIOCommandBufferHandler :: *void;
MTLDrawablePresentedHandler :: *void;
MTLCommandBufferHandler :: *void;
MTL4NewMachineLearningPipelineStateCompletionHandler :: *void;
MTL4NewBinaryFunctionCompletionHandler :: *void;
MTL4CommitFeedbackHandler :: *void;

MTLAutoreleasedComputePipelineReflection :: *MTLComputePipelineReflection;
MTLAutoreleasedRenderPipelineReflection :: *MTLRenderPipelineReflection;
MTLAutoreleasedArgument :: *MTLArgument;

// These are opaque
IOSurfaceRef :: *void;
CGColorSpaceRef :: *void;


// borrowed from the code that ships with the compiler
MTLCreateSystemDefaultDevice :: () -> id #foreign Metal;
MTLCopyAllDevices :: () -> *NSArray(id) #foreign Metal;
MTLDeviceNotificationName :: *NSString;
MTLDeviceWasAddedNotification: MTLDeviceNotificationName;
MTLDeviceRemovalRequestedNotification: MTLDeviceNotificationName;
MTLDeviceWasRemovedNotification: MTLDeviceNotificationName;
MTLRemoveDeviceObserver :: (observer: id) -> () #foreign Metal;
Metal :: #library,system,link_always "Metal";  // We were having some problems on Mac, so, try this...
