#import <UIKit/UIKit.h>
@interface YBSStage24View : UIView
@property (nonatomic, copy) void (^startCountTime)(BOOL isFrist);
@property (nonatomic, copy) void (^finish)();
@property (nonatomic, copy) void (^fail)();
- (void)startAppearCockroach;
- (void)showNextVovkroach;
- (BOOL)hitCockroachWithIndex:(NSInteger)index;
- (void)removeFromSuperview;
@end
