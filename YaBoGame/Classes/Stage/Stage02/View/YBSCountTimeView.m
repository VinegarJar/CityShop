#import "YBSCountTimeView.h"
#import "YBSStrokeLabel.h"
@interface YBSCountTimeView ()
{
    int _index;
    int _ms;
}
@property (weak, nonatomic) IBOutlet YBSStrokeLabel *countLabel;
@property (weak, nonatomic) IBOutlet YBSStrokeLabel *unitLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (nonatomic, strong) CADisplayLink *timer;
@property (nonatomic, assign) NSTimeInterval outTime;
@end
@implementation YBSCountTimeView
- (void)awakeFromNib {
    self.clipsToBounds = NO;
    [self.countLabel setTextStorkeWidth:3];
    [self.unitLabel setTextStorkeWidth:3];
    self.layer.anchorPoint = CGPointMake(0, 1);
    self.transform = CGAffineTransformMakeRotation(-M_PI_2);
    [self.backgroundImageView cleanSawtooth];
    UIFont *font1 = [UIFont fontWithName:@"TransformersMovie" size:90];
    UIFont *font2 = [UIFont fontWithName:@"TransformersMovie" size:40];
    if (font1 && font2) {
        self.countLabel.font = font1;
        self.unitLabel.font = font2;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeTimer) name:kNotificationNameGameViewControllerDelloc object:nil];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)startAnimationWithCompletion:(void (^)(BOOL))completion {
    [UIView animateWithDuration:0.4 animations:^{
        self.transform = CGAffineTransformMakeRotation(M_PI_4 / 8);
    } completion:^(BOOL finished) {
        if (completion) {
            completion(YES);
        }
    }];
}
- (void)startCalculateByTimeWithTimeOut:(void (^)())timeOutBlock outTime:(NSTimeInterval)outTime {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.outTime = outTime;
    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateTime:)];
    [self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    self.TimeOutBlock = timeOutBlock;
}
- (void)startCalculateTime {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    _ms = 0;
    _index = 0;
    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateTime1)];
    [self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}
- (void)updateTime:(CADisplayLink *)timer {
    _index++;
    if (_index == 60) {
        _index = 0;
        _ms++;
        if (_ms == _outTime && !self.notHasTimeOut) {
            [timer invalidate];
            [UIView animateWithDuration:0.2 animations:^{
                self.countLabel.transform = CGAffineTransformMakeScale(1.2, 1.2);
            } completion:^(BOOL finished) {
                [UIView animateWithDuration:0.1 animations:^{
                    self.countLabel.transform = CGAffineTransformIdentity;
                }];
            }];
            if (self.TimeOutBlock) {
                self.TimeOutBlock();
            }
        }
    }
    self.countLabel.text = [NSString stringWithFormat:@"%d%02d", _ms, _index];
}
- (void)updateTime1 {
    _index++;
    if (_index == 60) {
        _index = 0;
        _ms++;
    }
    self.countLabel.text = [NSString stringWithFormat:@"%d%02d", _ms, _index];
}
- (void)stopCalculateByTimeWithTimeBlock:(void (^)(int, int))timeBlock {
    [self.timer invalidate];
    self.timer = nil;
    if (timeBlock) {
        timeBlock(_ms, _index);
    }
    [UIView animateWithDuration:0.2 animations:^{
        self.countLabel.transform = CGAffineTransformMakeScale(1.2, 1.2);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.1 animations:^{
            self.countLabel.transform = CGAffineTransformIdentity;
        }];
    }];
}
- (void)pause {
    self.timer.paused = YES;
}
- (void)continueGame {
    self.timer.paused = NO;
}
- (void)cleanData {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    _index = 0;
    _ms = 0;
    self.countLabel.text = [NSString stringWithFormat:@"%d%02d", _ms, _index];
}
- (void)removeTimer {
    [self.timer invalidate];
    self.timer = nil;
}
@end
