#import "FlushOntoSwanController.h"
#import "RaiseFlashSelflessView.h"
@interface FlushOntoSwanController ()
@property (nonatomic, strong) RaiseFlashSelflessView *bobmView;
@end
@implementation FlushOntoSwanController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    UIImageView *yellowLineIV1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 16)];
    yellowLineIV1.image = [UIImage imageNamed:@"14_line-iphone4"];
    [self.view addSubview:yellowLineIV1];
    UIImageView *yellowLineIV2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, ScreenHeight - self.redButton.frame.size.height - 16, ScreenWidth, 16)];
    yellowLineIV2.image = [UIImage imageNamed:@"14_line-iphone4"];
    [self.view addSubview:yellowLineIV2];
    [self  resignAboveDrought:[UIImage imageNamed:@"14_stopsign-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(20, 20, 20, 20)];
    [self flareHeatingHorizontal:self action:@selector(stopBtnClick:) forControlEvents:UIControlEventTouchDown];
    __weak typeof(self) weakSelf = self;
    self.bobmView = [[RaiseFlashSelflessView alloc] initWithFrame:CGRectMake(0, 0, 16, ScreenHeight - 16 - self.redButton.frame.size.height)];
    [self.view insertSubview:self.bobmView belowSubview:self.playAgainButton];
    self.bobmView.nextBlock = ^{
        weakSelf.redImageView.highlighted = NO;
        weakSelf.yellowImageView.highlighted = NO;
        weakSelf.blueImageView.highlighted = NO;
        [weakSelf.bobmView teaseNearBan];
        [weakSelf repentLover:YES];
    };
    self.bobmView.passBlock = ^(NSTimeInterval score){
        weakSelf.view.userInteractionEnabled = NO;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [weakSelf transformMatureLifeboat:score unit:@"ç§’" stage:weakSelf.stage isAddScore:YES];
        });
    };
    self.bobmView.failBlock = ^{
        [weakSelf refineFortunateEnvelope];
    };
    [self lookIntoWeekend];
}
#pragma mark - Action 
- (void)stopBtnClick:(UIButton *)sender {
    [self.bobmView fastenSoccerGrammatical:(int)sender.tag];
    sender.userInteractionEnabled = NO;
    switch (sender.tag) {
        case 0:
            self.redImageView.highlighted = YES;
            break;
        case 1:
            self.yellowImageView.highlighted = YES;
            break;
        case 2:
            self.blueImageView.highlighted = YES;
            break;
        default:
            break;
    }
}
#pragma mark - Super Method 
- (void)faxHoneymoon {
    [super faxHoneymoon];
    [self.bobmView teaseNearBan];
    [self repentLover:YES];
}
- (void)stitchScheduleOdourless {
    [super stitchScheduleOdourless];
    [self.bobmView exclaimDespiteSuitableDeal];
    self.redImageView.highlighted = NO;
    self.yellowImageView.highlighted = NO;
    self.blueImageView.highlighted = NO;
}
- (void)terriblePoetry {
    [super terriblePoetry];
    [self.bobmView pause];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [self.bobmView resume];
}
@end


