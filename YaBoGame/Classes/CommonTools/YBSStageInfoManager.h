#import <Foundation/Foundation.h>
@class YBSStageInfo;
@interface YBSStageInfoManager : NSObject
+ (instancetype)sharedStageInfoManager;
- (BOOL)saveStageInfo:(YBSStageInfo *)stageInfo;
- (YBSStageInfo *)stageInfoWithNumber:(int)number;
- (BOOL)unlockNextStage;
@end
