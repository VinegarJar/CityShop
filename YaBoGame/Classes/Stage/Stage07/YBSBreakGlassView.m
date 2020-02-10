#import "YBSBreakGlassView.h"
@interface YBSBreakGlassView ()
@property (weak, nonatomic) IBOutlet UIImageView *bottomIV;
@property (weak, nonatomic) IBOutlet UIImageView *topIV;
@property (weak, nonatomic) IBOutlet UIImageView *lightIV;
@end
@implementation YBSBreakGlassView
- (void)showBreakGlass {
    [UIView animateWithDuration:0.5 animations:^{
        self.bottomIV.alpha = 0;
        self.topIV.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}
@end
