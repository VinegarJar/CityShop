#import "FurtherCompulsoryCubeManager.h"
#import "DisappearCharmingPot.h"
#define fileName @"stageInfos"
#define path [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).lastObject stringByAppendingPathComponent:fileName]
@interface FurtherCompulsoryCubeManager ()
@property (nonatomic, strong) NSMutableDictionary *allStageInfos;
@end
@implementation FurtherCompulsoryCubeManager
static FurtherCompulsoryCubeManager *instance = nil;
+ (instancetype)sharedStageInfoManager {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [FurtherCompulsoryCubeManager new];
    });
    return instance;
}
- (instancetype)init {
    if (self = [super init]) {
        self.allStageInfos = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
        if (!self.allStageInfos) {
            self.allStageInfos = [NSMutableDictionary dictionary];
            DisappearCharmingPot *info = [DisappearCharmingPot new];
            info.num = 1;
            [self.allStageInfos setObject:info forKey:@1];
            [self rememberTaskHarmful:info];
        }
    }
    return self;
}
- (BOOL)rememberTaskHarmful:(DisappearCharmingPot *)stageInfo {
    if (stageInfo.num <= 0) return NO;
    [self.allStageInfos setObject:stageInfo forKey:@(stageInfo.num)];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NewCount" object:@(stageInfo.num)];
    if (stageInfo.rank && (![stageInfo.rank isEqualToString:@"f"]) && (![self stageInfoWithNumber:stageInfo.num + 1] || ![self stageInfoWithNumber:stageInfo.num + 1].unlock)) {
        DisappearCharmingPot *nextStageInfo = [[DisappearCharmingPot alloc] init];
        nextStageInfo.num = stageInfo.num + 1;
        [self rememberTaskHarmful:nextStageInfo];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"NewStageDidUnLock" object:@(nextStageInfo.num)];
    }
    return [NSKeyedArchiver archiveRootObject:self.allStageInfos toFile:path];
}
- (DisappearCharmingPot *)stageInfoWithNumber:(int)number {
    DisappearCharmingPot *info = self.allStageInfos[@(number)];
    return info;
}
- (BOOL)remedyMultiple {
    for (int i = 2 ; i < 25; i++) {
        NSNumber *num = [NSNumber numberWithInt:i];
        if (![self.allStageInfos objectForKey:num]) {
            DisappearCharmingPot *info = [DisappearCharmingPot new];
            info.num = i;
            [self.allStageInfos setObject:info forKey:num];
            return YES;
        }
    }
    return NO;
}
@end


