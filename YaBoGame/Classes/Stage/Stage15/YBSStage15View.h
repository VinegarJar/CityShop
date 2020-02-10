#import <UIKit/UIKit.h>
@interface YBSStage15View : UIView
@property (nonatomic, copy) void (^buttonActivate)();
@property (nonatomic, copy) void (^passStage)();
- (BOOL)jumpToNextRowWithIndex:(int)index;
@end
