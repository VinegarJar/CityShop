#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, WNXSubjectGuessType) {
    WNXSubjectGuessTypeLeft = 0,
    WNXSubjectGuessTypeMiddle,
    WNXSubjectGuessTypeRight
};
@interface YBSSubjectView : UIView
@property (nonatomic, assign) BOOL isPlayAgain;
- (void)showHandViewWithAnimationFinish:(void (^) (void))finish;
- (void)showSubjectViewNums:(void (^)(int index1, int index2, int index3, int result))nums;
- (void)showNextSubjectViewNums:(void (^)(int index1, int index2, int index3, int result))nums;
- (void)showResultWithResult:(int)result finish:(void (^) (void))finish;
- (void)cleanData;
@end
