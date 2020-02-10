#import "YBSStage12BottomView.h"
@interface YBSStage12BottomView ()
@property (nonatomic, strong) UIImageView *iv1;
@property (nonatomic, strong) UIImageView *iv2;
@property (nonatomic, strong) UIImageView *iv3;
@end
@implementation YBSStage12BottomView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIImageView *lineIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 45, ScreenWidth, 5)];
        lineIV.image = [UIImage imageNamed:@"01_line-iphone4"];
        [self addSubview:lineIV];
        self.iv1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth / 3, 144)];
        self.iv1.image = [UIImage imageNamed:@"01_normal-iphone4"];
        [self addSubview:self.iv1];
        self.iv2 = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth / 3, 0, ScreenWidth / 3, 144)];
        self.iv2.image = [UIImage imageNamed:@"01_normal-iphone4"];
        [self addSubview:self.iv2];
        self.iv3 = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth / 3 * 2, 0, ScreenWidth / 3, 144)];
        self.iv3.image = [UIImage imageNamed:@"01_normal-iphone4"];
        [self addSubview:self.iv3];
    }
    return self;
}
- (void)changeBottomWihtIndex:(NSInteger)index imageType:(WNXStage12BottomViewType)imageType {
    if (index == 0) {
        if (imageType == WNXStage12BottomViewTypeNormal) {
            self.iv1.image = [UIImage imageNamed:@"01_normal-iphone4"];
        } else if (imageType == WNXStage12BottomViewTypeFail) {
            self.iv1.image = [UIImage imageNamed:@"01_fail-iphone4"];
        } else {
            self.iv1.image = [UIImage imageNamed:@"01_success-iphone4"];
        }
    } else if (index == 1) {
        if (imageType == WNXStage12BottomViewTypeNormal) {
            self.iv2.image = [UIImage imageNamed:@"01_normal-iphone4"];
        } else if (imageType == WNXStage12BottomViewTypeFail) {
            self.iv2.image = [UIImage imageNamed:@"01_fail-iphone4"];
        } else {
            self.iv2.image = [UIImage imageNamed:@"01_success-iphone4"];
        }
    } else {
        if (imageType == WNXStage12BottomViewTypeNormal) {
            self.iv3.image = [UIImage imageNamed:@"01_normal-iphone4"];
        } else if (imageType == WNXStage12BottomViewTypeFail) {
            self.iv3.image = [UIImage imageNamed:@"01_fail-iphone4"];
        } else {
            self.iv3.image = [UIImage imageNamed:@"01_success-iphone4"];
        }
    }
}
@end
