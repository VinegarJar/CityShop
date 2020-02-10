#import "GrieveUnderneathHillView.h"
#import "ImpressBoyhoodDeafView.h"
@interface GrieveUnderneathHillView ()
{
    CGFloat _speed;
    int _count;
}
@property (nonatomic, strong) CADisplayLink *timer;
@property (nonatomic, weak) ImpressBoyhoodDeafView *currentL;
@property (nonatomic, weak) ImpressBoyhoodDeafView *currentR;
@property (nonatomic, weak) ImpressBoyhoodDeafView *lastL;
@property (nonatomic, weak) ImpressBoyhoodDeafView *lastR;
@end
@implementation GrieveUnderneathHillView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTowardBlankWeather) name:kNotificationNameGameViewControllerDelloc object:nil];
        _speed = 2;
        _count = 0;
    }
    return self;
}
- (void)setTowardBlankWeather {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
}
- (void)dealloc {
    [self setTowardBlankWeather];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (int)dischargeCarefullySaltyCliff {
    int maxTag = arc4random_uniform(2) + 1;
    _speed += 2;
    if (_speed > 20) {
        _speed = 20;
    }
    _count++;
    int leftDen;
    int leftNum;
    int rightDen;
    int rightNum;
    self.lastL = self.currentL;
    self.lastR = self.currentR;
    if (maxTag == 1) {
        leftDen = arc4random_uniform(8) + 1;
        leftNum = arc4random_uniform(7) + 3;
        rightDen = arc4random_uniform(8) + 1;
        rightNum = arc4random_uniform(7) + 3;
        while (leftDen <= leftNum || rightDen <= rightNum || (leftNum / 1.0 / leftDen) <= (rightNum / 1.0 / rightDen)) {
            leftDen = arc4random_uniform(8) + 1;
            leftNum = arc4random_uniform(7) + 3;
            rightDen = arc4random_uniform(8) + 1;
            rightNum = arc4random_uniform(7) + 3;
        }
    } else {
        leftDen = arc4random_uniform(8) + 1;
        leftNum = arc4random_uniform(7) + 3;
        rightDen = arc4random_uniform(8) + 1;
        rightNum = arc4random_uniform(7) + 3;
        while (leftDen <= leftNum || rightDen <= rightNum || (leftNum / 1.0 / leftDen) >= (rightNum / 1.0 / rightDen)) {
            leftDen = arc4random_uniform(8) + 1;
            leftNum = arc4random_uniform(7) + 3;
            rightDen = arc4random_uniform(8) + 1;
            rightNum = arc4random_uniform(7) + 3;
        }
    }
    ImpressBoyhoodDeafView *leftFractView = [[ImpressBoyhoodDeafView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth / 2, ScreenHeight - ScreenWidth / 3) Denominator:leftDen numerator:leftNum];
    [self addSubview:leftFractView];
    leftFractView.transform = CGAffineTransformMakeTranslation(0, 300);
    self.currentL = leftFractView;
    ImpressBoyhoodDeafView *rightFractView = [[ImpressBoyhoodDeafView alloc] initWithFrame:CGRectMake(ScreenWidth / 2, 0, ScreenWidth / 2, ScreenHeight - ScreenWidth / 3) Denominator:rightDen numerator:rightNum];
    rightFractView.transform = CGAffineTransformMakeTranslation(0, -300);
    [self addSubview:rightFractView];
    self.currentR = rightFractView;
    [[YaBoOrgyTool sharedSoundToolManager] patWorthyLiberty:YaSoundWriteName];
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateTime)];
    [self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    return maxTag;
}
- (void)updateTime {
    self.currentL.transform = CGAffineTransformTranslate(self.currentL.transform, 0, -_speed);
    self.currentR.transform = CGAffineTransformTranslate(self.currentR.transform, 0, _speed);
    self.lastL.transform = CGAffineTransformTranslate(self.lastL.transform, 0, -_speed);
    self.lastR.transform = CGAffineTransformTranslate(self.lastR.transform, 0, _speed);
    if (self.currentL.transform.ty <= 0) {
        [self.timer invalidate];
        if (self.showNumberAnimationFinish) {
            self.showNumberAnimationFinish();
        }
        self.currentL.transform = CGAffineTransformIdentity;
        self.currentR.transform = CGAffineTransformIdentity;
        [self.lastR removeFromSuperview];
        [self.lastL removeFromSuperview];
        self.timer = nil;
    }
}
- (void)pause {
    if (self.timer) {
        self.timer.paused = YES;
    }
}
- (void)resume {
    if (self.timer) {
        self.timer.paused = NO;
    }
}
- (void)skiFromReply {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.showNumberAnimationFinish = nil;
    [self removeFromSuperview];
}
@end


