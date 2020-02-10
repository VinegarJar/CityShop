#import <UIKit/UIKit.h>
@interface YBSStage10View : UIView
@property (nonatomic, copy) void (^AnimationFinishBlock)(BOOL isFrist);
@property (nonatomic, copy) void (^StopCountTimeBlock)();
@property (nonatomic, copy) void (^NextBlock)();
@property (nonatomic, copy) void (^FailBlock)();
@property (nonatomic, copy) void (^PassStageBlock)();
@property (nonatomic, assign) BOOL isAnimation;
- (void)startRotation;
- (BOOL)clickWithIndex:(int)index;
- (void)pause;
- (void)resume;
- (void)cleanData;
@end
