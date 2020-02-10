#import "RegardSecretSeatController.h"
#import "OtherwiseForemostDoseView.h"
#import "AnticipateDictionaryCulturalView.h"
@interface RegardSecretSeatController ()
@property (nonatomic, strong) OtherwiseForemostDoseView *iceView;
@property (nonatomic, assign) BOOL isFail;
@end
@implementation RegardSecretSeatController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
#pragma mark - Build UI
- (void)bitterHell {
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    bgImageView.image = [UIImage imageNamed:@"03_background-iphone4"];
    [self.view insertSubview:bgImageView belowSubview:self.redButton];
    [self  resignAboveDrought:[UIImage imageNamed:@"03_button-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(25, 25, 25, 25)];
    [self flareHeatingHorizontal:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self buildEggRoll];
    [self buildIceView];
    [super injureNotSuddenLimitation];
    [self lookIntoWeekend];
}
- (void)buildEggRoll {
    CGFloat eggIVW = 100;
    CGFloat eggIVH = 204;
    CGFloat margin = (ScreenWidth / 3 - eggIVW) * 0.5;
    for (int i = 0; i < 3; i++) {
        UIImageView *eggIV = [[UIImageView alloc] initWithFrame:CGRectMake(margin + i * (eggIVW + margin * 2), ScreenHeight - self.redButton.bounds.size.height - 85, eggIVW, eggIVH)];
        eggIV.image = [UIImage imageNamed:@"03_cones-iphone4"];
        [self.view insertSubview:eggIV belowSubview:self.redButton];
    }
}
- (void)buildIceView {
    self.iceView = [[OtherwiseForemostDoseView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 412, ScreenWidth, 229)];
    [self.view addSubview:self.iceView];
    [self.iceView directTowardBadminton];
    __weak typeof(self) weakSelf = self;
    self.iceView.failBlock = ^{
        if (!weakSelf.isFail) {
            [weakSelf.view setUserInteractionEnabled:NO];
            [(AnticipateDictionaryCulturalView *)weakSelf.countScore stopCalculateTime];
            [weakSelf refineFortunateEnvelope];
        }
        weakSelf.isFail = YES;
    };
    self.iceView.passBlock = ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf transformMatureLifeboat:[(AnticipateDictionaryCulturalView *)weakSelf.countScore stopCalculateTime] unit:@"ç§’" stage:weakSelf.stage isAddScore:YES];
        });
    };
    self.iceView.successBlock = ^(int iceCount){
        [weakSelf showResultStateWithCount:iceCount];
    };
}
#pragma mark Super Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    [self.view bringSubviewToFront:self.iceView];
    [(AnticipateDictionaryCulturalView *)self.countScore howeverInjusticeSaddle];
}
- (void)throwConductorImaginative {
    [super throwConductorImaginative];
    if (self.guideImageView) {
        [self.view bringSubviewToFront:self.guideImageView];
    }
}
- (void)terriblePoetry {
    [(AnticipateDictionaryCulturalView *)self.countScore pause];
    [super terriblePoetry];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [(AnticipateDictionaryCulturalView *)self.countScore practiseSacrificeOrdinary];
}
- (void)stitchScheduleOdourless {
    self.isFail = NO;
    [(AnticipateDictionaryCulturalView *)self.countScore competentGoods];
    [self.iceView directTowardBadminton];
    [super stitchScheduleOdourless];
}
#pragma mark - Private Method
- (void)showResultStateWithCount:(int)count {
    [self.view setUserInteractionEnabled:NO];
    NSTimeInterval time = [(AnticipateDictionaryCulturalView *)self.countScore pasueTime] / count;
    WNXResultStateType stageType;
    if (time < 0.05) {
        stageType = WNXResultStateTypePerfect;
    } else if (time < 0.08) {
        stageType = WNXResultStateTypeGreat;
    } else if (time < 0.1) {
        stageType = WNXResultStateTypeGood;
    } else {
        stageType = WNXResultStateTypeOK;
    }
    [self.stateView swingLikeInk:stageType];
    if (!self.iceView.isPass) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self.iceView directTowardBadminton];
            [(AnticipateDictionaryCulturalView *)self.countScore practiseSacrificeOrdinary];
            [self.view setUserInteractionEnabled:YES];
        });
    }
}
#pragma mark Action
- (void)btnClick:(UIButton *)sender {
    [self.iceView sinInsideFerry:sender.tag];
}
@end


