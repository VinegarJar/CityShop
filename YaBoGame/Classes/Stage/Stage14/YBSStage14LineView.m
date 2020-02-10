#import "YBSStage14LineView.h"
#import <CoreMotion/CoreMotion.h>
@interface YBSStage14LineView ()
@property (weak, nonatomic) IBOutlet UIImageView *lineIV;
@property (weak, nonatomic) IBOutlet UIImageView *phoneIV;
@property (weak, nonatomic) IBOutlet UIImageView *dangerIV;
@property (weak, nonatomic) IBOutlet UIImageView *rightArrow;
@property (weak, nonatomic) IBOutlet UIImageView *leftArrow;
@property (weak, nonatomic) CMMotionManager *motionManager;
@property (nonatomic, copy) void (^shakeFinsh)();
@end
@implementation YBSStage14LineView
- (void)awakeFromNib {
    self.lineIV.layer.borderWidth = 1.5;
    self.lineIV.layer.borderColor = [UIColor whiteColor].CGColor;
    self.backgroundColor = [UIColor clearColor];
    self.arrowIV.hidden = YES;
    self.dangerIV.hidden = YES;
    [self resumeData];
}
- (void)startShakePhoneAnimationWithFinish:(void (^)())finish {
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    anim.values = @[@0, @(M_PI_4 / 3), @0, @(-M_PI_4 / 3), @0];
    anim.repeatCount = 3;
    anim.duration = 0.35;
    anim.delegate = self;
    [self.phoneIV.layer addAnimation:anim forKey:@"phoneAnimation"];
    self.shakeFinsh = finish;
}
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.phoneIV.hidden = YES;
    self.leftArrow.hidden = YES;
    self.rightArrow.hidden = YES;
    if (self.shakeFinsh) {
        self.shakeFinsh();
    }
}
- (void)arrowPromptWithAngle:(float)angle {
    self.arrowIV.transform = CGAffineTransformMakeTranslation(-120 * angle, 0);
    self.dangerIV.transform = CGAffineTransformMakeTranslation(-140 * angle, 0);
    if (angle > 0.5 || angle < -0.5) {
        self.dangerIV.hidden = NO;
    } else {
        self.dangerIV.hidden = YES;
    }
}
- (void)resumeData {
    self.arrowIV.hidden = YES;
    self.dangerIV.hidden = YES;
    self.phoneIV.hidden = NO;
    self.leftArrow.hidden = NO;
    self.rightArrow.hidden = NO;
    self.arrowIV.transform = CGAffineTransformIdentity;
    self.dangerIV.transform = CGAffineTransformIdentity;
}
@end
