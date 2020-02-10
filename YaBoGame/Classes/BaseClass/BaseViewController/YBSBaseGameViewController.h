#import <UIKit/UIKit.h>
#import "YBSScoreboardCountView.h"
#import "YBSResultViewController.h"
#import "YBSStateView.h"
typedef NS_ENUM(NSInteger, WNXGameGuideType) {
    WNXGameGuideTypeNone = 0,
    WNXGameGuideTypeOneFingerClick,
    WNXGameGuideTypeReplaceClick,
    WNXGameGuideTypeMultiPointClick
};
typedef NS_ENUM(NSInteger, WNXScoreboardType) {
    WNXScoreboardTypeNone = 0,
    WNXScoreboardTypeCountPTS,
    WNXScoreboardTypeTimeMS,
    WNXScoreboardTypeSecondAndMS,
};
typedef NS_ENUM(NSInteger, WNXADType) {
    WNXADTypeBlog = 0,
    WNXADTypeWeiBo,
    WNXADTypeGithub
};
@interface YBSBaseGameViewController : UIViewController
@property (nonatomic, assign) WNXGameGuideType  guideType;
@property (nonatomic, assign) WNXScoreboardType scoreboardType;
@property (nonatomic, strong) YBSStage          *stage;
@property (nonatomic, strong) UIView            *countScore;
@property (nonatomic, strong) UIImageView       *guideImageView;
@property (nonatomic, strong) UIButton          *playAgainButton;
@property (nonatomic, strong) UIButton          *pauseButton;
@property (nonatomic, strong) YBSStateView      *stateView;
- (void)beginGame;
- (void)endGame;
- (void)beginRedayGoView;
- (void)readyGoAnimationFinish;
- (void)pauseGame;
- (void)continueGame;
- (void)playAgainGame;
- (void)showGameFail;
- (void)showResultControllerWithNewScroe:(double)scroe
                                    unit:(NSString *)unil
                                   stage:(YBSStage *)stage
                              isAddScore:(BOOL)isAddScroe;
- (void)buildStageInfo;
- (void)bringPauseAndPlayAgainToFront;
- (void)buildStageView;
@end
