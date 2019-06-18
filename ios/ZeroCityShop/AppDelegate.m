/**
 * Copyright (c) 2015-present, Facebook, Inc.
 *
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 */

#import "AppDelegate.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTDevLoadingView.h>
#import "SplashScreen.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  
  RCTRootView *rootView ;
#ifdef DEBUG
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithBundleURL:[[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index.ios" fallbackResource:nil]
                                            moduleProvider:nil
                                             launchOptions:launchOptions];
  [bridge moduleForClass:[RCTDevLoadingView class]];
  rootView = [[RCTRootView alloc] initWithBridge:bridge
                                      moduleName:@"ZeroCityShop"
                               initialProperties:nil];
  
#else
  rootView = [[RCTRootView alloc] initWithBundleURL:[[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"]
                                         moduleName:@"ZeroCityShop"
                                  initialProperties:nil
                                      launchOptions:launchOptions];
#endif
  

  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
   // [SplashScreen show];
  return YES;
}

@end
