#import "YBSFailViewController.h"
#import "YBSPrepareViewController.h"
#import "YBSStageInfoManager.h"
#import "YBSSelectStageViewController.h"
typedef void(^RetryButtonClickBlock)();
@interface YBSFailViewController ()
@property (nonatomic, copy) RetryButtonClickBlock retryButtonClickBlock;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
@implementation YBSFailViewController
+ (instancetype)initWithStage:(YBSStage *)stage retryButtonClickBlock:(void (^)())retryButtonClickBlock {
    YBSFailViewController *failVC = [[YBSFailViewController alloc] init];
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
            if ([vc isKindOfClass:[YBSSelectStageViewController class]]) {
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
