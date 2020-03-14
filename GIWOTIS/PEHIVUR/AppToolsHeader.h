//
//  AppToolsHeader.h
//  PEHIVUR
//
//  Created by admin on 14/3/2020.
//  Copyright © 2020 PEHIVUR. All rights reserved.
//

#ifndef AppToolsHeader_h
#define AppToolsHeader_h

#define APP_ID @"BfhCX7hNFtkQ0DlW79M5kEqp-gzGzoHsz"
#define APP_KEY @"cXIinf17uf4G1he7tSxzPzwb"
#define API_URL @"https://bfhcx7hn.lc-cn-n1-shared.com"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0xFF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define BarHight \
({\
CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];\
CGRect rectNav = self.navigationController.navigationBar.frame;\
( rectStatus.size.height+ rectNav.size.height);\
})\



typedef NS_ENUM(UInt32, UIColorRGB) {
     MiansColor        = 0xFFBA97,
     MianColor         = 0xD44000,

};


#endif /* AppToolsHeader_h */
