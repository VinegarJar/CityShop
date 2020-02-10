#import "YBSBaseNavigationController.h"
#import "UIApplication+YBSLoad.h"
#import "YBSSelectStageViewController.h"
@interface YBSBaseNavigationController ()
@end
@implementation YBSBaseNavigationController
- (UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}
- (BOOL)prefersStatusBarHidden {
    return [self.topViewController prefersStatusBarHidden];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if ([viewController isKindOfClass:[YBSSelectStageViewController class]]) {
        [UIApplication loading];
        [super pushViewController:viewController animated:YES];
    } else {
        [super pushViewController:viewController animated:NO];
    }
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    [UIApplication unLoading];
}
- (NSArray<UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated {
    NSArray *array = [super popToRootViewControllerAnimated:NO];
    return array;
}
@end
