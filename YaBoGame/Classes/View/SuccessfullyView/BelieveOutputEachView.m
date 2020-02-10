#import "BelieveOutputEachView.h"
@implementation BelieveOutputEachView
+(instancetype)loadNibNamedPrivacyView{
   BelieveOutputEachView *privacyView = [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([BelieveOutputEachView class]) owner:nil options:nil] lastObject];
   return privacyView;
}
@end


