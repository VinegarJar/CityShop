#import "YBSYBSportsAlert.h"
#import "YBSUIPrivacyView.h"
@interface YBSYBSportsAlert ()<UITextViewDelegate>
@property(nonatomic,strong)YBSUIPrivacyView *sportsAlert;
@property(nonatomic,strong)UIView *sportsBlackView;
@end
@implementation YBSYBSportsAlert
+(instancetype)initYBSportsAlertWithFrame:(CGRect)frame delegate:(id<YBSDCAlertDelegate>)delegate{
    YBSYBSportsAlert *alertView = [[self alloc] initWithFrame:frame];
    alertView.delegate = delegate;
    return alertView;
}
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self sportsBlackView];
        [self  sportsAlert];
    }
    return self;
}
-(UIView*)sportsBlackView{
    if (!_sportsBlackView) {
       _sportsBlackView = [[UIView alloc]initWithFrame:([UIScreen mainScreen].bounds)];
       _sportsBlackView.backgroundColor = [UIColor colorWithRed:(0)/255.0f green:(0)/255.0f blue:(0)/255.0f alpha:(0.6)];
        [self addSubview:_sportsBlackView];
    }
    return _sportsBlackView;
}
-(YBSUIPrivacyView*)sportsAlert{
    if (!_sportsAlert) {
        _sportsAlert = [YBSUIPrivacyView loadNibNamedPrivacyView];
         _sportsAlert.frame = CGRectMake(40, SCREEN_HEIGHT, SCREEN_WIDTH - 80, SCREEN_HEIGHT - 150);
         _sportsAlert.userInteractionEnabled = YES;
         _sportsAlert.layer.cornerRadius = 14;
         _sportsAlert.layer.masksToBounds=YES;
         _sportsAlert.layer.borderColor = [UIColor grayColor].CGColor;
        _sportsAlert.layer.borderWidth= 0;
         _sportsAlert.backgroundColor = [UIColor whiteColor];
        _sportsAlert.textView.delegate = self;
        [ _sportsAlert.agree addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [ _sportsAlert.check addTarget:self action:@selector(privacy:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_sportsAlert];
    }
    return _sportsAlert;
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{ return NO; }
-(void)clicked:(UIButton *)sender{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:YES forKey:@"isNotFist"];
    [userDefaults synchronize];
    if ([self.delegate respondsToSelector:@selector(didSportsAlert:)]&&self.delegate) {
        [self.delegate didSportsAlert:self];
    }
    [self close];
}
-(void)privacy:(UIButton *)sender{
}
-(void)setAnimationType:(YBSDCAlerAnimation)animationType{
      _animationType = animationType;
}
-(void)YBSDCAlerAnimationConterl:(UIViewController *)viewController{
   [viewController.view.window addSubview:self];
    self.sportsBlackView.alpha = 0;
    [UIView animateWithDuration:0.5 animations:^{
        self.sportsBlackView.alpha = 1;
        self->_sportsAlert.frame = CGRectMake(40, 75, SCREEN_WIDTH - 80, SCREEN_HEIGHT - 150);
    } completion:nil];
}
-(void)close{
    switch (_animationType) {
        case YBSportsAlertAnimationTypeDefault:{
            [UIView animateWithDuration:0.5 animations:^{
                self->_sportsAlert.frame = CGRectMake(20, SCREEN_HEIGHT, SCREEN_WIDTH - 40, SCREEN_HEIGHT - 150);
                self.sportsBlackView.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
        case YBSportsAlertAnimationTypeCenter:{
            [UIView animateWithDuration:0.4 animations:^{
                self->_sportsAlert.transform = CGAffineTransformMakeScale(.2f, .2f);
                self->_sportsAlert.alpha = 0;
                self.sportsBlackView.alpha = 0;
            }completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
        case YBSportsAlertAnimationTypeLine:{
            [UIView animateWithDuration:0.5 animations:^{
                self->_sportsAlert.frame = CGRectMake((SCREEN_WIDTH - 40)*0.5, 75, 0, SCREEN_HEIGHT - 150);
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
            break;
        default:
            break;
    }
}
@end
