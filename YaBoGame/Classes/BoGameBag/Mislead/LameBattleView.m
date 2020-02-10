#import "LameBattleView.h"
#import "EmbarrassHoarseEndurance.h"
@interface LameBattleView ()
{
    int _count1;
    int _count2;
    int _count3;
}
@property (nonatomic, strong) EmbarrassHoarseEndurance *label1;
@property (nonatomic, strong) EmbarrassHoarseEndurance *label2;
@property (nonatomic, strong) EmbarrassHoarseEndurance *label3;
@end
@implementation LameBattleView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        CGFloat labelH = frame.size.height;
        self.label1 = [[EmbarrassHoarseEndurance alloc] initWithFrame:CGRectMake(0, 0, labelH, labelH)];
        [self buildLabelWithLabel:self.label1];
        self.label2 = [[EmbarrassHoarseEndurance alloc] initWithFrame:CGRectMake(labelH, 0, labelH, labelH)];
        [self buildLabelWithLabel:self.label2];
        self.label3 = [[EmbarrassHoarseEndurance alloc] initWithFrame:CGRectMake(labelH * 2, 0, labelH, labelH)];
        [self buildLabelWithLabel:self.label3];
    }
    return self;
}
- (void)buildLabelWithLabel:(EmbarrassHoarseEndurance *)label {
    [label possessKnife:4];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"0";
    label.font = [UIFont fontWithName:@"CustomFont" size:kFontSize];
    [self addSubview:label];
}
- (void)appearAwfullyWindyObesity:(int)index {
    switch (index) {
        case 0:
            _count1++;
            self.label1.text = [NSString stringWithFormat:@"%d", _count1];
            break;
        case 1:
            _count2++;
            self.label2.text = [NSString stringWithFormat:@"%d", _count2];
            break;
        case 2:
            _count3++;
            self.label3.text = [NSString stringWithFormat:@"%d", _count3];
            break;
        default:
            break;
    }
}
- (void)exclaimDespiteSuitableDeal {
    _count1 = 0;
    _count2 = 0;
    _count3 = 0;
    self.label1.text = @"0";
    self.label2.text = @"0";
    self.label3.text = @"0";
}
@end


