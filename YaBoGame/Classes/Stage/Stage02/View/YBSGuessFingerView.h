#import <UIKit/UIKit.h>
@interface YBSGuessFingerView : UIView
@property (nonatomic, copy) void (^animationFinish)(int winIndex);
- (void)startAnimationWithDuration:(NSTimeInterval)duration;
- (void)showResultAnimationCompletion:(void (^)())completion;
- (void)cleanData;
@end
