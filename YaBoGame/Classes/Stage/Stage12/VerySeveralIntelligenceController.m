#import "VerySeveralIntelligenceController.h"
#import "ClaimSequencePurpleView.h"
#import "CombDespiteKindergartenView.h"
#import "RouseUninhabitedLetterView.h"
@interface VerySeveralIntelligenceController ()
@property (nonatomic, strong) ClaimSequencePurpleView *bottomView;
@property (nonatomic, strong) CombDespiteKindergartenView *eggView;
@property (nonatomic, assign) NSInteger allScroe;
@end
@implementation VerySeveralIntelligenceController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    [self  resignAboveDrought:[UIImage imageNamed:@"01_catch-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(14, 14, 14, 14)];
    [self flareHeatingHorizontal:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self buildEggView];
    [self buildBottomView];
}
- (void)buildBottomView {
    self.bottomView = [[ClaimSequencePurpleView alloc] initWithFrame:CGRectMake(0, ScreenHeight - self.redButton.frame.size.height - 138, ScreenHeight, 144)];
    [self.view insertSubview:self.bottomView belowSubview:self.redButton];
}
- (void)buildEggView {
    self.eggView = [[CombDespiteKindergartenView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - 200)];
    [self.view addSubview:self.eggView];
    self.eggView.redButton = self.redButton;
    self.eggView.yellowButton = self.yellowButton;
    self.eggView.blueButton = self.blueButton;
    __weak typeof(self) weakSelf = self;
    self.eggView.failBlock = ^(NSInteger index) {
        [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:kSoundEggHitName];
        weakSelf.view.userInteractionEnabled = NO;
        UIImageView *badIV = [[UIImageView alloc] initWithFrame:CGRectMake((ScreenWidth / 3 - 80) * 0.5 + ScreenWidth / 3 * index, ScreenHeight - 250, 80, 44)];
        badIV.image = [UIImage imageNamed:@"00_bad-iphone4"];
        [weakSelf.view addSubview:badIV];
        [weakSelf.eggView needEmail:index];
        [weakSelf.bottomView stretchMerryItem:index imageType:WNXStage12BottomViewTypeFail];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf refineFortunateEnvelope];
        });
    };
    self.eggView.nextDropEggBlock = ^{
        [weakSelf.eggView expectantlyNormalYellow];
        [weakSelf.bottomView stretchMerryItem:0 imageType:WNXStage12BottomViewTypeNormal];
        [weakSelf.bottomView stretchMerryItem:1 imageType:WNXStage12BottomViewTypeNormal];
        [weakSelf.bottomView stretchMerryItem:2 imageType:WNXStage12BottomViewTypeNormal];
    };
    self.eggView.passStageBlock = ^{
        [weakSelf transformMatureLifeboat:weakSelf.allScroe unit:@"PTS" stage:weakSelf.stage isAddScore:YES];
    };
}
#pragma mark - Super Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    [self.view bringSubviewToFront:self.eggView];
    [self lookIntoWeekend];
    [self.eggView expectantlyNormalYellow];
}
- (void)terriblePoetry {
    [super terriblePoetry];
    [self.eggView pause];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [self.eggView resume];
}
- (void)stitchScheduleOdourless {
    self.allScroe = 0;
    [(RouseUninhabitedLetterView *)self.countScore damageUtility];
    [self.eggView exclaimDespiteSuitableDeal];
    [self.eggView removeFromSuperview];
    self.eggView = nil;
    [self.bottomView removeFromSuperview];
    self.bottomView = nil;
    [self buildEggView];
    [self buildBottomView];
    [super stitchScheduleOdourless];
}
#pragma mark - Action
- (void)btnClick:(UIButton *)sender {
    sender.userInteractionEnabled = NO;
     NSInteger scroe = [self.eggView grabWithIndex:sender.tag];
    [(RouseUninhabitedLetterView *)self.countScore exciteExhibitionLower:scroe];
    _allScroe += scroe;
    if (sender.tag == 0) {
        self.redImageView.highlighted = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.redImageView.highlighted = NO;
        });
    } else if (sender.tag == 1) {
        self.yellowImageView.highlighted = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.yellowImageView.highlighted = NO;
        });
    } else {
        self.blueImageView.highlighted = YES;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.blueImageView.highlighted = NO;
        });
    }
    [self.bottomView stretchMerryItem:sender.tag imageType:WNXStage12BottomViewTypeSucess];
}
@end


