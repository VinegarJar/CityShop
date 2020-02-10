#import "SponsorExpertIllController.h"
#import "GloomyHarmView.h"
#import "AnticipateDictionaryCulturalView.h"
@interface SponsorExpertIllController ()
@property (nonatomic, strong) GloomyHarmView *headerView;
@property (nonatomic, assign) CGFloat scroe;
@end
@implementation SponsorExpertIllController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    self.backgroundIV.image = [UIImage imageNamed:@"23_bg-iphone4"];
    [self.leftButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    [self.rightButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    self.headerView = [[GloomyHarmView alloc] initWithFrame:CGRectMake(0, CGRectGetMinY(self.leftButton.frame) - 250, ScreenWidth, 350)];
    [self.view addSubview:self.headerView];
    [self.view insertSubview:self.headerView belowSubview:self.leftButton];
    [self buildBottomImageView];
    [self lookIntoWeekend];
}
- (void)buildBottomImageView {
    [self buildBottonImageViewWithFrame:CGRectMake(13, 0, 55, 40) image:[UIImage imageNamed:@"23_Rarrow-iphone4"]];
    [self buildBottonImageViewWithFrame:CGRectMake(78, 0 , 66, 64) image:[UIImage imageNamed:@"23_bticon-iphone4"]];
    [self buildBottonImageViewWithFrame:CGRectMake(ScreenWidth * 0.5 + 13, 0, 66, 64) image:[UIImage imageNamed:@"23_bticon-iphone4"]];
    [self buildBottonImageViewWithFrame:CGRectMake(ScreenWidth * 0.5 + 79 + 10, 0, 55, 40) image:[UIImage imageNamed:@"23_Barrow-iphone4"]];
}
- (void)buildBottonImageViewWithFrame:(CGRect)frame image:(UIImage *)image {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:frame];
    imageView.center = CGPointMake(imageView.center.x, self.rightButton.center.y);
    imageView.image = image;
    [self.view addSubview:imageView];
}
#pragma mark - Override Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    [self weaveTransparentlyFunSeaside];
}
- (void)weaveTransparentlyFunSeaside {
    [super weaveTransparentlyFunSeaside];
    __weak __typeof(self) weakSelf = self;
    [((AnticipateDictionaryCulturalView *)self.countScore) howeverInjusticeSaddle];
    [self.headerView shineAgainstHonestMetal:^{
        [weakSelf equipBrilliantLamb];
    } stopCalculateTime:^{
        weakSelf.scroe = [((AnticipateDictionaryCulturalView *)weakSelf.countScore) stopCalculateTime];
    }];
}
- (void)equipBrilliantLamb {
    [super equipBrilliantLamb];
    [self transformMatureLifeboat:self.scroe unit:@"ç§’" stage:self.stage isAddScore:YES];
}
- (void)terriblePoetry {
    [super terriblePoetry];
    [self.headerView pause];
    [((AnticipateDictionaryCulturalView *)self.countScore) pause];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [self.headerView practiseSacrificeOrdinary];
    [((AnticipateDictionaryCulturalView *)self.countScore) practiseSacrificeOrdinary];
}
- (void)stitchScheduleOdourless {
    [self.headerView exchangeMercifulCabbage];
    [((AnticipateDictionaryCulturalView *)self.countScore) competentGoods];
    [super stitchScheduleOdourless];
}
#pragma mark - Method
#pragma mark - Action
- (void)buttonClick:(UIButton *)sender {
    if (sender.tag == 1) {
        [self.headerView rotaryEndeacour];
    } else if(sender.tag == 2) {
        [self.headerView disapproveDespiteBristle];
    }
}
@end


