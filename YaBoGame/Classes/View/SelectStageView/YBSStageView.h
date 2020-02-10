#import <UIKit/UIKit.h>
@class YBSStage;
@interface YBSStageView : UIView
@property (nonatomic, strong) YBSStage *stage;
+ (instancetype)stageViewWithStage:(YBSStage *)stage frame:(CGRect)frame;
@end
