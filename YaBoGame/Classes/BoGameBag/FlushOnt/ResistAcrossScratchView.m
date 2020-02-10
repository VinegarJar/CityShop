#import "ResistAcrossScratchView.h"
@interface ResistAcrossScratchView ()
{
    int _s;
    int _ms;
}
@property (weak, nonatomic) IBOutlet UILabel *countDownLabel;
@property (nonatomic, strong) CADisplayLink *timer;
@end
@implementation ResistAcrossScratchView
- (void)awakeFromNib {
    [super awakeFromNib];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTowardBlankWeather) name:kNotificationNameGameViewControllerDelloc object:nil];
}
- (void)setTowardBlankWeather {
    [self.timer invalidate];
    self.timer = nil;
}
- (void)damageUtility {
    [self.timer invalidate];
    self.timer = nil;
    self.countDownLabel.text = @"0:00";
    self.countDownLabel.textColor = [UIColor greenColor];
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)thenInsufficientTransformer {
    self.countDownLabel.text = @"";
}
- (void)structureWhereGracefulAccident {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    self.countDownLabel.alpha = 1;
    self.countDownLabel.textColor = [UIColor greenColor];
    _s = arc4random_uniform(5) + 4;
    _ms = arc4random_uniform(60);
    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateTime)];
    [self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}
- (void)updateTime {
    _ms--;
    if (_ms < 0) {
        _ms = 60;
        _s--;
        if (_s < 0) {
            _s = 0;
            _ms = 0;
            [self.timer invalidate];
            self.timer = nil;
            [self showTwinkleAnimation];
        }
    }
    if (_s == 0) {
        self.countDownLabel.textColor = [UIColor redColor];
    }
    NSString *format;
    if (_ms >= 10) {
        format = @"%d:%d";
    } else {
        format = @"%d:%02d";
    }
    self.countDownLabel.text = [NSString stringWithFormat:format, _s, _ms];
}
- (void)showTwinkleAnimation {
    self.timeOver();
    [UIView animateWithDuration:0.1 animations:^{
        self.countDownLabel.alpha = 0;
    } completion:^(BOOL finished) {
        [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:kSountAlertName];
        [UIView animateWithDuration:0.1 animations:^{
            self.countDownLabel.alpha = 1;
        } completion:^(BOOL finished) {
            [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:kSountAlertName];
            [UIView animateWithDuration:0.1 animations:^{
                self.countDownLabel.alpha = 0;
            } completion:^(BOOL finished) {
                [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:kSountAlertName];
                [UIView animateWithDuration:0.1 animations:^{
                    self.countDownLabel.alpha = 1;
                } completion:^(BOOL finished) {
                    self.hidden = YES;
                    [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:kSountAlertName];
                }];
            }];
        }];
    }];
}
- (NSTimeInterval)stopCountDown {
    [self.timer invalidate];
    self.timer = nil;
    return (_s + _ms / 100.0);
}
- (void)decayAgainstScholar {
    self.timer.paused = YES;
}
- (void)shampooEqualMotivation {
    self.timer.paused = NO;
}
@end


