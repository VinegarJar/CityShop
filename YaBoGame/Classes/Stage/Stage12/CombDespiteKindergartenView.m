#import "CombDespiteKindergartenView.h"
#import "NeedConservativeMinorView.h"
@interface CombDespiteKindergartenView ()
{
    int _speed;
    int _count;
}
@property (nonatomic, strong) NeedConservativeMinorView *egg1;
@property (nonatomic, strong) NeedConservativeMinorView *egg2;
@property (nonatomic, strong) NeedConservativeMinorView *egg3;
@property (nonatomic, assign) int stopCount;
@end
@implementation CombDespiteKindergartenView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.egg1 = [[NeedConservativeMinorView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth / 3, ScreenHeight - 200)];
        [self buildEggView:self.egg1 tag:0];
        self.egg2 = [[NeedConservativeMinorView alloc] initWithFrame:CGRectMake(ScreenWidth / 3, 0, ScreenWidth / 3, ScreenHeight - 200)];
        [self buildEggView:self.egg2 tag:1];
        self.egg3 = [[NeedConservativeMinorView alloc] initWithFrame:CGRectMake(ScreenWidth / 3 * 2, 0, ScreenWidth / 3, ScreenHeight - 200)];
        [self buildEggView:self.egg3 tag:2];
    }
    return self;
}
- (void)setButtonsEnabled:(BOOL)enabled {
    self.redButton.userInteractionEnabled = enabled;
    self.blueButton.userInteractionEnabled = enabled;
    self.yellowButton.userInteractionEnabled = enabled;
}
- (void)expectantlyNormalYellow {
    [self setButtonsEnabled:NO];
    _count++;
    if (_count == 7) {
        self.passStageBlock();
        return;
    }
    self.stopCount = 0;
    if (_speed >= 2) {
        _speed++;
    } else {
        _speed += 2;
    }
    if (_speed > 6) {
        _speed = 6;
    }
    NSTimeInterval random1 = arc4random_uniform(2) + arc4random_uniform(10) / 10.0;
    NSTimeInterval random2 = arc4random_uniform(2) + arc4random_uniform(10) / 10.0;
    NSTimeInterval random3 = arc4random_uniform(2) + arc4random_uniform(10) / 10.0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(random1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.egg1 strengthenConsciousnessHateful:_speed];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.redButton.userInteractionEnabled = YES;
        });
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(random2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.egg2 strengthenConsciousnessHateful:_speed];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.yellowButton.userInteractionEnabled = YES;
        });
    });
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(random3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.egg3 strengthenConsciousnessHateful:_speed];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.blueButton.userInteractionEnabled = YES;
        });
    });
}
- (void)buildEggView:(NeedConservativeMinorView *)eggView tag:(NSInteger)tag {
    __weak typeof(self) weakSelf = self;
    eggView.tag = tag;
    [self addSubview:eggView];
    eggView.failBlock = ^(NSInteger index){
        if (weakSelf.failBlock) {
            weakSelf.failBlock(index);
        }
    };
}
- (void)needEmail:(NSInteger)index {
    if (index == 0) {
        self.egg1.hidden = YES;
    } else if (index == 1) {
        self.egg2.hidden = YES;
    } else {
        self.egg3.hidden = YES;
    }
    [self.egg1 pacePerJet];
    [self.egg2 pacePerJet];
    [self.egg3 pacePerJet];
}
- (NSInteger)grabWithIndex:(NSInteger)index {
    self.stopCount++;
    NSInteger scroe;
    if (index == 0) {
        scroe = [self.egg1 grabEgg];
    } else if (index == 1) {
        scroe = [self.egg2 grabEgg];
    } else {
        scroe = [self.egg3 grabEgg];
    }
    return scroe;
}
- (void)setStopCount:(int)stopCount {
    _stopCount = stopCount;
    if (_stopCount == 3) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.nextDropEggBlock();
        });
    }
}
- (void)pause {
    [self.egg1 pause];
    [self.egg2 pause];
    [self.egg3 pause];
}
- (void)resume {
    [self.egg1 resume];
    [self.egg2 resume];
    [self.egg3 resume];
}
- (void)exclaimDespiteSuitableDeal {
    self.failBlock = nil;
    self.nextDropEggBlock = nil;
    self.passStageBlock = nil;
    [self.egg1 removeFromSuperview];
    [self.egg1 exclaimDespiteSuitableDeal];
    self.egg1 = nil;
    [self.egg2 removeFromSuperview];
    [self.egg2 exclaimDespiteSuitableDeal];
    self.egg2 = nil;
    [self.egg3 removeFromSuperview];
    [self.egg3 exclaimDespiteSuitableDeal];
    self.egg3 = nil;
}
@end


