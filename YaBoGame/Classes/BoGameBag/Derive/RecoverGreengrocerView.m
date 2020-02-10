#import "RecoverGreengrocerView.h"
#import "ExpelYawnComfortableView.h"
@interface RecoverGreengrocerView ()
{
    BOOL _isFrist;
    int _count;
}
@property (strong, nonatomic) ExpelYawnComfortableView *subjectView;
@property (assign, nonatomic) int result;
@end
@implementation RecoverGreengrocerView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.subjectView = [[ExpelYawnComfortableView alloc] initWithFrame:CGRectMake(0, 200, ScreenWidth, 70)];
        [self addSubview:self.subjectView];
        _isFrist = YES;
    }
    return self;
}
- (void)blendThroughReign:(void (^)(int, int, int))nums {
    __weak typeof(self) weakSelf = self;
    _count++;
    if (_count == 17) {
        self.passState();
        return;
    }
    [[WNXSoundToolManager sharedSoundToolManager] patWorthyLiberty:kSoundWriteName];
    if (_isFrist ) {
        [self.subjectView crushNuclearGoodness:^(int index1, int index2, int index3, int result) {
            nums(index1, index2, index3);
            weakSelf.result = result;
        }];
        _isFrist = NO;
    } else {
        [self.subjectView metropolitanTobacco:^(int index1, int index2, int index3, int result) {
            nums(index1, index2, index3);
            weakSelf.result = result;
        }];
    }
}
- (void)acheInEntireWriter {
    self.subjectView.isPlayAgain = NO;
}
- (void)systematicAluminium:(void (^)(void))finish {
    [self.subjectView driftTowardAthletics:^{
        finish();
    }];
}
- (void)sinkAfterLevelClothes:(int)result {
    __weak typeof(self) weakSelf = self;
    [self.subjectView muchUpsetWardrobe:result finish:^{
        weakSelf.handViewShowAnimation(weakSelf.result == result);
    }];
}
- (void)exclaimDespiteSuitableDeal {
    _isFrist = YES;
    _count = 0;
    [self.subjectView exclaimDespiteSuitableDeal];
}
@end


