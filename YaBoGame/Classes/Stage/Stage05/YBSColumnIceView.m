#import "YBSColumnIceView.h"
@interface YBSColumnIceView ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView3;
@property (weak, nonatomic) IBOutlet UIImageView *imageView4;
@end
@implementation YBSColumnIceView
- (void)awakeFromNib {
    self.clipsToBounds = NO;
}
- (void)showColumnDottedLineWithNum:(int)num {
    [self cleanTransform];
    switch (num) {
        case 1:
            self.imageView1.hidden = YES;
            self.imageView2.hidden = YES;
            self.imageView3.hidden = YES;
            self.imageView4.hidden = NO;
            self.imageView4.transform = CGAffineTransformMakeTranslation(0, self.imageView1.frame.origin.y - self.imageView4.frame.origin.y);
            break;
        case 2:
            self.imageView1.hidden = NO;
            self.imageView2.hidden = YES;
            self.imageView3.hidden = YES;
            self.imageView4.hidden = NO;
            self.imageView4.transform = CGAffineTransformMakeTranslation(0, self.imageView2.frame.origin.y - self.imageView4.frame.origin.y);
            break;
        case 3:
            self.imageView1.hidden = NO;
            self.imageView2.hidden = NO;
            self.imageView3.hidden = YES;
            self.imageView4.hidden = NO;
            self.imageView4.transform = CGAffineTransformMakeTranslation(0, self.imageView3.frame.origin.y - self.imageView4.frame.origin.y);
            break;
            case 4:
            self.imageView1.hidden = NO;
            self.imageView2.hidden = NO;
            self.imageView3.hidden = NO;
            self.imageView4.hidden = NO;
            break;
        default:
            break;
    }
}
- (void)cleanTransform {
    self.imageView1.transform = CGAffineTransformIdentity;
    self.imageView2.transform = CGAffineTransformIdentity;
    self.imageView3.transform = CGAffineTransformIdentity;
    self.imageView4.transform = CGAffineTransformIdentity;
}
@end
