#import "YBSStage10ViewController.h"
#import "YBSStage10View.h"
#import "YBSStage10BottomNumView.h"
#import "YBSTimeCountView.h"
@interface YBSStage10ViewController ()
@property (nonatomic, strong) YBSStage10View *plateView;
@property (nonatomic, strong) YBSStage10BottomNumView *numView;
@property (nonatomic, assign) NSTimeInterval oneTime;
@end
@implementation YBSStage10ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildStageInfo];
}
- (void)buildStageInfo {
    [super buildStageView];
    [self removeAllImageView];
    UIImageView *bgIV = [[UIImageView alloc] initWithFrame:ScreenBounds];
    bgIV.image = [UIImage imageNamed:@"08_bg-iphone4"];
    [self.view insertSubview:bgIV belowSubview:self.redButton];
    [self setButtonsIsActivate:NO];
    [self buildPlateView];
    [self buildBottomNumberView];
    [super bringPauseAndPlayAgainToFront];
    [self addButtonsActionWithTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
}
- (void)buildPlateView {
    __weak typeof(self) weakSelf = self;
    self.plateView = [[YBSStage10View alloc] initWithFrame:CGRectMake(0, ScreenHeight - self.redButton.frame.size.height + 55 - 480, ScreenWidth, 480)];
    [self.view insertSubview:self.plateView belowSubview:self.redButton];
    self.plateView.AnimationFinishBlock = ^(BOOL isFrist) {
        [weakSelf setButtonsIsActivate:YES];
        if (isFrist) {
            [(YBSTimeCountView *)weakSelf.countScore startCalculateTime];
        } else {
            [(YBSTimeCountView *)weakSelf.countScore resumed];
        }
    };
    self.plateView.StopCountTimeBlock = ^{
        [weakSelf setButtonsIsActivate:NO];
        weakSelf.oneTime = [(YBSTimeCountView *)weakSelf.countScore pasueTime];
    };
    self.plateView.PassStageBlock = ^{
        WNXResultStateType resultType;
        if (weakSelf.oneTime < 0.8) {
            resultType = WNXResultStateTypePerfect;
        } else if (weakSelf.oneTime < 1) {
            resultType = WNXResultStateTypeGreat;
        } else {
            resultType = WNXResultStateTypeGood;
        }
        [weakSelf.stateView showStateViewWithType:resultType stageViewHiddenFinishBlock:^{
            [weakSelf showResultControllerWithNewScroe:[(YBSTimeCountView *)weakSelf.countScore stopCalculateTime] unit:@"秒" stage:weakSelf.stage isAddScore:YES];
        }];
    };
    self.plateView.NextBlock = ^{
        WNXResultStateType resultType;
        if (weakSelf.oneTime < 0.8) {
            resultType = WNXResultStateTypePerfect;
        } else if (weakSelf.oneTime < 1) {
            resultType = WNXResultStateTypeGreat;
        } else {
            resultType = WNXResultStateTypeGood;
        }
        [weakSelf.stateView showStateViewWithType:resultType stageViewHiddenFinishBlock:^{
            [weakSelf.numView cleanData];
            [weakSelf.plateView startRotation];
        }];
    };
    self.plateView.FailBlock = ^{
        [(YBSTimeCountView *)weakSelf.countScore stopCalculateTime];
        [weakSelf showGameFail];
    };
}
- (void)buildBottomNumberView {
    self.numView = [[YBSStage10BottomNumView alloc] initWithFrame:CGRectMake(0, self.redButton.frame.origin.y + 4, ScreenWidth, self.redButton.frame.size.height)];
    self.numView.userInteractionEnabled = NO;
    [self.view insertSubview:self.numView aboveSubview:self.blueButton];
}
#pragma mark - Action
- (void)buttonClick:(UIButton *)sender {
    [[WNXSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundFeatherClickName];
    [self.numView addNumWithIndex:(int)sender.tag];
    if (![self.plateView clickWithIndex:(int)sender.tag]) {
        [(YBSTimeCountView *)self.countScore stopCalculateTime];
        [self showGameFail];
    }
}
#pragma mark - Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    self.view.userInteractionEnabled = YES;
    [self setButtonsIsActivate:NO];
    [self.plateView startRotation];
}
- (void)pauseGame {
    [self.plateView pause];
    [(YBSTimeCountView *)self.countScore pause];
    [super pauseGame];
}
- (void)continueGame {
    [super continueGame];
    [self.plateView resume];
    if (!self.plateView.isAnimation) {
        [(YBSTimeCountView *)self.countScore resumed];
    }
}
- (void)playAgainGame {
    [(YBSTimeCountView *)self.countScore cleadData];
    [self.plateView cleanData];
    [self.numView cleanData];
    [self.plateView removeFromSuperview];
    self.plateView = nil;
    [self.numView removeFromSuperview];
    self.numView = nil;
    [self buildPlateView];
    [self buildBottomNumberView];
    [super playAgainGame];
}
@end
