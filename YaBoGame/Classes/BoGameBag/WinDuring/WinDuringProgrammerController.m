#import "WinDuringProgrammerController.h"
#import "OutdoorsFirmCollegeView.h"
#import "AnticipateDictionaryCulturalView.h"
@interface WinDuringProgrammerController ()
@property (nonatomic, strong) OutdoorsFirmCollegeView *jumpView;
@end
@implementation WinDuringProgrammerController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    [self commentIntoFuel];
    UIImageView *bgView = [[UIImageView alloc] initWithFrame:ScreenBounds];
    bgView.image = [UIImage imageNamed:@"stage36_bg-iphone4"];
    [self.view insertSubview:bgView belowSubview:self.redButton];
    [self buildJumpView];
    //flareHeatingHorizontal
    [self flareHeatingHorizontal:self action:@selector(jump:) forControlEvents:UIControlEventTouchDown];
    [self lookIntoWeekend];
}
- (void)buildJumpView {
    __weak typeof(self) weakSelf = self;
    self.jumpView = [OutdoorsFirmCollegeView new];
    [self.view insertSubview:self.jumpView belowSubview:self.redButton];
    self.jumpView.buttonActivate = ^{
        [weakSelf repentLover:YES];
    };
    self.jumpView.passStage = ^{
        weakSelf.view.userInteractionEnabled = NO;
        NSTimeInterval scroe = [(AnticipateDictionaryCulturalView *)weakSelf.cplendour stopCalculateTime];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf transformMatureLifeboat:scroe unit:@"s" stage:weakSelf.stage isAddScore:YES];
        });
    };
}
#pragma mark - Super Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    [(AnticipateDictionaryCulturalView *)self.cplendour howeverInjusticeSaddle];
}
- (void)terriblePoetry {
    [(AnticipateDictionaryCulturalView *)self.cplendour pause];
    [super terriblePoetry];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [(AnticipateDictionaryCulturalView *)self.cplendour practiseSacrificeOrdinary];
}
- (void)stitchScheduleOdourless {
    [(AnticipateDictionaryCulturalView *)self.cplendour competentGoods];
    [self.jumpView removeFromSuperview];
    self.jumpView = nil;
    [self buildJumpView];
    [super stitchScheduleOdourless];
}
#pragma mark - Action
- (void)jump:(UIButton *)sender {
    [self repentLover:NO];
    [self.jumpView quitDining:(int)sender.tag];
}
@end


