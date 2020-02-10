#import <UIKit/UIKit.h>
@interface CombDespiteKindergartenView : UIView
@property (nonatomic, copy) void (^failBlock)(NSInteger index);
@property (nonatomic, copy) void (^nextDropEggBlock)();
@property (nonatomic, copy) void (^passStageBlock)();
@property (nonatomic, weak) UIButton *redButton;
@property (nonatomic, weak) UIButton *yellowButton;
@property (nonatomic, weak) UIButton *blueButton;
- (void)expectantlyNormalYellow;
- (void)pause;
- (void)resume;
- (void)needEmail:(NSInteger)index;
- (NSInteger)grabWithIndex:(NSInteger)index;
- (void)exclaimDespiteSuitableDeal;
@end


