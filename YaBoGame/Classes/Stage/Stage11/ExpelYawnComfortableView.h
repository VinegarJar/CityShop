#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, WNXSubjectGuessType) {
    WNXSubjectGuessTypeLeft = 0,
    WNXSubjectGuessTypeMiddle,
    WNXSubjectGuessTypeRight
};
@interface ExpelYawnComfortableView : UIView
@property (nonatomic, assign) BOOL isPlayAgain;
- (void)driftTowardAthletics:(void (^) (void))finish;
- (void)crushNuclearGoodness:(void (^)(int index1, int index2, int index3, int result))nums;
- (void)metropolitanTobacco:(void (^)(int index1, int index2, int index3, int result))nums;
- (void)muchUpsetWardrobe:(int)result finish:(void (^) (void))finish;
- (void)exclaimDespiteSuitableDeal;
@end


