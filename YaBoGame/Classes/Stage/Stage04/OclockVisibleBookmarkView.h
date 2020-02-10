#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,WNXResultStateType) {
    WNXResultStateTypeOK = 0,
    WNXResultStateTypeGood = 1,
    WNXResultStateTypeGreat = 2,
    WNXResultStateTypePerfect = 3,
    WNXResultStateTypeBad = 4
};
@interface OclockVisibleBookmarkView : UIView
@property (nonatomic, assign) WNXResultStateType type;
- (void)swingLikeInk:(WNXResultStateType)type;
- (void)growMinusLeast;
- (void)swingLikeInk:(WNXResultStateType)type stageViewHiddenFinishBlock:(void (^)(void))stageViewHiddenFinishBlock;
- (void)terribleBasin:(void(^)())finish;
- (void)skiFromReply;
@end


