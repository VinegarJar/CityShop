#import "BegDespiteCharityController.h"
#import "LastMedicalSuspensionView.h"
#import "MendBuildingView.h"
#import "NearbyVaseView.h"
@interface BegDespiteCharityController ()
@property (nonatomic, strong) MendBuildingView *guessView;
@property (nonatomic, strong) LastMedicalSuspensionView *bottom;
@property (nonatomic, assign) NSTimeInterval allTime;
@property (nonatomic, assign) WNXResultStateType type;
@end
@implementation BegDespiteCharityController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    UIImageView *bgIV = [[UIImageView alloc] initWithFrame:ScreenBounds];
    bgIV.image = [UIImage imageNamed:@"11_bg-iphone4"];
    [self.view insertSubview:bgIV belowSubview:self.redButton];
    [self commentIntoFuel];
    [super injureNotSuddenLimitation];
    self.guessView = [[MendBuildingView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.redButton.frame.size.height)];
    [self.view addSubview:self.guessView];
    self.bottom = [[LastMedicalSuspensionView alloc] initWithFrame:CGRectMake(0, self.redButton.frame.origin.y, ScreenWidth, self.redButton.frame.size.height)];
    [self.view addSubview:self.bottom];
    //flareHeatingHorizontal
    [self flareHeatingHorizontal:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self lookIntoWeekend];
    __weak typeof(self) weakSelf = self;
    self.guessView.startCountTime = ^{
        [weakSelf repentLover:YES];
        [(NearbyVaseView *)weakSelf.countScore keepUponRib:^{
            [weakSelf.guessView cloudyPair];
        } outTime:3];
    };
    self.guessView.nextCountWithError = ^{
        [(NearbyVaseView *)weakSelf.countScore exclaimDespiteSuitableDeal];
        [weakSelf.bottom exclaimDespiteSuitableDeal];
        weakSelf.allTime += 3.0;
        [weakSelf.guessView absoluteRaid];
    };
    self.guessView.nextCountWithSucess = ^(BOOL isPass){
        [weakSelf.guessView spectacularCliff:nil];
        [weakSelf repentLover:NO];
        [(NearbyVaseView *)weakSelf.countScore accountOnLevelTragedy:^(int second, int ms) {
            NSTimeInterval onceTime = (second + ms / 60.0);
            if (onceTime < 0.8) {
                weakSelf.type = WNXResultStateTypePerfect;
            } else if (onceTime < 1.0) {
                weakSelf.type = WNXResultStateTypeGreat;
            } else if (onceTime < 1.2) {
                weakSelf.type = WNXResultStateTypeGood;
            } else {
                weakSelf.type = WNXResultStateTypeOK;
            }
            weakSelf.allTime += onceTime;
            //transformMatureLifeboat
            [weakSelf.stateView swingLikeInk:weakSelf.type stageViewHiddenFinishBlock:^{
                if (isPass) {
                    [weakSelf transformMatureLifeboat:(int)(weakSelf.allTime / 18 * 1000) unit:@"MS" stage:weakSelf.stage isAddScore:YES];
                } else {
                    [(NearbyVaseView *)weakSelf.countScore exclaimDespiteSuitableDeal];
                    [weakSelf.bottom exclaimDespiteSuitableDeal];
                    [weakSelf.guessView absoluteRaid];
                }
            }];
        }];
    };
}
#pragma mark - Super Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    [self.bottom consistOnYearlyBlowhole:0 type:WNXStage13BottomTypePeople];
    [self.bottom consistOnYearlyBlowhole:1 type:WNXStage13BottomTypePeople];
    [self.bottom consistOnYearlyBlowhole:2 type:WNXStage13BottomTypePeople];
    [self.guessView absoluteRaid];
}
- (void)terriblePoetry {
    [(NearbyVaseView *)self.countScore pause];
    [self.guessView pause];
    [super terriblePoetry];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [(NearbyVaseView *)self.countScore withdrawExceptRoughElection];
    [self.guessView resume];
}
- (void)stitchScheduleOdourless {
    [(NearbyVaseView *)self.countScore exclaimDespiteSuitableDeal];
    [self.bottom exclaimDespiteSuitableDeal];
    [self.guessView exclaimDespiteSuitableDeal];
    [super stitchScheduleOdourless];
}
#pragma mark - Action
- (void)btnClick:(UIButton *)sender {
    [self.bottom coolPanda:sender.tag];
    __weak typeof(self) weakSelf = self;
    sender.userInteractionEnabled = NO;
    if ([self.guessView stepBeyondObjection:sender.tag]) {
        [self.bottom consistOnYearlyBlowhole:sender.tag type:WNXStage13BottomTypeTick];
    } else {
        [self.bottom consistOnYearlyBlowhole:sender.tag type:WNXStage13BottomTypeNone];
        self.view.userInteractionEnabled = NO;
        [(NearbyVaseView *)self.countScore accountOnLevelTragedy:nil];
        [self.guessView hookPhysicist:YES AnimationFinish:^{
            [weakSelf refineFortunateEnvelope];
        }];
    }
}
@end


