#import "AppDelegate.h"
#import "TrimOriginMagnetic.h"
@interface AppDelegate ()
@end
@implementation AppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [TrimOriginMagnetic jumpBaserConterl];
    return YES;
}

@end


