#import "YBSStage11BottomNumView.h"
#import "YBSStrokeLabel.h"
@interface YBSStage11BottomNumView ()
{
    int _result1;
    int _result2;
    int _result3;
}
@property (nonatomic, strong) YBSStrokeLabel *label1;
@property (nonatomic, strong) YBSStrokeLabel *label2;
@property (nonatomic, strong) YBSStrokeLabel *label3;
@end
@implementation YBSStage11BottomNumView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        CGFloat labelH = frame.size.height;
        self.label1 = [[YBSStrokeLabel alloc] initWithFrame:CGRectMake(0, 0, labelH, labelH)];
        [self buildLabelWithLabel:self.label1];
        self.label2 = [[YBSStrokeLabel alloc] initWithFrame:CGRectMake(labelH, 0, labelH, labelH)];
        [self buildLabelWithLabel:self.label2];
        self.label3 = [[YBSStrokeLabel alloc] initWithFrame:CGRectMake(labelH * 2, 0, labelH, labelH)];
        [self buildLabelWithLabel:self.label3];
        self.hidden = YES;
        self.userInteractionEnabled = NO;
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
- (void)setLabelTextWithNum1:(int)num1 num2:(int)num2 num3:(int)num3 {
    self.hidden = NO;
    _result1 = num1;
    _result2 = num2;
    _result3 = num3;
    self.label1.text = [NSString stringWithFormat:@"%d", num1];
    self.label2.text = [NSString stringWithFormat:@"%d", num2];
    self.label3.text = [NSString stringWithFormat:@"%d", num3];
}
- (int)resultWithIndex:(int)index {
    if (index == 0) {
        return _result1;
    } else if (index == 1) {
        return _result2;
    } else {
        return _result3;
    }
}
@end
