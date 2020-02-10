#import <Foundation/Foundation.h>
@class YBSStageInfo;
@interface YBSStage : NSObject
@property (nonatomic, assign) int num;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *format;
@property (nonatomic, copy) NSString *intro;
@property (nonatomic, assign) double max;
@property (nonatomic, assign) double min;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *unit;
@property (nonatomic, copy) NSString *fail;
@property (nonatomic, strong) YBSStageInfo *userInfo;
+ (instancetype)stageWithDict:(NSDictionary *)dict;
@end
