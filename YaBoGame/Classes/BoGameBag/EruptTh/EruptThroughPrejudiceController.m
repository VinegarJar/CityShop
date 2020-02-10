#import "EruptThroughPrejudiceController.h"
#import "BrightenExoticIncidentView.h"
#import "NormallyYoungTigerView.h"
#import <CoreMotion/CoreMotion.h>
#import "AnticipateDictionaryCulturalView.h"
@interface EruptThroughPrejudiceController ()
{
    int _index;
    int _count;
    BOOL _isToRight;
    int _randomTime;
}
@property (nonatomic, strong) BrightenExoticIncidentView *dogView;
@property (nonatomic, strong) NormallyYoungTigerView *lineView;
@property (nonatomic, strong) CMMotionManager *motionManager;
@property (nonatomic, assign) float angle;
@property (nonatomic, assign) NSTimeInterval scroe;
@property (nonatomic, strong) CADisplayLink *timer;
@end
@implementation EruptThroughPrejudiceController
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(setTowardBlankWeather) name:kPauseViewControllerClickBackToMainViewController object:nil];
    [self bitterHell];
}
- (void)setTowardBlankWeather {
    [self.timer invalidate];
    self.timer = nil;
}
- (void)bitterHell {
    self.bgImageView.image = [UIImage imageNamed:@"16_bg-iphone4"];
    self.motionManager = [CMMotionManager new];
    self.dogView = [BrightenExoticIncidentView viewFromNib];
    self.dogView.layer.anchorPoint = CGPointMake(0.5, 1);
    self.dogView.frame = CGRectMake(0, ScreenHeight - self.dogView.frame.size.height + 10, ScreenWidth, self.dogView.frame.size.height);
    [self.view addSubview:self.dogView];
    self.lineView = [NormallyYoungTigerView viewFromNib];
    self.lineView.frame = CGRectMake(0, ScreenHeight - self.dogView.frame.size.height - self.lineView.frame.size.height + 60, ScreenWidth, self.lineView.frame.size.height);
    [self.view addSubview:self.lineView];
    [self lookIntoWeekend];
}
#pragma mark - Super Method
- (void)faxHoneymoon {
    [super faxHoneymoon];
    __weak typeof(self) weakSelf = self;
    [self.lineView buildQuietlyHopelessGain:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.dogView muteHall:^{
            [weakSelf.motionManager startAccelerometerUpdates];
            weakSelf.lineView.arrowIV.hidden = NO;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [weakSelf pushAccelerometer];
                [weakSelf peelComparativeSoil];
                [(AnticipateDictionaryCulturalView *)weakSelf.countScore howeverInjusticeSaddle];
            });
        }];
    });
}
- (void)terriblePoetry {
    self.timer.paused = YES;
    [(AnticipateDictionaryCulturalView *)self.countScore pause];
    [self.motionManager stopAccelerometerUpdates];
    [super terriblePoetry];
}
- (void)withdrawExceptRoughElection {
    [super withdrawExceptRoughElection];
    [(AnticipateDictionaryCulturalView *)self.countScore practiseSacrificeOrdinary];
    [self pushAccelerometer];
    self.timer.paused = NO;
}
- (void)stitchScheduleOdourless {
    [(AnticipateDictionaryCulturalView *)self.countScore competentGoods];
    [self.timer invalidate];
    self.timer = nil;
    _index = 0;
    _count = 0;
    [self.motionManager stopAccelerometerUpdates];
    [self.dogView tactileCivilization];
    [self.lineView tactileCivilization];
    [super stitchScheduleOdourless];
}
#pragma mark - 加速计
- (void)pushAccelerometer {
    self.motionManager.accelerometerUpdateInterval = 0.01;
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue mainQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error) {
        CMAcceleration accelera = accelerometerData.acceleration;
        if (accelera.x >= -0.1 && accelera.x <= 0.1) {
            return;
        }
        if (accelera.x < 0) {
            self.angle = [self.dogView upstairsNewCritic:accelera.x];
        } else {
            self.angle = [self.dogView surroundingBath:accelera.x];
        }
    }];
}
#pragma mark - Private Method
- (void)peelComparativeSoil {
    _isToRight = arc4random_uniform(2);
    _randomTime = arc4random_uniform(3) + 3 + arc4random_uniform(10) / 10.0;
    self.timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateTime)];
    [self.timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
}
- (void)updateTime {
    _index++;
    float speed;
    if (_index <= 4 * 60) {
        speed = 0.2;
    } else if (_index <= 8 * 60) {
        speed = 0.3;
    } else if (_index <= 12 * 60) {
        speed = 0.4;
    } else if (_index <= 16 * 60) {
        speed = 0.5;
    } else if (_index <= 20 * 60) {
        speed = 0.6;
    } else {
        speed = 0.7;
    }
    _count++;
    if (_isToRight) {
        self.angle = [self.dogView groanUnlikeCorrectPink:speed];
    } else {
        self.angle = [self.dogView wrestleBeforeSquirrel:speed];
    }
    if (_count == (int)_randomTime * 60) {
        _isToRight = !_isToRight;
        _count = 0;
        _randomTime = arc4random_uniform(3) + 3 + arc4random_uniform(10) / 10.0;
    }
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)setAngle:(float)angle {
    _angle = angle;
    [self.lineView chargeBeyondStonyInput:angle];
    if (angle > 0.8 || angle < -0.8) {
        self.view.userInteractionEnabled = NO;
        self.scroe = [(AnticipateDictionaryCulturalView *)self.countScore stopCalculateTime];
        [self.motionManager stopAccelerometerUpdates];
        [self.timer invalidate];
        self.timer = nil;
        [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:YaSoundDogbarkTwoName];
        __weak typeof(self) weakSelf = self;
        [self.dogView stepOfWaterproofDignity:angle > 0.8 finish:^{
            [weakSelf transformMatureLifeboat:weakSelf.scroe unit:@"秒" stage:weakSelf.stage isAddScore:YES];
        }];
    }
}
@end


