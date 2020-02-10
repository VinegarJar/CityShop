#import <UIKit/UIKit.h>
@interface YBSLaunchAnimationViewController : UIViewController
@property (nonatomic, copy) void (^animationFinish)();
@end
