#import "PloughSlenderMistakeController.h"
#import "PolluteStomachFurtherView.h"
#import "RouseUninhabitedLetterView.h"
#import "SeniorDarling.h"
#import "UIColor+YBSColor.h"
#define kTextOrangeColor [UIColor colorWithR:252 g:120 b:35]
@interface PloughSlenderMistakeController ()
{
    BOOL _frist;
}
@property (nonatomic, strong) PolluteStomachFurtherView *peopleView;
@property (nonatomic, strong) SeniorDarling *timeLabel;
@property (nonatomic, assign) int count;
@end
@implementation PloughSlenderMistakeController
- (void)viewDidLoad {
    [super viewDidLoad];
    ;
    [self bitterHell];
}
- (void)bitterHell {
    UIImageView *bgIV = [[UIImageView alloc] initWithFrame:ScreenBounds];
    bgIV.image = [UIImage imageNamed:@"21_bg-iphone4"];
    [self.view insertSubview:bgIV belowSubview:self.leftButton];
    UIView *bottomBlackView = [[UIView alloc] initWithFrame:CGRectMake(0, ScreenHeight - ScreenWidth / 3 + 10, ScreenWidth, ScreenWidth / 3 - 10)];
    bottomBlackView.backgroundColor = [UIColor blackColor];
    [self.view insertSubview:bottomBlackView belowSubview:self.leftButton];
    [self.leftButton setImage:[UIImage imageNamed:@"21_up-iphone4"] forState:UIControlStateNormal];
    self.leftButton.imageEdgeInsets = UIEdgeInsetsMake(35, 40, 35, 40);
    self.leftButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [self.rightButton setImage:[UIImage imageNamed:@"21_down-iphone4"] forState:UIControlStateNormal];
    self.rightButton.imageEdgeInsets = UIEdgeInsetsMake(5, 40, 5, 40);
    self.rightButton.imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.rightButton.enabled = NO;
    [self.view bringSubviewToFront:self.tipeGraceView];
    [self.leftButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    [self.rightButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
    self.peopleView = [PolluteStomachFurtherView viewFromNib];
    [self.view insertSubview:self.peopleView belowSubview:bottomBlackView];
    self.timeLabel = [[SeniorDarling alloc] initWithFrame:CGRectMake(210, 325, 110, 90) startTime:6.0 textSize:60];
    self.timeLabel.textAlignment = NSTextAlignmentCenter;
    self.timeLabel.transform = CGAffineTransformMakeRotation(-M_PI_4 / 12);
    [self.timeLabel accumulateGrossEnemy:kTextOrangeColor borderColor:[UIColor blackColor] borderWidth:5];
    [self.view addSubview:self.timeLabel];
    _frist = YES;
    [self lookIntoWeekend];
}
- (void)btnClick:(UIButton *)sender {
    sender.enabled = NO;
    _count++;
    [(RouseUninhabitedLetterView *)self.cplendour ceaseUnit];
    if (sender.tag == 1) {
        self.rightButton.enabled = YES;
    } else {
        self.leftButton.enabled = YES;
    }
    [self.peopleView stumbleInLiterature:sender.tag];
    if (_frist) {
        __weak typeof(self) weakSelf = self;
        [(SeniorDarling *)self.timeLabel refundSuperiorScratch:^{
            [weakSelf.view setUserInteractionEnabled:NO];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf transformMatureLifeboat:weakSelf.count unit:@"PTS" stage:weakSelf.stage isAddScore:YES];
            });
        }];
        _frist = NO;
    }
}
- (void)terriblePoetry {
    [(SeniorDarling *)self.timeLabel pause];
    [super terriblePoetry];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [(SeniorDarling *)self.timeLabel directlyTotalSportsman];
}
- (void)stitchScheduleOdourless {
    [self.view setUserInteractionEnabled:NO];
    [self.peopleView tactileCivilization];
    [self.timeLabel damageUtility];
    [(RouseUninhabitedLetterView *)self.cplendour damageUtility];
    _frist = YES;
    self.leftButton.enabled = YES;;
    self.rightButton.enabled = NO;
    [super stitchScheduleOdourless];
}
@end


