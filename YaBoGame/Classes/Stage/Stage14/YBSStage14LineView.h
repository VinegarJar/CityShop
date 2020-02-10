#import <UIKit/UIKit.h>
@interface YBSStage14LineView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *arrowIV;
- (void)startShakePhoneAnimationWithFinish:(void (^)())finish;
- (void)resumeData;
- (void)arrowPromptWithAngle:(float)angle;
@end
