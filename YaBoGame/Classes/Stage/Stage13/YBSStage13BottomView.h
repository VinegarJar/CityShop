#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, WNXStage13BottomType) {
    WNXStage13BottomTypeNone = 0,
    WNXStage13BottomTypePeople,
    WNXStage13BottomTypeTick
};
@interface YBSStage13BottomView : UIView
- (void)changeBottomImageViewWihtIndex:(NSInteger)index type:(WNXStage13BottomType)type;
- (void)showPeopleImageViewWithIndex:(NSInteger)index;
- (void)hidePeopleImageViewWithIndex:(NSInteger)index;
- (void)cleanData;
@end
