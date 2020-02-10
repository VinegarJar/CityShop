#import "YBSStage16PeopleView.h"
@interface YBSStage16PeopleView ()
@property (weak, nonatomic) IBOutlet UIImageView *upIV;
@property (weak, nonatomic) IBOutlet UIImageView *downIV;
@end
@implementation YBSStage16PeopleView
- (void)ullUpsWithIndex:(NSInteger)index {
    if (index == 1) {
        [[WNXSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundManDownName];
        self.upIV.hidden = YES;
        self.downIV.hidden = NO;
    } else {
        [[WNXSoundToolManager sharedSoundToolManager] playSoundWithSoundName:kSoundManUpName];
        self.upIV.hidden = NO;
        self.downIV.hidden = YES;
    }
}
- (void)resumeData {
    self.upIV.hidden = NO;
    self.downIV.hidden = YES;
}
@end
