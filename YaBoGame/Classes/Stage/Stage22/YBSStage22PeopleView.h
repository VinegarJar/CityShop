#import <UIKit/UIKit.h>
@interface YBSStage22PeopleView : UIView
@property (nonatomic, copy) void (^fartFinish)();
@property (nonatomic, copy) void (^sucess)();
@property (nonatomic, weak) UIImageView *redIV;
@property (nonatomic, weak) UIImageView *yellowIV;
@property (nonatomic, weak) UIImageView *blueIV;
@property (nonatomic, assign) int count;
- (void)startFart;
- (BOOL)fartWithIndex:(int)index;
- (void)removeData;
@end
