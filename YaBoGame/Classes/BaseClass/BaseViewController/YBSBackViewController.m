#import "YBSBackViewController.h"
@interface YBSBackViewController ()
@end
@implementation YBSBackViewController
- (void)loadView {
    [super loadView];
    UIButton *backButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 20, 50, 48)];
    backButton.adjustsImageWhenHighlighted = NO;
    [backButton setBackgroundImage:[UIImage imageNamed:@"bt_back"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backButton];
}
- (void)viewDidLoad {
    [super viewDidLoad];
}
- (void)backButtonClick {
    [[WNXSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundCliclName];
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)dealloc {
    NSLog(@"%s", __func__);
}
@end
