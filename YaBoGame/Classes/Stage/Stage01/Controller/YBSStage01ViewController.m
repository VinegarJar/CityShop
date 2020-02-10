#import "YBSStage01ViewController.h"
#import "YBSCountDownLabel.h"
#import "YBSFootView.h"
#import "YBSFeatherView.h"
#import "YBSScoreboardCountView.h"
#import "YBSStageInfoManager.h"
#define kStage01Duration 7.0
@interface YBSStage01ViewController ()
@property (nonatomic, strong) YBSCountDownLabel *timeLabel;
@property (nonatomic, strong) YBSFootView *footView;
@property (nonatomic, strong) YBSFeatherView *featherView;
@end
@implementation YBSStage01ViewController
- (void)viewDidLoad {    
    [super viewDidLoad];
    [self buildStageInfo];
}
#pragma mark - Build UI
- (void)buildStageInfo {
    self.buttonImageNames = @[@"01-btfeather", @"01-btfeather", @"01-btfeather"];
    [self.view bringSubviewToFront:self.guideImageView];
    [self addButtonsActionWithTarget:self action:@selector(featherClick:) forControlEvents:UIControlEventTouchDown];
    [self initTimeLabel];
    [self initFootView];
    [self initFeaterView];
    [self bringPauseAndPlayAgainToFront];
}
- (void)initTimeLabel {
    self.timeLabel = [[YBSCountDownLabel alloc] initWithFrame:CGRectMake(ScreenWidth - 55, ScreenHeight - self.redButton.frame.size.height - 50, 60, 50)
                                                    startTime:kStage01Duration textSize:30];
    [self.view insertSubview:self.timeLabel aboveSubview:self.redButton];
}
- (void)initFootView {
    self.footView = [[YBSFootView alloc] initWithFrame:CGRectMake(0, ScreenHeight - self.redButton.frame.size.height - 200 - 45, ScreenWidth / 3, 200)];
    [self.view insertSubview:self.footView aboveSubview:self.redButton];
}
- (void)initFeaterView {
    self.featherView = [[YBSFeatherView alloc] initWithFrame:CGRectMake((ScreenWidth / 3 - 100) * 0.5, ScreenHeight - self.redButton.frame.size.height - 160, 100, 73)];
    [self.view insertSubview:self.featherView aboveSubview:self.footView];
}
#pragma mark - Override Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    [self beginGame];
    __weak __typeof(&*self)weakSelf = self;
    [self.timeLabel startCountDownWithCompletion:^{
        [weakSelf endGame];
    }];
}
- (void)endGame {
    [super endGame];
    self.view.userInteractionEnabled = NO;
    [self.footView stopFootView];
    [self.featherView removeFromSuperview];
    [self showResultControllerWithNewScroe:[((YBSScoreboardCountView *)self.countScore).countLabel.text intValue] unit:@"PTS" stage:self.stage isAddScore:YES];
}
- (void)playAgainGame {
    [super playAgainGame];
    [self.footView clean];
    [self.timeLabel clean];
    [self setButtonsIsActivate:NO];
    [((YBSScoreboardCountView *)self.countScore) clean];
}
- (void)beginGame {
    [super beginGame];
    [self.footView startAnimation];
}
- (void)pauseGame {
    [super pauseGame];
    [self.footView pause];
    [self.timeLabel pause];
}
- (void)continueGame {
    [super continueGame];
    [self.footView continueFootView];
    [self.timeLabel continueWork];
}
#pragma mark - action
- (void)featherClick:(UIButton *)sender {
    [[WNXSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundFeatherClickName];
    [self.featherView attack:(int)sender.tag];
    if ([self.footView attackFootViewAtIndex:(int)sender.tag]) {
        [(YBSScoreboardCountView *)self.countScore hit];
    } else {
        [self showMissImageViewAtIndex:(int)sender.tag];
    }
}
- (void)showMissImageViewAtIndex:(int)index {
    UIImageView *missIV = [[UIImageView alloc] initWithFrame:CGRectMake((index * ScreenWidth / 3) + (ScreenWidth / 3 - 80) * 0.5, CGRectGetMinY(self.footView.frame), 80, 31)];
    missIV.image = [UIImage imageNamed:@"01_miss"];
    [self.view insertSubview:missIV belowSubview:self.footView];
    [UIView animateWithDuration:0.15 animations:^{
        missIV.transform = CGAffineTransformMakeTranslation(0, -100);
        missIV.alpha = 0;
    } completion:^(BOOL finished) {
        [missIV removeFromSuperview];
    }];
}
@end
