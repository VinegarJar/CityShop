#import "metamacros.h"
#define onExit \
    try {} @finally {} \
    __strong mtl_cleanupBlock_t metamacro_concat(mtl_exitBlock_, __LINE__) __attribute__((cleanup(mtl_executeCleanupBlock), unused)) = ^
#define weakify(...) \
    try {} @finally {} \
    metamacro_foreach_cxt(mtl_weakify_,, __weak, __VA_ARGS__)
#define unsafeify(...) \
    try {} @finally {} \
    metamacro_foreach_cxt(mtl_weakify_,, __unsafe_unretained, __VA_ARGS__)
#define strongify(...) \
    try {} @finally {} \
    _Pragma("clang diagnostic push") \
    _Pragma("clang diagnostic ignored \"-Wshadow\"") \
    metamacro_foreach(mtl_strongify_,, __VA_ARGS__) \
    _Pragma("clang diagnostic pop")
typedef void (^mtl_cleanupBlock_t)();
void mtl_executeCleanupBlock (__strong mtl_cleanupBlock_t *block);
#define mtl_weakify_(INDEX, CONTEXT, VAR) \
    CONTEXT __typeof__(VAR) metamacro_concat(VAR, _weak_) = (VAR);
#define mtl_strongify_(INDEX, VAR) \
    __strong __typeof__(VAR) VAR = metamacro_concat(VAR, _weak_);
#define tryBegin            @try{
#define tryEnd              }@catch (NSException *exception) { NSLog(@"***********CATCH ERROR************** Line:%d, **** Function:%s ***************************", __LINE__, __FUNCTION__); } @finally {}