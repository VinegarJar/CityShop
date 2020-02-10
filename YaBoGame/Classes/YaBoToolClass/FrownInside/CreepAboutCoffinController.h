#import <UIKit/UIKit.h>
@interface CreepAboutCoffinController : UIViewController
@property (nonatomic, strong) BattleUponSplendour *stage;
+ (instancetype)initWithStage:(BattleUponSplendour *)stage retryButtonClickBlock:(void(^)())retryButtonClickBlock;
@end


