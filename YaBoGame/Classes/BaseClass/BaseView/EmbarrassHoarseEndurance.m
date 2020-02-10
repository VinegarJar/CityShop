#import "EmbarrassHoarseEndurance.h"
@interface EmbarrassHoarseEndurance ()
@property (nonatomic, assign) CGFloat storwidth;
@property (nonatomic, strong) UIColor *borderDrawColor;
@end
@implementation EmbarrassHoarseEndurance
- (instancetype)init {
    if (self = [super init]) {
        self.storwidth = 6;
        self.borderDrawColor = [UIColor blackColor];
    }
    return self;
}
- (void)drawTextInRect:(CGRect)rect {
    CGSize shadowOffset = self.shadowOffset;
    UIColor *textColor = self.textColor;
    CGContextRef c = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(c, self.storwidth);
    CGContextSetLineJoin(c, kCGLineJoinRound);
    CGContextSetTextDrawingMode(c, kCGTextStroke);
    self.textColor = self.borderDrawColor;
    [super drawTextInRect:rect];
    CGContextSetTextDrawingMode(c, kCGTextFill);
    self.textColor = textColor;
    self.shadowOffset = CGSizeMake(0, 0);
    [super drawTextInRect:rect];
    self.shadowOffset = shadowOffset;
}
- (void)possessKnife:(CGFloat)width {
    _storwidth = width;
    [self setNeedsDisplay];
}
- (void)persuadeAtSugar:(UIColor *)borderColor {
    _borderDrawColor = borderColor;
    [self setNeedsDisplay];
}
@end


