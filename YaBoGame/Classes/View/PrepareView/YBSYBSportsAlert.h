#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,  YBSDCAlerAnimation) {
     YBSportsAlertAnimationTypeDefault,
     YBSportsAlertAnimationTypeCenter,
     YBSportsAlertAnimationTypeLine,
};
@class YBSYBSportsAlert;
@protocol YBSDCAlertDelegate <NSObject>
@optional
- (void)didSportsAlert:(YBSYBSportsAlert *)didSportsAlert;
@end
@interface YBSYBSportsAlert : UIView
+ (instancetype)initYBSportsAlertWithFrame:(CGRect)frame delegate:(id<YBSDCAlertDelegate>)delegate;
@property (nonatomic, weak) id<YBSDCAlertDelegate> delegate;
@property(nonatomic,assign) YBSDCAlerAnimation  animationType;
-(void)YBSDCAlerAnimationConterl:(UIViewController *)viewController;
-(void)close;
@end
