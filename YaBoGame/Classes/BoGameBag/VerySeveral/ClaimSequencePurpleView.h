#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, WNXStage12BottomViewType) {
    WNXStage12BottomViewTypeNormal = 0,
    WNXStage12BottomViewTypeFail,
    WNXStage12BottomViewTypeSucess
};
@interface ClaimSequencePurpleView : UIView
- (void)stretchMerryItem:(NSInteger)index imageType:(WNXStage12BottomViewType)imageType;
@end


