#import "YBSBaseGameViewController.h"
#import "YBSStageInfo.h"
#import "YBSReadyGoView.h"
#import "YBSPauseViewController.h"
#import "YBSCountTimeView.h"
#import "YBSFailView.h"
#import "YBSFailViewController.h"
#import "YBSPrepareViewController.h"
#import "YBSTimeCountView.h"
@interface YBSBaseGameViewController ()
{
    float _volume;
}
@property (nonatomic, strong) UIImageView *adView;
@property (nonatomic, assign) WNXADType adType;
@end
@implementation YBSBaseGameViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initGuideImageView];
    [self buildPlayAgainButton];
    [self buildPauseButton];
    [self showGuideImageView];
    [self buildADView];
}
- (void)dealloc {
    NSLog(@"%s", __func__);
    [[NSNotificationCenter defaultCenter] postNotificationName:kNotificationNameGameViewControllerDelloc object:nil];
}
#pragma mark - Pubilc Method
- (void)playAgainGame {
    self.view.userInteractionEnabled = NO;
    [self guideImageViewClick];
}
- (void)pauseGame {
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)buildStageInfo {}
- (void)continueGame {
    self.view.userInteractionEnabled = YES;
}
- (void)readyGoAnimationFinish {
    self.view.userInteractionEnabled = YES;
}
- (void)beginGame {
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"kMusicType"] == SoundPlayTypeMute) {
        [[WNXSoundToolManager sharedSoundToolManager] setBackgroundMusicVolume:0.3];
        _volume = 0.3;
    }
}
- (void)endGame {
    if (_volume) {
        [[WNXSoundToolManager sharedSoundToolManager] setBackgroundMusicVolume:1.0];
    }
    self.view.userInteractionEnabled = NO;
}
- (void)showGameFail {
    self.view.userInteractionEnabled = NO;
    __weak __typeof(self) weakSelf = self;
    YBSFailView *failView = [YBSFailView viewFromNib];
    failView.frame = CGRectMake(0, ScreenHeight - failView.frame.size.width - 140, failView.frame.size.width, failView.frame.size.height);
    [self.view addSubview:failView];
    [failView showFailViewWithAnimatonFinishBlock:^{
        [weakSelf showFailViewController];
    }];
}
- (void)showFailViewController {
    __weak __typeof(self) weakSelf = self;
    YBSFailViewController *failVC = [YBSFailViewController initWithStage:self.stage retryButtonClickBlock:^{
        for (UIViewController *vc in weakSelf.navigationController.viewControllers) {
            if ([vc isKindOfClass:[YBSPrepareViewController class]]) {
                ((YBSPrepareViewController *)vc).stage = self.stage;
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
    [self.playAgainButton addTarget:self action:@selector(playAgainGame) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.playAgainButton];
}
- (void)bringPauseAndPlayAgainToFront {
    [self.view bringSubviewToFront:self.pauseButton];
    [self.view bringSubviewToFront:self.playAgainButton];
    [self.view bringSubviewToFront:self.adView];
    if (self.guideImageView) {
        [self.view bringSubviewToFront:self.guideImageView];
    }
}
- (void)buildPauseButton {
    self.pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth - 55, CGRectGetMaxY(self.playAgainButton.frame) + 13, 110, 52)];
    [self.pauseButton setBackgroundImage:[UIImage imageNamed:@"ing_pause"] forState:UIControlStateNormal];
    self.pauseButton.adjustsImageWhenHighlighted = NO;
    self.pauseButton.userInteractionEnabled = YES;
    [self.pauseButton addTarget:self action:@selector(pauseGame) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:self.pauseButton];
}
- (void)initGuideImageView {
    self.guideImageView = [[UIImageView alloc] initWithFrame:ScreenBounds];
    [self.view addSubview:self.guideImageView];
}
- (void)showGuideImageView {
    if ((self.stage.userInfo && self.stage.userInfo.rank && ![self.stage.userInfo isEqual:@"f"]) || self.guideType == WNXGameGuideTypeNone) {
        [self guideImageViewClick];
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
    self.guideImageView.animationDuration = duration;
    self.guideImageView.animationImages = animationImages;
    self.guideImageView.animationRepeatCount = -1;
    [self.guideImageView startAnimating];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(guideImageViewClick)];
    self.guideImageView.userInteractionEnabled = YES;
    [self.guideImageView addGestureRecognizer:tap];
}
- (void)guideImageViewClick {
    [self.guideImageView removeFromSuperview];
    self.countScore.hidden = NO;
    __weak __typeof(self) weakSelf = self;
    if (self.scoreboardType == WNXScoreboardTypeCountPTS) {
        [(YBSScoreboardCountView *)self.countScore startAnimationWithCompletion:^(BOOL finished) {
            [weakSelf beginRedayGoView];
        }];
    } else if (self.scoreboardType == WNXScoreboardTypeTimeMS) {
        [((YBSCountTimeView *)self.countScore) startAnimationWithCompletion:^(BOOL finished) {
            [weakSelf beginRedayGoView];
        }];
    } else if (self.scoreboardType == WNXScoreboardTypeSecondAndMS) {
        [((YBSTimeCountView *)self.countScore) startAnimationWithCompletion:^(BOOL finished) {
            [weakSelf beginRedayGoView];
        }];
    } else if (self.scoreboardType == WNXScoreboardTypeNone) {
        [self beginRedayGoView];
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
    [self pauseGame];
    NSURL *url;
    switch (self.adType) {
        case WNXADTypeBlog:
            url = [NSURL URLWithString:kBlogURL];
            break;
        case WNXADTypeGithub:
            url = [NSURL URLWithString:kGithubUrl];
            break;
        case WNXADTypeWeiBo:
            url = [NSURL URLWithString:kWeiBoURL];
            break;
        default:
            break;
    }
    [[UIApplication sharedApplication] openURL:url];
}
- (void)setScoreboardType:(WNXScoreboardType)scoreboardType {
    _scoreboardType = scoreboardType;
    if (scoreboardType == WNXScoreboardTypeNone) {
        return;
    } else if (scoreboardType == WNXScoreboardTypeCountPTS) {
        self.countScore = [YBSScoreboardCountView viewFromNib];
        self.countScore.frame = CGRectMake(-40, -140, self.countScore.frame.size.width, self.countScore.frame.size.height);
    } else if (scoreboardType == WNXScoreboardTypeTimeMS) {
        self.countScore = [YBSCountTimeView viewFromNib];
        self.countScore.frame = CGRectMake(-60, -140, self.countScore.frame.size.width, self.countScore.frame.size.height);
    } else if (scoreboardType == WNXScoreboardTypeSecondAndMS) {
        self.countScore = [YBSTimeCountView viewFromNib];
        self.countScore.frame = CGRectMake(-40, -55, self.countScore.frame.size.width, self.countScore.frame.size.height);
    }
    self.countScore.hidden = YES;
    if (self.guideImageView) {
        [self.view insertSubview:self.countScore belowSubview:self.guideImageView];
    } else {
        [self.view addSubview:self.countScore];
    }
}
- (void)beginRedayGoView {
    __weak __typeof(self) weakSelf = self;
    self.view.userInteractionEnabled = NO;
    [YBSReadyGoView showReadyGoViewWithSuperView:self.view completion:^{
        [weakSelf readyGoAnimationFinish];
    }];
}
- (void)showResultControllerWithNewScroe:(double)scroe unit:(NSString *)unil stage:(YBSStage *)stage isAddScore:(BOOL)isAddScroe {
    YBSResultViewController *resultVC = [[YBSResultViewController alloc] init];
    NSLog(@"%f", scroe);
    [resultVC setCountScoreWithNewScroe:scroe unit:unil stage:stage isAddScore:isAddScroe];
    [self.navigationController pushViewController:resultVC animated:NO];
}
- (void)buildStageView {
    self.stateView = [YBSStateView viewFromNib];
    self.stateView.frame = CGRectMake(0, ScreenHeight - self.stateView.frame.size.height - ScreenWidth / 3 - 10, self.stateView.frame.size.width, self.stateView.frame.size.height);
    [self.view addSubview:self.stateView];
}
@end
