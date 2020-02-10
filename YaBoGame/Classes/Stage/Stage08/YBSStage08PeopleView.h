#import <UIKit/UIKit.h>
@interface YBSStage08PeopleView : UIView
@property (nonatomic, copy) void(^startTakePhoto)();
@property (nonatomic, copy) void(^shopTakePhoto)();
@property (nonatomic, copy) void(^nextTakePhoto)(BOOL isPass);
- (BOOL)takePhotoWithIndex:(int)index;
- (void)showModel;
- (void)stopTime;
- (void)cleanDate;
- (void)pause;
- (void)resume;
@end
