#import "YBSStage24ViewController.h"
#import "YBSCountTimeView.h"
#import "YBSStage24View.h"
@interface YBSStage24ViewController ()
@property (nonatomic, strong) YBSStage24View *cockroachView;
@property (nonatomic, assign) int allScore;
@property (nonatomic, assign) int count;
@property (nonatomic, assign) BOOL playAgain;
@end
@implementation YBSStage24ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildStageInfo];
}
- (void)buildStageInfo {
    [self setButtonImage:[UIImage imageNamed:@"stage27_btn-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    [self addButtonsActionWithTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self buildCockroachView];
    [self buildStageView];
    [self bringPauseAndPlayAgainToFront];
}
- (void)buildCockroachView {
    self.cockroachView = [[YBSStage24View alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view insertSubview:self.cockroachView belowSubview:self.redButton];
    __weak typeof(self) weakSelf = self;
    self.cockroachView.startCountTime = ^(BOOL isFrist) {
        weakSelf.playAgain = NO;
        if (isFrist) {
            [(YBSCountTimeView *)weakSelf.countScore startCalculateTime];
        } else {
            [(YBSCountTimeView *)weakSelf.countScore continueGame];
        }
    };
    self.cockroachView.finish = ^{
        weakSelf.count++;
        WNXResultStateType type;
        __block int onecTime;
        [(YBSCountTimeView *)weakSelf.countScore stopCalculateByTimeWithTimeBlock:^(int second, int ms) {
            onecTime = second * 1000 + ms / 60.0 * 1000;
            weakSelf.allScore += onecTime;
        }];
        if (onecTime <= 900) {
            type = WNXResultStateTypePerfect;
        } else if (onecTime <= 1000) {
            type = WNXResultStateTypeGreat;
        } else if (onecTime <= 1100) {
            type = WNXResultStateTypeGood;
        } else {
            type = WNXResultStateTypeOK;
        }
        [weakSelf.stateView showStateViewWithType:type stageViewHiddenFinishBlock:^{
            if (!weakSelf.playAgain) {
                if (weakSelf.count != 4) {
                    [weakSelf showNewCockroachView];
                } else {
                    [weakSelf showResultControllerWithNewScroe:weakSelf.allScore / 4 unit:@"ms" stage:weakSelf.stage isAddScore:YES];
                }
            }
        }];
    };
    self.cockroachView.fail = ^{
        [(YBSCountTimeView *)weakSelf.countScore pause];
        [weakSelf showGameFail];
    };
}
#pragma mark - Private Method
- (void)showNewCockroachView {
    [self removeCockroachViewData];
    [self buildCockroachView];
    [self.cockroachView startAppearCockroach];
}
- (void)removeCockroachViewData {
    [(YBSCountTimeView *)self.countScore cleanData];
    self.redImageView.highlighted = NO;
    self.yellowImageView.highlighted = NO;
    self.blueImageView.highlighted = NO;
    [self setButtonsIsActivate:YES];
    [self.cockroachView removeFromSuperview];
    self.cockroachView = nil;
}
#pragma mark - Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    [self setButtonsIsActivate:YES];
    [self.cockroachView startAppearCockroach];
}
#pragma mark - Action
- (void)btnClick:(UIButton *)sender {
    sender.userInteractionEnabled = NO;
    [(YBSCountTimeView *)self.countScore pause];
    if ([self.cockroachView hitCockroachWithIndex:sender.tag]) {
        if (sender.tag == 0) {
            self.redImageView.highlighted = YES;
        } else if (sender.tag == 1) {
            self.yellowImageView.highlighted = YES;
        } else {
            self.blueImageView.highlighted = YES;
        }
    } else {
        [self showGameFail];
    }
}
- (void)playAgainGame {
    self.count = 0;
    self.allScore = 0;
    self.playAgain = YES;
    [self removeCockroachViewData];
    [self buildCockroachView];
    [super playAgainGame];
}
@end
