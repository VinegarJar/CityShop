#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,WNXResultStateType) {
    WNXResultStateTypeOK = 0,
    WNXResultStateTypeGood = 1,
    WNXResultStateTypeGreat = 2,
    WNXResultStateTypePerfect = 3,
    WNXResultStateTypeBad = 4
};
@interface YBSStateView : UIView
@property (nonatomic, assign) WNXResultStateType type;
- (void)showStateViewWithType:(WNXResultStateType)type;
- (void)hideStateView;
- (void)showStateViewWithType:(WNXResultStateType)type stageViewHiddenFinishBlock:(void (^)(void))stageViewHiddenFinishBlock;
- (void)showBadStateWithFinish:(void(^)())finish;
- (void)removeData;
@end
