#import <UIKit/UIKit.h>
@interface YBSTimeCountView : UIView
- (void)startAnimationWithCompletion:(void (^)(BOOL finished))completion;
- (void)startCalculateTime;
- (NSTimeInterval)stopCalculateTime;
- (NSTimeInterval)pasueTime;
- (void)pause;
- (void)resumed;
- (void)cleadData;
@end
