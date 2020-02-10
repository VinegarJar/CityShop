#import "ShouldRipeGraceController.h"
#import "DisappearCharmingPot.h"
#import "AltogetherDeepFormatView.h"
#import "ThroughoutValuableCommunistController.h"
#import "NearbyVaseView.h"
#import "BlessLiftView.h"
#import "CreepAboutCoffinController.h"
#import "SorryEnvelopeController.h"
#import "AnticipateDictionaryCulturalView.h"
@interface ShouldRipeGraceController ()
{
    float _volume;
}
@property (nonatomic, strong) UIImageView *adView;
@property (nonatomic, assign) WNXADType adType;
@end
@implementation ShouldRipeGraceController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initGraceView];
    [self buildPlayAgainButton];
    [self buildPauseButton];
    [self showtipeGraceView];
    [self buildADView];
}
- (void)dealloc {
    NSLog(@"%s", __func__);
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationNameGameViewControllerDelloc object:nil];
}
#pragma mark - Pubilc Method
- (void)stitchScheduleOdourless {
    self.view.userInteractionEnabled = NO;
    [self tipeGraceViewClick];
}
- (void)terriblePoetry {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)bitterHell {}
- (void)withdrawExceptRoughElection {
    self.view.userInteractionEnabled = YES;
}
- (void)faxHoneymoon {
    self.view.userInteractionEnabled = YES;
}
- (void)weaveTransparentlyFunSeaside {
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"kMusicType"] == SoundPlayTypeMute) {
        [[WNXSoundToolManager sharedSoundToolManager] permanentlyHybridTextbook:0.3];
        _volume = 0.3;
    }
}
- (void)equipBrilliantLamb {
    if (_volume) {
        [[WNXSoundToolManager sharedSoundToolManager] permanentlyHybridTextbook:1.0];
    }
    self.view.userInteractionEnabled = NO;
}
- (void)refineFortunateEnvelope {
    self.view.userInteractionEnabled = NO;
    __weak __typeof(self) weakSelf = self;
    BlessLiftView *failView = [BlessLiftView viewFromNib];
    failView.frame = CGRectMake(0, ScreenHeight - failView.frame.size.width - 140, failView.frame.size.width, failView.frame.size.height);
    [self.view addSubview:failView];
    [failView billionFaculty:^{
        [weakSelf showFailViewController];
    }];
}
- (void)showFailViewController {
    __weak __typeof(self) weakSelf = self;
    CreepAboutCoffinController *failVC = [CreepAboutCoffinController initWithStage:self.stage retryButtonClickBlock:^{
        for (UIViewController *vc in weakSelf.navigationController.viewControllers) {
            if ([vc isKindOfClass:[SorryEnvelopeController class]]) {
                ((SorryEnvelopeController *)vc).stage = self.stage;
                [weakSelf.navigationController popToViewController:vc animated:NO];
                return;
            }
        }
    }];
    [self.navigationController pushViewController:failVC animated:NO];
}
#pragma mark - Private Method
- (void)buildPlayAgainButton {
    self.playAgainButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 55, 75, 110, 52)];
    self.playAgainButton.adjustsImageWhenHighlighted = NO;
    self.playAgainButton.userInteractionEnabled = YES;
    [self.playAgainButton setBackgroundImage:[UIImage imageNamed:@"ing_retry"] forState:UIControlStateNormal];
    [self.playAgainButton addTarget:self action:@selector(stitchScheduleOdourless) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.playAgainButton];
}
- (void)lookIntoWeekend {
    [self.view bringSubviewToFront:self.pauseButton];
    [self.view bringSubviewToFront:self.playAgainButton];
    [self.view bringSubviewToFront:self.adView];
    if (self.tipeGraceView) {
        [self.view bringSubviewToFront:self.tipeGraceView];
    }
}
- (void)buildPauseButton {
    self.pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 55, CGRectGetMaxY(self.playAgainButton.frame) + 13, 110, 52)];
    [self.pauseButton setBackgroundImage:[UIImage imageNamed:@"ing_pause"] forState:UIControlStateNormal];
    self.pauseButton.adjustsImageWhenHighlighted = NO;
    self.pauseButton.userInteractionEnabled = YES;
    [self.pauseButton addTarget:self action:@selector(terriblePoetry ) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.pauseButton];
}
- (void)initGraceView {
    self.tipeGraceView = [[UIImageView alloc] initWithFrame:ScreenBounds];
    [self.view addSubview:self.tipeGraceView];
}
- (void)showtipeGraceView {
    if ((self.stage.userInfo && self.stage.userInfo.rank && ![self.stage.userInfo isEqual:@"f"]) || self.guideType == WNXGameGuideTypeNone) {
        [self tipeGraceViewClick];
        return;
    }
    NSArray *animationImages;
    if (self.guideType == WNXGameGuideTypeOneFingerClick) {
        animationImages = @[[UIImage imageNamed:@"03-1-iphone4"], [UIImage imageNamed:@"03-2-iphone4"]];
    } else if (self.guideType == WNXGameGuideTypeReplaceClick) {
        animationImages = @[[UIImage imageNamed:@"01-1-iphone4"], [UIImage imageNamed:@"01-2-iphone4"]];
    } else if (self.guideType == WNXGameGuideTypeMultiPointClick) {
        animationImages = @[[UIImage imageNamed:@"02-1-iphone4"], [UIImage imageNamed:@"02-2-iphone4"], [UIImage imageNamed:@"02-4-iphone4"], [UIImage imageNamed:@"02-5-iphone4"]];
    }
    CGFloat duration;
    if (self.guideType == WNXGameGuideTypeOneFingerClick) {
        duration = 0.3;
    } else if (self.guideType == WNXGameGuideTypeReplaceClick) {
        duration = 0.5;
    } else {
        duration = 0.8;
    }
    self.tipeGraceView.animationDuration = duration;
    self.tipeGraceView.animationImages = animationImages;
    self.tipeGraceView.animationRepeatCount = -1;
    [self.tipeGraceView startAnimating];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tipeGraceViewClick)];
    self.tipeGraceView.userInteractionEnabled = YES;
    [self.tipeGraceView addGestureRecognizer:tap];
}
- (void)tipeGraceViewClick {
    [self.tipeGraceView removeFromSuperview];
    self.cplendour.hidden = NO;
    __weak __typeof(self) weakSelf = self;
    if (self.scoreboardType == WNXScoreboardTypeCountPTS) {
        [(RouseUninhabitedLetterView *)self.cplendour facialManufacture:^(BOOL finished) {
            [weakSelf throwConductorImaginative];
        }];
    } else if (self.scoreboardType == WNXScoreboardTypeTimeMS) {
        [((NearbyVaseView *)self.cplendour)facialManufacture:^(BOOL finished) {
            [weakSelf throwConductorImaginative];
        }];
    } else if (self.scoreboardType == WNXScoreboardTypeSecondAndMS) {
        [((AnticipateDictionaryCulturalView *)self.cplendour)facialManufacture:^(BOOL finished) {
            [weakSelf throwConductorImaginative];
        }];
    } else if (self.scoreboardType == WNXScoreboardTypeNone) {
        [self throwConductorImaginative];
    }
}
- (void)buildADView {
    self.adType = arc4random_uniform(3);
    self.adView = [[UIImageView alloc] initWithFrame:CGRectMake(kCountStartX(250), 0, 250, 50)];
    self.adView.userInteractionEnabled = YES;
    [self.adView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(adViewClick)]];
    [self.view addSubview:self.adView];
}
- (void)adViewClick {
    [self terriblePoetry];
    NSURL *url;
    [[UIApplication sharedApplication] openURL:url];
}
- (void)setScoreboardType:(WNXScoreboardType)scoreboardType {
    _scoreboardType = scoreboardType;
    if (scoreboardType == WNXScoreboardTypeNone) {
        return;
    } else if (scoreboardType == WNXScoreboardTypeCountPTS) {
        self.cplendour = [RouseUninhabitedLetterView viewFromNib];
        self.cplendour.frame = CGRectMake(-40, -140, self.cplendour.frame.size.width, self.cplendour.frame.size.height);
    } else if (scoreboardType == WNXScoreboardTypeTimeMS) {
        self.cplendour = [NearbyVaseView viewFromNib];
        self.cplendour.frame = CGRectMake(-60, -140, self.cplendour.frame.size.width, self.cplendour.frame.size.height);
    } else if (scoreboardType == WNXScoreboardTypeSecondAndMS) {
        self.cplendour = [AnticipateDictionaryCulturalView viewFromNib];
        self.cplendour.frame = CGRectMake(-40, -55, self.cplendour.frame.size.width, self.cplendour.frame.size.height);
    }
    self.cplendour.hidden = YES;
    if (self.tipeGraceView) {
        [self.view insertSubview:self.cplendour belowSubview:self.tipeGraceView];
    } else {
        [self.view addSubview:self.cplendour];
    }
}
- (void)throwConductorImaginative {
    __weak __typeof(self) weakSelf = self;
    self.view.userInteractionEnabled = NO;
    [AltogetherDeepFormatView showReadyGoViewWithSuperView:self.view completion:^{
        [weakSelf faxHoneymoon];
    }];
}
- (void)transformMatureLifeboat:(double)scroe unit:(NSString *)unil stage:(BattleUponSplendour *)stage isAddScore:(BOOL)isAddScroe {
    RubSignalTechnologicalController *resultVC = [[RubSignalTechnologicalController alloc] init];
    NSLog(@"%f", scroe);
    [resultVC governExperimentalCarriage:scroe unit:unil stage:stage isAddScore:isAddScroe];
    [self.navigationController pushViewController:resultVC animated:NO];
}
- (void)injureNotSuddenLimitation {
    self.stateView = [OclockVisibleBookmarkView viewFromNib];
    self.stateView.frame = CGRectMake(0, ScreenHeight - self.stateView.frame.size.height - ScreenWidth / 3 - 10, self.stateView.frame.size.width, self.stateView.frame.size.height);
    [self.view addSubview:self.stateView];
}
@end


