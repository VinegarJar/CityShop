#import "YBSStage05ViewController.h"
#import "YBSIceView.h"
#import "YBSTimeCountView.h"
@interface YBSStage05ViewController ()
@property (nonatomic, strong) YBSIceView *iceView;
@property (nonatomic, assign) BOOL isFail;
@end
@implementation YBSStage05ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildStageInfo];
}
#pragma mark - Build UI
- (void)buildStageInfo {
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.image = [UIImage imageNamed:@"03_background-iphone4"];
    [self.view insertSubview:bgImageView belowSubview:self.redButton];
    [self setButtonImage:[UIImage imageNamed:@"03_button-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(25, 25, 25, 25)];
    [self addButtonsActionWithTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self buildEggRoll];
    [self buildIceView];
    [super buildStageView];
    [self bringPauseAndPlayAgainToFront];
}
- (void)buildEggRoll {
    CGFloat eggIVW = 100;
    CGFloat eggIVH = 204;
    CGFloat margin = (ScreenWidth / 3 - eggIVW) * 0.5;
    for (int i = 0; i < 3; i++) {
        UIImageView *eggIV = [[UIImageView alloc] initWithFrame:CGRectMake(margin + i * (eggIVW + margin * 2), ScreenHeight - self.redButton.bounds.size.height - 85, eggIVW, eggIVH)];
        eggIV.image = [UIImage imageNamed:@"03_cones-iphone4"];
        [self.view insertSubview:eggIV belowSubview:self.redButton];
    }
}
- (void)buildIceView {
    self.iceView = [[YBSIceView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 412, ScreenWidth, 229)];
    [self.view addSubview:self.iceView];
    [self.iceView showDottedLineView];
    __weak typeof(self) weakSelf = self;
    self.iceView.failBlock = ^{
        if (!weakSelf.isFail) {
            [weakSelf.view setUserInteractionEnabled:NO];
            [(YBSTimeCountView *)weakSelf.countScore stopCalculateTime];
            [weakSelf showGameFail];
        }
        weakSelf.isFail = YES;
    };
    self.iceView.passBlock = ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf showResultControllerWithNewScroe:[(YBSTimeCountView *)weakSelf.countScore stopCalculateTime] unit:@"秒" stage:weakSelf.stage isAddScore:YES];
        });
    };
    self.iceView.successBlock = ^(int iceCount){
        [weakSelf showResultStateWithCount:iceCount];
    };
}
#pragma mark Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    [self.view bringSubviewToFront:self.iceView];
    [(YBSTimeCountView *)self.countScore startCalculateTime];
}
- (void)beginRedayGoView {
    [super beginRedayGoView];
    if (self.guideImageView) {
        [self.view bringSubviewToFront:self.guideImageView];
    }
}
- (void)pauseGame {
    [(YBSTimeCountView *)self.countScore pause];
    [super pauseGame];
}
- (void)continueGame {
    [super continueGame];
    [(YBSTimeCountView *)self.countScore resumed];
}
- (void)playAgainGame {
    self.isFail = NO;
    [(YBSTimeCountView *)self.countScore cleadData];
    [self.iceView showDottedLineView];
    [super playAgainGame];
}
#pragma mark - Private Method
- (void)showResultStateWithCount:(int)count {
    [self.view setUserInteractionEnabled:NO];
    NSTimeInterval time = [(YBSTimeCountView *)self.countScore pasueTime] / count;
    WNXResultStateType stageType;
    if (time < 0.05) {
        stageType = WNXResultStateTypePerfect;
    } else if (time < 0.08) {
        stageType = WNXResultStateTypeGreat;
    } else if (time < 0.1) {
        stageType = WNXResultStateTypeGood;
    } else {
        stageType = WNXResultStateTypeOK;
    }
    [self.stateView showStateViewWithType:stageType];
    if (!self.iceView.isPass) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.iceView showDottedLineView];
            [(YBSTimeCountView *)self.countScore resumed];
            [self.view setUserInteractionEnabled:YES];
        });
    }
}
#pragma mark Action
- (void)btnClick:(UIButton *)sender {
    [self.iceView addIceWithIndex:sender.tag];
}
@end
