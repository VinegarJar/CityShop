#import "YBSReadyGoView.h"
@interface YBSReadyGoView ()
@property (nonatomic, strong) UIImageView *readyView;
@property (nonatomic, strong) UIImage *readyImage;
@property (nonatomic, strong) UIImage *goImage;
@end
@implementation YBSReadyGoView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.readyView = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth - 250) * 0.5, 0, 250, 95)];
        self.readyImage = [UIImage imageNamed:@"ready"];
        self.goImage = [UIImage imageNamed:@"go"];
        self.readyView.image = self.readyImage;
        [self addSubview:self.readyView];
    }
    return self;
}
+ (void)showReadyGoViewWithSuperView:(UIView *)superView completion:(void (^)(void))completion {
    CGFloat startY = 200;
    if (!iPhone5) {
        startY = 150;
    }
    YBSReadyGoView *readyGoView = [[YBSReadyGoView alloc] initWithFrame:CGRectMake(ScreenWidth, startY, ScreenWidth, 95)];
    [superView addSubview:readyGoView];
    [superView bringSubviewToFront:readyGoView];
    [[WNXSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundReadyGoName];
    [UIView animateWithDuration:0.3 animations:^{
        readyGoView.frame = CGRectMake(0, startY, ScreenWidth, 95);
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            readyGoView.readyView.image = readyGoView.goImage;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.3 animations:^{
                    readyGoView.frame = CGRectMake(-ScreenWidth, startY, ScreenWidth, 95);
                } completion:^(BOOL finished) {
                    if (completion) {
                        completion();
                    }
                    [readyGoView removeFromSuperview];
                }];
            });
        });
    }];
}
@end
