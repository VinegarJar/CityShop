#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@interface YBSUIPrivacyView : UIView
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIButton *check;
@property (weak, nonatomic) IBOutlet UIButton *agree;
+(instancetype)loadNibNamedPrivacyView;
@end
NS_ASSUME_NONNULL_END
