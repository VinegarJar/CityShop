#import <UIKit/UIKit.h>
@interface YBSNoseView : UIView
@property (nonatomic, copy) void(^passStageBlock)();
- (void)showPullAnimationWithIsPullOut:(BOOL)pullOut score:(int)score finish:(void(^)())finish;
- (void)pause;
- (void)resume;
- (void)resumeData;
@end
