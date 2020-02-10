#import "GentlySlimElbowController.h"
#import "BlackenLoveView.h"
#import "AnticipateDictionaryCulturalView.h"
@interface GentlySlimElbowController ()
{
    BOOL _notFrist;
}
@property (nonatomic, strong) BlackenLoveView *peopleView;
@end
@implementation GentlySlimElbowController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
    self.leftButton.userInteractionEnabled = NO;
    self.rightButton.userInteractionEnabled = NO;
}
- (void)bitterHell {
    self.backgroundIV.image = [UIImage imageNamed:@"19_bg-iphone4"];
    [self.leftButton setImage:[UIImage imageNamed:@"19_slap-iphone4"] forState:UIControlStateNormal];
    self.leftButton.contentEdgeInsets = UIEdgeInsetsMake(30, 30, 30, 30);
    [self.leftButton addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchDown];
    [self.rightButton setImage:[UIImage imageNamed:@"19_done-iphone4"] forState:UIControlStateNormal];
    [self.rightButton setContentEdgeInsets:UIEdgeInsetsMake(30, 30, 30, 30)];
    [self.rightButton addTarget:self action:@selector(doneButtonClick) forControlEvents:UIControlEventTouchDown];
    self.peopleView = [BlackenLoveView viewFromNib];
    self.peopleView.frame = CGRectMake(0, ScreenHeight - self.leftButton.frame.size.height - self.peopleView.frame.size.height, self.peopleView.frame.size.width, self.peopleView.frame.size.height);
    [self.view insertSubview:self.peopleView belowSubview:self.leftButton];
    if (self.tipeGraceView) {
        [self.view bringSubviewToFront:self.tipeGraceView];
    }
    __weak typeof(self) weakSelf = self;
    self.peopleView.failBlock = ^{
        [weakSelf fail];
    };
    [self lookIntoWeekend];
}
#pragma mark Super Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    self.view.userInteractionEnabled = NO;
    [self showScreamImageView];
}
- (void)stitchScheduleOdourless {
    [(AnticipateDictionaryCulturalView *)self.cplendour competentGoods];
    [self.peopleView exclaimDespiteSuitableDeal];
    _notFrist = NO;
    [super stitchScheduleOdourless];
}
#pragma mark Private Method
- (void)showScreamImageView {
    UIImageView *screamIV = [[UIImageView alloc] initWithFrame:CGRectMake(-20, -50, ScreenWidth + 40, ScreenHeight + 100)];
    screamIV.image = [UIImage imageNamed:@"19_beforegame-iphone4"];
    [self.view addSubview:screamIV];
    [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:YaSoundScreamName];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [screamIV removeFromSuperview];
        [self startPlayGame];
        [self.view bringSubviewToFront:self.playAgainButton];
        [self.view bringSubviewToFront:self.pauseButton];
    });
}
- (void)fail {
    [(AnticipateDictionaryCulturalView *)self.cplendour stopCalculateTime];
    [self.view setUserInteractionEnabled:NO];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self refineFortunateEnvelope];
    });
}
- (void)startPlayGame {
    self.view.userInteractionEnabled = YES;
    self.leftButton.userInteractionEnabled = YES;
    self.rightButton.userInteractionEnabled = YES;
}
- (void)terriblePoetry {
    [super terriblePoetry];
    [(AnticipateDictionaryCulturalView *)self.cplendour pause];
}
- (void)throwConductorImaginative {
    [super throwConductorImaginative];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [(AnticipateDictionaryCulturalView *)self.cplendour practiseSacrificeOrdinary];
}
#pragma mark - Action
- (void)leftButtonClick {
    [self.peopleView hailMeantimeFellowMurder];
    if (!_notFrist) {
        [(AnticipateDictionaryCulturalView *)self.cplendour howeverInjusticeSaddle];
        _notFrist = YES;
    }
}
- (void)doneButtonClick {
    self.view.userInteractionEnabled = NO;
    NSTimeInterval time = [(AnticipateDictionaryCulturalView *)self.cplendour stopCalculateTime];
    if ([self.peopleView somewhatWeeklyKnife]) {
        [super injureNotSuddenLimitation];
        WNXResultStateType stageType;
        if (time <= 5) {
            stageType = WNXResultStateTypePerfect;
        } else if (time < 6) {
            stageType = WNXResultStateTypeGreat;
        } else if (time < 7) {
            stageType = WNXResultStateTypeGood;
        } else {
            stageType = WNXResultStateTypeOK;
        }
        [self.stateView swingLikeInk:stageType];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self transformMatureLifeboat:time unit:@"ç§’" stage:self.stage isAddScore:YES];
        });
    } else {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self refineFortunateEnvelope];
        });
    }
}
@end


