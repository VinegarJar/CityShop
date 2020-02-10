#import <UIKit/UIKit.h>
@class YBSStage;
@interface YBSPrepareScoreView : UIView
@property (nonatomic, strong) YBSStage *stage;
- (void)showScroeViewWithCompletion:(void (^)(void))completion;
@end
