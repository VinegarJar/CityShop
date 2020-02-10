#import "YBSStage06ViewController.h"
#import "YBSStage06PeolpeView.h"
#import "YBSTimeCountView.h"
@interface YBSStage06ViewController ()
{
    BOOL _notFrist;
}
@property (nonatomic, strong) YBSStage06PeolpeView *peopleView;
@end
@implementation YBSStage06ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildStageInfo];
    self.leftButton.userInteractionEnabled = NO;
    self.rightButton.userInteractionEnabled = NO;
}
- (void)buildStageInfo {
    self.backgroundIV.image = [UIImage imageNamed:@"19_bg-iphone4"];
    [self.leftButton setImage:[UIImage imageNamed:@"19_slap-iphone4"] forState:UIControlStateNormal];
    self.leftButton.contentEdgeInsets = UIEdgeInsetsMake(30, 30, 30, 30);
    [self.leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchDown];
    [self.rightButton setImage:[UIImage imageNamed:@"19_done-iphone4"] forState:UIControlStateNormal];
    [self.rightButton setContentEdgeInsets:UIEdgeInsetsMake(30, 30, 30, 30)];
    [self.rightButton addTarget:self action:@selector(doneButtonClick) forControlEvents:UIControlEventTouchDown];
    self.peopleView = [YBSStage06PeolpeView viewFromNib];
    self.peopleView.frame = CGRectMake(0, ScreenHeight - self.leftButton.frame.size.height - self.peopleView.frame.size.height, self.peopleView.frame.size.width, self.peopleView.frame.size.height);
    [self.view insertSubview:self.peopleView belowSubview:self.leftButton];
    if (self.guideImageView) {
        [self.view bringSubviewToFront:self.guideImageView];
    }
    __weak typeof(self) weakSelf = self;
    self.peopleView.failBlock = ^{
        [weakSelf fail];
    };
    [self bringPauseAndPlayAgainToFront];
}
#pragma mark Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    self.view.userInteractionEnabled = NO;
    [self showScreamImageView];
}
- (void)playAgainGame {
    [(YBSTimeCountView *)self.countScore cleadData];
    [self.peopleView cleanData];
    _notFrist = NO;
    [super playAgainGame];
}
#pragma mark Private Method
- (void)showScreamImageView {
    UIImageView *screamIV = [[UIImageView alloc] initWithFrame:CGRectMake(-20, -50, ScreenWidth + 40, ScreenHeight + 100)];
    screamIV.image = [UIImage imageNamed:@"19_beforegame-iphone4"];
    [self.view addSubview:screamIV];
    [[WNXSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundScreamName];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [screamIV removeFromSuperview];
        [self startPlayGame];
        [self.view bringSubviewToFront:self.playAgainButton];
        [self.view bringSubviewToFront:self.pauseButton];
    });
}
- (void)fail {
    [(YBSTimeCountView *)self.countScore stopCalculateTime];
    [self.view setUserInteractionEnabled:NO];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self showGameFail];
    });
}
- (void)startPlayGame {
    self.view.userInteractionEnabled = YES;
    self.leftButton.userInteractionEnabled = YES;
    self.rightButton.userInteractionEnabled = YES;
}
- (void)pauseGame {
    [super pauseGame];
    [(YBSTimeCountView *)self.countScore pause];
}
- (void)beginRedayGoView {
    [super beginRedayGoView];
}
- (void)continueGame {
    [super continueGame];
    [(YBSTimeCountView *)self.countScore resumed];
}
#pragma mark - Action
- (void)leftButtonClick {
    [self.peopleView punchTheFace];
    if (!_notFrist) {
        [(YBSTimeCountView *)self.countScore startCalculateTime];
        _notFrist = YES;
    }
}
- (void)doneButtonClick {
    self.view.userInteractionEnabled = NO;
    NSTimeInterval time = [(YBSTimeCountView *)self.countScore stopCalculateTime];
    if ([self.peopleView doneBtnClick]) {
        [super buildStageView];
        WNXResultStateType stageType;
        if (time <= 5) {
            stageType = WNXResultStateTypePerfect;
        } else if (time < 6) {
            stageType = WNXResultStateTypeGreat;
        } else if (time < 7) {
            stageType = WNXResultStateTypeGood;
        } else {
            stageType = WNXResultStateTypeOK;
        }
        [self.stateView showStateViewWithType:stageType];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self showResultControllerWithNewScroe:time unit:@"秒" stage:self.stage isAddScore:YES];
        });
    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self showGameFail];
        });
    }
}
@end
