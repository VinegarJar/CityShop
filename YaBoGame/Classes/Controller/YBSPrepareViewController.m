#import "YBSPrepareViewController.h"
#import "YBSPrepareScoreView.h"
#import "YBSGameControllerViewManager.h"
#import "YBSBaseGameViewController.h"
@interface YBSPrepareViewController ()
@property (weak, nonatomic) IBOutlet YBSPrepareScoreView *scoreView;
@property (weak, nonatomic) IBOutlet YBSFullBackgroundView *animationView;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (strong, nonatomic) IBOutletCollection(UILabel) NSArray *labels;
@property (weak, nonatomic) IBOutlet UIButton *playButton;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *number1Label;
@property (weak, nonatomic) IBOutlet UILabel *describeLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topMargin;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomMargin;
@property (weak, nonatomic) IBOutlet UIImageView *loadingIV;
@property (weak, nonatomic) IBOutlet UIImageView *readyIV;
@end
@implementation YBSPrepareViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.animationView setBackgroundImageWihtImageName:@"select_bg"];
    if (self.stage) {
        [self initStage];
    }
}
- (void)viewWillAppear:(BOOL)animated {
    self.playButton.hidden = YES;
    self.readyIV.hidden = YES;
    self.loadingIV.hidden = NO;
    [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self startTitleAnimation];
    if (!iPhone5) {
        self.topMargin.constant = 0;
        self.bottomMargin.constant = -5;
        [self.view setNeedsLayout];
    }
    [self.describeLabel sizeToFit];
}
- (void)initStage {
    self.scoreView.stage = self.stage;
    self.number1Label.text = [NSString stringWithFormat:@"%d", self.stage.num];
    self.numberLabel.text = self.number1Label.text;
    self.iconImageView.image = [UIImage imageNamed:self.stage.icon];
    self.describeLabel.text = [self.stage.intro stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"];
    NSArray *array = [self.stage.title componentsSeparatedByString:@"\\n"];
    for (int i = 0; i < array.count; i++) {
        UILabel *label = (UILabel *)[self.animationView viewWithTag:i + 10];
        label.text = array[i];
    }
}
- (void)startTitleAnimation {
    self.animationView.hidden = NO;
    for (int i = 0; i < self.labels.count; i++) {
        UILabel *titleLabel = (UILabel *)[self.animationView viewWithTag:i + 10];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)((i + 1) * 0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
            scale.fromValue = @0;
            titleLabel.hidden = NO;
            scale.toValue = @1;
            CAKeyframeAnimation *translation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.y"];
            translation.values = @[@0, @40, @(-20)];
            CAAnimationGroup *group = [CAAnimationGroup animation];
            group.duration = 0.3;
            group.animations = @[scale, translation];
            [titleLabel.layer addAnimation:group forKey:nil];
            [[WNXSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundPrepaerTitle(i+1)];
        });
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)( (1.5) * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.animationView.hidden = YES;
        for (int i = 0; i < self.labels.count; i++) {
            UILabel *titleLabel = (UILabel *)[self.animationView viewWithTag:i + 10];
            titleLabel.hidden = YES;
        }
        [self showPlayView];
    });
}
- (void)showPlayView {
    __weak __typeof(&*self)weakSelf = self;
    [self.scoreView showScroeViewWithCompletion:^{
        weakSelf.playButton.hidden = NO;
        weakSelf.loadingIV.hidden = YES;
        weakSelf.readyIV.hidden = NO;
        weakSelf.playButton.userInteractionEnabled = YES;
    }];
}
- (IBAction)playGameClick {
    [[WNXSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundCliclName];
    YBSBaseGameViewController *gameVC = [YBSGameControllerViewManager viewControllerWithStage:self.stage];
    [self.navigationController pushViewController:gameVC animated:NO];
}
@end
