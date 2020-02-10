#import <UIKit/UIKit.h>
@interface YBSDiceView : UIView
@property (nonatomic, copy) void (^shakeDiceFinish)();
- (void)startShakeDiceWithFirstDiceNumber:(int)number1 secoundDiceNumber:(int)number2 thridDiceNumber:(int)number3 shakeDuration:(NSInteger)duration;
- (void)pause;
- (void)resume;
- (void)removeData;
@end
