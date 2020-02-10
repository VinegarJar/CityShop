#import "YBSStage07ViewController.h"
#import "YBSStage07View.h"
#import "YBSTimeCountView.h"
@interface YBSStage07ViewController ()
{
    BOOL _isStartTime;
    NSTimeInterval _time;
}
@property (nonatomic, strong) YBSStage07View *glassView;
@property (nonatomic, assign) NSTimeInterval oneTime;
@end
@implementation YBSStage07ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildStageInfo];
}
- (void)buildStageInfo {
    [self removeAllImageView];
    __weak typeof(self) weakSelf = self;
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 20)];
    bgImageView.image = [UIImage imageNamed:@"04_background-iphone4"];
    [self.view insertSubview:bgImageView belowSubview:self.playAgainButton];
    [self addButtonsActionWithTarget:self action:@selector(gunClick) forControlEvents:UIControlEventTouchDown];
    [self setButtonImage:[UIImage imageNamed:@"004_gun-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    self.glassView = [[YBSStage07View alloc] initWithFrame:CGRectMake(0, ScreenHeight - 300 - self.redButton.frame.size.height, ScreenWidth, 300)];
    [self.view addSubview:self.glassView];
    if (self.guideImageView) {
        [self.view bringSubviewToFront:self.guideImageView];
    }
    self.glassView.failBlock = ^{
        [weakSelf setButtonsIsActivate:NO];
        [weakSelf showGameFail];
    };
    self.glassView.sucessBlock = ^(int glassCount, BOOL isPass){
        [weakSelf setButtonsIsActivate:NO];
        [weakSelf showStageViewWihtCount:glassCount isPass:isPass];
    };
    self.glassView.stopTimeBlock = ^{
        weakSelf.oneTime = [(YBSTimeCountView *)weakSelf.countScore pasueTime];
    };
    [self bringPauseAndPlayAgainToFront];
}
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    [self.glassView start];
}
- (void)pauseGame {
    [super pauseGame];
    [(YBSTimeCountView *)self.countScore pause];
}
- (void)continueGame {
    [super continueGame];
    [(YBSTimeCountView *)self.countScore resumed];
}
- (void)playAgainGame {
    [(YBSTimeCountView *)self.countScore cleadData];
    [self.glassView cleadData];
    _isStartTime = NO;
    [super playAgainGame];
}
#pragma mark - Action
- (void)gunClick {
    [self.glassView hitGlass];
    if (!_isStartTime) {
        _isStartTime = YES;
        [(YBSTimeCountView *)self.countScore startCalculateTime];
    }
}
- (void)showStageViewWihtCount:(int)count isPass:(BOOL)isPass {
    __weak typeof(self) weakSelf = self;
    if (isPass) {
        _time = [(YBSTimeCountView *)weakSelf.countScore stopCalculateTime];
    }
    NSTimeInterval oneGlassTime = _oneTime / count;
    if (self.stateView) {
        [self.stateView removeFromSuperview];
        self.stateView = nil;
    }
    [super buildStageView];
    WNXResultStateType stageType;
    if (oneGlassTime <= 0.1) {
        stageType = WNXResultStateTypePerfect;
    } else if (oneGlassTime <= 0.14) {
        stageType = WNXResultStateTypeGreat;
    } else if (oneGlassTime <= 0.18) {
        stageType = WNXResultStateTypeGood;
    } else {
        stageType = WNXResultStateTypeOK;
    }
    [self.stateView showStateViewWithType:stageType stageViewHiddenFinishBlock:^{
        if (isPass) {
            [weakSelf showResultControllerWithNewScroe:_time unit:@"秒" stage:weakSelf.stage isAddScore:YES];
        } else {
            [weakSelf.glassView start];
            [weakSelf setButtonsIsActivate:YES];
            [(YBSTimeCountView *)weakSelf.countScore resumed];
        }
    }];
}
@end
