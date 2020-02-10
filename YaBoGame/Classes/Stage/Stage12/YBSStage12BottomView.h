#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, WNXStage12BottomViewType) {
    WNXStage12BottomViewTypeNormal = 0,
    WNXStage12BottomViewTypeFail,
    WNXStage12BottomViewTypeSucess
};
@interface YBSStage12BottomView : UIView
- (void)changeBottomWihtIndex:(NSInteger)index imageType:(WNXStage12BottomViewType)imageType;
@end
