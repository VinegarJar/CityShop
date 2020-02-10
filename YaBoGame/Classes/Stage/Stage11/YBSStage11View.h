#import <UIKit/UIKit.h>
@interface YBSStage11View : UIView
@property (nonatomic, copy) void (^handViewShowAnimation) (BOOL isRight);
@property (nonatomic, copy) void (^passState)();
- (void)showSubjectViewWithNums:(void (^)(int index1, int index2, int index3))nums;
- (void)guessResult:(int)result;
- (void)showHandViewAnimationFinish:(void (^) (void))finish;
- (void)cleanData;
- (void)setSubjectPlayAgain;
@end
