#import <UIKit/UIKit.h>
#import "EmbarrassHoarseEndurance.h"
@protocol WNXResultScoreViewDelegate <NSObject>
- (void)resultScoreViewChangeWithRank:(NSString *)rank;
- (void)resultScoreViewShowFailViewPassScroeStr:(NSString *)passScroe userScroeStr:(NSString *)userScroe;
- (void)resultScoreViewShowNewCount;
- (void)resultScoreViewDidRemove;
@end
@class BattleUponSplendour;
@interface DryPrimitiveLeisureView : UIView
@property (nonatomic, weak) IBOutlet UIImageView    *hintImageView;
@property (nonatomic, weak) IBOutlet UIImageView    *boardImageView;
@property (nonatomic, weak) IBOutlet EmbarrassHoarseEndurance *scroeLabel;
@property (nonatomic, weak) IBOutlet EmbarrassHoarseEndurance *unitLabel;
@property (nonatomic, weak) IBOutlet UIView         *labelView;
@property (nonatomic, weak) id <WNXResultScoreViewDelegate> delegate;
- (void)reproduceBrieflySuperBoom:(double)scroe unit:(NSString *)unit stage:(BattleUponSplendour *)stage isAddScore:(BOOL)isAddScroe;
@end


