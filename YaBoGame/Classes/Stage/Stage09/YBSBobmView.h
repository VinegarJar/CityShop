#import <UIKit/UIKit.h>
@interface YBSBobmView : UIView
@property (nonatomic, copy) void (^timeOver)();
- (void)startCountDown;
- (NSTimeInterval)stopCountDown;
- (void)pasueCountDown;
- (void)resumeCountDown;
- (void)clean;
- (void)cleanLabelStage;
@end
