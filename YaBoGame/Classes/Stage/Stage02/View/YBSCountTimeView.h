#import <UIKit/UIKit.h>
@interface YBSCountTimeView : UIView
@property (nonatomic, copy) void(^TimeOutBlock)(void);
@property (nonatomic, assign) BOOL notHasTimeOut;
- (void)startAnimationWithCompletion:(void (^)(BOOL))completion;
- (void)startCalculateByTimeWithTimeOut:(void(^)())timeOutBlock outTime:(NSTimeInterval)outTime;
- (void)startCalculateTime;
- (void)stopCalculateByTimeWithTimeBlock:(void(^)(int second, int ms))timeBlock;
- (void)cleanData;
- (void)pause;
- (void)continueGame;
@end
