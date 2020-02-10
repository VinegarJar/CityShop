#import <UIKit/UIKit.h>
@interface TerminalMaskView : UIView
@property (nonatomic, copy) void (^startCountTime)(BOOL isFrist);
@property (nonatomic, copy) void (^finish)();
@property (nonatomic, copy) void (^fail)();
- (void)broodPassiveWait;
- (void)proceedWithStreet;
- (BOOL)juniorMass:(NSInteger)index;
- (void)removeFromSuperview;
@end


