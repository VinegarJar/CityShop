#import "YBSStage18ViewController.h"
#import "YBSStage18PokerView.h"
#import "YBSCountTimeView.h"
@interface YBSStage18ViewController ()
@property (nonatomic, strong) YBSStage18PokerView *pokerView;
@property (nonatomic, assign) BOOL btnCanEdit;
@property (nonatomic, assign) int allScore;
@end
@implementation YBSStage18ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildStageInfo];
}
- (void)buildStageInfo {
    [super buildStageView];
    [self buildPokerView];
    [self setButtonImage:[UIImage imageNamed:@"20_same-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    [self addButtonsActionWithTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self bringPauseAndPlayAgainToFront];
}
- (void)buildPokerView {
    self.pokerView = [YBSStage18PokerView viewFromNib];
    [self.view insertSubview:self.pokerView belowSubview:self.redButton];
    __weak typeof(self) weakSelf = self;
    self.pokerView.startCountTime = ^{
        [(YBSCountTimeView *)weakSelf.countScore startCalculateByTimeWithTimeOut:^{
            weakSelf.view.userInteractionEnabled = NO;
            [weakSelf showGameFail];
        } outTime:2];
    };
    self.pokerView.showNextPoker = ^{
        weakSelf.btnCanEdit = [weakSelf.pokerView showPokerView];
        [weakSelf setButtonsIsActivate:YES];
    };
    self.pokerView.selectSamePokerSucess = ^(BOOL isPass){
        weakSelf.view.userInteractionEnabled = NO;
        [(YBSCountTimeView *)weakSelf.countScore stopCalculateByTimeWithTimeBlock:^(int second, int ms) {
            int onceTime = (second + ms / 60.0) * 1000;
            WNXResultStateType type;
            if (onceTime < 350) {
                type = WNXResultStateTypePerfect;
            } else if (onceTime < 500) {
                type = WNXResultStateTypeGreat;
            } else if (onceTime < 650) {
                type = WNXResultStateTypeGood;
            } else {
                type = WNXResultStateTypeGreat;
            }
            weakSelf.allScore += onceTime;
            [weakSelf.stateView showStateViewWithType:type stageViewHiddenFinishBlock:^{
                if (isPass) {
                    weakSelf.view.userInteractionEnabled = NO;
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [weakSelf showResultControllerWithNewScroe:weakSelf.allScore / 9 unit:@"ms" stage:weakSelf.stage isAddScore:YES];
                    });
                } else {
                    weakSelf.redImageView.highlighted = NO;
                    weakSelf.yellowImageView.highlighted = NO;
                    weakSelf.blueImageView.highlighted = NO;
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        weakSelf.btnCanEdit = [weakSelf.pokerView showPokerView];
                        [(YBSCountTimeView *)weakSelf.countScore cleanData];
                        [weakSelf setButtonsIsActivate:YES];
                    });
                }
            }];
        }];
    };
}
#pragma mark - Action
- (void)btnClick:(UIButton *)sender {
    [[WNXSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundClickAnsName];
    sender.userInteractionEnabled = NO;
    if (self.btnCanEdit) {
        if ([self.pokerView selectSamePokerWithIndex:sender.tag]) {
            if (sender.tag == 0) {
                self.redImageView.highlighted = YES;
            } else if (sender.tag == 1) {
                self.yellowImageView.highlighted = YES;
            } else {
                self.blueImageView.highlighted = YES;
            }
        } else {
            self.view.userInteractionEnabled = NO;
            [(YBSCountTimeView *)self.countScore stopCalculateByTimeWithTimeBlock:nil];
            self.pokerView.isFail = YES;
            __weak typeof(self) weakSelf = self;
            [self.stateView showBadStateWithFinish:^{
                [weakSelf showGameFail];
            }];
        }
    } else {
        self.view.userInteractionEnabled = NO;
        self.pokerView.isFail = YES;
        __weak typeof(self) weakSelf = self;
        [self.stateView showBadStateWithFinish:^{
            [weakSelf showGameFail];
        }];
    }
}
#pragma mark - Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    self.btnCanEdit = [self.pokerView showPokerView];
}
- (void)pauseGame {
    [(YBSCountTimeView *)self.countScore pause];
    [super pauseGame];
}
- (void)continueGame {
    [super continueGame];
    [(YBSCountTimeView *)self.countScore continueGame];
}
- (void)playAgainGame {
    self.redImageView.highlighted = NO;
    self.yellowImageView.highlighted = NO;
    self.blueImageView.highlighted = NO;
     self.pokerView.isFail = YES;
    [self.pokerView resumeData];
    [self.pokerView removeFromSuperview];
    self.pokerView = nil;
    [(YBSCountTimeView *)self.countScore cleanData];
    [self buildPokerView];
    [super playAgainGame];
}
@end
