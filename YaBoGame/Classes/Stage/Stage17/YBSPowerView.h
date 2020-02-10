#import <UIKit/UIKit.h>
@interface YBSPowerView : UIView
@property (nonatomic, copy) void(^failBlock)();
- (void)startWithCount:(int)count;
- (int)stopCount;
- (void)pause;
- (void)resume;
- (void)resumeData;
@end
