#import "PlantWeakPensionView.h"
#import "EmbarrassHoarseEndurance.h"
@interface PlantWeakPensionView ()
@property (weak, nonatomic) IBOutlet UIImageView *stageImageView;
@property (weak, nonatomic) IBOutlet EmbarrassHoarseEndurance *timeLabel;
@end
@implementation PlantWeakPensionView
- (void)awakeFromNib {
    [super awakeFromNib];
    [self.timeLabel possessKnife:3];
    self.timeLabel.font = [UIFont fontWithName:@"CustomFont" size:25];
    self.timeLabel.textColor = [UIColor whiteColor];
    self.hidden = YES;
    self.backgroundColor = [UIColor clearColor];
}
- (void)declareTrousersReady:(NSTimeInterval)time {
    self.hidden = NO;
    if (time <= 0.2) {
        self.stageImageView.image = [UIImage imageNamed:@"00_perfect-iphone4"];
    } else if (time <= 0.4) {
        self.stageImageView.image = [UIImage imageNamed:@"00_great-iphone4"];
    } else {
        self.stageImageView.image = [UIImage imageNamed:@"00_okay-iphone4"];
    }
    self.timeLabel.text = [NSString stringWithFormat:@"%.2f", time];
}
@end


