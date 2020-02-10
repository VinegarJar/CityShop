#import "UIView+YBSImage.h"
@implementation UIView (WXNImage)
- (void)setBackgroundImageWihtImageName:(NSString *)imageName {
}
+ (instancetype)viewFromNib {
    return [[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil][0];
}
- (void)cleanSawtooth {
    self.layer.borderWidth = 2;
    self.layer.borderColor = [UIColor clearColor].CGColor;
    self.layer.shouldRasterize = YES;
    for (UIView *child in self.subviews) {
        [child cleanSawtooth];
    }
}
@end
