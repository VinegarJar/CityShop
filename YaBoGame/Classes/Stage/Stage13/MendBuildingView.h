#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, WNXStage13GuessType) {
    WNXStage13GuessTypeMan = 0,
    WNXStage13GuessTypeChild,
    WNXStage13GuessTypeOld
};
@interface MendBuildingView : UIView
@property (nonatomic, copy) void (^startCountTime)();
@property (nonatomic, copy) void (^timeOut)();
@property (nonatomic, copy) void (^nextCountWithError)();
@property (nonatomic, copy) void (^nextCountWithSucess)(BOOL isPass);
- (void)absoluteRaid;
- (BOOL)stepBeyondObjection:(WNXStage13GuessType)type;
- (void)hookPhysicist:(BOOL)showPeople AnimationFinish:(void (^)(void))finish;
- (void)cloudyPair;
- (void)spectacularCliff:(void (^)())finish;
- (void)pause;
- (void)resume;
- (void)exclaimDespiteSuitableDeal;
@end


