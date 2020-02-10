#import "YBSGameControllerViewManager.h"
#import "YBSRYBViewController.h"
#import "YBSStage01ViewController.h"
#import "YBSStage02ViewController.h"
#import "YBSStage03ViewController.h"
#import "YBSStage04ViewController.h"
#import "YBSStage05ViewController.h"
#import "YBSStage06ViewController.h"
#import "YBSStage07ViewController.h"
#import "YBSStage08ViewController.h"
#import "YBSStage09ViewController.h"
#import "YBSStage10ViewController.h"
#import "YBSStage11ViewController.h"
#import "YBSStage12ViewController.h"
#import "YBSStage13ViewController.h"
#import "YBSStage14ViewController.h"
#import "YBSStage15ViewController.h"
#import "YBSStage16ViewController.h"
#import "YBSStage17ViewController.h"
#import "YBSStage18ViewController.h"
#import "YBSStage19ViewController.h"
#import "YBSStage20ViewController.h"
#import "YBSStage21ViewController.h"
#import "YBSStage22ViewController.h"
#import "YBSStage23ViewController.h"
#import "YBSStage24ViewController.h"
@implementation YBSGameControllerViewManager
+ (YBSBaseGameViewController *)viewControllerWithStage:(YBSStage *)stage {
    YBSBaseGameViewController *gameVC;
    switch (stage.num) {
        case 1:
            gameVC = [YBSStage01ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeOneFingerClick;
            gameVC.scoreboardType = WNXScoreboardTypeCountPTS;
            break;
        case 2:
            gameVC = [YBSStage02ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeOneFingerClick;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 3:
            gameVC = [YBSStage03ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeReplaceClick;
            gameVC.scoreboardType = WNXScoreboardTypeSecondAndMS;
            break;
        case 4:
            gameVC = [YBSStage04ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeReplaceClick;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 5:
            gameVC = [YBSStage05ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = WNXScoreboardTypeSecondAndMS;
            break;
        case 6:
            gameVC = [YBSStage06ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeOneFingerClick;
            gameVC.scoreboardType = WNXScoreboardTypeSecondAndMS;
            break;
        case 7:
            gameVC = [YBSStage07ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = WNXScoreboardTypeSecondAndMS;
            break;
        case 8:
            gameVC = [YBSStage08ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = WNXScoreboardTypeCountPTS;
            break;
        case 9:
            gameVC = [YBSStage09ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeNone;
            break;
        case 10:
            gameVC = [YBSStage10ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeOneFingerClick;
            gameVC.scoreboardType = WNXScoreboardTypeSecondAndMS;
            break;
        case 11:
            gameVC = [YBSStage11ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeOneFingerClick;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 12:
            gameVC = [YBSStage12ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeCountPTS;
            break;
        case 13:
            gameVC = [YBSStage13ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 14:
            gameVC = [YBSStage14ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeSecondAndMS;
            break;
        case 15:
            gameVC = [YBSStage15ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeSecondAndMS;
            break;
        case 16:
            gameVC = [YBSStage16ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeReplaceClick;
            gameVC.scoreboardType = WNXScoreboardTypeCountPTS;
            break;
        case 17:
            gameVC = [YBSStage17ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeNone;
            break;
        case 18:
            gameVC = [YBSStage18ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 19:
            gameVC = [YBSStage19ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 20:
            gameVC = [YBSStage20ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXScoreboardTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 21:
            gameVC = [YBSStage21ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 22:
            gameVC = [YBSStage22ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 23:
            gameVC = [YBSStage23ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 24:
            gameVC = [YBSStage24ViewController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        default:
            break;
    }
    return gameVC;
}
@end
