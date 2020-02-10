#import "CreepAboutCoffinController.h"
#import "SorryEnvelopeController.h"
#import "FurtherCompulsoryCubeManager.h"
#import "DominateJointMereController.h"
typedef void(^RetryButtonClickBlock)();
@interface CreepAboutCoffinController ()
@property (nonatomic, copy) RetryButtonClickBlock retryButtonClickBlock;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
@implementation CreepAboutCoffinController
+ (instancetype)initWithStage:(BattleUponSplendour *)stage retryButtonClickBlock:(void (^)())retryButtonClickBlock {
    CreepAboutCoffinController *failVC = [[CreepAboutCoffinController alloc] init];
    failVC.stage = stage;
    failVC.retryButtonClickBlock = retryButtonClickBlock;
    failVC.titleLabel.text = stage.fail;
    return failVC;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    self.titleLabel.text = self.stage.fail;
}
- (IBAction)buttonClick:(UIButton *)sender {
    if (sender.tag == 10) {
        for (UIViewController *vc in self.navigationController.viewControllers) {
            if ([vc isKindOfClass:[DominateJointMereController class]]) {
                [self.navigationController popToViewController:vc animated:NO];
                return;
            }
        }
    } else if (sender.tag == 11) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"失败原因" message:self.stage.fail delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        [alertView show];
    } else if (sender.tag == 12) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.davechambers.co.uk "]];
    } else if (sender.tag == 13) {
        if (self.retryButtonClickBlock) {
            self.retryButtonClickBlock();
        }
    }
}
@end


