#import <Foundation/Foundation.h>
@interface YBSStageInfo : NSObject <NSCoding>
@property (nonatomic, copy) NSString *rank;
@property (nonatomic, assign) int num;
@property (nonatomic, assign) double score;
@property (nonatomic, assign, getter = isUnlock) BOOL unlock;
@end
