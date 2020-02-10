#import <UIKit/UIKit.h>
@interface YBSReadyGoView : UIView
+ (void)showReadyGoViewWithSuperView:(UIView *)superView completion:(void (^)(void))completion;
@end
