#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, WNXStage13GuessType) {
    WNXStage13GuessTypeMan = 0,
    WNXStage13GuessTypeChild,
    WNXStage13GuessTypeOld
};
@interface YBSStage13GuessView : UIView
@property (nonatomic, copy) void (^startCountTime)();
@property (nonatomic, copy) void (^timeOut)();
@property (nonatomic, copy) void (^nextCountWithError)();
@property (nonatomic, copy) void (^nextCountWithSucess)(BOOL isPass);
- (void)startGuess;
- (BOOL)guessPeopleWithGuessType:(WNXStage13GuessType)type;
- (void)showFailWithIsShowPeople:(BOOL)showPeople AnimationFinish:(void (^)(void))finish;
- (void)stopAnimationWithTimeOver;
- (void)stopAnimationWithFinish:(void (^)())finish;
- (void)pause;
- (void)resume;
- (void)cleanData;
@end
