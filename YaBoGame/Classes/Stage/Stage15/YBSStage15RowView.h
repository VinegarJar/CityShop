#import <UIKit/UIKit.h>
@interface YBSStage15RowView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *leftWoodIV;
@property (weak, nonatomic) IBOutlet UIImageView *rightWoodIV;
@property (weak, nonatomic) IBOutlet UIImageView *middleWoodIV;
- (void)showRowWithIsShowWave:(BOOL)showWave showFinish:(BOOL)finsih isFrist:(BOOL)isFrist;
- (void)startWoodAnimation;
@end
