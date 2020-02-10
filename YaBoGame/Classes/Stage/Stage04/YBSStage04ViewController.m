#import "YBSStage04ViewController.h"
#import "YBSStage04View.h"
#import "YBSCountTimeView.h"
@interface YBSStage04ViewController ()
@property (nonatomic, strong) YBSStage04View *imageView;
@property (nonatomic, assign) int stepsCount;
@property (nonatomic, assign) WNXResultStateType stateType;
@property (nonatomic, assign) float allAverage;
@end
@implementation YBSStage04ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildStageInfo];
}
- (void)buildStageInfo {
    self.backgroundIV.image = [UIImage imageNamed:@"05_bg-iphone4"];
    self.view.backgroundColor = [UIColor blackColor];
    [self.leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self.rightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self.leftButton setImage:[UIImage imageNamed:@"05_Rfoot-iphone4"] forState:UIControlStateNormal];
    self.leftButton.imageEdgeInsets = UIEdgeInsetsMake(15, 40, 15, 40);
    self.leftButton.adjustsImageWhenDisabled = NO;
    self.leftButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.rightButton setImage:[UIImage imageNamed:@"05_Yfoot-iphone4"] forState:UIControlStateNormal];
    self.rightButton.imageEdgeInsets = UIEdgeInsetsMake(15, 40, 15, 40);
    self.rightButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.rightButton.adjustsImageWhenDisabled = NO;
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 96, ScreenHeight, self.rightButton.frame.size.height)];
    bottomView.backgroundColor = [UIColor blackColor];
    [self.view insertSubview:bottomView belowSubview:self.leftButton];
    [self buildStageImageView];
    [super buildStageView];
    [self bringPauseAndPlayAgainToFront];
}
- (void)buttonClick:(UIButton *)sender {
    sender.enabled = NO;
    sender.alpha = 0.5;
    if (sender.tag == 1) {
        self.rightButton.enabled = YES;
        self.rightButton.alpha = 1;
        [self.imageView runLeft];
    } else {
        self.leftButton.enabled = YES;
        self.leftButton.alpha = 1;
        [self.imageView runRight];
    }
}
- (void)buildStageImageView {
    __weak typeof(self) weakSelf = self;
    self.imageView = [[YBSStage04View alloc] initWithFrame:CGRectMake(0, ScreenHeight - 96 - 300, ScreenWidth, 300)];
    [self.view insertSubview:self.imageView belowSubview:self.playAgainButton];
    self.imageView.bgIV = self.backgroundIV;
    self.imageView.stopTime = ^(int count) {
        [((YBSCountTimeView *)weakSelf.countScore) stopCalculateByTimeWithTimeBlock:^(int second, int ms) {
            [weakSelf calculateStateWithCount:count second:second msec:ms];
        }];
    };
    self.imageView.passStage = ^() {
        weakSelf.view.userInteractionEnabled = NO;
        [weakSelf showResultControllerWithNewScroe:weakSelf.allAverage * 1000 unit:@"MS" stage:weakSelf.stage isAddScore:YES];
    };
    self.imageView.showResult = ^() {
        [weakSelf showStageResult];
    };
    self.imageView.btnToFront = ^() {
        [weakSelf.view bringSubviewToFront:weakSelf.leftButton];
        [weakSelf.view bringSubviewToFront:weakSelf.rightButton];
        if (weakSelf.guideImageView) {
            [weakSelf.view bringSubviewToFront:weakSelf.guideImageView];
        }
    };
    self.imageView.stopAnimationDidFinish = ^() {
        [weakSelf.imageView start];
        [weakSelf setButtonActivate:YES];
        [((YBSCountTimeView *)weakSelf.countScore) cleanData];
        [((YBSCountTimeView *)weakSelf.countScore) startCalculateByTimeWithTimeOut:nil outTime:0];
    };
    self.imageView.failBlock = ^() {
        [weakSelf setButtonActivate:NO];
        [weakSelf showGameFail];
    };
    [(YBSCountTimeView *)self.countScore setNotHasTimeOut:YES];
    [self.imageView start];
    [self setButtonActivate:NO];
}
- (void)pauseGame {
    [super pauseGame];
    [(YBSCountTimeView *)self.countScore pause];
}
- (void)continueGame {
    [super continueGame];
    [(YBSCountTimeView *)self.countScore continueGame];
}
- (void)playAgainGame {
    [super playAgainGame];
    [(YBSCountTimeView *)self.countScore cleanData];
    [self.imageView playAgain];
    [self setButtonActivate:NO];
}
#pragma mark - 
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    [self setButtonActivate:YES];
    [(YBSCountTimeView *)self.countScore startCalculateByTimeWithTimeOut:nil outTime:0];
}
#pragma mark
- (void)showStageResult {
    [self.stateView showStateViewWithType:self.stateType];
    [self setButtonActivate:NO];
    self.leftButton.alpha = 1;
    self.rightButton.alpha = 1;
}
- (void)calculateStateWithCount:(int)count second:(int)second msec:(int)ms {
    float time = second + ms / 60.0;
    float average = time / count;
    if (average < 0.15) {
        self.stateType = WNXResultStateTypePerfect;
    } else if (average < 0.20) {
        self.stateType = WNXResultStateTypeGreat;
    } else {
        self.stateType = WNXResultStateTypeOK;
    }
    _allAverage += average;
}
@end
