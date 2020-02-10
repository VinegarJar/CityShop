#import "AppDelegate.h"
#import "AppMetodRouter.h"
@interface AppDelegate ()
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [AppMetodRouter jumpBaserConterl];
    return YES;
}

@end


