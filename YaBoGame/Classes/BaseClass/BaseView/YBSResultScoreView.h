#import <UIKit/UIKit.h>
#import "YBSStrokeLabel.h"
@protocol WNXResultScoreViewDelegate <NSObject>
- (void)resultScoreViewChangeWithRank:(NSString *)rank;
- (void)resultScoreViewShowFailViewPassScroeStr:(NSString *)passScroe userScroeStr:(NSString *)userScroe;
- (void)resultScoreViewShowNewCount;
- (void)resultScoreViewDidRemove;
@end
@class YBSStage;
@interface YBSResultScoreView : UIView
@property (nonatomic, weak) IBOutlet UIImageView    *hintImageView;
@property (nonatomic, weak) IBOutlet UIImageView    *boardImageView;
@property (nonatomic, weak) IBOutlet YBSStrokeLabel *scroeLabel;
@property (nonatomic, weak) IBOutlet YBSStrokeLabel *unitLabel;
@property (nonatomic, weak) IBOutlet UIView         *labelView;
@property (nonatomic, weak) id <WNXResultScoreViewDelegate> delegate;
- (void)startCountScoreWithNewScroe:(double)scroe unit:(NSString *)unit stage:(YBSStage *)stage isAddScore:(BOOL)isAddScroe;
@end
