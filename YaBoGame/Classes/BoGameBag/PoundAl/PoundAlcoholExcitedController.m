#import "PoundAlcoholExcitedController.h"
#import "GlitterBehindDespairView.h"
#import "NearbyVaseView.h"
@interface PoundAlcoholExcitedController ()
{
    int _maxIndex;
    int _timeCount;
    int _diceCount;
    BOOL _playAgain;
}
@property (nonatomic, strong) GlitterBehindDespairView *diceView;
@property (nonatomic, assign) NSInteger allScore;
@property (nonatomic, strong) CADisplayLink *timer;
@end
@implementation PoundAlcoholExcitedController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    [self  resignAboveDrought:[UIImage imageNamed:@"11_tick-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(25, 25, 25, 25)];
    [self flareHeatingHorizontal:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self injureNotSuddenLimitation];
    [self buildDiceView];
}
- (void)buildDiceView {
    self.diceView = [[GlitterBehindDespairView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.redButton.frame.size.height)];
    [self.view insertSubview:self.diceView belowSubview:self.redButton];
    [self lookIntoWeekend];
    __weak typeof(self) weakSelf = self;
    self.diceView.shakeDiceFinsih = ^{
        [weakSelf repentLover:YES];
        [(NearbyVaseView *)weakSelf.cplendour howeverInjusticeSaddle];
    };
    [self lookIntoWeekend];
}
#pragma mark - Action
- (void)btnClick:(UIButton *)sender {
    [self repentLover:NO];
    __block NSInteger onceTime;
    __weak typeof(self) weakSelf = self;
    [(NearbyVaseView *)self.cplendour accountOnLevelTragedy:^(int second, int ms) {
        onceTime = second * 1000 + ms / 60.0 * 1000;
        weakSelf.allScore += onceTime;
    }];
    UIView *twinkleView = [[UIView alloc] init];
    twinkleView.backgroundColor = [UIColor whiteColor];
    twinkleView.alpha = 0.7;
    if (sender.tag == 0) {
        twinkleView.frame = CGRectMake(0, 0, ScreenWidth / 3, ScreenHeight - ScreenWidth / 3);
        self.redImageView.highlighted = YES;
    } else if (sender.tag == 1) {
        twinkleView.frame = CGRectMake(ScreenWidth / 3, 0, ScreenWidth / 3, ScreenHeight - ScreenWidth / 3);
        self.yellowImageView.highlighted = YES;
    } else {
        twinkleView.frame = CGRectMake(ScreenWidth / 3 * 2, 0, ScreenWidth / 3, ScreenHeight - ScreenWidth / 3);
        self.blueImageView.highlighted = YES;
    }
    [self.view addSubview:twinkleView];
    [UIView animateWithDuration:0.25 animations:^{
        twinkleView.alpha = 0;
    } completion:^(BOOL finished) {
        [twinkleView removeFromSuperview];
        self.redImageView.highlighted = NO;
        self.yellowImageView.highlighted = NO;
        self.blueImageView.highlighted = NO;
    }];
    if (sender.tag != _maxIndex) {
        self.view.userInteractionEnabled = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refineFortunateEnvelope];
        });
    } else {
        WNXResultStateType resultType;
        if (onceTime < 400) {
            resultType = WNXResultStateTypePerfect;
        } else if (onceTime < 500) {
            resultType = WNXResultStateTypeGreat;
        } else if (onceTime < 600) {
            resultType = WNXResultStateTypeGood;
        } else {
            resultType = WNXResultStateTypeGood;
        }
        [self.stateView swingLikeInk:resultType stageViewHiddenFinishBlock:^{
            if (!_playAgain) {
                [weakSelf nextDice];
            }
        }];
    }
}
- (void)updateTime {
    _timeCount++;
    int interval = 40 - _diceCount * 5;
    if (interval < 10) {
        interval = 10;
    }
    if (_timeCount == interval) {
        [self.timer invalidate];
        self.timer = nil;
        _diceCount++;
        [(NearbyVaseView *)self.cplendour exclaimDespiteSuitableDeal];
        _maxIndex = [self.diceView flourishPastMultiplePhonetics];
    }
}
#pragma mark - Private Method
- (void)nextDice {
    if (self.timer) {
        [self.timer invalidate];
    }
    if (_diceCount == 12) {
        [self transformMatureLifeboat:self.allScore / 12 unit:@"ms" stage:self.stage isAddScore:YES];
    } else {
        _timeCount = 0;
        self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateTime)];
        [self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    }
}
#pragma mark - Super Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    [self repentLover:NO];
    _maxIndex = [self.diceView flourishPastMultiplePhonetics];
    _playAgain = NO;
}
- (void)terriblePoetry {
    if (self.timer) {
        self.timer.paused = YES;
    }
    [(NearbyVaseView *)self.cplendour pause];
    [self.diceView pause];
    [super terriblePoetry];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [(NearbyVaseView *)self.cplendour withdrawExceptRoughElection];
    if (self.timer) {
        self.timer.paused = NO;
    }
    [self.diceView resume];
}
- (void)stitchScheduleOdourless {
    if (self.timer) {
        [self.timer invalidate];
        self.timer = nil;
    }
    _playAgain = YES;
    self.allScore = 0;
    _maxIndex = -1;
    _timeCount = 0;
    _diceCount = 0;
    [self.diceView skiFromReply];
    [self.diceView removeFromSuperview];
    self.diceView = nil;
    [self buildDiceView];
    [self.stateView removeFromSuperview];
    self.stateView = nil;
    [super injureNotSuddenLimitation];
    [(NearbyVaseView *)self.cplendour exclaimDespiteSuitableDeal];
    [super stitchScheduleOdourless];
}
@end


