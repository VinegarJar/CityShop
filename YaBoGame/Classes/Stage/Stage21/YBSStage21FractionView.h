#import <UIKit/UIKit.h>
@interface YBSStage21FractionView : UIView
@property (nonatomic, copy) void (^showNumberAnimationFinish)();
- (int)showNumber;
- (void)pause;
- (void)resume;
- (void)removeData;
@end
