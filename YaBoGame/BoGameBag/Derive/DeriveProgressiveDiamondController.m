#import "DeriveProgressiveDiamondController.h"
#import "RecoverGreengrocerView.h"
#import "EvenLogicalAttackView.h"
#import "AnticipateDictionaryCulturalView.h"
#import "NearbyVaseView.h"
@interface DeriveProgressiveDiamondController ()
@property (nonatomic, strong) RecoverGreengrocerView *blackboardView;
@property (nonatomic, strong) EvenLogicalAttackView *bottomNumView;
@property (nonatomic, assign) NSTimeInterval onceTime;
@property (nonatomic, assign) NSTimeInterval allTime;
@property (nonatomic, assign) BOOL isPlayAgain;
@end
@implementation DeriveProgressiveDiamondController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    [super injureNotSuddenLimitation];
    [self commentIntoFuel];
    __weak typeof(self) weakSelf = self;
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:ScreenBounds];
    bgImageView.image = [UIImage imageNamed:@"13_bg-iphone4"];
    [self.view insertSubview:bgImageView belowSubview:self.redButton];
    self.blackboardView = [[RecoverGreengrocerView alloc] initWithFrame:ScreenBounds];
    [self.view insertSubview:self.blackboardView belowSubview:self.redButton];
    self.blackboardView.handViewShowAnimation = ^(BOOL isRight) {
        if (isRight) {
            weakSelf.bottomNumView.hidden = YES;
            [weakSelf showResultStatusWithIsSucess:YES animationFinish:^{
                [weakSelf.blackboardView systematicAluminium:^{
                    [weakSelf.blackboardView blendThroughReign:^(int index1, int index2, int index3) {
                        [(NearbyVaseView *)weakSelf.cplendour howeverInjusticeSaddle];
                        [weakSelf.bottomNumView determineClay:index1 num2:index2 num3:index3];
                        [weakSelf repentLover:YES];
                    }];
                }];
            }];
        } else {
            weakSelf.bottomNumView.hidden = NO;
            [weakSelf showResultStatusWithIsSucess:NO animationFinish:^{
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    if (weakSelf.isPlayAgain) {
                        return;
                    }
                    [weakSelf refineFortunateEnvelope];
                });
            }];
        }
    };
    self.blackboardView.passState = ^{
        NSTimeInterval average = weakSelf.allTime / 16;
        int scroe = average * 1000;
        [weakSelf transformMatureLifeboat:scroe unit:@"MS" stage:weakSelf.stage isAddScore:YES];
    };
    self.bottomNumView = [[EvenLogicalAttackView alloc] initWithFrame:CGRectMake(0, self.redButton.frame.origin.y + 4, ScreenWidth, self.redButton.frame.size.height)];
    [self.view addSubview:self.bottomNumView];
    [self lookIntoWeekend];
    [self flareHeatingHorizontal:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
}
- (void)showResultStatusWithIsSucess:(BOOL)sucess animationFinish:(void (^)(void))finish {
    _allTime += self.onceTime;
    if (sucess) {
        WNXResultStateType resultType;
        if (self.onceTime < 1.0) {
            resultType = WNXResultStateTypePerfect;
        } else if (self.onceTime < 1.2) {
            resultType = WNXResultStateTypeGreat;
        } else if (self.onceTime < 1.4) {
            resultType = WNXResultStateTypeGood;
        } else {
            resultType = WNXResultStateTypeOK;
        }
        [self.stateView swingLikeInk:resultType stageViewHiddenFinishBlock:^{
            finish();
        }];
    } else {
        UIImageView *errorView = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth - 150) * 0.5, ScreenHeight - self.redButton.frame.size.height - 180, 150, 150)];
        errorView.image = [UIImage imageNamed:@"00_cross-iphone4"];
        [self.view addSubview:errorView];
        UIImageView *badView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 140, 80)];
        badView.layer.anchorPoint = CGPointMake(0, 0.5);
        badView.image = [UIImage imageNamed:@"00_bad-iphone4"];
        badView.center = CGPointMake(errorView.center.x - 70, errorView.center.y);
        [self.view addSubview:badView];
        [[YaBoOrgyTool sharedSoundToolManager] patWorthyLiberty:YaSoundEnenName];
        [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            badView.transform = CGAffineTransformMakeRotation(M_2_PI);
        } completion:^(BOOL finished) {
            [badView removeFromSuperview];
            [errorView removeFromSuperview];
            finish();
        }];
    }
}
#pragma mark - Super Method blendThroughReign
- (void)faxHoneymoon {
    [super faxHoneymoon];
    [self.blackboardView acheInEntireWriter];
    __weak typeof(self) weakSelf = self;
    [self.blackboardView blendThroughReign:^(int index1, int index2, int index3) {
        [weakSelf.bottomNumView determineClay:index1 num2:index2 num3:index3];
        [(NearbyVaseView *)weakSelf.cplendour howeverInjusticeSaddle];
        weakSelf.isPlayAgain = NO;
    }];
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
    [(NearbyVaseView *)self.cplendour exclaimDespiteSuitableDeal];
    [self.bottomNumView determineClay:0 num2:0 num3:0];
    self.bottomNumView.hidden = YES;
    [self.blackboardView exclaimDespiteSuitableDeal];
    self.isPlayAgain = YES;
    [super stitchScheduleOdourless];
}
#pragma mark - Action
- (void)btnClick:(UIButton *)sender {
    __weak typeof(self) weakSelf = self;
    [self repentLover:NO];
    [(NearbyVaseView *)self.cplendour accountOnLevelTragedy:^(int second, int ms) {
        weakSelf.onceTime = second + ms / 60.0;
    }];
    [self.blackboardView sinkAfterLevelClothes:[self.bottomNumView geographicalTradition:(int)sender.tag]];
}
@end


