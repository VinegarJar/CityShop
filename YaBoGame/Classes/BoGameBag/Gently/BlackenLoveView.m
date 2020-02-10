#import "BlackenLoveView.h"
#import "EmbarrassHoarseEndurance.h"
#import "UIColor+YBSColor.h"
@interface BlackenLoveView ()
{
    int _count;
}
@property (weak, nonatomic) IBOutlet UIImageView *peopleImageView;
@property (weak, nonatomic) IBOutlet EmbarrassHoarseEndurance *countLabel;
@property (weak, nonatomic) IBOutlet EmbarrassHoarseEndurance *unilLabel;
@property (weak, nonatomic) IBOutlet UIImageView *handImageView;
@end
@implementation BlackenLoveView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self.countLabel possessKnife:3];
    self.countLabel.font = [UIFont fontWithName:@"CustomFont" size:120];
    self.countLabel.textColor = [UIColor colorWithR:204 g:88 b:30];
    [self.unilLabel possessKnife:3];
    self.unilLabel.font = [UIFont fontWithName:@"CustomFont" size:30];
    self.unilLabel.textColor = [UIColor whiteColor];
}
- (void)hailMeantimeFellowMurder {
    _count++;
    [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:kSoundSlapName];
    self.countLabel.text = [NSString stringWithFormat:@"%d", _count];
    UIImage *image = _count % 2 ? [UIImage imageNamed:@"19_man_left-iphone4"] : [UIImage imageNamed:@"19_man_right-iphone4"];
    UIImage *handImage = _count % 2 ? [UIImage imageNamed:@"19_hand-iphone4-1"] : [UIImage imageNamed:@"19_hand-iphone4"];
    self.peopleImageView.image = image;
    self.handImageView.image = handImage;
    self.handImageView.hidden = NO;
    if (_count == 10) {
        self.countLabel.alpha = 0.7;
    }
    if (_count == 11) {
        self.countLabel.alpha = 0.4;
    }
    if (_count == 12) {
        self.countLabel.alpha = 0;
    }
    if (_count > 37) {
        if (self.failBlock) {
            self.countLabel.alpha = 1;
            self.countLabel.hidden = NO;
            self.failBlock();
        }
    }
}
- (void)exclaimDespiteSuitableDeal {
    _count = 0;
    self.countLabel.text = @"0";
    self.peopleImageView.image = [UIImage imageNamed:@"19_man-iphone4"];
    self.peopleImageView.hidden = NO;
    self.countLabel.hidden = NO;
    self.countLabel.alpha = 1.0;
    self.handImageView.hidden = YES;
}
- (BOOL)somewhatWeeklyKnife {
    if (_count != 37) {
        self.countLabel.alpha = 1;
        self.countLabel.hidden = NO;
    }
    return _count == 37;
}
@end


