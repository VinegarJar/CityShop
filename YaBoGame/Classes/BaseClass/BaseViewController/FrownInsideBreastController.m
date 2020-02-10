#import "FrownInsideBreastController.h"
@interface FrownInsideBreastController ()
@end
@implementation FrownInsideBreastController
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
    [[YaBoOrgyTool sharedSoundToolManager] patWorthyLiberty:YaSoundCliclName];
    [self.navigationController popViewControllerAnimated:NO];
}
- (void)dealloc {
    NSLog(@"%s", __func__);
}
@end


