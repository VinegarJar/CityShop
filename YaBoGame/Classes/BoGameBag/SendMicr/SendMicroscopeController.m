#import "SendMicroscopeController.h"
#import "GrieveUnderneathHillView.h"
#import "NearbyVaseView.h"
@interface SendMicroscopeController ()
@property (nonatomic, strong) GrieveUnderneathHillView *numView;
@property (nonatomic, assign) int maxTag;
@property (nonatomic, assign) int allScore;
@property (nonatomic, assign) int count;
@end
@implementation SendMicroscopeController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    self.backgroundIV.image = [UIImage imageNamed:@"13_bg-iphone4"];
    UIImageView *lineIV = [[UIImageView alloc] initWithFrame:CGRectMake(156, 0, 8, ScreenHeight)];
    lineIV.image = [UIImage imageNamed:@"17_blackline-iphone4"];
    [self.view insertSubview:lineIV belowSubview:self.leftButton];
    lineIV.alpha = 0.6;
    [self.leftButton setImage:[UIImage imageNamed:@"17_bigger-iphone4"] forState:UIControlStateNormal];
    self.leftButton.contentEdgeInsets = UIEdgeInsetsMake(50, 30, 15, 30);
    [self.rightButton setImage:[UIImage imageNamed:@"17_bigger-iphone4"] forState:UIControlStateNormal];
    self.rightButton.contentEdgeInsets = UIEdgeInsetsMake(50, 30, 15, 30);
    UIImageView *arrow1 = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth / 2 - 40) * 0.5, ScreenHeight - 80, 40, 20)];
    arrow1.image = [UIImage imageNamed:@"17_triangle-iphone4"];
    [self.view addSubview:arrow1];
    UIImageView *arrow2 = [[UIImageView alloc] initWithFrame:CGRectMake(ScreenWidth / 2 + (ScreenWidth / 2 - 40) * 0.5, ScreenHeight - 80, 40, 20)];
    arrow2.image = [UIImage imageNamed:@"17_triangle-iphone4"];
    [self.view addSubview:arrow2];
    [self buildNumberView];
    [self injureNotSuddenLimitation];
    [self.leftButton addTarget:self action:@selector(bgView:) forControlEvents:UIControlEventTouchDown];
    [self.rightButton addTarget:self action:@selector(bgView:) forControlEvents:UIControlEventTouchDown];
}
- (void)buildNumberView {
    self.numView = [[GrieveUnderneathHillView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - ScreenWidth / 3)];
    [self.view insertSubview:self.numView belowSubview:self.leftButton];
    __weak typeof(self) weakSelf = self;
    self.numView.showNumberAnimationFinish = ^{
        [(NearbyVaseView *)weakSelf.cplendour howeverInjusticeSaddle];
        [weakSelf deepenJuryIdeal:YES];
    };
    [self lookIntoWeekend];
}
#pragma mark - Action
- (void)bgView:(UIButton *)sender {
    self.leftButton.userInteractionEnabled = NO;
    self.rightButton.userInteractionEnabled = NO;
    if (sender.tag == self.maxTag) {
        __weak typeof(self) weakSelf = self;
        __block int onceTime;
        [(NearbyVaseView *)self.cplendour accountOnLevelTragedy:^(int second, int ms) {
            onceTime = second * 1000 + ms / 60.0 * 1000;
            weakSelf.allScore += onceTime;
        }];
        WNXResultStateType resultType;
        if (onceTime < 300) {
            resultType = WNXResultStateTypePerfect;
        } else if (onceTime < 400) {
            resultType = WNXResultStateTypeGreat;
        } else if (onceTime < 500) {
            resultType = WNXResultStateTypeGood;
        } else {
            resultType = WNXResultStateTypeOK;
        }
        [self.stateView swingLikeInk:resultType stageViewHiddenFinishBlock:^{
            if (weakSelf.count == 12) {
                [weakSelf transformMatureLifeboat:weakSelf.allScore / 13 unit:@"ms" stage:weakSelf.stage isAddScore:YES];
            } else {
                weakSelf.count++;
                [(NearbyVaseView *)weakSelf.cplendour exclaimDespiteSuitableDeal];
                weakSelf.maxTag = [weakSelf.numView dischargeCarefullySaltyCliff];
            }
        }];
    } else {
        self.view.userInteractionEnabled = NO;
        [self refineFortunateEnvelope];
        [(NearbyVaseView *)self.cplendour accountOnLevelTragedy:nil];
    }
}
#pragma mark - Super Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    self.leftButton.userInteractionEnabled = NO;
    self.rightButton.userInteractionEnabled = NO;
    self.allScore = 0;
    _count = 0;
    self.maxTag = [self.numView dischargeCarefullySaltyCliff];
}
- (void)terriblePoetry {
    [(NearbyVaseView *)self.cplendour pause];
    [self.numView pause];
    [super terriblePoetry];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [self.numView resume];
    [(NearbyVaseView *)self.cplendour withdrawExceptRoughElection];
}
- (void)stitchScheduleOdourless {
    [(NearbyVaseView *)self.cplendour exclaimDespiteSuitableDeal];
    [self.stateView skiFromReply];
    self.stateView = nil;
    [self injureNotSuddenLimitation];
    [self.numView skiFromReply];
    self.numView = nil;
    [self buildNumberView];
    [super stitchScheduleOdourless];
}
@end


