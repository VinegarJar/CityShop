#import "YBSStage03ViewController.h"
#import "YBSStage03HeaderView.h"
#import "YBSTimeCountView.h"
@interface YBSStage03ViewController ()
@property (nonatomic, strong) YBSStage03HeaderView *headerView;
@property (nonatomic, assign) CGFloat scroe;
@end
@implementation YBSStage03ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildStageInfo];
}
- (void)buildStageInfo {
    self.backgroundIV.image = [UIImage imageNamed:@"23_bg-iphone4"];
    [self.leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self.rightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    self.headerView = [[YBSStage03HeaderView alloc] initWithFrame:CGRectMake(0, CGRectGetMinY(self.leftButton.frame) - 250, ScreenWidth, 350)];
    [self.view addSubview:self.headerView];
    [self.view insertSubview:self.headerView belowSubview:self.leftButton];
    [self buildBottomImageView];
    [self bringPauseAndPlayAgainToFront];
}
- (void)buildBottomImageView {
    [self buildBottonImageViewWithFrame:CGRectMake(13, 0, 55, 40) image:[UIImage imageNamed:@"23_Rarrow-iphone4"]];
    [self buildBottonImageViewWithFrame:CGRectMake(78, 0 , 66, 64) image:[UIImage imageNamed:@"23_bticon-iphone4"]];
    [self buildBottonImageViewWithFrame:CGRectMake(ScreenWidth * 0.5 + 13, 0, 66, 64) image:[UIImage imageNamed:@"23_bticon-iphone4"]];
    [self buildBottonImageViewWithFrame:CGRectMake(ScreenWidth * 0.5 + 79 + 10, 0, 55, 40) image:[UIImage imageNamed:@"23_Barrow-iphone4"]];
}
- (void)buildBottonImageViewWithFrame:(CGRect)frame image:(UIImage *)image {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.center = CGPointMake(imageView.center.x, self.rightButton.center.y);
    imageView.image = image;
    [self.view addSubview:imageView];
}
#pragma mark - Override Method
- (void)readyGoAnimationFinish {
    [super readyGoAnimationFinish];
    [self beginGame];
}
- (void)beginGame {
    [super beginGame];
    __weak __typeof(self) weakSelf = self;
    [((YBSTimeCountView *)self.countScore) startCalculateTime];
    [self.headerView startWithFailBlock:^{
        [weakSelf endGame];
    } stopCalculateTime:^{
        weakSelf.scroe = [((YBSTimeCountView *)weakSelf.countScore) stopCalculateTime];
    }];
}
- (void)endGame {
    [super endGame];
    [self showResultControllerWithNewScroe:self.scroe unit:@"秒" stage:self.stage isAddScore:YES];
}
- (void)pauseGame {
    [super pauseGame];
    [self.headerView pause];
    [((YBSTimeCountView *)self.countScore) pause];
}
- (void)continueGame {
    [super continueGame];
    [self.headerView resumed];
    [((YBSTimeCountView *)self.countScore) resumed];
}
- (void)playAgainGame {
    [self.headerView again];
    [((YBSTimeCountView *)self.countScore) cleadData];
    [super playAgainGame];
}
#pragma mark - Method
#pragma mark - Action
- (void)buttonClick:(UIButton *)sender {
    if (sender.tag == 1) {
        [self.headerView leftBtnClick];
    } else if(sender.tag == 2) {
        [self.headerView rightBtnClick];
    }
}
@end
