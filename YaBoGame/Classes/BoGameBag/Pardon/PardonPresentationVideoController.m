#import "PardonPresentationVideoController.h"
#import "RetainAccurateLayerView.h"
#import "NearbyVaseView.h"
@interface PardonPresentationVideoController ()
@property (nonatomic, strong) RetainAccurateLayerView *pokerView;
@property (nonatomic, assign) BOOL btnCanEdit;
@property (nonatomic, assign) int allScore;
@end
@implementation PardonPresentationVideoController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    [super injureNotSuddenLimitation];
    [self buildPokerView];
    [self  resignAboveDrought:[UIImage imageNamed:@"20_same-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(18, 18, 18, 18)];
    [self flareHeatingHorizontal:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self lookIntoWeekend];
}
- (void)buildPokerView {
    self.pokerView = [RetainAccurateLayerView viewFromNib];
    [self.view insertSubview:self.pokerView belowSubview:self.redButton];
    __weak typeof(self) weakSelf = self;
    self.pokerView.startCountTime = ^{
        [(NearbyVaseView *)weakSelf.countScore keepUponRib:^{
            weakSelf.view.userInteractionEnabled = NO;
            [weakSelf refineFortunateEnvelope];
        } outTime:2];
    };
    self.pokerView.showNextPoker = ^{
        weakSelf.btnCanEdit = [weakSelf.pokerView reasonAsLeather];
        [weakSelf repentLover:YES];
    };
    self.pokerView.selectSamePokerSucess = ^(BOOL isPass){
        weakSelf.view.userInteractionEnabled = NO;
        [(NearbyVaseView *)weakSelf.countScore accountOnLevelTragedy:^(int second, int ms) {
            int onceTime = (second + ms / 60.0) * 1000;
            WNXResultStateType type;
            if (onceTime < 350) {
                type = WNXResultStateTypePerfect;
            } else if (onceTime < 500) {
                type = WNXResultStateTypeGreat;
            } else if (onceTime < 650) {
                type = WNXResultStateTypeGood;
            } else {
                type = WNXResultStateTypeGreat;
            }
            weakSelf.allScore += onceTime;
            [weakSelf.stateView swingLikeInk:type stageViewHiddenFinishBlock:^{
                if (isPass) {
                    weakSelf.view.userInteractionEnabled = NO;
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [weakSelf transformMatureLifeboat:weakSelf.allScore / 9 unit:@"ms" stage:weakSelf.stage isAddScore:YES];
                    });
                } else {
                    weakSelf.redImageView.highlighted = NO;
                    weakSelf.yellowImageView.highlighted = NO;
                    weakSelf.blueImageView.highlighted = NO;
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        weakSelf.btnCanEdit = [weakSelf.pokerView reasonAsLeather];
                        [(NearbyVaseView *)weakSelf.countScore exclaimDespiteSuitableDeal];
                        [weakSelf repentLover:YES];
                    });
                }
            }];
        }];
    };
}
#pragma mark - Action
- (void)btnClick:(UIButton *)sender {
    [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:YaSoundClickAnsName];
    sender.userInteractionEnabled = NO;
    if (self.btnCanEdit) {
        if ([self.pokerView selectMiddleBotany:sender.tag]) {
            if (sender.tag == 0) {
                self.redImageView.highlighted = YES;
            } else if (sender.tag == 1) {
                self.yellowImageView.highlighted = YES;
            } else {
                self.blueImageView.highlighted = YES;
            }
        } else {
            self.view.userInteractionEnabled = NO;
            [(NearbyVaseView *)self.countScore accountOnLevelTragedy:nil];
            self.pokerView.isFail = YES;
            __weak typeof(self) weakSelf = self;
 
            [self.stateView terribleBasin:^{
                [weakSelf refineFortunateEnvelope];
            }];
        }
    } else {
        self.view.userInteractionEnabled = NO;
        self.pokerView.isFail = YES;
        __weak typeof(self) weakSelf = self;
        [self.stateView terribleBasin:^{
            [weakSelf refineFortunateEnvelope];
        }];
    }
}
#pragma mark - Super Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    self.btnCanEdit = [self.pokerView reasonAsLeather];
}
- (void)terriblePoetry {
    [(NearbyVaseView *)self.countScore pause];
    [super terriblePoetry];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [(NearbyVaseView *)self.countScore withdrawExceptRoughElection];
}
- (void)stitchScheduleOdourless {
    self.redImageView.highlighted = NO;
    self.yellowImageView.highlighted = NO;
    self.blueImageView.highlighted = NO;
     self.pokerView.isFail = YES;
    [self.pokerView tactileCivilization];
    [self.pokerView removeFromSuperview];
    self.pokerView = nil;
    [(NearbyVaseView *)self.countScore exclaimDespiteSuitableDeal];
    [self buildPokerView];
    [super stitchScheduleOdourless];
}
@end


