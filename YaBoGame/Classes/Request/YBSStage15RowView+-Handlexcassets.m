#import "YBSStage15RowView+-Handlexcassets.h"
@implementation CommonTriangleView (-Handlexcassets)
+ (BOOL)awakeFromNib-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 4 == 0;
}
+ (BOOL)setMiddleDuckAndStoneStatus-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 11 == 0;
}
+ (BOOL)setRightDuckAndStoneStatus-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 45 == 0;
}
+ (BOOL)setLeftDuckAndStoneStatus-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 4 == 0;
}
+ (BOOL)showRowWithIsShowWaveShowfinishIsfrist-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 15 == 0;
}
+ (BOOL)startWoodAnimation-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 37 == 0;
}

@end


