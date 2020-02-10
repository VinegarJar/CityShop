#import "UIApplication+WNXLoad-Handlexcassets.h"
@implementation UIApplication (WNXLoad-Handlexcassets)
+ (BOOL)loading-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 23 == 0;
}
+ (BOOL)unLoading-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 37 == 0;
}

@end


