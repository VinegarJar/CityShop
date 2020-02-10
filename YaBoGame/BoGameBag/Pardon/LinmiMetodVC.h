#import <UIKit/UIKit.h>
@interface LinmiMetodVC : UIView
@property (nonatomic, copy) void (^startCountTime)();
@property (nonatomic, copy) void (^showNextPoker)();
@property (nonatomic, copy) void (^selectSamePokerSucess)(BOOL isPass);
@property (nonatomic, assign) BOOL isFail;
- (BOOL)reasonAsLeather;
- (BOOL)selectMiddleBotany:(NSInteger)index;
- (void)tactileCivilization;
@end


