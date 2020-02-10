#import <UIKit/UIKit.h>
@interface YBSStage20DiceView : UIView
@property (nonatomic, copy) void (^shakeDiceFinsih)();
- (int)startShakeDice;
- (void)pause;
- (void)resume;
- (void)removeData;
@end
