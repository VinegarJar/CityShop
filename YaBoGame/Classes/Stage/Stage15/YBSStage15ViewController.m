#import "YBSStage15ViewController.h"
#import "YBSStage15View.h"
#import "YBSTimeCountView.h"
@interface YBSStage15ViewController ()
@property (nonatomic, strong) YBSStage15View *jumpView;
@end
@implementation YBSStage15ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildStageInfo];
}
- (void)buildStageInfo {
    [self removeAllImageView];
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:ScreenBounds];
    bgView.image = [UIImage imageNamed:@"stage36_bg-iphone4"];
    [self.view insertSubview:bgView belowSubview:self.redButton];
    [self buildJumpView];
    [self addButtonsActionWithTarget:self action:@selector(jump:) forControlEvents:UIControlEventTouchDown];
    [self bringPauseAndPlayAgainToFront];
}
- (void)buildJumpView {
    __weak typeof(self) weakSelf = self;
    self.jumpView = [YBSStage15View new];
    [self.view insertSubview:self.jumpView belowSubview:self.redButton];
    self.jumpView.buttonActivate = ^{
        [weakSelf setButtonsIsActivate:YES];
    };
    self.jumpView.passStage = ^{
        weakSelf.view.userInteractionEnabled = NO;
        NSTimeInterval scroe = [(YBSTimeCountView *)weakSelf.countScore stopCalculateTime];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf showResultControllerWithNewScroe:scroe unit:@"s" stage:weakSelf.stage isAddScore:YES];
        });
    };
}
#pragma mark - Super Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    [(YBSTimeCountView *)self.countScore startCalculateTime];
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
    [(YBSTimeCountView *)self.countScore cleadData];
    [self.jumpView removeFromSuperview];
    self.jumpView = nil;
    [self buildJumpView];
    [super playAgainGame];
}
#pragma mark - Action
- (void)jump:(UIButton *)sender {
    [self setButtonsIsActivate:NO];
    [self.jumpView jumpToNextRowWithIndex:(int)sender.tag];
}
@end
