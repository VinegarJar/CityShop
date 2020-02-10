#import "UIColor+YBSColor.h"
@implementation UIColor (WNXColor)
+ (instancetype)colorWithR:(int)red g:(int)green b:(int)blue {
    UIColor *color = [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1];
    return color;
}
+ (instancetype)random {
    return [UIColor colorWithR:arc4random_uniform(256) g:arc4random_uniform(256) b:arc4random_uniform(256)];
}
@end
