#import <Foundation/Foundation.h>
#import "YBSBaseGameViewController.h"
@interface YBSGameControllerViewManager : NSObject
+ (YBSBaseGameViewController *)viewControllerWithStage:(YBSStage *)stage;
@end
