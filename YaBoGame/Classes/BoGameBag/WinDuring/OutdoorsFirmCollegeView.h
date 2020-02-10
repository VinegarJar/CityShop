#import <UIKit/UIKit.h>
@interface OutdoorsFirmCollegeView : UIView
@property (nonatomic, copy) void (^buttonActivate)();
@property (nonatomic, copy) void (^passStage)();
- (BOOL)quitDining:(int)index;
@end


