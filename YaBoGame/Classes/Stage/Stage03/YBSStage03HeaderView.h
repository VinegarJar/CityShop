#import <UIKit/UIKit.h>
@interface YBSStage03HeaderView : UIView
- (void)startWithFailBlock:(void (^)(void))failBlock stopCalculateTime:(void (^)(void))stopCalculateTime;
- (void)leftBtnClick;
- (void)rightBtnClick;
- (void)pause;
- (void)resumed;
- (void)again;
@end
