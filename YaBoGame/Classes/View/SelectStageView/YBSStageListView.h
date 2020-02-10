#import <UIKit/UIKit.h>
@class YBSStage;
@interface YBSStageListView : UIScrollView <UIScrollViewDelegate>
@property (nonatomic, copy) void (^didChangeScrollPage)(int page);
@property (nonatomic, copy) void (^didSelectedStageView)(YBSStage *stage);
- (void)reloadStageForNumber:(int)num;
@end
