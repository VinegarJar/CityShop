#import "YBSStage14DogView.h"
@interface YBSStage14DogView ()
{
    CGAffineTransform _boneTrans;
}
@property (weak, nonatomic) IBOutlet UIView *boneView;
@property (weak, nonatomic) IBOutlet UIImageView *rightEye;
@property (weak, nonatomic) IBOutlet UIImageView *leftEye;
@property (nonatomic, assign) float angle;
@end
@implementation YBSStage14DogView
- (void)awakeFromNib {
    self.boneView.clipsToBounds = NO;
    self.boneView.layer.anchorPoint = CGPointMake(0.5, .8);
    self.boneView.hidden = YES;
    _boneTrans = CGAffineTransformMakeScale(1, 1);
}
- (float)rotationToLeftWithSpeed:(float)speed {
    self.boneView.transform = CGAffineTransformRotate(_boneTrans, -(M_PI_4 / (100 * (1 - speed))));
    _boneTrans = self.boneView.transform;
    self.angle = _boneTrans.c;
    return _boneTrans.c;
}
- (float)rotationToRightWithSpeed:(float)speed {
    self.boneView.transform = CGAffineTransformRotate(_boneTrans, (M_PI_4 / (100 * (1 - speed))));
    _boneTrans = self.boneView.transform;
    self.angle = _boneTrans.c;
    return _boneTrans.c;
}
- (float)shakeToRithgWithOffset:(CGFloat)offset {
    self.boneView.transform = CGAffineTransformRotate(_boneTrans, (M_PI_4 * offset) / 10);
    _boneTrans = self.boneView.transform;
    self.angle = _boneTrans.c;
    return _boneTrans.c;
}
- (float)shakeToLeftWithOffset:(CGFloat)offset {
    self.boneView.transform = CGAffineTransformRotate(_boneTrans, (M_PI_4 * offset) / 10);
    _boneTrans = self.boneView.transform;
    self.angle = _boneTrans.c;
    return _boneTrans.c;
}
- (void)showBoneViewWithAnimationFinish:(void (^)())finish {
    self.boneView.frame = CGRectMake(self.boneView.frame.origin.x, self.boneView.frame.origin.y - 500, self.boneView.frame.size.width, self.boneView.frame.size.height);
    self.boneView.hidden = NO;
    [[WNXSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundDogbarkOnceName];
    [UIView animateWithDuration:0.2 animations:^{
        self.boneView.frame = CGRectMake(self.boneView.frame.origin.x, self.boneView.frame.origin.y + 500, self.boneView.frame.size.width, self.boneView.frame.size.height);
    } completion:^(BOOL finished) {
        if (finish) {
            finish();
        }
    }];
}
- (void)startDropBoneDirectionIsRight:(BOOL)isRight finish:(void (^)())finish {
    [UIView animateWithDuration:0.5 animations:^{
        if (isRight) {
            self.boneView.transform = CGAffineTransformRotate(_boneTrans, -0.9);
        } else {
            self.boneView.transform = CGAffineTransformRotate(_boneTrans, 0.9);
        }
    } completion:^(BOOL finished) {
        finish();
    }];
}
- (void)setAngle:(float)angle {
    _angle = angle;
    if (angle <= 0.1 && angle >= -0.1 ) {
        return;
    }
    if (angle < -0.1) {
        self.rightEye.transform = CGAffineTransformMakeTranslation(25 * -angle, 10 * -angle);
        self.leftEye.transform = CGAffineTransformMakeTranslation(10 * -angle, 10 * -angle);
    } else if (angle > 0.1) {
        self.leftEye.transform = CGAffineTransformMakeTranslation(25 * -angle, 10 * angle);
        self.rightEye.transform = CGAffineTransformMakeTranslation(10 * -angle, 10 * angle);
    }
}
- (void)resumeData {
     _boneTrans = CGAffineTransformMakeScale(1, 1);
    self.boneView.transform = CGAffineTransformIdentity;
    self.boneView.hidden = YES;
    self.leftEye.transform = CGAffineTransformIdentity;
    self.rightEye.transform = CGAffineTransformIdentity;
    self.angle = 0;
}
@end
