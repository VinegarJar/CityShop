#import "UsedChanceController.h"
#import "SlimGownView.h"
#import "WinChillView.h"
#import "EmbarrassHoarseEndurance.h"
#import "UIColor+YBSColor.h"
#define kTextOrangeColor [UIColor colorWithR:252 g:120 b:35]
@interface UsedChanceController ()
{
    int _count;
}
@property (nonatomic, strong) UIImageView *pullIV;
@property (nonatomic, strong) SlimGownView *noseView;
@property (nonatomic, strong) WinChillView *powerView;
@property (nonatomic, assign) int allScore;
@property (nonatomic, strong) EmbarrassHoarseEndurance *scoreLabel;
@end
@implementation UsedChanceController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    _count = 1;
    [super injureNotSuddenLimitation];
    self.scoreLabel = [[EmbarrassHoarseEndurance alloc] initWithFrame:CGRectMake(0, 90, 100, 60)];
    self.scoreLabel.font =  [UIFont fontWithName:@"CustomFont" size:60];
    self.scoreLabel.textColor = kTextOrangeColor;
    [self.scoreLabel possessKnife:5];
    self.scoreLabel.hidden = YES;
    self.scoreLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.scoreLabel];
    self.pullIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, ScreenHeight - ScreenWidth / 3 + 10, ScreenWidth, ScreenWidth / 3 - 10)];
    self.pullIV.image = [UIImage imageNamed:@"15_button-iphone4"];
    self.pullIV.userInteractionEnabled = YES;
    [self.pullIV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(pullClick)]];
    [self.view insertSubview:self.pullIV atIndex:0];
    self.powerView = [WinChillView viewFromNib];
    self.powerView.frame = CGRectMake(0, ScreenHeight - ScreenWidth / 3 - self.powerView.frame.size.height + 10, self.powerView.frame.size.width, self.powerView.frame.size.height);
    [self.view addSubview:self.powerView];
    [self.view insertSubview:self.powerView atIndex:0];
    self.noseView = [SlimGownView viewFromNib];
    [self.view insertSubview:self.noseView atIndex:0];
    __weak typeof(self) weakSelf = self;
    self.noseView.passStageBlock = ^{
        [weakSelf transformMatureLifeboat:weakSelf.allScore unit:@"PTS" stage:weakSelf.stage isAddScore:YES];
    };
    self.powerView.failBlock = ^{
        [weakSelf.view setUserInteractionEnabled:NO];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf refineFortunateEnvelope];
        });
    };
    [self lookIntoWeekend];
}
- (void)pullClick {
    [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:YaSoundEggHitName];
    _count++;
    self.pullIV.hidden = YES;
    __weak typeof(self) weakSelf = self;
    int score = [self.powerView enforceBoomingMarathon];
    self.allScore += score;
    [self showScore:score];
    WNXResultStateType type;
    if (score == 100) {
        type = WNXResultStateTypePerfect;
    } else if (score < 100 && score != 0) {
        type = WNXResultStateTypeOK;
    } else if (score == 0) {
        type = WNXResultStateTypeBad;
    }
    [self.noseView oralOutlook:_count == 7 score:score finish:^{
        self.scoreLabel.hidden = YES;
        [self.stateView swingLikeInk:type stageViewHiddenFinishBlock:^{
            [weakSelf.powerView naturallyAuxiliaryBend:_count];
            weakSelf.pullIV.hidden = NO;
        }];
    }];
}
- (void)showScore:(int)score {
    self.scoreLabel.text = [NSString stringWithFormat:@"%d", score];
    self.scoreLabel.hidden = NO;
}
#pragma mark - Super Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    [self.powerView naturallyAuxiliaryBend:_count];
}
- (void)terriblePoetry {
    [self.noseView pause];
    [self.powerView pause];
    [super terriblePoetry];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [self.noseView resume];
    [self.powerView resume];
}
- (void)stitchScheduleOdourless {
    self.view.userInteractionEnabled = NO;
    _count = 1;
    self.scoreLabel.hidden = YES;
    self.allScore = 0;
    self.pullIV.hidden = NO;
    self.stateView.hidden = YES;
    [self.noseView tactileCivilization];
    [self.powerView tactileCivilization];
    [super stitchScheduleOdourless];
}
@end


