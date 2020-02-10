#import "InterpretProductiveRosebudController.h"
#import "TugOddView.h"
#import "NearbyVaseView.h"
typedef NS_ENUM(NSInteger, WNXStatusResultType) {
    WNXStatusResultTypeInsanelyFast = 0,
    WNXStatusResultTypeVeryFast,
    WNXStatusResultTypeFast
};
@interface InterpretProductiveRosebudController ()
{
    BOOL _isCountTime;
}
@property (nonatomic, strong) UIImageView *bottomStatusView;
@property (nonatomic, strong) TugOddView *peopleView;
@property (nonatomic, assign) int allScore;
@property (nonatomic, strong) UIImageView        *winImageView;
@property (nonatomic, strong) UIImageView        *resultImageView;
@property (nonatomic, strong) EmbarrassHoarseEndurance     *resultLabel;
@property (nonatomic, assign) BOOL playAgain;
@property (nonatomic, assign) int count;
@end
@implementation InterpretProductiveRosebudController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
   
    [self  resignAboveDrought:[UIImage imageNamed:@"24_fart-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    [self buildBottomView];
    [self buildPeopleView];
    [self flareHeatingHorizontal:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self buildResultLabel];
}
- (void)buildResultLabel {
    self.resultImageView = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth - 200) * 0.5 - 50, ScreenHeight - ScreenWidth / 3 - 150, 200, 100)];
    self.resultImageView.hidden = YES;
    self.resultImageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.resultImageView];
    self.resultLabel = [[EmbarrassHoarseEndurance alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.resultImageView.frame) - 30, 0, 100, 60)];
    self.resultLabel.center = CGPointMake(self.resultLabel.center.x, self.resultImageView.center.y);
    self.resultLabel.textAlignment = NSTextAlignmentCenter;
    self.resultLabel.font = [UIFont boldSystemFontOfSize:50];
    self.resultLabel.textColor = [UIColor colorWithRed:228 / 255.0 green:120 / 255.0 blue:11 / 255.0 alpha:1];
    [self.resultLabel possessKnife:5];
    self.resultLabel.hidden = YES;
    [self.view addSubview:self.resultLabel];
}
- (void)buildBottomView {
    self.bottomStatusView = [[UIImageView alloc] initWithFrame:CGRectMake(0, ScreenHeight - ScreenWidth / 3, ScreenWidth, ScreenWidth / 3)];
    self.bottomStatusView.image = [UIImage imageNamed:@"24_watch-iphone4"];
    self.bottomStatusView.hidden = YES;
    [self.view addSubview:self.bottomStatusView];
}
- (void)buildPeopleView {
    self.peopleView = [[TugOddView alloc] init];
    [self.view insertSubview:self.peopleView belowSubview:self.redButton];
    self.peopleView.redIV = self.redImageView;
    self.peopleView.yellowIV = self.yellowImageView;
    self.peopleView.blueIV = self.blueImageView;
    [self lookIntoWeekend];
    __weak typeof(self) weakSelf = self;
    self.peopleView.fartFinish = ^{
        weakSelf.playAgain = NO;
        weakSelf.bottomStatusView.image = [UIImage imageNamed:@"24_yourturn-iphone4"];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            weakSelf.bottomStatusView.hidden = YES;
            [weakSelf repentLover:YES];
        });
    };
    self.peopleView.sucess = ^{
        [weakSelf repentLover:NO];
        [(NearbyVaseView *)weakSelf.countScore accountOnLevelTragedy:^(int second, int ms) {
            int onceTime = (second * 1000 + ms / 60.0 * 1000) / weakSelf.peopleView.count;
            WNXStatusResultType type;
            if (onceTime < 300) {
                type = WNXStatusResultTypeInsanelyFast;
            } else if (onceTime < 500) {
                type = WNXStatusResultTypeVeryFast;
            } else {
                type = WNXStatusResultTypeFast;
            }
            [weakSelf showResultWithType:type];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                if (weakSelf.count == 12) {
                    [weakSelf transformMatureLifeboat:weakSelf.allScore unit:@"PTS" stage:weakSelf.stage isAddScore:YES];
                } else {
                    weakSelf.resultLabel.hidden = YES;
                    weakSelf.resultImageView.hidden = YES;
                    [(NearbyVaseView *)weakSelf.countScore exclaimDespiteSuitableDeal];
                    _isCountTime = NO;
                    weakSelf.bottomStatusView.hidden = NO;
                    weakSelf.bottomStatusView.image = [UIImage imageNamed:@"24_watch-iphone4"];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        if (!weakSelf.playAgain) {
                            [weakSelf.peopleView wentTenseLift];
                            weakSelf.count++;
                        }
                    });
                }
            });
        }];
    };
}
- (void)showResultWithType:(WNXStatusResultType)type {
    if (type == WNXStatusResultTypeInsanelyFast) {
        self.resultImageView.image = [UIImage imageNamed:@"09_fraction01-iphone4"];
        self.resultLabel.text = @"+6";
        self.allScore += 6;
    } else if (type == WNXStatusResultTypeVeryFast) {
        self.resultImageView.image = [UIImage imageNamed:@"09_fraction02-iphone4"];
        self.resultLabel.text = @"+3";
        self.allScore += 3;
    } else {
        self.resultImageView.image = [UIImage imageNamed:@"09_fraction03-iphone4"];
        self.resultLabel.text = @"+1";
        self.allScore += 1;
    }
    self.resultLabel.hidden = NO;
    self.resultImageView.hidden = NO;
}
- (void)showBadView {
    UIImageView *xIV = [[UIImageView alloc] initWithFrame:CGRectMake(kCountStartX(180), 200, 180, 180)];
    xIV.image = [UIImage imageNamed:@"00_cross-iphone4"];
    [self.view addSubview:xIV];
    UIImageView *badIV = [[UIImageView alloc] initWithFrame:CGRectMake(kCountStartX(260) + 130, 0, 260, 142)];
    badIV.layer.anchorPoint = CGPointMake(1, 0.5);
    badIV.center = CGPointMake(badIV.center.x, xIV.center.y);
    badIV.image = [UIImage imageNamed:@"00_bad-iphone4"];
    [self.view addSubview:badIV];
    NSString *badName = [NSString stringWithFormat:@"instantFail0%d.mp3", arc4random_uniform(3) + 2];
    [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:badName];
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        badIV.transform = CGAffineTransformMakeRotation(-M_PI_4);
    } completion:^(BOOL finished) {
        [self transformMatureLifeboat:self.allScore unit:@"PTS" stage:self.stage isAddScore:YES];
    }];
}
#pragma mark - Action
- (void)btnClick:(UIButton *)sender {
    if (!_isCountTime) {
        _isCountTime = YES;
        [(NearbyVaseView *)self.countScore howeverInjusticeSaddle];
    }
    if (![self.peopleView besidesSpritualInsurance:(int)sender.tag]) {
        self.view.userInteractionEnabled = NO;
        [(NearbyVaseView *)self.countScore accountOnLevelTragedy:nil];
        [self showBadView];
    }
}
#pragma mark - Super Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    self.count = 0;
     self.allScore = 0;
    [self repentLover:NO];
    self.bottomStatusView.hidden = NO;
    self.bottomStatusView.image = [UIImage imageNamed:@"24_watch-iphone4"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.peopleView wentTenseLift];
        self.count++;
    });
}
- (void)terriblePoetry {
    [(NearbyVaseView *)self.countScore pause];
    [super terriblePoetry];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [(NearbyVaseView *)self.countScore withdrawExceptRoughElection];
}
- (void)stitchScheduleOdourless {
    self.bottomStatusView.hidden = YES;
    [(NearbyVaseView *)self.countScore exclaimDespiteSuitableDeal];
    self.resultLabel.hidden = YES;
    self.resultImageView.hidden = YES;
    self.playAgain = YES;
    [self.peopleView skiFromReply];
    self.peopleView = nil;
    [self buildPeopleView];
    [super stitchScheduleOdourless];
}
@end


