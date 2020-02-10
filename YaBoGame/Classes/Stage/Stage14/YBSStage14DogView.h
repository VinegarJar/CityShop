#import <UIKit/UIKit.h>
@interface YBSStage14DogView : UIView
- (void)showBoneViewWithAnimationFinish:(void(^)())finish;
- (float)rotationToRightWithSpeed:(float)speed;;
- (float)rotationToLeftWithSpeed:(float)speed;
- (float)shakeToRithgWithOffset:(CGFloat)offset;
- (float)shakeToLeftWithOffset:(CGFloat)offset;
- (void)startDropBoneDirectionIsRight:(BOOL)isRight finish:(void(^)())finish;
- (void)resumeData;
@end
