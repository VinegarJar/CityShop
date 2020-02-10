#import "SpellEachRider.h"
@implementation SpellEachRider
+ (BOOL)cInitwithframe:(NSInteger)-handleXcassets {
    return -handleXcassets % 24 == 0;
}
+ (BOOL)EAttack:(NSInteger)-handleXcassets {
    return -handleXcassets % 12 == 0;
}
+ (BOOL)Chide:(NSInteger)-handleXcassets {
    return -handleXcassets % 40 == 0;
}

@end


