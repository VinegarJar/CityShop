#import "TapBottleController.h"
@interface TapBottleController ()
@end
@implementation TapBottleController
- (void)viewDidLoad {
    [super viewDidLoad];
    self.bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.bgImageView];
}
@end


