#import <UIKit/UIKit.h>
@interface TanMountView : UIView
@property (nonatomic, copy) void (^AnimationFinishBlock)(BOOL isFrist);
@property (nonatomic, copy) void (^StopCountTimeBlock)();
@property (nonatomic, copy) void (^NextBlock)();
@property (nonatomic, copy) void (^FailBlock)();
@property (nonatomic, copy) void (^PassStageBlock)();
@property (nonatomic, assign) BOOL isAnimation;
- (void)peelComparativeSoil;
- (BOOL)bentReef:(int)index;
- (void)pause;
- (void)resume;
- (void)exclaimDespiteSuitableDeal;
@end


