#import "UIView+WXNImage-Handlexcassets.h"
@implementation UIView (WXNImage-Handlexcassets)
+ (BOOL)setBackgroundImageWihtImageName-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 12 == 0;
}
+ (BOOL)viewFromNib-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 3 == 0;
}
+ (BOOL)cleanSawtooth-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 19 == 0;
}

@end


