#import "YBSBackgroundViewController.h"
@interface YBSBackgroundViewController ()
@end
@implementation YBSBackgroundViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.bgImageView];
}
@end
