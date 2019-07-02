//
//  ImageDownMenu.h
//  ryp_rn_supplier
//
//  Created by ryp-app01 on 2018/7/13.
//  Copyright © 2018年 Facebook. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "PhotoAlbumModel.h"


@class ImageDownMenu;

@protocol ImageDownMenuDelegate <NSObject>

@optional
- (void)didSelectRowAtIndexPath:(ImageDownMenu*)didSelectRowAtIndexPath
                          model:( PhotoAlbumModel*)model  title:(NSString*)title;

@end

@interface ImagePhotoCell : UITableViewCell
@property (nonatomic, strong)  UILabel* titleLabel ;
@property (nonatomic, strong)  UIImageView*imge;
@end


@interface ImageDownMenu : UIView
@property (nonatomic, weak) id<ImageDownMenuDelegate> delegate;
- (instancetype)initWithFrame:(CGRect)frame;
@property (nonatomic,copy)NSArray*arraySource;
-(void)showAlertView;
-(void)dismissAlertView;

@end
