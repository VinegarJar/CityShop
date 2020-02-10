#import <UIKit/UIKit.h>
@interface YBSBusView : UIView
@property (nonatomic, copy) void (^busPassFinish)();
@property (nonatomic, copy) void (^guessSucess)();
@property (nonatomic, copy) void (^stopCountTime)();
- (void)showBus;
- (BOOL)guessWithIndex:(NSInteger)index;
- (void)showCorrectBus;
- (void)pause;
- (void)resume;
- (void)removeData;
@end
