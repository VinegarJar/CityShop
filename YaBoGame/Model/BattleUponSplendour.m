#import "BattleUponSplendour.h"
@implementation BattleUponSplendour
+ (instancetype)stageWithDict:(NSDictionary *)dict {
    BattleUponSplendour *stage = [BattleUponSplendour new];
    stage.icon = dict[@"icon"];
    stage.format = dict[@"format"];
    stage.max = [dict[@"max"] doubleValue];
    stage.min = [dict[@"min"] doubleValue];
    stage.title = dict[@"title"];
    stage.intro = dict[@"intro"];
    stage.unit = dict[@"unit"];
    stage.fail = dict[@"fail"];
    return stage;
}
@end


