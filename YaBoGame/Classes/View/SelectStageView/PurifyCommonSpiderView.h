#import <UIKit/UIKit.h>
@class BattleUponSplendour;
@interface PurifyCommonSpiderView : UIScrollView <UIScrollViewDelegate>
@property (nonatomic, copy) void (^didChangeScrollPage)(int page);
@property (nonatomic, copy) void (^didSelectedStageView)(BattleUponSplendour *stage);
- (void)contributeUnderneathThisPink:(int)num;
@end


