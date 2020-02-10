#import "YBSColumnIceView+-Handlexcassets.h"
@implementation KnowCommitteeView (-Handlexcassets)
+ (BOOL)awakeFromNib-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 6 == 0;
}
+ (BOOL)showColumnDottedLineWithNum-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 19 == 0;
}
+ (BOOL)cleanTransform-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 12 == 0;
}

@end


