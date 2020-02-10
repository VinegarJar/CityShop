#import "YBSStage21ViewController.h"
#import "YBSStage21FractionView.h"
#import "YBSCountTimeView.h"
@interface YBSStage21ViewController ()
@property (nonatomic, strong) YBSStage21FractionView *numView;
@property (nonatomic, assign) int maxTag;
@property (nonatomic, assign) int allScore;
@property (nonatomic, assign) int count;
@end
@implementation YBSStage21ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildStageInfo];
}
- (void)buildStageInfo {
    self.backgroundIV.image = [UIImage imageNamed:@"13_bg-iphone4"];
    UIImageView *lineIV = [[UIImageView alloc] initWithFrame:CGRectMake(156, 0, 8, ScreenHeight)];
    lineIV.image = [UIImage imageNamed:@"17_blackline-iphone4"];
    [self.view insertSubview:lineIV belowSubview:self.leftButton];
    lineIV.alpha = 0.6;
    [self.leftButton setImage:[UIImage imageNamed:@"17_bigger-iphone4"] forState:UIControlStateNormal];
    self.leftButton.contentEdgeInsets = UIEdgeInsetsMake(50, 30, 15, 30);
    [self.rightButton setImage:[UIImage imageNamed:@"17_bigger-iphone4"] forState:UIControlStateNormal];
    self.rightButton.contentEdgeInsets = UIEdgeInsetsMake(50, 30, 15, 30);
    UIImageView *arrow1 = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth / 2 - 40) * 0.5, ScreenHeight - 80, 40, 20)];
    arrow1.image = [UIImage imageNamed:@"17_triangle-iphone4"];
    [self.view addSubview:arrow1];
    UIImageView *arrow2 = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth / 2 + (ScreenWidth / 2 - 40) * 0.5, ScreenHeight - 80, 40, 20)];
    arrow2.image = [UIImage imageNamed:@"17_triangle-iphone4"];
    [self.view addSubview:arrow2];
    [self buildNumberView];
    [self buildStageView];
    [self.leftButton addTarget:self action:@selector(bgView:) forControlEvents:UIControlEventTouchDown];
    [self.rightButton addTarget:self action:@selector(bgView:) forControlEvents:UIControlEventTouchDown];
}
- (void)buildNumberView {
    self.numView = [[YBSStage21FractionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - ScreenWidth / 3)];
    [self.view insertSubview:self.numView belowSubview:self.leftButton];
    __weak typeof(self) weakSelf = self;
    self.numView.showNumberAnimationFinish = ^{
        [(YBSCountTimeView *)weakSelf.countScore startCalculateTime];
        [weakSelf setButtonActivate:YES];
    };
    [self bringPauseAndPlayAgainToFront];
}
#pragma mark - Action
- (void)bgView:(UIButton *)sender {
    self.leftButton.userInteractionEnabled = NO;
    self.rightButton.userInteractionEnabled = NO;
    if (sender.tag == self.maxTag) {
        __weak typeof(self) weakSelf = self;
        __block int onceTime;
        [(YBSCountTimeView *)self.countScore stopCalculateByTimeWithTimeBlock:^(int second, int ms) {
            onceTime = second * 1000 + ms / 60.0 * 1000;
            weakSelf.allScore += onceTime;
        }];
        WNXResultStateType resultType;
        if (onceTime < 300) {
            resultType = WNXResultStateTypePerfect;
        } else if (onceTime < 400) {
            resultType = WNXResultStateTypeGreat;
        } else if (onceTime < 500) {
            resultType = WNXResultStateTypeGood;
        } else {
            resultType = WNXResultStateTypeOK;
        }
        [self.stateView showStateViewWithType:resultType stageViewHiddenFinishBlock:^{
            if (weakSelf.count == 12) {
                [weakSelf showResultControllerWithNewScroe:weakSelf.allScore / 13 unit:@"ms" stage:weakSelf.stage isAddScore:YES];
            } else {
                weakSelf.count++;
                [(YBSCountTimeView *)weakSelf.countScore cleanData];
                weakSelf.maxTag = [weakSelf.numView showNumber];
            }
        }];
    } else {
        self.view.userInteractionEnabled = NO;
        [self showGameFail];
        [(YBSCountTimeView *)self.countScore stopCalculateByTimeWithTimeBlock:nil];
    }
}
#pragma mark - Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    self.leftButton.userInteractionEnabled = NO;
    self.rightButton.userInteractionEnabled = NO;
    self.allScore = 0;
    _count = 0;
    self.maxTag = [self.numView showNumber];
}
- (void)pauseGame {
    [(YBSCountTimeView *)self.countScore pause];
    [self.numView pause];
    [super pauseGame];
}
- (void)continueGame {
    [super continueGame];
    [self.numView resume];
    [(YBSCountTimeView *)self.countScore continueGame];
}
- (void)playAgainGame {
    [(YBSCountTimeView *)self.countScore cleanData];
    [self.stateView removeData];
    self.stateView = nil;
    [self buildStageView];
    [self.numView removeData];
    self.numView = nil;
    [self buildNumberView];
    [super playAgainGame];
}
@end
