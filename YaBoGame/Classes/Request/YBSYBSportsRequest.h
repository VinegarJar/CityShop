#import "AFHTTPSessionManager.h"
#import "YBSportsRequest_Url.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^YBSportsCompletedBlock)(BOOL ret, id obj);
@interface YBSYBSportsRequest : AFHTTPSessionManager
+ (instancetype)sharedManager;
- (void)postWithPath:(NSString *)path dict:(NSDictionary*)dict completed:(YBSportsCompletedBlock)completed;
- (void)getWithPath:(NSString *)path dict:(NSDictionary*)dict completed:(YBSportsCompletedBlock)completed;
@end
NS_ASSUME_NONNULL_END
