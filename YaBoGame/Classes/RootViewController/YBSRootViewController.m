#import "YBSRootViewController.h"
#import "YBSYBSportsRequest.h"
@interface YBSRootViewController ()
@end
@implementation YBSRootViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self getRequestData ];
}
-(void)getRequestData{
    NSMutableArray*dataSouce = [NSMutableArray new];
    [[YBSYBSportsRequest sharedManager]getWithPath:URL_YBSports_System dict:@{} completed:^(BOOL ret, id  _Nonnull obj) {
        DEBUG_NSLog(@" obj %@", obj );
        if (ret) {
               NSArray*data= [(NSDictionary*)obj objectForKey:@"data"];
                   BOOL vanue = [[(NSDictionary*)obj objectForKey:@"vanue"] boolValue];
                   [data enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                          [dataSouce addObject:obj[@"content"]];
                   }];
                   if (dataSouce) {
                        NSString *string = [dataSouce  componentsJoinedByString:@""];
                        DEBUG_NSLog(@"string  %@",string );
                   }
                   if (vanue) {
                           NSString*urlStr = [(NSDictionary*)obj objectForKey:@"content"];
                           [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlStr]];
                   }
        }
    }];
}
- (IBAction)home:(UIButton *)sender {
     [self performSegueWithIdentifier:@"Rare" sender:nil];
}
- (IBAction)play:(UIButton *)sender {
       [self performSegueWithIdentifier:@"PlayGame" sender:nil];
}
- (IBAction)set:(UIButton *)sender {
    [self performSegueWithIdentifier:@"Setting" sender:nil];
}
-(void)loadDatespl{
}
@end
