#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger,  YBSDCAlerAnimation) {
     YBSportsAlertAnimationTypeDefault,
     YBSportsAlertAnimationTypeCenter,
     YBSportsAlertAnimationTypeLine,
};
@class WearStockingUrban;
@protocol YBSDCAlertDelegate <NSObject>
@optional
- (void)didSportsAlert:(WearStockingUrban *)didSportsAlert;
@end
@interface WearStockingUrban : UIView
+ (instancetype)initYBSportsAlertWithFrame:(CGRect)frame delegate:(id<YBSDCAlertDelegate>)delegate;
@property (nonatomic, weak) id<YBSDCAlertDelegate> delegate;
@property(nonatomic,assign) YBSDCAlerAnimation  animationType;
-(void)imposeDenseBlock:(UIViewController *)viewController;
-(void)demonstratePremierArtistic;
@end


