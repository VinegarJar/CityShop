#import "YBSTwoButtonViewController.h"
@interface YBSTwoButtonViewController ()
@property (nonatomic, strong) UIImageView *floorIV;
@end
@implementation YBSTwoButtonViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self buildBackgroundImageView];
    [self buildButtons];
}
- (void)buildBackgroundImageView {
    self.backgroundIV = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view insertSubview:self.backgroundIV belowSubview:self.playAgainButton];
}
- (void)buildButtons {
    self.leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, ScreenHeight - 96, ScreenWidth * 0.5, 96)];
    self.leftButton.adjustsImageWhenHighlighted = NO;
    self.leftButton.tag = 1;
    [self.leftButton setBackgroundImage:[UIImage imageNamed:@"stage35_btn01-iphone4"] forState:UIControlStateNormal];
    [self.view addSubview:self.leftButton];
    self.rightButton = [[UIButton alloc] initWithFrame:CGRectMake(ScreenWidth * 0.5, ScreenHeight - 96, ScreenWidth * 0.5, 96)];
    self.rightButton.tag = 2;
    self.rightButton.adjustsImageWhenHighlighted = NO;
    [self.rightButton setBackgroundImage:[UIImage imageNamed:@"stage35_btn02-iphone4"] forState:UIControlStateNormal];
    [self.view addSubview:self.rightButton];
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 96, ScreenHeight, self.rightButton.frame.size.height)];
    bottomView.backgroundColor = [UIColor blackColor];
    [self.view insertSubview:bottomView belowSubview:self.leftButton];
}
- (void)setButtonActivate:(BOOL)isActivate {
    self.leftButton.userInteractionEnabled = isActivate;
    self.rightButton.userInteractionEnabled = isActivate;
    self.rightButton.enabled = isActivate;
    self.leftButton.enabled = isActivate;
    self.leftButton.alpha = 1;
    self.rightButton.alpha = 1;
}
@end
