#import "YBSBaseGameViewController.h"
@interface YBSTwoButtonViewController : YBSBaseGameViewController
@property (nonatomic, strong) UIImageView *backgroundIV;
@property (nonatomic, strong) UIButton *leftButton;
@property (nonatomic, strong) UIButton *rightButton;
- (void)setButtonActivate:(BOOL)isActivate;
@end
