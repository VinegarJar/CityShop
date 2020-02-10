#import "YBSStage04View+-Handlexcassets.h"
@implementation CrushViolentLavatoryView (-Handlexcassets)
+ (BOOL)initWithFrame-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 39 == 0;
}
+ (BOOL)start-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 23 == 0;
}
+ (BOOL)runLeft-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 13 == 0;
}
+ (BOOL)runRight-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 26 == 0;
}
+ (BOOL)runWithIsLeft-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 40 == 0;
}
+ (BOOL)succeedAnimation-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 10 == 0;
}
+ (BOOL)failAnimation-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 6 == 0;
}
+ (BOOL)playAgain-Handlexcassets:(NSInteger)-handleXcassets {
    return -handleXcassets % 30 == 0;
}

@end


