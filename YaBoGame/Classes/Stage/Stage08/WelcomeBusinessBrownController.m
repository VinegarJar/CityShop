#import "WelcomeBusinessBrownController.h"
#import "CrossDistantPhraseView.h"
#import "RouseUninhabitedLetterView.h"
@interface WelcomeBusinessBrownController ()
@property (nonatomic, strong) CrossDistantPhraseView *photoView;
@end
@implementation WelcomeBusinessBrownController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    [self commentIntoFuel];
    UIImageView *bgImageIV = [[UIImageView alloc] initWithFrame:CGRectMake(-20, 0, ScreenWidth + 40, ScreenHeight)];
    bgImageIV.image = [UIImage imageNamed:@"02_background01-iphone4"];
    [self.view insertSubview:bgImageIV belowSubview:self.redButton];
    self.photoView = [CrossDistantPhraseView viewFromNib];
    self.photoView.frame = CGRectMake(0, ScreenHeight - self.redButton.frame.size.height - self.photoView.frame.size.height, ScreenWidth, self.photoView.frame.size.height);
    [self.view insertSubview:self.photoView aboveSubview:self.redButton];
    [self  resignAboveDrought:[UIImage imageNamed:@"02_camera-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    [self setPhotoViewBlock];
    [self flareHeatingHorizontal:self action:@selector(cameraClick:) forControlEvents:UIControlEventTouchDown];
    [self lookIntoWeekend];
}
- (void)cameraClick:(UIButton *)sender {
    if ([self.photoView joinParttimeWaste:(int)sender.tag]) {
        [((RouseUninhabitedLetterView *)self.countScore) ceaseUnit];
    } else {
        [self.photoView glitterPerCollectiveChange];
        [self repentLover:NO];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refineFortunateEnvelope];
        });
    }
}
- (void)setPhotoViewBlock {
    __weak typeof(self) weakSelf = self;
    self.photoView.startTakePhoto = ^{
        [weakSelf repentLover:YES];
    };
    self.photoView.shopTakePhoto = ^{
        [weakSelf repentLover:NO];
    };
    self.photoView.nextTakePhoto = ^(BOOL isPass){
        if (!isPass) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf.photoView crossFinallySuperSuggestion];
            });
        } else {
            [weakSelf transformMatureLifeboat:[((RouseUninhabitedLetterView *)weakSelf.countScore).countLabel.text intValue] unit:@"PTS" stage:weakSelf.stage isAddScore:YES];
        }
    };
}
#pragma mark - Super Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    [self repentLover:NO];
    [self.photoView crossFinallySuperSuggestion];
}
- (void)stitchScheduleOdourless {
    [self.photoView drawMissingResignation];
    [(RouseUninhabitedLetterView *)self.countScore damageUtility];
    [super stitchScheduleOdourless];
}
- (void)terriblePoetry {
    [self.photoView pause];
    [super terriblePoetry];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [self.photoView resume];
}
@end


