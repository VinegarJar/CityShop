//
//  ImagePickerList.h
//  ImagePickerPhoto
//
//  Created by ryp-app01 on 2018/7/16.
//  Copyright © 2018年 SmellZero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoAlbumModel.h"

@class ImagePickerCell;

@protocol ImagePickerCellDelegate<NSObject>
@optional
- (void)deleteCell:(ImagePickerCell *)deleteCell  iconViewindex:(NSInteger)iconViewindex;

@end


@interface ImagePickerCell : UICollectionViewCell
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, weak) id <ImagePickerCellDelegate> delegate;
@property (nonatomic,strong) ImageModel *model;
@end




@class ImagePickerList;
@protocol ImagePickerListDelegate <NSObject>
@optional
- (void)deleteImage:(ImagePickerList *)deleteImage deleteModel:(ImageModel*)deleteModel;
- (void)confirm:(ImagePickerList *)confirm;
@end

@interface ImagePickerList : UIView

/** 初始化（推荐使用） */
+ (instancetype)imagePickerListViewWithFrame:(CGRect)frame delegate:(id<ImagePickerListDelegate>)delegate;
@property (nonatomic, weak) id<ImagePickerListDelegate> delegate;
@property (nonatomic, assign) NSInteger maxCount;
@property(nonatomic ,strong)UILabel*title;
@property (nonatomic, strong) NSMutableArray *icons;
/*开启动画*/
-(void)showWithController:(UIView *)viewController;
/*关闭动画*/
-(void)disMiss;

@end
