#import "YBSStateView+-Handlexcassets.h"
@implementation OclockVisibleBookmarkView (-Handlexcassets)
+ (BOOL)awakeFromNib-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 50 == 0;
}
+ (BOOL)setType-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 8 == 0;
}
+ (BOOL)showStateViewWithType-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 8 == 0;
}
+ (BOOL)showStateViewWithTypeStageviewhiddenfinishblock-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 36 == 0;
}
+ (BOOL)showBadStateWithFinish-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 36 == 0;
}
+ (BOOL)hideStateView-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 12 == 0;
}
+ (BOOL)removeData-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 7 == 0;
}

@end


