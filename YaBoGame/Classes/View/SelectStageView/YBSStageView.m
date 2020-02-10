#import "YBSStageView.h"
#import "UIView+YBSImage.h"
#import "YBSStage.h"
#import "YBSStageInfo.h"
#import "YBSStageInfoManager.h"
@interface YBSStageView ()
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UIView *coverView;
@property (weak, nonatomic) IBOutlet UIImageView *edgeImageView;
@property (weak, nonatomic) IBOutlet UIImageView *rankShadowView;
@property (weak, nonatomic) IBOutlet UIButton *numButton;
@property (weak, nonatomic) IBOutlet UIImageView *rankImageView;
@property (weak, nonatomic) IBOutlet UIImageView *stageNewImageView;
@property (weak, nonatomic) IBOutlet UIView *lockView;
@end
@implementation YBSStageView
+ (instancetype)stageViewWithStage:(YBSStage *)stage frame:(CGRect)frame {
    YBSStageView *stageView = [YBSStageView viewFromNib];
    stageView.frame = frame;
    stageView.stage = stage;
    return stageView;
}
- (void)awakeFromNib {
    self.clipsToBounds = NO;
    self.userInteractionEnabled = NO;
    self.numButton.userInteractionEnabled = NO;
    self.stageNewImageView.hidden = YES;
    UIImage *image1 = [UIImage imageNamed:@"select_stage_s01.png"];
    UIImage *image2 = [UIImage imageNamed:@"select_stage_s02.png"];
    UIImage *image3 = [UIImage imageNamed:@"select_stage_s03.png"];
    self.edgeImageView.animationImages = @[image1, image2, image3];
    self.edgeImageView.animationDuration = 0.3;
}
- (void)setStage:(YBSStage *)stage {
    _stage = stage;
    self.backgroundImageView.image = [UIImage imageNamed:stage.icon];
    [self.numButton setTitle:[NSString stringWithFormat:@"%d", stage.num] forState:UIControlStateNormal];
    [self updateStageViewInfo];
}
- (void)updateStageViewInfo {
    if (self.stage.userInfo) {
        if (!self.stage.userInfo.isUnlock) {
            [self startUnLockAnmiation];
        } else {
            [self setStageViewInfo];
        }
    } else {
        self.stageNewImageView.hidden = YES;
        self.rankShadowView.hidden = YES;
        self.rankImageView.hidden = YES;
    }
}
- (void)startUnLockAnmiation {
    [[WNXSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundUnlock];
    CAAnimationGroup *group = [self shakeAndScaleAnimation];
    group.delegate = self;
    [self.layer addAnimation:group forKey:nil];
    self.stage.userInfo.unlock = YES;
    [[YBSStageInfoManager sharedStageInfoManager] saveStageInfo:self.stage.userInfo];
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.rankImageView.hidden = YES;
    self.rankShadowView.hidden = YES;
    [self.coverView removeFromSuperview];
    [[WNXSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundNewShow];
    [UIView animateWithDuration:CGRectGetMaxY(self.frame) / 3000 animations:^{
        self.lockView.transform = CGAffineTransformMakeTranslation(0, ScreenHeight - CGRectGetMaxY(self.frame) + 100);
    } completion:^(BOOL finished) {
        [self.lockView removeFromSuperview];
        self.edgeImageView.image = [UIImage imageNamed:@"select_stage_new"];
        self.stageNewImageView.hidden = NO;
        self.userInteractionEnabled = YES;
        CAAnimationGroup *grounp = [self shakeAndScaleAnimation];
        [self.stageNewImageView.layer addAnimation:grounp forKey:nil];
    }];
}
- (CAAnimationGroup *)shakeAndScaleAnimation {
    CAKeyframeAnimation *shake = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    CGFloat angle = M_PI_4/2;
    shake.values = @[ @(-angle), @(angle), @(-angle), @(angle), @(-angle), @(angle), @(-angle), @0];
    CAKeyframeAnimation *scale = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
    scale.values = @[@1.2, @1];
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.duration = 0.3;
    group.animations = @[shake, scale];
    return group;
}
- (void)setStageViewInfo {
    [self.coverView removeFromSuperview];
    [self.lockView removeFromSuperview];
    self.userInteractionEnabled = YES;
    if (self.stage.userInfo.rank && ![@"s" isEqualToString:self.stage.userInfo.rank]) {
        [self hasRank];
    } else if ([@"s" isEqualToString:self.stage.userInfo.rank]) {
        [self hasRank];
        [self.edgeImageView startAnimating];
    } else if (!self.stage.userInfo.rank) {
        self.edgeImageView.image = [UIImage imageNamed:@"select_stage_new"];
        self.stageNewImageView.hidden = NO;
        self.rankImageView.hidden = YES;
        self.rankShadowView.hidden = YES;
    }
}
- (void)hasRank {
    [self.stageNewImageView removeFromSuperview];
    self.rankImageView.hidden = NO;
    self.rankShadowView.hidden = NO;
    self.rankImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"select_stage_%@", self.stage.userInfo.rank]];
    self.edgeImageView.image = [UIImage imageNamed:@"select_stage_normal"];
}
@end
