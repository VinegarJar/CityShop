#import <UIKit/UIKit.h>
@interface YBSDropEggView : UIView
@property (nonatomic, copy) void (^failBlock)(NSInteger index);
- (void)showDropEggWithSpeed:(int)speed;
- (void)stopDropEgg;
- (void)pause;
- (void)resume;
- (NSInteger)grabEgg;
- (void)cleanData;
@end
