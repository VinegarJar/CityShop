#import "BlessLiftView.h"
@interface BlessLiftView ()
@property (weak, nonatomic) IBOutlet UIImageView *redBgView;
@property (weak, nonatomic) IBOutlet UIImageView *shadowView;
@property (weak, nonatomic) IBOutlet UIImageView *peopleView;
@property (weak, nonatomic) IBOutlet UIImageView *outView;
@end
@implementation BlessLiftView
- (void)awakeFromNib {
    self.redBgView.transform = CGAffineTransformMakeTranslation(ScreenWidth, 0);
    self.shadowView.transform = CGAffineTransformMakeTranslation(ScreenWidth, 0);
    self.peopleView.transform = CGAffineTransformMakeTranslation(ScreenWidth, 0);
    self.outView.transform = CGAffineTransformMakeTranslation(ScreenWidth, 0);
}
- (void)billionFaculty:(void (^)())completion {
    [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:kSoundOutSpoonName];
    [UIView animateWithDuration:0.15 animations:^{
        self.redBgView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            self.peopleView.transform = CGAffineTransformIdentity;
            self.shadowView.transform = CGAffineTransformIdentity;
            self.outView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:kSoundOutName];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [UIView animateWithDuration:0.25 animations:^{
                    self.peopleView.transform = CGAffineTransformMakeTranslation(-ScreenWidth - 50, 0);
                    self.shadowView.transform = CGAffineTransformMakeTranslation(-ScreenWidth - 50, 0);
                    self.outView.transform = CGAffineTransformMakeTranslation(-ScreenWidth, 0);
                } completion:^(BOOL finished) {
                    completion();
                }];
            });
        }];
    }];
}
@end


