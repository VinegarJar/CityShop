#import <UIKit/UIKit.h>
@interface YBSCockroachView : UIView
@property (nonatomic, copy) void (^startCountTime)();
@property (nonatomic, copy) void (^showHitFinish)();
@property (nonatomic, assign) BOOL failed;
- (void)shake;
- (void)stopShake;
- (void)cockroachRunWithFail:(void (^)())finish;
- (BOOL)hitCockroach;
- (void)stopMove;
- (void)removeData;
@end
