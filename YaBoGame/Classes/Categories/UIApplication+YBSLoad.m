#import "UIApplication+YBSLoad.h"
#import "YBSFullBackgroundView.h"
#define kLoadingViewTag 10000
@implementation UIApplication (WNXLoad)
+ (void)loading {
    UIWindow *mainWindow = [[UIApplication sharedApplication] keyWindow];
    YBSFullBackgroundView *loadView = [[YBSFullBackgroundView alloc] initWithFrame:ScreenBounds];
    loadView.tag = kLoadingViewTag;
    [loadView setBackgroundImageWihtImageName:@"loading_bg"];
    [mainWindow addSubview:loadView];
}
+ (void)unLoading {
    UIView *loadView = [[[UIApplication sharedApplication] keyWindow].subviews lastObject];
    if (loadView.tag == kLoadingViewTag) {
        [loadView removeFromSuperview];
    }
}
@end
