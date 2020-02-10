#import "AppMetodRouter.h"
#import "AppDelegate.h"
#import "PurelyGracefulCalculateController.h"
#import "TugNiecePresentationalController.h"
#import "ComeAgainstConclusionController.h"
#import "WearStockingUrban.h"

@implementation AppMetodRouter

+(void)jumpBaserConterl{
     __weak typeof(self) weakSelf = self;
    TugNiecePresentationalController *launchAnimationVC = [[TugNiecePresentationalController alloc] init];
    [[self class] toHomeViewConterl:launchAnimationVC];
    launchAnimationVC.animationFinish = ^{
        [[weakSelf class] EnteryBaseConterl];
    };
}

+(void)EnteryBaseConterl{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
       PurelyGracefulCalculateController *tabBar = (PurelyGracefulCalculateController *)[sb instantiateViewControllerWithIdentifier:@"RootNavigationController"];
    [[self class] toHomeViewConterl:tabBar];
}

+(void)loadPrivacyAlert{
     NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
     BOOL isNotFist = [userDefaults boolForKey:@"isNotFist"];
     if (isNotFist) {
            [[self class] EnteryBaseConterl];
      }else{
          [[self class] EnteryBaseConterl];
        WearStockingUrban*sportsAlert = [WearStockingUrban initYBSportsAlertWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) delegate:nil ];
         [sportsAlert setAnimationType:YBSportsAlertAnimationTypeDefault];
         AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
        [sportsAlert imposeDenseBlock:appDelegate.window.rootViewController];
      }
}

+(void)toHomeViewConterl:(UIViewController*)controller{
    AppDelegate *appDelegate =  (AppDelegate*)[[UIApplication sharedApplication] delegate];
    appDelegate.window.rootViewController = controller;
    appDelegate.window.backgroundColor = [UIColor whiteColor];
    if (![appDelegate.window isKeyWindow]) {
        [appDelegate.window makeKeyAndVisible];
    }
}
@end


