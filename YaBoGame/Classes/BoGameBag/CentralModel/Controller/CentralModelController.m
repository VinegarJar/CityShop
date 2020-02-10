#import "CentralModelController.h"
#import "SeniorDarling.h"
#import "DoubleExcuseView.h"
#import "PauseEcofriendlyHawkView.h"
#import "RouseUninhabitedLetterView.h"
#import "FurtherCompulsoryCubeManager.h"
#define kStage01Duration 7.0
@interface CentralModelController ()
@property (nonatomic, strong) SeniorDarling *timeLabel;
@property (nonatomic, strong) DoubleExcuseView *footView;
@property (nonatomic, strong) PauseEcofriendlyHawkView *featherView;
@end
@implementation CentralModelController
- (void)viewDidLoad {    
    [super viewDidLoad];
    [self bitterHell];
}
#pragma mark - Build UI
- (void)bitterHell {
    self.buttonImageNames = @[@"01-btfeather", @"01-btfeather", @"01-btfeather"];
    [self.view bringSubviewToFront:self.tipeGraceView];
    [self flareHeatingHorizontal:self action:@selector(featherClick:) forControlEvents:UIControlEventTouchDown];
    [self initTimeLabel];
    [self initFootView];
    [self initFeaterView];
    [self lookIntoWeekend];
}
- (void)initTimeLabel {
    self.timeLabel = [[SeniorDarling alloc] initWithFrame:CGRectMake(ScreenWidth - 55, ScreenHeight - self.redButton.frame.size.height - 50, 60, 50)
                                                    startTime:kStage01Duration textSize:30];
    [self.view insertSubview:self.timeLabel aboveSubview:self.redButton];
}
- (void)initFootView {
    self.footView = [[DoubleExcuseView alloc] initWithFrame:CGRectMake(0, ScreenHeight - self.redButton.frame.size.height - 200 - 45, ScreenWidth / 3, 200)];
    [self.view insertSubview:self.footView aboveSubview:self.redButton];
}
- (void)initFeaterView {
    self.featherView = [[PauseEcofriendlyHawkView alloc] initWithFrame:CGRectMake((ScreenWidth / 3 - 100) * 0.5, ScreenHeight - self.redButton.frame.size.height - 160, 100, 73)];
    [self.view insertSubview:self.featherView aboveSubview:self.footView];
}
#pragma mark - Override Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    [self weaveTransparentlyFunSeaside];
    __weak __typeof(&*self)weakSelf = self;

    [self.timeLabel refundSuperiorScratch:^{
        [weakSelf equipBrilliantLamb];
    }];
}
- (void)equipBrilliantLamb {
    [super equipBrilliantLamb];
    self.view.userInteractionEnabled = NO;
    [self.footView transparentlyCriticalBureau];
    [self.featherView removeFromSuperview];
    [self transformMatureLifeboat:[((RouseUninhabitedLetterView *)self.cplendour).countLabel.text intValue] unit:@"PTS" stage:self.stage isAddScore:YES];
}
- (void)stitchScheduleOdourless {
    [super stitchScheduleOdourless];
    [self.footView damageUtility];
    [self.timeLabel damageUtility];
    [self repentLover:NO];
    [((RouseUninhabitedLetterView *)self.cplendour) damageUtility];
}
- (void)weaveTransparentlyFunSeaside {
    [super weaveTransparentlyFunSeaside];
    [self.footView amuseMiddleEarth];
}
- (void)terriblePoetry {
    [super terriblePoetry];
    [self.footView pause];
    [self.timeLabel pause];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [self.footView sailToFlashlight];
    [self.timeLabel directlyTotalSportsman];
}
#pragma mark - action
- (void)featherClick:(UIButton *)sender {
    [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:YaSoundFeatherClickName];
    [self.featherView frighteningConception:(int)sender.tag];
    if ([self.footView stainChurch:(int)sender.tag]) {
        [(RouseUninhabitedLetterView *)self.cplendour ceaseUnit];
    } else {
        [self showMissImageViewAtIndex:(int)sender.tag];
    }
}
- (void)showMissImageViewAtIndex:(int)index {
    UIImageView *missIV = [[UIImageView alloc] initWithFrame:CGRectMake((index * ScreenWidth / 3) + (ScreenWidth / 3 - 80) * 0.5, CGRectGetMinY(self.footView.frame), 80, 31)];
    missIV.image = [UIImage imageNamed:@"01_miss"];
    [self.view insertSubview:missIV belowSubview:self.footView];
    [UIView animateWithDuration:0.15 animations:^{
        missIV.transform = CGAffineTransformMakeTranslation(0, -100);
        missIV.alpha = 0;
    } completion:^(BOOL finished) {
        [missIV removeFromSuperview];
    }];
}
@end


