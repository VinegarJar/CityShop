#import "AlsoJollyDrawingView.h"
#import "GatherUnwaryPolititionView.h"
@interface AlsoJollyDrawingView ()
@property (nonatomic, strong) GatherUnwaryPolititionView *fishView1;
@property (nonatomic, strong) GatherUnwaryPolititionView *fishView2;
@property (nonatomic, strong) GatherUnwaryPolititionView *fishView3;
@property (nonatomic, strong) UIImageView *goodsIV;
@end
@implementation AlsoJollyDrawingView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = NO;
        self.fishView1 = [GatherUnwaryPolititionView viewFromNib];
        [self addSubview:self.fishView1];
        self.fishView2 = [GatherUnwaryPolititionView viewFromNib];
        self.fishView2.frame = CGRectMake(ScreenWidth / 3, 0, ScreenWidth / 3, frame.size.height);
        [self addSubview:self.fishView2];
        self.fishView3 = [GatherUnwaryPolititionView viewFromNib];
        self.fishView3.frame = CGRectMake(ScreenWidth / 3 * 2, 0, ScreenWidth / 3, frame.size.height);
        [self addSubview:self.fishView3];
        self.goodsIV = [UIImageView new];
        [self addSubview:self.goodsIV];
    }
    return self;
}
- (void)underlineInfinitePermit:(NSInteger)index {
    if (index == 0) {
        [self.fishView1 latePrivateReligion];
    } else if (index == 1) {
        [self.fishView2 latePrivateReligion];
    } else {
        [self.fishView3 latePrivateReligion];
    }
}
- (void)kneelAmongMoveableFlattery:(NSInteger)index {
    if (index == 0) {
        [self.fishView1 illustratePulseDull];
    } else if (index == 1) {
        [self.fishView2 illustratePulseDull];
    } else {
        [self.fishView3 illustratePulseDull];
    }
}
- (void)accumulateDuringSocalledSneaker:(NSInteger)index finish:(void (^)())finish {
    if (index == 0) {
        [self.fishView1 ridFastEncounter];
    } else if (index == 1) {
        [self.fishView2 ridFastEncounter];
    } else {
        [self.fishView3 ridFastEncounter];
    }
    int imageIndex = arc4random_uniform(3) + 1;
    if (imageIndex == 1) {
        self.goodsIV.frame = CGRectMake(kCountStartX(150), 160, 150, 180);
    } else if (imageIndex == 2) {
        self.goodsIV.frame = CGRectMake(kCountStartX(150), 160, 150, 111);
    } else {
        self.goodsIV.frame = CGRectMake(kCountStartX(150), 160, 150, 135);
    }
    self.goodsIV.transform = CGAffineTransformMakeScale(0, 0);
    self.goodsIV.hidden = NO;
    self.goodsIV.image = [UIImage imageNamed:[NSString stringWithFormat:@"06_success0%d-iphone4", imageIndex]];
    [UIView animateWithDuration:0.2 animations:^{
        self.goodsIV.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:YaSoundCatchFishName];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.goodsIV.hidden = YES;
            if (finish) {
                finish();
            }
            if (index == 0) {
                [self.fishView1 tactileCivilization];
            } else if (index == 1) {
                [self.fishView2 tactileCivilization];
            } else {
                [self.fishView3 tactileCivilization];
            }
        });
    }];
}
- (void)pause {
    [self.fishView1 pause];
    [self.fishView2 pause];
    [self.fishView3 pause];
}
- (void)resume {
    [self.fishView1 resume];
    [self.fishView2 resume];
    [self.fishView3 resume];
}
- (void)skiFromReply {
    [self setTowardBlankWeather];
    [self.fishView1 removeFromSuperview];
    [self.fishView2 removeFromSuperview];
    [self.fishView3 removeFromSuperview];
    self.fishView1 = nil;
    self.fishView2 = nil;
    self.fishView3 = nil;
}
- (void)setTowardBlankWeather {
    [self.fishView1 laughAsSugaryChicken];
    [self.fishView2 laughAsSugaryChicken];
    [self.fishView3 laughAsSugaryChicken];
}
@end


