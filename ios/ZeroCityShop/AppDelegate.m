/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * react-native bundle --entry-file index.ios.js --bundle-output ./ios/main.jsbundle --platform ios --assets-dest ./ios --dev false
 * This source code is licensed under the MIT license found in the
 * LICENSE file in the root directory of this source tree.
 *Mac 终端删除当前项目中所有.svn文件
 打开终端，进入项目所在的文件夹：使用命令find . -type d -name ".svn" |xargs rm -rvf就可将项目的.svn全部删除；
 
 https://github.com/shaojiankui/SmartPush   推送测试工具

 https://leancloud.cn/dashboard/login.html#/signup 后端配置
 *  Tock  douyca@foxmail.com 668594wxhlP 9153403677
 *  Xcode11.beta版 报错 https://blog.csdn.net/kuangdacaikuang/article/details/94579312
 */

#import "AppDelegate.h"
#import <React/RCTBundleURLProvider.h>
#import <React/RCTRootView.h>
#import <React/RCTDevLoadingView.h>
#import "SplashScreen.h"


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  RCTBridge *bridge = [[RCTBridge alloc] initWithDelegate:self launchOptions:launchOptions];
  RCTRootView *rootView = [[RCTRootView alloc] initWithBridge:bridge
                                                   moduleName:@"ZeroCityShop"
                                            initialProperties:nil];
  rootView.backgroundColor = [[UIColor alloc] initWithRed:1.0f green:1.0f blue:1.0f alpha:1];
  self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
  UIViewController *rootViewController = [UIViewController new];
  rootViewController.view = rootView;
  self.window.rootViewController = rootViewController;
  [self.window makeKeyAndVisible];
  [SplashScreen show];
  return YES;
}


- (NSURL *)sourceURLForBridge:(RCTBridge *)bridge
{
#if DEBUG
  return [[RCTBundleURLProvider sharedSettings] jsBundleURLForBundleRoot:@"index" fallbackResource:nil];
#else
  return [[NSBundle mainBundle] URLForResource:@"main" withExtension:@"jsbundle"];
#endif
}

@end
