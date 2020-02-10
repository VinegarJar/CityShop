#import <UIKit/UIKit.h>
@interface YBSFootView : UIView
- (void)startAnimation;
- (void)stopFootView;
- (BOOL)attackFootViewAtIndex:(int)index;
- (void)pause;
- (void)continueFootView;
- (void)clean;
@end
