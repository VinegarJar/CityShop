#import <UIKit/UIKit.h>
@interface OtherwiseForemostDoseView : UIView
@property (nonatomic, copy) void(^failBlock)();
@property (nonatomic, copy) void(^successBlock)(int iceCount);
@property (nonatomic, copy) void(^passBlock)();
@property (nonatomic, assign) BOOL isPass;
- (void)directTowardBadminton;
- (void)sinInsideFerry:(NSInteger)index;
@end


