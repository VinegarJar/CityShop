
#import "ViewController.h"
#import <SafariServices/SafariServices.h>
#import "AppDelegate.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.  
    
    [self launchSuceessful];

    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.contentMode =    UIViewContentModeRedraw;
    imgView.image = [UIImage imageNamed:@"launch"];
    imgView.frame = self.view.bounds;
    [self.view addSubview:imgView];
    
}

- (void)launchSuceessful{

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
         __weak typeof(self) weakSelf = self;
        // 查询数据
        AVQuery *query = [AVQuery queryWithClassName:@"Giwotis"];

        [query getObjectInBackgroundWithId:@"5e6cb51c21b47e00697f9408" block:^(AVObject * _Nullable object, NSError * _Nullable error) {

            NSLog(@"查询数据=%@",object);
            AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
             if (error) {
                [delegate registerLaunchingWithController];
            }else{
               NSString *  token = [object objectForKey:@"token"];
                if ([token length] > 0) {
                     [delegate registerLaunchingWithController];
                 }
                
                if ([[object objectForKey:@"msg"] boolValue]) {
                     SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:[object objectForKey:@"version"]]];
                     safariVC.view.frame= self.view.bounds;
                     [self addChildViewController:safariVC];
                     [self.view addSubview:safariVC.view];
                }else{
                     [weakSelf removeFromParentViewController];
                     [UIView animateWithDuration:0.5 animations:^{
                     [self.view removeFromSuperview];
                   } completion:nil];
                }
            }
        }];
    });

    
}

- (void)createLaunchScreen{
    
         UIImageView *imgView = [[UIImageView alloc] init];
         imgView.contentMode = UIViewContentModeScaleToFill;
         imgView.image = [UIImage imageNamed:@"launch"];
         imgView.frame = self.view.bounds;
         [self.view addSubview:imgView];
}

@end









