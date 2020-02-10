#import "AppealNecessaryTideController.h"
#import "StackFavourablePerseveranceView.h"
#import "AnticipateDictionaryCulturalView.h"
@interface AppealNecessaryTideController ()
{
    BOOL _isStartTime;
    NSTimeInterval _time;
}
@property (nonatomic, strong) StackFavourablePerseveranceView *glassView;
@property (nonatomic, assign) NSTimeInterval oneTime;
@end
@implementation AppealNecessaryTideController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    [self commentIntoFuel];
    __weak typeof(self) weakSelf = self;
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 20)];
    bgImageView.image = [UIImage imageNamed:@"04_background-iphone4"];
    [self.view insertSubview:bgImageView belowSubview:self.playNose];
    [self flareHeatingHorizontal:self action:@selector(gunClick) forControlEvents:UIControlEventTouchDown];
    [self  resignAboveDrought:[UIImage imageNamed:@"004_gun-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    self.glassView = [[StackFavourablePerseveranceView alloc] initWithFrame:CGRectMake(0, ScreenHeight - 300 - self.redButton.frame.size.height, ScreenWidth, 300)];
    [self.view addSubview:self.glassView];
    if (self.tipeGraceView) {
        [self.view bringSubviewToFront:self.tipeGraceView];
    }
    self.glassView.failBlock = ^{
        [weakSelf repentLover:NO];
        [weakSelf refineFortunateEnvelope];
    };
    self.glassView.sucessBlock = ^(int glassCount, BOOL isPass){
        [weakSelf repentLover:NO];
        [weakSelf showStageViewWihtCount:glassCount isPass:isPass];
    };
    self.glassView.stopTimeBlock = ^{
        weakSelf.oneTime = [(AnticipateDictionaryCulturalView *)weakSelf.cplendour pasueTime];
    };
    [self lookIntoWeekend];
}
- (void)faxHoneymoon {
    [super faxHoneymoon];
    [self.glassView trickHealthySite];
}
- (void)terriblePoetry {
    [super terriblePoetry];
    [(AnticipateDictionaryCulturalView *)self.cplendour pause];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [(AnticipateDictionaryCulturalView *)self.cplendour practiseSacrificeOrdinary];
}
- (void)stitchScheduleOdourless {
    [(AnticipateDictionaryCulturalView *)self.cplendour competentGoods];
    [self.glassView competentGoods];
    _isStartTime = NO;
    [super stitchScheduleOdourless];
}
#pragma mark - Action
- (void)gunClick {
    [self.glassView specializePerLightEngineering];
    if (!_isStartTime) {
        _isStartTime = YES;
        [(AnticipateDictionaryCulturalView *)self.cplendour howeverInjusticeSaddle];
    }
}
- (void)showStageViewWihtCount:(int)count isPass:(BOOL)isPass {
    __weak typeof(self) weakSelf = self;
    if (isPass) {
        _time = [(AnticipateDictionaryCulturalView *)weakSelf.cplendour stopCalculateTime];
    }
    NSTimeInterval oneGlassTime = _oneTime / count;
    if (self.stateView) {
        [self.stateView removeFromSuperview];
        self.stateView = nil;
    }
    [super injureNotSuddenLimitation];
    WNXResultStateType stageType;
    if (oneGlassTime <= 0.1) {
        stageType = WNXResultStateTypePerfect;
    } else if (oneGlassTime <= 0.14) {
        stageType = WNXResultStateTypeGreat;
    } else if (oneGlassTime <= 0.18) {
        stageType = WNXResultStateTypeGood;
    } else {
        stageType = WNXResultStateTypeOK;
    }
    [self.stateView swingLikeInk:stageType stageViewHiddenFinishBlock:^{
        if (isPass) {
            [weakSelf transformMatureLifeboat:_time unit:@"ç§’" stage:weakSelf.stage isAddScore:YES];
        } else {
            [weakSelf.glassView trickHealthySite];
            [weakSelf repentLover:YES];
            [(AnticipateDictionaryCulturalView *)weakSelf.cplendour practiseSacrificeOrdinary];
        }
    }];
}
@end


