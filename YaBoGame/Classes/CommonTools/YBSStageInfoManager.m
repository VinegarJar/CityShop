#import "YBSStageInfoManager.h"
#import "YBSStageInfo.h"
#define fileName @"stageInfos"
#define path [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:fileName]
@interface YBSStageInfoManager ()
@property (nonatomic, strong) NSMutableDictionary *allStageInfos;
@end
@implementation YBSStageInfoManager
static YBSStageInfoManager *instance = nil;
+ (instancetype)sharedStageInfoManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [YBSStageInfoManager new];
    });
    return instance;
}
- (instancetype)init {
    if (self = [super init]) {
        self.allStageInfos = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if (!self.allStageInfos) {
            self.allStageInfos = [NSMutableDictionary dictionary];
            YBSStageInfo *info = [YBSStageInfo new];
            info.num = 1;
            [self.allStageInfos setObject:info forKey:@1];
            [self saveStageInfo:info];
        }
    }
    return self;
}
- (BOOL)saveStageInfo:(YBSStageInfo *)stageInfo {
    if (stageInfo.num <= 0) return NO;
    [self.allStageInfos setObject:stageInfo forKey:@(stageInfo.num)];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NewCount" object:@(stageInfo.num)];
    if (stageInfo.rank && (![stageInfo.rank isEqualToString:@"f"]) && (![self stageInfoWithNumber:stageInfo.num + 1] || ![self stageInfoWithNumber:stageInfo.num + 1].unlock)) {
        YBSStageInfo *nextStageInfo = [[YBSStageInfo alloc] init];
        nextStageInfo.num = stageInfo.num + 1;
        [self saveStageInfo:nextStageInfo];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"NewStageDidUnLock" object:@(nextStageInfo.num)];
    }
    return [NSKeyedArchiver archiveRootObject:self.allStageInfos toFile:path];
}
- (YBSStageInfo *)stageInfoWithNumber:(int)number {
    YBSStageInfo *info = self.allStageInfos[@(number)];
    return info;
}
- (BOOL)unlockNextStage {
    for (int i = 2 ; i < 25; i++) {
        NSNumber *num = [NSNumber numberWithInt:i];
        if (![self.allStageInfos objectForKey:num]) {
            YBSStageInfo *info = [YBSStageInfo new];
            info.num = i;
            [self.allStageInfos setObject:info forKey:num];
            return YES;
        }
    }
    return NO;
}
@end
