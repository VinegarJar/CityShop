#import "WashOntoGreenManager.h"
#import "StraightPresenceController.h"
#import "CentralModelController.h"
#import "QuitIntervalController.h"
#import "SponsorExpertIllController.h"
#import "SeemAltitudeController.h"
#import "RegardSecretSeatController.h"
#import "GentlySlimElbowController.h"
#import "AppealNecessaryTideController.h"
#import "WelcomeBusinessBrownController.h"
#import "FlushOntoSwanController.h"
#import "MisleadScoreController.h"
#import "DeriveProgressiveDiamondController.h"
#import "VerySeveralIntelligenceController.h"
#import "BegDespiteCharityController.h"
#import "EruptThroughPrejudiceController.h"
#import "WinDuringProgrammerController.h"
#import "PloughSlenderMistakeController.h"
#import "UsedChanceController.h"
#import "PardonPresentationVideoController.h"
#import "SidewaysPatientPardonController.h"
#import "PoundAlcoholExcitedController.h"
#import "SendMicroscopeController.h"
#import "InterpretProductiveRosebudController.h"
#import "TearDangerousSpectacleController.h"
#import "SentenceApparatusVoluntaryController.h"
@implementation WashOntoGreenManager
+ (ShouldRipeGraceController *)viewControllerWithStage:(BattleUponSplendour *)stage {
    ShouldRipeGraceController *gameVC;
    switch (stage.num) {
        case 1:
            gameVC = [CentralModelController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeOneFingerClick;
            gameVC.scoreboardType = WNXScoreboardTypeCountPTS;
            break;
        case 2:
            gameVC = [QuitIntervalController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeOneFingerClick;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 3:
            gameVC = [SponsorExpertIllController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeReplaceClick;
            gameVC.scoreboardType = WNXScoreboardTypeSecondAndMS;
            break;
        case 4:
            gameVC = [SeemAltitudeController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeReplaceClick;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 5:
            gameVC = [RegardSecretSeatController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = WNXScoreboardTypeSecondAndMS;
            break;
        case 6:
            gameVC = [GentlySlimElbowController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeOneFingerClick;
            gameVC.scoreboardType = WNXScoreboardTypeSecondAndMS;
            break;
        case 7:
            gameVC = [AppealNecessaryTideController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = WNXScoreboardTypeSecondAndMS;
            break;
        case 8:
            gameVC = [WelcomeBusinessBrownController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = WNXScoreboardTypeCountPTS;
            break;
        case 9:
            gameVC = [FlushOntoSwanController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeNone;
            break;
        case 10:
            gameVC = [MisleadScoreController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeOneFingerClick;
            gameVC.scoreboardType = WNXScoreboardTypeSecondAndMS;
            break;
        case 11:
            gameVC = [DeriveProgressiveDiamondController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeOneFingerClick;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 12:
            gameVC = [VerySeveralIntelligenceController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeCountPTS;
            break;
        case 13:
            gameVC = [BegDespiteCharityController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 14:
            gameVC = [EruptThroughPrejudiceController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeSecondAndMS;
            break;
        case 15:
            gameVC = [WinDuringProgrammerController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeSecondAndMS;
            break;
        case 16:
            gameVC = [PloughSlenderMistakeController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeReplaceClick;
            gameVC.scoreboardType = WNXScoreboardTypeCountPTS;
            break;
        case 17:
            gameVC = [UsedChanceController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeNone;
            break;
        case 18:
            gameVC = [PardonPresentationVideoController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 19:
            gameVC = [SidewaysPatientPardonController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 20:
            gameVC = [PoundAlcoholExcitedController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXScoreboardTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 21:
            gameVC = [SendMicroscopeController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 22:
            gameVC = [InterpretProductiveRosebudController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeNone;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 23:
            gameVC = [TearDangerousSpectacleController new];
            gameVC.stage = stage;
            gameVC.guideType = WNXGameGuideTypeMultiPointClick;
            gameVC.scoreboardType = WNXScoreboardTypeTimeMS;
            break;
        case 24:
            gameVC = [SentenceApparatusVoluntaryController new];
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


