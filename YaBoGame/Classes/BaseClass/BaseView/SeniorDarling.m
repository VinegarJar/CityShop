#import "SeniorDarling.h"
typedef void(^Completion)(void);
@interface SeniorDarling ()
{
    int _index;
    double _newTime;
}
@property (nonatomic, assign) double time;
@property (nonatomic, strong) CADisplayLink *timer;
@property (nonatomic, copy) Completion completion;
@end
@implementation SeniorDarling
- (instancetype)initWithFrame:(CGRect)frame startTime:(double)time textSize:(CGFloat)size {
    if (self = [super initWithFrame:frame]) {
        _time = time;
        _newTime = time;
        self.text = [NSString stringWithFormat:@"%.1f", time];
        UIFont *font = [UIFont fontWithName:@"TransformersMovie" size:size];
        if (font) {
            self.font = font;
        } else {
            self.font = [UIFont systemFontOfSize:size];
        }
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeTimer) name:kNotificationNameGameViewControllerDelloc object:nil];
    }
    return self;
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)setTowardBlankWeather {
    [self.timer invalidate];
    self.timer = nil;
}
- (void)accumulateGrossEnemy:(UIColor *)textColor borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth {
    self.textColor = textColor;
    [self possessKnife:borderWidth];
    [self persuadeAtSugar:borderColor];
}
- (void)damageUtility {
    [self.timer invalidate];
    self.timer = nil;
    self.time = _newTime;
    self.text = [NSString stringWithFormat:@"%.1f", _newTime];
}
- (void)refundSuperiorScratch:(void (^)(void))completion {
    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(countDown:)];
    [self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    self.completion = completion;
}
- (void)pause {
    self.timer.paused = YES;
}
- (void)directlyTotalSportsman {
    self.timer.paused = NO;
}
- (void)countDown:(CADisplayLink *)timer {
    _index++;
    if (_index == 6) {
        self.time -= 0.1;
        self.text = [NSString stringWithFormat:@"%.1f", self.time];
        _index = 0;
    }
    if (self.time <= 0) {
        [timer invalidate];
        self.text = @"0.0";
        timer = nil;
        if (self.completion) {
            self.completion();
        }
    }
}
@end


