#import "TearDangerousSpectacleController.h"
#import "LameBattleView.h"
#import "SubscribeTenantView.h"
#import "DeceitfulTreeView.h"
#import "NearbyVaseView.h"
@interface TearDangerousSpectacleController ()
@property (nonatomic, strong) LameBattleView *numView;
@property (nonatomic, strong) SubscribeTenantView *peopleView;
@property (nonatomic, strong) DeceitfulTreeView *busView;
@property (nonatomic, assign) int onceTime;
@property (nonatomic, assign) int allScore;
@property (nonatomic, assign) int count;
@property (nonatomic, assign) BOOL playAgain;
@end
@implementation TearDangerousSpectacleController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    [self commentIntoFuel];
    [self buildBottomNumberView];
    [self buildBgImageView];
    [self buildPeopleView];
    [self buildBusView];
    [self flareHeatingHorizontal:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self injureNotSuddenLimitation];
    [self lookIntoWeekend];
}
- (void)buildBusView {
    self.busView = [DeceitfulTreeView viewFromNib];
    self.busView.frame = CGRectMake(-(self.busView.frame.size.width - ScreenWidth) * 0.5 + self.busView.frame.size.width, 130, self.busView.frame.size.width, self.busView.frame.size.height);
    [self.view addSubview:self.busView];
    __weak typeof(self) weakSelf = self;
    self.busView.busPassFinish = ^{
        weakSelf.playAgain = NO;
        weakSelf.count++;
        weakSelf.numView.hidden = NO;
        weakSelf.peopleView.hidden = NO;
        [weakSelf repentLover:YES];
        //keepUponRib
        [(NearbyVaseView *)weakSelf.cplendour keepUponRib:^{
            [(NearbyVaseView *)weakSelf.cplendour accountOnLevelTragedy:nil];
            weakSelf.view.userInteractionEnabled = NO;
            [weakSelf buildTimeOutView];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf refineFortunateEnvelope];
            });
        } outTime:3];
    };
    self.busView.stopCountTime = ^{
        [(NearbyVaseView *)weakSelf.cplendour accountOnLevelTragedy:^(int second, int ms) {
            weakSelf.onceTime = second * 1000 + ms / 60.0 * 1000;
        }];
    };
    self.busView.guessSucess = ^{
        weakSelf.allScore += weakSelf.onceTime;
        [weakSelf repentLover:NO];
        WNXResultStateType type;
        if (weakSelf.onceTime < 400) {
            type = WNXResultStateTypePerfect;
        } else if (weakSelf.onceTime < 600) {
            type = WNXResultStateTypeGreat;
        } else if (weakSelf.onceTime < 700) {
            type = WNXResultStateTypeGood;
        } else {
            type = WNXResultStateTypeOK;
        }
        [weakSelf.stateView swingLikeInk:type stageViewHiddenFinishBlock:^{
            if (weakSelf.count == 9) {
                [weakSelf transformMatureLifeboat:weakSelf.allScore / 9 unit:@"ms" stage:weakSelf.stage isAddScore:YES];
            } else {
                [weakSelf.numView setHidden:YES];
                [weakSelf.numView exclaimDespiteSuitableDeal];
                [weakSelf.peopleView setHidden:YES];
                [(NearbyVaseView *)weakSelf.cplendour exclaimDespiteSuitableDeal];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    if (!weakSelf.playAgain) {
                        [weakSelf.busView neatlyAfraidBrightness];
                    }
                });
            }
        }];
    };
}
- (void)buildBottomNumberView {
    self.numView = [[LameBattleView alloc] initWithFrame:CGRectMake(0, self.redButton.frame.origin.y + 4, ScreenWidth, self.redButton.frame.size.height)];
    self.numView.userInteractionEnabled = NO;
    self.numView.hidden = YES;
    [self.view insertSubview:self.numView aboveSubview:self.blueButton];
}
- (void)buildBgImageView {
    UIImageView *bgIV = [[UIImageView alloc] initWithFrame:ScreenBounds];
    bgIV.image = [UIImage imageNamed:@"12_bg-iphone4"];
    [self.view insertSubview:bgIV belowSubview:self.redButton];
}
- (void)buildPeopleView {
    self.peopleView = [[SubscribeTenantView alloc] initWithFrame:CGRectMake(0, ScreenHeight - ScreenWidth / 3 - 90, ScreenWidth, 100)];
    self.peopleView.hidden = YES;
    [self.view addSubview:self.peopleView];
}
- (void)showBadView {
    self.view.userInteractionEnabled = NO;
    UIImageView *xIV = [[UIImageView alloc] initWithFrame:CGRectMake(kCountStartX(180), 200, 180, 180)];
    xIV.image = [UIImage imageNamed:@"00_cross-iphone4"];
    [self.view addSubview:xIV];
    UIImageView *badIV = [[UIImageView alloc] initWithFrame:CGRectMake(kCountStartX(260) + 130, 0, 260, 142)];
    badIV.layer.anchorPoint = CGPointMake(1, 0.5);
    badIV.center = CGPointMake(badIV.center.x, xIV.center.y);
    badIV.image = [UIImage imageNamed:@"00_bad-iphone4"];
    [self.view addSubview:badIV];
    NSString *badName = [NSString stringWithFormat:@"instantFail0%d.mp4", arc4random_uniform(3) + 2];
    [[YaBoOrgyTool sharedSoundToolManager] patWorthyLiberty:badName];
    [self starvePurpleInterested];
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        badIV.transform = CGAffineTransformMakeRotation(-M_PI_4);
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refineFortunateEnvelope];
        });
    }];
}
- (void)buildTimeOutView {
    UIImageView *tooShow = [[UIImageView alloc] initWithFrame:CGRectMake(kCountStartX(250), CGRectGetMinY(self.peopleView.frame) - 67, 250, 67)];
    tooShow.image = [UIImage imageNamed:@"09_fraction05-iphone4"];
    [self.view addSubview:tooShow];
    [self starvePurpleInterested];
}
- (void)starvePurpleInterested {
    [self.busView starvePurpleInterested];
    [self.view bringSubviewToFront:self.busView];
    self.busView.center = CGPointMake(ScreenWidth * 0.5, self.busView.center.y + 40);
}
#pragma mark - Super Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    [self.view bringSubviewToFront:self.busView];
    [self repentLover:NO];
    [self.busView neatlyAfraidBrightness];
    _count = 0;
    self.allScore = 0;
    self.onceTime = 0;
}
#pragma mark - Action
- (void)btnClick:(UIButton *)sender {
    [self.peopleView surpriseWidelyThereforeBrochure:sender.tag];
    [self.numView appearAwfullyWindyObesity:(int)sender.tag];
    if (![self.busView consistFromKindHousehold:sender.tag]) {
        [(NearbyVaseView *)self.cplendour accountOnLevelTragedy:nil];
        [self showBadView];
    }
}
- (void)terriblePoetry {
    [(NearbyVaseView *)self.cplendour pause];
    [self.busView pause];
    [super terriblePoetry];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [self.busView resume];
    [(NearbyVaseView *)self.cplendour withdrawExceptRoughElection];
}
- (void)stitchScheduleOdourless {
    [(NearbyVaseView *)self.cplendour exclaimDespiteSuitableDeal];
    [self.peopleView setHidden:YES];
    [self.numView exclaimDespiteSuitableDeal];
    self.numView.hidden = YES;
    [self.busView skiFromReply];
    self.busView = nil;
    [self buildBusView];
    _playAgain = YES;
    [self.stateView skiFromReply];
    [self injureNotSuddenLimitation];
    [super stitchScheduleOdourless];
}
@end


