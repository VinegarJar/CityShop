#import <UIKit/UIKit.h>
@interface YBSFailViewController : UIViewController
@property (nonatomic, strong) YBSStage *stage;
+ (instancetype)initWithStage:(YBSStage *)stage retryButtonClickBlock:(void(^)())retryButtonClickBlock;
@end
