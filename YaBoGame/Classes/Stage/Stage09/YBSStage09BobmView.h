#import <UIKit/UIKit.h>
@interface YBSStage09BobmView : UIView
@property (nonatomic, copy) void (^nextBlock)();
@property (nonatomic, copy) void (^passBlock)(NSTimeInterval score);
@property (nonatomic, copy) void (^failBlock)();
- (void)showBobm;
- (void)stopCountWithIndex:(int)index;
- (void)cleanData;
- (void)pause;
- (void)resume;
@end
