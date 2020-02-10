#import "YBSPrepareScoreView.h"
#import "YBSStage.h"
#import "YBSStageInfo.h"
@interface YBSPrepareScoreView ()
@property (weak, nonatomic) IBOutlet UIImageView *arrowImageView;
@property (weak, nonatomic) IBOutlet UIImageView *scoreImageView;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@end
@implementation YBSPrepareScoreView
- (void)setStage:(YBSStage *)stage {
    _stage = stage;
    for (int i = 100; i < 106; i++) {
        UILabel *label = (UILabel *)[self viewWithTag:i];
        label.text = [NSString stringWithFormat:stage.format, stage.min + (label.tag - 100) * ((stage.max - stage.min) / 5)];
    }
    if (!self.stage.userInfo.rank) {
        [self.arrowImageView removeFromSuperview];
        [self.scoreImageView removeFromSuperview];
        for (int i = 100; i < 106; i++) {
            UILabel *label = (UILabel *)[self viewWithTag:i];
            [label removeFromSuperview];
        }
    } else {
        [self calculateArrowLocation];
    }
}
- (void)showScroeViewWithCompletion:(void (^)(void))completion {
    self.transform = CGAffineTransformMakeTranslation(0, 150);
    [UIView animateWithDuration:0.2 animations:^{
        self.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.05 animations:^{
           self.transform = CGAffineTransformMakeTranslation(0, 50);
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.15 animations:^{
                self.transform = CGAffineTransformIdentity;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1 animations:^{
                    self.transform = CGAffineTransformMakeTranslation(0, 30);
                } completion:^(BOOL finished) {
                    [UIView animateWithDuration:0.1 animations:^{
                        self.transform = CGAffineTransformIdentity;
                    } completion:^(BOOL finished) {
                        [self arrowTwinkleAnimationWithCompletion:completion];
                    }];
                }];
            }];
        }];
    }];
}
- (void)calculateArrowLocation {
    if ((_stage.max - _stage.min > 0 && _stage.userInfo.score > _stage.max) || (_stage.max - _stage.min < 0 && _stage.userInfo.score < _stage.max)) {
        _arrowImageView.transform = CGAffineTransformMakeTranslation(-300, 0);
        return;
    }
    if ((_stage.max - _stage.min > 0 && _stage.userInfo.score < _stage.min) || (_stage.max - _stage.max < 0 && _stage.userInfo.score > _stage.min)) {
        _arrowImageView.transform = CGAffineTransformIdentity;
        return;
    }
    CGFloat arrowX = _arrowImageView.frame.origin.x;
    CGFloat delta = _stage.userInfo.score - _stage.min;
    CGFloat everyScoreLength = (arrowX + (_arrowImageView.frame.size.width / 2) - _scoreImageView.frame.origin.x) / (((_stage.max - _stage.min) / 5) * 6);
    CGFloat moveX = delta * everyScoreLength;
    if (moveX >= 0) {
        moveX = -moveX;
    }
    _arrowImageView.transform = CGAffineTransformMakeTranslation(moveX, 0);
}
- (void)arrowTwinkleAnimationWithCompletion:(void (^)(void))completion {
    [UIView animateWithDuration:0.1 animations:^{
        self.arrowImageView.alpha = 0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.15 animations:^{
            self.arrowImageView.alpha = 1;
        } completion:^(BOOL finished) {
            [UIView animateWithDuration:0.1 animations:^{
                self.arrowImageView.alpha = 0;
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1 animations:^{
                    self.arrowImageView.alpha = 1;
                } completion:^(BOOL finished) {
                    if (completion) {
                        completion();
                    }
                }];
            }];
        }];
    }];
}
@end
