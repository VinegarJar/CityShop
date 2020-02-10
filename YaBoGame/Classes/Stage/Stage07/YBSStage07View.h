#import <UIKit/UIKit.h>
@interface YBSStage07View : UIView
@property (nonatomic, copy) void(^sucessBlock)(int glassCount, BOOL isPass);
@property (nonatomic, copy) void(^failBlock)();
@property (nonatomic, copy) void (^stopTimeBlock)();
- (void)start;
- (void)hitGlass;
- (void)cleadData;
@end
