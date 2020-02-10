#import <UIKit/UIKit.h>
@interface YBSStage19FishView : UIView
- (void)showFishBite:(NSInteger)index;
- (void)showPromptViewWithIndex:(NSInteger)index;
- (void)showSucessWithIndex:(NSInteger)index finish:(void(^)())finish;
- (void)removeData;
- (void)pause;
- (void)resume;
- (void)removeTimer;
@end
