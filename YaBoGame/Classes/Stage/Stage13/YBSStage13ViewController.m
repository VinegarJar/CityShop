#import "YBSStage13ViewController.h"
#import "YBSStage13BottomView.h"
#import "YBSStage13GuessView.h"
#import "YBSCountTimeView.h"
@interface YBSStage13ViewController ()
@property (nonatomic, strong) YBSStage13GuessView *guessView;
@property (nonatomic, strong) YBSStage13BottomView *bottom;
@property (nonatomic, assign) NSTimeInterval allTime;
@property (nonatomic, assign) WNXResultStateType type;
@end
@implementation YBSStage13ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildStageInfo];
}
- (void)buildStageInfo {
    UIImageView *bgIV = [[UIImageView alloc] initWithFrame:ScreenBounds];
    bgIV.image = [UIImage imageNamed:@"11_bg-iphone4"];
    [self.view insertSubview:bgIV belowSubview:self.redButton];
    [self removeAllImageView];
    [super buildStageView];
    self.guessView = [[YBSStage13GuessView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.redButton.frame.size.height)];
    [self.view addSubview:self.guessView];
    self.bottom = [[YBSStage13BottomView alloc] initWithFrame:CGRectMake(0, self.redButton.frame.origin.y, ScreenWidth, self.redButton.frame.size.height)];
    [self.view addSubview:self.bottom];
    [self addButtonsActionWithTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self bringPauseAndPlayAgainToFront];
    __weak typeof(self) weakSelf = self;
    self.guessView.startCountTime = ^{
        [weakSelf setButtonsIsActivate:YES];
        [(YBSCountTimeView *)weakSelf.countScore startCalculateByTimeWithTimeOut:^{
            [weakSelf.guessView stopAnimationWithTimeOver];
        } outTime:3];
    };
    self.guessView.nextCountWithError = ^{
        [(YBSCountTimeView *)weakSelf.countScore cleanData];
        [weakSelf.bottom cleanData];
        weakSelf.allTime += 3.0;
        [weakSelf.guessView startGuess];
    };
    self.guessView.nextCountWithSucess = ^(BOOL isPass){
        [weakSelf.guessView stopAnimationWithFinish:nil];
        [weakSelf setButtonsIsActivate:NO];
        [(YBSCountTimeView *)weakSelf.countScore stopCalculateByTimeWithTimeBlock:^(int second, int ms) {
            NSTimeInterval onceTime = (second + ms / 60.0);
            if (onceTime < 0.8) {
                weakSelf.type = WNXResultStateTypePerfect;
            } else if (onceTime < 1.0) {
                weakSelf.type = WNXResultStateTypeGreat;
            } else if (onceTime < 1.2) {
                weakSelf.type = WNXResultStateTypeGood;
            } else {
                weakSelf.type = WNXResultStateTypeOK;
            }
            weakSelf.allTime += onceTime;
            [weakSelf.stateView showStateViewWithType:weakSelf.type stageViewHiddenFinishBlock:^{
                if (isPass) {
                    [weakSelf showResultControllerWithNewScroe:(int)(weakSelf.allTime / 18 * 1000) unit:@"MS" stage:weakSelf.stage isAddScore:YES];
                } else {
                    [(YBSCountTimeView *)weakSelf.countScore cleanData];
                    [weakSelf.bottom cleanData];
                    [weakSelf.guessView startGuess];
                }
            }];
        }];
    };
}
#pragma mark - Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    [self.bottom changeBottomImageViewWihtIndex:0 type:WNXStage13BottomTypePeople];
    [self.bottom changeBottomImageViewWihtIndex:1 type:WNXStage13BottomTypePeople];
    [self.bottom changeBottomImageViewWihtIndex:2 type:WNXStage13BottomTypePeople];
    [self.guessView startGuess];
}
- (void)pauseGame {
    [(YBSCountTimeView *)self.countScore pause];
    [self.guessView pause];
    [super pauseGame];
}
- (void)continueGame {
    [super continueGame];
    [(YBSCountTimeView *)self.countScore continueGame];
    [self.guessView resume];
}
- (void)playAgainGame {
    [(YBSCountTimeView *)self.countScore cleanData];
    [self.bottom cleanData];
    [self.guessView cleanData];
    [super playAgainGame];
}
#pragma mark - Action
- (void)btnClick:(UIButton *)sender {
    [self.bottom showPeopleImageViewWithIndex:sender.tag];
    __weak typeof(self) weakSelf = self;
    sender.userInteractionEnabled = NO;
    if ([self.guessView guessPeopleWithGuessType:sender.tag]) {
        [self.bottom changeBottomImageViewWihtIndex:sender.tag type:WNXStage13BottomTypeTick];
    } else {
        [self.bottom changeBottomImageViewWihtIndex:sender.tag type:WNXStage13BottomTypeNone];
        self.view.userInteractionEnabled = NO;
        [(YBSCountTimeView *)self.countScore stopCalculateByTimeWithTimeBlock:nil];
        [self.guessView showFailWithIsShowPeople:YES AnimationFinish:^{
            [weakSelf showGameFail];
        }];
    }
}
@end
