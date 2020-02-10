#import "ExtendDateOrganicController.h"
@interface ExtendDateOrganicController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topMargin;
@property (weak, nonatomic) IBOutlet UIButton *bgMusicButton;
@property (weak, nonatomic) IBOutlet UIButton *soundButton;
@property (weak, nonatomic) IBOutlet UIButton *other1Button;
@property (weak, nonatomic) IBOutlet UIButton *other2Button;
@property (weak, nonatomic) IBOutlet UIButton *other3Button;
@end
@implementation ExtendDateOrganicController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundImageWihtImageName:@"setting_bg"];
    [self startSetTopMargin];
    [self setButtonsTitle];
}
- (void)setButtonsTitle {
    [self.bgMusicButton setTitle:[NSString stringWithFormat:@"MUSIC %@", [self buttonTitleWihtYaBoOrgyPlay:[[YaBoOrgyTool sharedSoundToolManager] OutType]]] forState:UIControlStateNormal];
    [self.soundButton setTitle:[NSString stringWithFormat:@"SOUND %@", [self buttonTitleWihtYaBoOrgyPlay:[[YaBoOrgyTool sharedSoundToolManager] soundType]]] forState:UIControlStateNormal];
}
- (void)startSetTopMargin {
    if (iPhone5) {
        self.topMargin.constant = 120;
    } else {
        self.topMargin.constant = 120 - ScreenHeightDifference - 10;
    }
    [self.view setNeedsLayout];
}
- (IBAction)buttonClick:(UIButton *)sender {
    if (sender.tag == 10) {
        NSString *subTitle = [self nextButtonTitleWihtYaBoOrgyPlay:[[YaBoOrgyTool sharedSoundToolManager] OutType]];
        [sender setTitle:[NSString stringWithFormat:@"MUSIC %@", subTitle] forState:UIControlStateNormal];
        [[YaBoOrgyTool sharedSoundToolManager] setOutType:[self typeWihtYaBoOrgyPlay:[[YaBoOrgyTool sharedSoundToolManager] OutType]]];
    } else if (sender.tag == 11) {
        NSString *subTitle = [self nextButtonTitleWihtYaBoOrgyPlay:[[YaBoOrgyTool sharedSoundToolManager] soundType]];
        [sender setTitle:[NSString stringWithFormat:@"SOUND %@", subTitle] forState:UIControlStateNormal];
        [[YaBoOrgyTool sharedSoundToolManager] setSoundType:[self typeWihtYaBoOrgyPlay:[[YaBoOrgyTool sharedSoundToolManager] soundType]]];
    }
    [[YaBoOrgyTool sharedSoundToolManager] patWorthyLiberty:YaSoundCliclName];
}
- (NSString *)nextButtonTitleWihtYaBoOrgyPlay:(YaBoOrgyPlay)type {
    if (type == 0) {
        return @"[MED]";
    } else if (type == 1) {
        return @"[LOW]";
    } else if (type == 2) {
        return @"[OFF]";
    } else {
        return @"[HIGH]";
    }
}
- (NSString *)buttonTitleWihtYaBoOrgyPlay:(YaBoOrgyPlay)type {
    if (type == 0) {
        return @"[HIGH]";
    } else if (type == 1) {
        return @"[MED]";
    } else if (type == 2) {
        return @"[LOW]";
    } else {
        return @"[OFF]";
    }
}
- (YaBoOrgyPlay)typeWihtYaBoOrgyPlay:(YaBoOrgyPlay)type {
    if (type == YaBoOrgyManent) {
        return YaBoOrgySummer;
    } else if (type == YaBoOrgySummer) {
        return  YaBoOrgyMateHand;
    } else if (type ==  YaBoOrgyMateHand) {
        return  YaBoOrgyLiberty;
    } else {
        return YaBoOrgyManent;
    }
}
@end


