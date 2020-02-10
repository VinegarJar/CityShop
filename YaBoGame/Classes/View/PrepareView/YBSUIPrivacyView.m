#import "YBSUIPrivacyView.h"
@implementation YBSUIPrivacyView
+(instancetype)loadNibNamedPrivacyView{
   YBSUIPrivacyView *privacyView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([YBSUIPrivacyView class]) owner:nil options:nil] lastObject];
   return privacyView;
}
@end
