#import "YBSStage10BottomNumView.h"
#import "YBSStrokeLabel.h"
@interface YBSStage10BottomNumView ()
{
    int _count1;
    int _count2;
    int _count3;
}
@property (nonatomic, strong) YBSStrokeLabel *label1;
@property (nonatomic, strong) YBSStrokeLabel *label2;
@property (nonatomic, strong) YBSStrokeLabel *label3;
@end
@implementation YBSStage10BottomNumView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        CGFloat labelH = frame.size.height;
        self.label1 = [[YBSStrokeLabel alloc] initWithFrame:CGRectMake(0, 0, labelH, labelH)];
        [self buildLabelWithLabel:self.label1];
        self.label2 = [[YBSStrokeLabel alloc] initWithFrame:CGRectMake(labelH, 0, labelH, labelH)];
        [self buildLabelWithLabel:self.label2];
        self.label3 = [[YBSStrokeLabel alloc] initWithFrame:CGRectMake(labelH * 2, 0, labelH, labelH)];
        [self buildLabelWithLabel:self.label3];
    }
    return self;
}
- (void)buildLabelWithLabel:(YBSStrokeLabel *)label {
    [label setTextStorkeWidth:4];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"0";
    label.font = [UIFont fontWithName:@"TransformersMovie" size:kFontSize];
    [self addSubview:label];
}
- (void)addNumWithIndex:(int)index {
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
- (void)cleanData {
    _count1 = 0;
    _count2 = 0;
    _count3 = 0;
    self.label1.text = @"0";
    self.label2.text = @"0";
    self.label3.text = @"0";
}
@end
