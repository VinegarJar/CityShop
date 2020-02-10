#import <UIKit/UIKit.h>
@interface YBSStage12EggView : UIView
@property (nonatomic, copy) void (^failBlock)(NSInteger index);
@property (nonatomic, copy) void (^nextDropEggBlock)();
@property (nonatomic, copy) void (^passStageBlock)();
@property (nonatomic, weak) UIButton *redButton;
@property (nonatomic, weak) UIButton *yellowButton;
@property (nonatomic, weak) UIButton *blueButton;
- (void)showEgg;
- (void)pause;
- (void)resume;
- (void)failWithIndex:(NSInteger)index;
- (NSInteger)grabWithIndex:(NSInteger)index;
- (void)cleanData;
@end
