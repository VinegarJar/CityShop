#import <UIKit/UIKit.h>
#import "YBSStrokeLabel.h"
@interface YBSCountDownLabel : YBSStrokeLabel
- (instancetype)initWithFrame:(CGRect)frame startTime:(double)time textSize:(CGFloat)size;
- (void)startCountDownWithCompletion:(void (^)(void))completion;
- (void)pause;
- (void)continueWork;
- (void)clean;
- (void)setTextColor:(UIColor *)textColor borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth;;
@end
