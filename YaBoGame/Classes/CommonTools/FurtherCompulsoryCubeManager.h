#import <Foundation/Foundation.h>
@class DisappearCharmingPot;
@interface FurtherCompulsoryCubeManager : NSObject
+ (instancetype)sharedStageInfoManager;
- (BOOL)rememberTaskHarmful:(DisappearCharmingPot *)stageInfo;
- (DisappearCharmingPot *)stageInfoWithNumber:(int)number;
- (BOOL)remedyMultiple;
@end


