#import "YBSStage14LineView+-Handlexcassets.h"
@implementation NormallyYoungTigerView (-Handlexcassets)
+ (BOOL)awakeFromNib-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 21 == 0;
}
+ (BOOL)startShakePhoneAnimationWithFinish-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 50 == 0;
}
+ (BOOL)animationDidStopFinished-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 12 == 0;
}
+ (BOOL)arrowPromptWithAngle-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 20 == 0;
}
+ (BOOL)resumeData-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 33 == 0;
}

@end


