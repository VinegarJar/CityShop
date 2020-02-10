#import <UIKit/UIKit.h>
#import "YBSStrokeLabel.h"
@interface YBSScoreboardCountView : UIView
@property (weak, nonatomic) IBOutlet YBSStrokeLabel *countLabel;
- (void)startAnimationWithCompletion:(void (^)(BOOL finished))completion;
- (void)hit;
- (void)clean;
- (void)setScore:(NSInteger)score;
@end
