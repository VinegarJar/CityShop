//
//  GlobalMacros.h
//  ryp_rn_supplier
//
//  Created by ryp-app01 on 2019/6/25.
//  Copyright © 2019年 Facebook. All rights reserved.
//

#ifndef GlobalMacros_h
#define GlobalMacros_h

#ifdef DEBUG
#define DEBUG_NSLog(format, ...) printf("\n[%s] %s [第%d行] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);

#else
#define DEBUG_NSLog(format, ...)

#endif


#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)


#define isIphoneX (SCREEN_WIDTH == 375.f && SCREEN_HEIGHT == 812.f ? YES : NO)
#define StatusNav_Height (isIphoneX ? 88 : 64)



#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define ICBundle [NSBundle mainBundle]


typedef NS_ENUM(UInt32, ColorRGBType) {
  titleColor             = 0x2D2D2D,
  bagRefColor        = 0xEFEFF4,
  verifyColor           = 0x3F50F3,
  gobackColor        = 0x2D2D2D,
  inputViewBgColor  = 0xf7f7f7  ,
  inputViewborderColor= 0xefefef ,
};

//设置app开发环境
#define AppSever  1

#if  AppSever==1  //dev

#define BASE_MODE     @"dev"
#define  Bugly_AppID     @"adb859ed6f"
#define  Bugly_Appkey    @"41f6cc35-f3ab-4c80-bf9e-f9ddb44086bc"
#define  WX_APPID       @"wx8dc4c503a0253f40"
#define  WX_SECRET    @"b0a08edecc0f3ffd813cf8c84f127433"
#define  XM_APPID       @"2882303761517941736"
#define  XM_AppKey       @"5111794145736"
#define  XM_AppSecret       @"/M8pCwwYcjCalCet+0Yz6Q=="


#elif AppSever==2  //beta

#define  BASE_MODE  @"beta"
#define  Bugly_AppID     @"f0b4c9648d"
#define  Bugly_Appkey   @"12dfc81f-9944-4c21-95ee-1e64e4490401"
#define  WX_APPID       @"wx8dc4c503a0253f40"
#define  WX_SECRET    @"b0a08edecc0f3ffd813cf8c84f127433"
#define  XM_APPID       @"2882303761517941735"
#define  XM_AppKey       @"5791794146735"
#define  XM_AppSecret       @"sz6zByNCJOmju6O+bCoDIw=="


#elif AppSever==3   //demo
#define BASE_MODE  @"alpha"
#define  Bugly_AppID     @"2898edfa81"
#define  Bugly_Appkey   @"2842d13d-0781-4fb3-8ed6-c97b3bed1de7"
#define  WX_APPID       @"wx8dc4c503a0253f40"
#define  WX_SECRET    @"b0a08edecc0f3ffd813cf8c84f127433"
#define  XM_APPID       @"2882303761517941738"
#define  XM_AppKey       @"5521794182738"
#define  XM_AppSecret       @" HAoy/+hXMQRzI5M4rBD0Uw=="

#elif AppSever==4   //release
#define BASE_MODE  @"release"
#define  Bugly_AppID     @"2898edfa81"
#define  Bugly_Appkey   @"2842d13d-0781-4fb3-8ed6-c97b3bed1de7"
#define  WX_APPID       @"wx8dc4c503a0253f40"
#define  WX_SECRET    @"b0a08edecc0f3ffd813cf8c84f127433"
#define  XM_APPID       @"2882303761517941732"
#define  XM_AppKey       @"5161794153732"
#define  XM_AppSecret       @"AkUhlshldqUJQJKd4GVDEw=="

#endif

#endif /* GlobalMacros_h */
