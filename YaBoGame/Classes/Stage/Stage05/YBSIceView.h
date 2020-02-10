#import <UIKit/UIKit.h>
@interface YBSIceView : UIView
@property (nonatomic, copy) void(^failBlock)();
@property (nonatomic, copy) void(^successBlock)(int iceCount);
@property (nonatomic, copy) void(^passBlock)();
@property (nonatomic, assign) BOOL isPass;
- (void)showDottedLineView;
- (void)addIceWithIndex:(NSInteger)index;
@end
