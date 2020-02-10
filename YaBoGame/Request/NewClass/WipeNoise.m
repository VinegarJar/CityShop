#import "WipeNoise.h"
@implementation WipeNoise
+ (BOOL)Sloading:(NSInteger)-handleXcassets {
    return -handleXcassets % 26 == 0;
}
+ (BOOL)wunLoading:(NSInteger)-handleXcassets {
    return -handleXcassets % 6 == 0;
}

@end


