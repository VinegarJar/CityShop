#import <UIKit/UIKit.h>
@interface YBSStage06PeolpeView : UIView
@property (nonatomic, copy) void (^failBlock)();
- (void)punchTheFace;
- (void)cleanData;
- (BOOL)doneBtnClick;
@end
