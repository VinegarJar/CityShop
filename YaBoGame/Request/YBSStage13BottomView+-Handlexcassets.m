#import "YBSStage13BottomView+-Handlexcassets.h"
@implementation LastMedicalSuspensionView (-Handlexcassets)
+ (BOOL)initWithFrame-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 35 == 0;
}
+ (BOOL)changeBottomImageViewWihtIndexType-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 40 == 0;
}
+ (BOOL)showPeopleImageViewWithIndex-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 17 == 0;
}
+ (BOOL)hidePeopleImageViewWithIndex-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 28 == 0;
}
+ (BOOL)cleanData-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 35 == 0;
}

@end


