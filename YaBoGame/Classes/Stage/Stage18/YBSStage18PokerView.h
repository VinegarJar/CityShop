#import <UIKit/UIKit.h>
@interface YBSStage18PokerView : UIView
@property (nonatomic, copy) void (^startCountTime)();
@property (nonatomic, copy) void (^showNextPoker)();
@property (nonatomic, copy) void (^selectSamePokerSucess)(BOOL isPass);
@property (nonatomic, assign) BOOL isFail;
- (BOOL)showPokerView;
- (BOOL)selectSamePokerWithIndex:(NSInteger)index;
- (void)resumeData;
@end
