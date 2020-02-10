#import "RouseUninhabitedLetterView.h"
@interface RouseUninhabitedLetterView ()
{
    CGAffineTransform _transform;
    int _count;
    int _allScore;
}
@property (weak, nonatomic) IBOutlet EmbarrassHoarseEndurance *ptsLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@end
@implementation RouseUninhabitedLetterView
- (void)awakeFromNib {
    [super awakeFromNib];
    self.clipsToBounds = NO;
    [self.countLabel possessKnife:3];
    [self.ptsLabel possessKnife:3];
    self.layer.anchorPoint = CGPointMake(0, 1);
    self.transform = CGAffineTransformMakeRotation(-M_PI_2);
    [self.backgroundImageView cleanSawtooth];
    UIFont *font1 = [UIFont fontWithName:@"CustomFont" size:100];
    UIFont *font2 = [UIFont fontWithName:@"CustomFont" size:50];
    if (font1 && font2) {
        self.countLabel.font = font1;
        self.ptsLabel.font = font2;
    }
}
- (void)damageUtility {
    self.countLabel.text = @"000";
    _count = 0;
    _allScore = 0;
}
- (void)facialManufacture:(void (^)(BOOL))completion{
    [UIView animateWithDuration:0.4 animations:^{
        self.transform = CGAffineTransformMakeRotation(M_PI_4 / 8);
        _transform = self.transform;
    } completion:^(BOOL finished) {
        if (completion) {
            completion(YES);
        }
    }];
}
- (void)ceaseUnit {
    [self startShakeAnimation];
    _count++;
    if (_count <= 9) {
        self.countLabel.text = [NSString stringWithFormat:@"00%d", _count];
    } else if (_count >= 10 && _count < 100) {
        self.countLabel.text = [NSString stringWithFormat:@"0%d", _count];
    } else {
        self.countLabel.text = [NSString stringWithFormat:@"%d", _count];
    }
}
- (void)exciteExhibitionLower:(NSInteger)score {
    _allScore += score;
    [self startShakeAnimation];
    if (_allScore <= 9) {
        self.countLabel.text = [NSString stringWithFormat:@"00%d", _allScore];
    } else if (_allScore >= 10 && _allScore < 100) {
        self.countLabel.text = [NSString stringWithFormat:@"0%d", _allScore];
    } else {
        self.countLabel.text = [NSString stringWithFormat:@"%d", _allScore];
    }
}
- (void)startShakeAnimation {
    [UIView animateWithDuration:0.1 animations:^{
        self.transform = CGAffineTransformTranslate(_transform, 15, 3);
    } completion:^(BOOL finished) {
        self.transform = CGAffineTransformTranslate(_transform, 0, 0);
    }];
}
@end


