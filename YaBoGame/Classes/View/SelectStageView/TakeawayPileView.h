#import <UIKit/UIKit.h>
@class BattleUponSplendour;
@interface TakeawayPileView : UIView
@property (nonatomic, strong) BattleUponSplendour *stage;
+ (instancetype)stageViewWithStage:(BattleUponSplendour *)stage frame:(CGRect)frame;
@end


