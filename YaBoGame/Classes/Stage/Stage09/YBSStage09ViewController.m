#import "YBSStage09ViewController.h"
#import "YBSStage09BobmView.h"
@interface YBSStage09ViewController ()
@property (nonatomic, strong) YBSStage09BobmView *bobmView;
@end
@implementation YBSStage09ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildStageInfo];
}
- (void)buildStageInfo {
    UIImageView *yellowLineIV1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 16)];
    yellowLineIV1.image = [UIImage imageNamed:@"14_line-iphone4"];
    [self.view addSubview:yellowLineIV1];
    UIImageView *yellowLineIV2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, ScreenHeight - self.redButton.frame.size.height - 16, ScreenWidth, 16)];
    yellowLineIV2.image = [UIImage imageNamed:@"14_line-iphone4"];
    [self.view addSubview:yellowLineIV2];
    [self setButtonImage:[UIImage imageNamed:@"14_stopsign-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    [self addButtonsActionWithTarget:self action:@selector(stopBtnClick:) forControlEvents:UIControlEventTouchDown];
    __weak typeof(self) weakSelf = self;
    self.bobmView = [[YBSStage09BobmView alloc] initWithFrame:CGRectMake(0, 0, 16, ScreenHeight - 16 - self.redButton.frame.size.height)];
    [self.view insertSubview:self.bobmView belowSubview:self.playAgainButton];
    self.bobmView.nextBlock = ^{
        weakSelf.redImageView.highlighted = NO;
        weakSelf.yellowImageView.highlighted = NO;
        weakSelf.blueImageView.highlighted = NO;
        [weakSelf.bobmView showBobm];
        [weakSelf setButtonsIsActivate:YES];
    };
    self.bobmView.passBlock = ^(NSTimeInterval score){
        weakSelf.view.userInteractionEnabled = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf showResultControllerWithNewScroe:score unit:@"秒" stage:weakSelf.stage isAddScore:YES];
        });
    };
    self.bobmView.failBlock = ^{
        [weakSelf showGameFail];
    };
    [self bringPauseAndPlayAgainToFront];
}
#pragma mark - Action 
- (void)stopBtnClick:(UIButton *)sender {
    [self.bobmView stopCountWithIndex:(int)sender.tag];
    sender.userInteractionEnabled = NO;
    switch (sender.tag) {
        case 0:
            self.redImageView.highlighted = YES;
            break;
        case 1:
            self.yellowImageView.highlighted = YES;
            break;
        case 2:
            self.blueImageView.highlighted = YES;
            break;
        default:
            break;
    }
}
#pragma mark - Super Method 
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    [self.bobmView showBobm];
    [self setButtonsIsActivate:YES];
}
- (void)playAgainGame {
    [super playAgainGame];
    [self.bobmView cleanData];
    self.redImageView.highlighted = NO;
    self.yellowImageView.highlighted = NO;
    self.blueImageView.highlighted = NO;
}
- (void)pauseGame {
    [super pauseGame];
    [self.bobmView pause];
}
- (void)continueGame {
    [super continueGame];
    [self.bobmView resume];
}
@end
