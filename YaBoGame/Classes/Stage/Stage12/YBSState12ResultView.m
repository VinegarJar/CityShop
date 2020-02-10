#import "YBSState12ResultView.h"
#import "YBSStrokeLabel.h"
@interface YBSState12ResultView ()
@property (nonatomic, strong) UIImageView *statusIV;
@property (nonatomic, strong) YBSStrokeLabel *scoreLabel;
@end
@implementation YBSState12ResultView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.statusIV = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth / 3 - 100) * 0.5, 0, 100, 40)];
        [self addSubview:self.statusIV];
        self.scoreLabel = [[YBSStrokeLabel alloc] initWithFrame:CGRectMake(0, 15, ScreenWidth / 3, 80)];
        [self.scoreLabel setTextStorkeWidth:5];
        self.scoreLabel.textAlignment = NSTextAlignmentCenter;
        self.scoreLabel.font = [UIFont fontWithName:@"TransformersMovie" size:50];
        self.scoreLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.scoreLabel];
    }
    return self;
}
- (void)showStatusWithStateType:(WNXResultStateType)type score:(NSInteger)score {
    if (type == WNXResultStateTypePerfect) {
        self.statusIV.image = [UIImage imageNamed:@"00_perfect-iphone4"];
    } else if (type == WNXResultStateTypeGreat) {
        self.statusIV.image = [UIImage imageNamed:@"00_great-iphone4"];
    } else if (type == WNXResultStateTypeGood) {
        self.statusIV.image = [UIImage imageNamed:@"00_good-iphone4"];
    } else {
        self.statusIV.image = [UIImage imageNamed:@"00_okay-iphone4"];
    }
    if (score == 10) {
        self.scoreLabel.text = [NSString stringWithFormat:@"%2d", (int)score];
    } else {
        self.scoreLabel.text = [NSString stringWithFormat:@"%d", (int)score];
    }
}
@end
