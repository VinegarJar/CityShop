#import "SidewaysPatientPardonController.h"
#import "AlsoJollyDrawingView.h"
#import "NearbyVaseView.h"
#import <CoreMotion/CoreMotion.h>
@interface SidewaysPatientPardonController ()
{
    int _index;
    BOOL _hasFish;
    BOOL _playAgain;
}
@property (nonatomic, strong) AlsoJollyDrawingView *fishView;
@property (nonatomic, assign) int hasFishTime;
@property (nonatomic, strong) CADisplayLink *timer1;
@property (nonatomic, assign) int currentFishIndex;
@property (nonatomic, strong) CMMotionManager *motionManager;
@property (nonatomic, assign) int allScore;
@property (nonatomic, assign) int count;
@end
@implementation SidewaysPatientPardonController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self bitterHell];
}
- (void)bitterHell {
    UIImageView *bgIV = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - ScreenWidth / 3)];
    bgIV.image = [UIImage imageNamed:@"06_bg-iphone4"];
    [self.view insertSubview:bgIV belowSubview:self.countScore];
    [self commentIntoFuel];
    [super injureNotSuddenLimitation];
    [self buildFishView];
    [self  resignAboveDrought:[UIImage imageNamed:@"06_press-iphone4"] contenEdgeInsets:UIEdgeInsetsMake(15, 15, 15, 15)];
    self.motionManager = [CMMotionManager new];
    [self flareHeatingHorizontal:self action:@selector(fishBite:) forControlEvents:UIControlEventTouchDown];
}
- (void)buildFishView {
    self.fishView = [[AlsoJollyDrawingView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight - self.redButton.frame.size.height)];
    [self.view addSubview:self.fishView];
    [self lookIntoWeekend];
}
#pragma mark - Action
- (void)fishBite:(UIButton *)sender {
    if (!_hasFish || sender.tag != self.currentFishIndex) {
        [self.timer1 invalidate];
        [(NearbyVaseView *)self.countScore accountOnLevelTragedy:nil];
        [self.fishView setTowardBlankWeather];
        [self refineFortunateEnvelope];
        return;
    }
    if (sender.tag == self.currentFishIndex) {
        [self repentLover:NO];
        [self.fishView kneelAmongMoveableFlattery:sender.tag];
        [self pushAccelerometer];
    }
}
#pragma mark - Super Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    _playAgain = NO;
    [self startGoFishing];
}
- (void)stitchScheduleOdourless {
    [self.stateView removeFromSuperview];
    self.stateView = nil;
    _hasFish = NO;
    _playAgain = YES;
    [self.fishView skiFromReply];
    [self.fishView removeFromSuperview];
    self.fishView = nil;
    [(NearbyVaseView *)self.countScore exclaimDespiteSuitableDeal];
    [self.timer1 invalidate];
    self.timer1 = nil;
    self.count = 0;
    _index = 0;
    [self.motionManager stopAccelerometerUpdates];
    [self buildFishView];
    [super injureNotSuddenLimitation];
    [super stitchScheduleOdourless];
}
- (void)terriblePoetry {
    [(NearbyVaseView *)self.countScore pause];
    [self.fishView pause];
    [super terriblePoetry];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [(NearbyVaseView *)self.countScore withdrawExceptRoughElection];
    [self.fishView resume];
}
#pragma mark - Private Method
- (void)startGoFishing {
    if (_playAgain) {
        return;
    }
    _hasFish = NO;
    self.count++;
    [(NearbyVaseView *)self.countScore exclaimDespiteSuitableDeal];
    [self repentLover:YES];
    self.hasFishTime = arc4random_uniform(2) * 60 + arc4random_uniform(60) + 10;
    if (self.timer1) {
        [self.timer1 invalidate];
    }
    _index = 0;
    self.timer1 = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateTime)];
    [self.timer1 addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    _currentFishIndex = arc4random_uniform(3);
}
- (void)updateTime {
    _index++;
    if (_index == self.hasFishTime) {
        [self.timer1 invalidate];
        [self.fishView underlineInfinitePermit:self.currentFishIndex];
        _hasFish = YES;
        [(NearbyVaseView *)self.countScore howeverInjusticeSaddle];
    }
}
- (void)stopMotionAndShowSucess {
    __weak typeof(self) weakSelf = self;
    [self.motionManager stopAccelerometerUpdates];
    __block WNXResultStateType type;
    [(NearbyVaseView *)weakSelf.countScore accountOnLevelTragedy:^(int second, int ms) {
        int onceCount = second * 1000 + ms / 60.0 * 1000;
        if (onceCount < 400) {
            type = WNXResultStateTypePerfect;
        } else if (onceCount < 500) {
            type = WNXResultStateTypeGreat;
        } else if (onceCount < 600) {
            type = WNXResultStateTypeGood;
        } else {
            type = WNXResultStateTypeOK;
        }
        weakSelf.allScore += onceCount;
    }];
    [self.fishView accumulateDuringSocalledSneaker:weakSelf.currentFishIndex finish:^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (weakSelf.count == 13) {
                [weakSelf transformMatureLifeboat:weakSelf.allScore / 13 unit:@"ms" stage:weakSelf.stage isAddScore:YES];
            } else {
                [weakSelf startGoFishing];
            }
        });
    }];
    [self.stateView swingLikeInk:type];
}
#pragma mark - 加速计
- (void)pushAccelerometer {
    __block CGFloat startX = -1000;
    __weak typeof(self) weakSelf = self;
    self.motionManager.accelerometerUpdateInterval = 0.01;
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        CMAcceleration accelera = accelerometerData.acceleration;
        if (startX == -1000) {
            startX = accelera.x;
        }
        if (accelera.x - startX > 0.4 || accelera.x - startX < -0.4) {
            [weakSelf stopMotionAndShowSucess];
        }
    }];
}
@end


