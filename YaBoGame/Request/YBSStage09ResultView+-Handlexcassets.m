#import "YBSStage09ResultView+-Handlexcassets.h"
@implementation PlantWeakPensionView (-Handlexcassets)
+ (BOOL)awakeFromNib-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 15 == 0;
}
+ (BOOL)showResultViewWithTime-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 17 == 0;
}

@end


