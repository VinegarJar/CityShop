#import "MisleadScoreController.h"
#import "TanMountView.h"
#import "LameBattleView.h"
#import "AnticipateDictionaryCulturalView.h"
@interface MisleadScoreController ()
@property (nonatomic, strong) TanMountView *plateView;
@property (nonatomic, strong) LameBattleView *numView;
@property (nonatomic, assign) NSTimeInterval oneTime;
@end
@implementation MisleadScoreController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    [super injureNotSuddenLimitation];
    [self commentIntoFuel];
    UIImageView *bgIV = [[UIImageView alloc] initWithFrame:ScreenBounds];
    bgIV.image = [UIImage imageNamed:@"08_bg-iphone4"];
    [self.view insertSubview:bgIV belowSubview:self.redButton];
    [self repentLover:NO];
    [self buildPlateView];
    [self buildBottomNumberView];
    [super lookIntoWeekend];
    [self flareHeatingHorizontal:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
}

- (void)buildPlateView {
    __weak typeof(self) weakSelf = self;
    self.plateView = [[TanMountView alloc] initWithFrame:CGRectMake(0, ScreenHeight - self.redButton.frame.size.height + 55 - 480, ScreenWidth, 480)];
    [self.view insertSubview:self.plateView belowSubview:self.redButton];
    self.plateView.AnimationFinishBlock = ^(BOOL isFrist) {
        [weakSelf repentLover:YES];
        if (isFrist) {
            [(AnticipateDictionaryCulturalView *)weakSelf.countScore howeverInjusticeSaddle];
        } else {
            [(AnticipateDictionaryCulturalView *)weakSelf.countScore practiseSacrificeOrdinary];
        }
    };
    self.plateView.StopCountTimeBlock = ^{
        [weakSelf repentLover:NO];
        weakSelf.oneTime = [(AnticipateDictionaryCulturalView *)weakSelf.countScore pasueTime];
    };
    self.plateView.PassStageBlock = ^{
        WNXResultStateType resultType;
        if (weakSelf.oneTime < 0.8) {
            resultType = WNXResultStateTypePerfect;
        } else if (weakSelf.oneTime < 1) {
            resultType = WNXResultStateTypeGreat;
        } else {
            resultType = WNXResultStateTypeGood;
        }
        
        [weakSelf.stateView swingLikeInk:resultType stageViewHiddenFinishBlock:^{
            [weakSelf transformMatureLifeboat:[(AnticipateDictionaryCulturalView *)weakSelf.countScore stopCalculateTime] unit:@"秒’" stage:weakSelf.stage isAddScore:YES];
        }];
    };
    self.plateView.NextBlock = ^{
        WNXResultStateType resultType;
        if (weakSelf.oneTime < 0.8) {
            resultType = WNXResultStateTypePerfect;
        } else if (weakSelf.oneTime < 1) {
            resultType = WNXResultStateTypeGreat;
        } else {
            resultType = WNXResultStateTypeGood;
        }
        [weakSelf.stateView swingLikeInk:resultType stageViewHiddenFinishBlock:^{
            [weakSelf.numView exclaimDespiteSuitableDeal];
            [weakSelf.plateView peelComparativeSoil];
        }];
    };
    self.plateView.FailBlock = ^{
        [(AnticipateDictionaryCulturalView *)weakSelf.countScore stopCalculateTime];
        [weakSelf refineFortunateEnvelope];
    };
}
- (void)buildBottomNumberView {
    self.numView = [[LameBattleView alloc] initWithFrame:CGRectMake(0, self.redButton.frame.origin.y + 4, ScreenWidth, self.redButton.frame.size.height)];
    self.numView.userInteractionEnabled = NO;
    [self.view insertSubview:self.numView aboveSubview:self.blueButton];
}
#pragma mark - Action
- (void)buttonClick:(UIButton *)sender {
    [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:YaSoundFeatherClickName];
    [self.numView appearAwfullyWindyObesity:(int)sender.tag];
    if (![self.plateView bentReef:(int)sender.tag]) {
        [(AnticipateDictionaryCulturalView *)self.countScore stopCalculateTime];
        [self refineFortunateEnvelope];
    }
}
#pragma mark - Super Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    self.view.userInteractionEnabled = YES;
    [self repentLover:NO];
    [self.plateView peelComparativeSoil];
}
- (void)terriblePoetry {
    [self.plateView pause];
    [(AnticipateDictionaryCulturalView *)self.countScore pause];
    [super terriblePoetry];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [self.plateView resume];
    if (!self.plateView.isAnimation) {
        [(AnticipateDictionaryCulturalView *)self.countScore practiseSacrificeOrdinary];
    }
}
- (void)stitchScheduleOdourless {
    [(AnticipateDictionaryCulturalView *)self.countScore competentGoods];
    [self.plateView exclaimDespiteSuitableDeal];
    [self.numView exclaimDespiteSuitableDeal];
    [self.plateView removeFromSuperview];
    self.plateView = nil;
    [self.numView removeFromSuperview];
    self.numView = nil;
    [self buildPlateView];
    [self buildBottomNumberView];
    [super stitchScheduleOdourless];
}
@end


