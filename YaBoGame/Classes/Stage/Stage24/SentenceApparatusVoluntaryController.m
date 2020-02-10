#import "SentenceApparatusVoluntaryController.h"
#import "NearbyVaseView.h"
#import "TerminalMaskView.h"
@interface SentenceApparatusVoluntaryController ()
@property (nonatomic, strong) TerminalMaskView *cockroachView;
@property (nonatomic, assign) int allScore;
@property (nonatomic, assign) int count;
@property (nonatomic, assign) BOOL playAgain;
@end
@implementation SentenceApparatusVoluntaryController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    [self  resignAboveDrought:[UIImage imageNamed:@"stage27_btn-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    [self flareHeatingHorizontal:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self buildCockroachView];
    [self injureNotSuddenLimitation];
    [self lookIntoWeekend];
}
- (void)buildCockroachView {
    self.cockroachView = [[TerminalMaskView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [self.view insertSubview:self.cockroachView belowSubview:self.redButton];
    __weak typeof(self) weakSelf = self;
    self.cockroachView.startCountTime = ^(BOOL isFrist) {
        weakSelf.playAgain = NO;
        if (isFrist) {
            [(NearbyVaseView *)weakSelf.countScore howeverInjusticeSaddle];
        } else {
            [(NearbyVaseView *)weakSelf.countScore withdrawExceptRoughElection];
        }
    };
    self.cockroachView.finish = ^{
        weakSelf.count++;
        WNXResultStateType type;
        __block int onecTime;
        [(NearbyVaseView *)weakSelf.countScore accountOnLevelTragedy:^(int second, int ms) {
            onecTime = second * 1000 + ms / 60.0 * 1000;
            weakSelf.allScore += onecTime;
        }];
        if (onecTime <= 900) {
            type = WNXResultStateTypePerfect;
        } else if (onecTime <= 1000) {
            type = WNXResultStateTypeGreat;
        } else if (onecTime <= 1100) {
            type = WNXResultStateTypeGood;
        } else {
            type = WNXResultStateTypeOK;
        }
        [weakSelf.stateView swingLikeInk:type stageViewHiddenFinishBlock:^{
            if (!weakSelf.playAgain) {
                if (weakSelf.count != 4) {
                    [weakSelf showNewCockroachView];
                } else {
                    [weakSelf transformMatureLifeboat:weakSelf.allScore / 4 unit:@"ms" stage:weakSelf.stage isAddScore:YES];
                }
            }
        }];
    };
    self.cockroachView.fail = ^{
        [(NearbyVaseView *)weakSelf.countScore pause];
        [weakSelf refineFortunateEnvelope];
    };
}
#pragma mark - Private Method
- (void)showNewCockroachView {
    [self removeCockroachViewData];
    [self buildCockroachView];
    [self.cockroachView broodPassiveWait];
}
- (void)removeCockroachViewData {
    [(NearbyVaseView *)self.countScore exclaimDespiteSuitableDeal];
    self.redImageView.highlighted = NO;
    self.yellowImageView.highlighted = NO;
    self.blueImageView.highlighted = NO;
    [self repentLover:YES];
    [self.cockroachView removeFromSuperview];
    self.cockroachView = nil;
}
#pragma mark - Super Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    [self repentLover:YES];
    [self.cockroachView broodPassiveWait];
}
#pragma mark - Action
- (void)btnClick:(UIButton *)sender {
    sender.userInteractionEnabled = NO;
    [(NearbyVaseView *)self.countScore pause];
    if ([self.cockroachView juniorMass:sender.tag]) {
        if (sender.tag == 0) {
            self.redImageView.highlighted = YES;
        } else if (sender.tag == 1) {
            self.yellowImageView.highlighted = YES;
        } else {
            self.blueImageView.highlighted = YES;
        }
    } else {
        [self refineFortunateEnvelope];
    }
}
- (void)stitchScheduleOdourless {
    self.count = 0;
    self.allScore = 0;
    self.playAgain = YES;
    [self removeCockroachViewData];
    [self buildCockroachView];
    [super stitchScheduleOdourless];
}
@end


