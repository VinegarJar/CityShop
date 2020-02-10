#import "SeemAltitudeController.h"
#import "CrushViolentLavatoryView.h"
#import "NearbyVaseView.h"
@interface SeemAltitudeController ()
@property (nonatomic, strong) CrushViolentLavatoryView *imageView;
@property (nonatomic, assign) int stepsCount;
@property (nonatomic, assign) WNXResultStateType stateType;
@property (nonatomic, assign) float allAverage;
@end
@implementation SeemAltitudeController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    self.backgroundIV.image = [UIImage imageNamed:@"05_bg-iphone4"];
    self.view.backgroundColor = [UIColor blackColor];
    [self.leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self.rightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self.leftButton setImage:[UIImage imageNamed:@"05_Rfoot-iphone4"] forState:UIControlStateNormal];
    self.leftButton.imageEdgeInsets = UIEdgeInsetsMake(15, 40, 15, 40);
    self.leftButton.adjustsImageWhenDisabled = NO;
    self.leftButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.rightButton setImage:[UIImage imageNamed:@"05_Yfoot-iphone4"] forState:UIControlStateNormal];
    self.rightButton.imageEdgeInsets = UIEdgeInsetsMake(15, 40, 15, 40);
    self.rightButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.rightButton.adjustsImageWhenDisabled = NO;
    UIView *bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 96, ScreenHeight, self.rightButton.frame.size.height)];
    bottomView.backgroundColor = [UIColor blackColor];
    [self.view insertSubview:bottomView belowSubview:self.leftButton];
    [self buildStageImageView];
    [super injureNotSuddenLimitation];
    [self lookIntoWeekend];
}
- (void)buttonClick:(UIButton *)sender {
    sender.enabled = NO;
    sender.alpha = 0.5;
    if (sender.tag == 1) {
        self.rightButton.enabled = YES;
        self.rightButton.alpha = 1;
        [self.imageView standContentSob];
    } else {
        self.leftButton.enabled = YES;
        self.leftButton.alpha = 1;
        [self.imageView dareNecessarilyRepublicanFlour];
    }
}
- (void)buildStageImageView {
    __weak typeof(self) weakSelf = self;
    self.imageView = [[CrushViolentLavatoryView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 96 - 300, ScreenWidth, 300)];
    [self.view insertSubview:self.imageView belowSubview:self.playNose];
    self.imageView.bgIV = self.backgroundIV;
    self.imageView.stopTime = ^(int count) {
        [((NearbyVaseView *)weakSelf.cplendour) accountOnLevelTragedy:^(int second, int ms) {
            [weakSelf calculateStateWithCount:count second:second msec:ms];
        }];
    };
    self.imageView.passStage = ^() {
        weakSelf.view.userInteractionEnabled = NO;
        [weakSelf transformMatureLifeboat:weakSelf.allAverage * 1000 unit:@"MS" stage:weakSelf.stage isAddScore:YES];
    };
    self.imageView.showResult = ^() {
        [weakSelf showStageResult];
    };
    self.imageView.btnToFront = ^() {
        [weakSelf.view bringSubviewToFront:weakSelf.leftButton];
        [weakSelf.view bringSubviewToFront:weakSelf.rightButton];
        if (weakSelf.tipeGraceView) {
            [weakSelf.view bringSubviewToFront:weakSelf.tipeGraceView];
        }
    };
    self.imageView.stopAnimationDidFinish = ^() {
        [weakSelf.imageView trickHealthySite];
        [weakSelf deepenJuryIdeal:YES];
        [((NearbyVaseView *)weakSelf.cplendour) exclaimDespiteSuitableDeal];
        [((NearbyVaseView *)weakSelf.cplendour) keepUponRib:nil outTime:0];
    };
    self.imageView.failBlock = ^() {
        [weakSelf deepenJuryIdeal:NO];
        [weakSelf refineFortunateEnvelope];
    };
    [(NearbyVaseView *)self.cplendour setNotHasTimeOut:YES];
    [self.imageView trickHealthySite];
    [self deepenJuryIdeal:NO];
}
- (void)terriblePoetry {
    [super terriblePoetry];
    [(NearbyVaseView *)self.cplendour pause];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [(NearbyVaseView *)self.cplendour withdrawExceptRoughElection];
}
- (void)stitchScheduleOdourless {
    [super stitchScheduleOdourless];
    [(NearbyVaseView *)self.cplendour exclaimDespiteSuitableDeal];
    [self.imageView woolenSqueak];
    [self deepenJuryIdeal:NO];
}
#pragma mark - 
- (void)faxHoneymoon {
    [super faxHoneymoon];
    [self deepenJuryIdeal:YES];
    [(NearbyVaseView *)self.cplendour keepUponRib:nil outTime:0];
}
#pragma mark
- (void)showStageResult {
    [self.stateView swingLikeInk:self.stateType];
    [self deepenJuryIdeal:NO];
    self.leftButton.alpha = 1;
    self.rightButton.alpha = 1;
}
- (void)calculateStateWithCount:(int)count second:(int)second msec:(int)ms {
    float time = second + ms / 60.0;
    float average = time / count;
    if (average < 0.15) {
        self.stateType = WNXResultStateTypePerfect;
    } else if (average < 0.20) {
        self.stateType = WNXResultStateTypeGreat;
    } else {
        self.stateType = WNXResultStateTypeOK;
    }
    _allAverage += average;
}
@end


