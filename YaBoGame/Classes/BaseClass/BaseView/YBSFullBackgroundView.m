#import "YBSFullBackgroundView.h"
#import "UIView+YBSImage.h"
@implementation YBSFullBackgroundView
{
    NSString *_bgImageName;
}
- (void)setBackgroundImageWihtImageName:(NSString *)imageName {
    _bgImageName = imageName;
    [self setNeedsDisplay];
}
- (void)drawRect:(CGRect)rect {
    if (_bgImageName) {
        UIImage *bgImage = [UIImage imageNamed:_bgImageName];
        CGFloat width = 640;
        CGFloat height = iPhone5 ? 1136 : 960;
        CGRect cutRect = CGRectMake((bgImage.size.width - width)*0.5, (bgImage.size.height - height)*0.5, width, height);
        CGImageRef imageRef = CGImageCreateWithImageInRect(bgImage.CGImage, cutRect);
        bgImage = [UIImage imageWithCGImage:imageRef];
        CGImageRelease(imageRef);
        [bgImage drawInRect:rect];
    }
}
@end
