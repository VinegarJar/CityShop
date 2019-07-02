//
//  PhotoPreview.h
//  ImagePickerPhoto
//
//  Created by ryp-app01 on 2018/7/16.
//  Copyright © 2018年 SmellZero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoAlbumModel.h"

@interface PhotoPreviewCell : UICollectionViewCell
@property (weak, nonatomic) UIImageView *imageView;
@property (nonatomic,strong) ImageModel *model;
@end



@class PhotoPreview;
@protocol PhotoPreviewDelegate <NSObject>
@optional

- (void)didSelectItem:(PhotoPreview *)didSelectItem model:(ImageModel*)model;
- (void)refreshSelectItem:(PhotoPreview *)selectItem;
- (void)refreshConFirmSelectImage:(PhotoPreview *)conFirmSelectImage;
@end



@interface PhotoPreview : UIView
+ (instancetype)photoPreviewWithFrame:(CGRect)frame delegate:(id<PhotoPreviewDelegate>)delegate ;
@property (nonatomic, weak) id<PhotoPreviewDelegate> delegate;
@property (nonatomic, strong) NSMutableArray *icons;
-(void)showWithController:(UIView *)viewController;
@property (nonatomic,copy) NSArray *arraySource;

/** 最大图片选择量 */
@property (nonatomic, assign) NSInteger maxCount;
/** 已经选中的图片量 */
@property (nonatomic, assign) NSInteger selectItem;
/** 滚动到选中的图片 */
@property (nonatomic, assign) NSIndexPath* scrollToIndex;
@property(nonatomic,copy) NSMutableArray*imageSource;
@end
