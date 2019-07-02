//
//  ImagePickerPhotoCell.h
//  ImagePickerPhoto
//
//  Created by ryp-app01 on 2018/7/16.
//  Copyright © 2018年 SmellZero. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PhotoAlbumModel.h"
#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>

@class ImagePickerPhotoCell;

@protocol ImagePickerPhotoDelegate<NSObject>

@optional

- (void)didSelectItemCell:(ImagePickerPhotoCell *)didSelectItemCell  iconViewindex:(NSInteger)iconViewindex;

@end


@interface ImagePickerPhotoCell : UICollectionViewCell
@property (nonatomic, weak) id <ImagePickerPhotoDelegate> delegate;
@property (nonatomic, assign) NSInteger index;
@property (nonatomic,strong) ImageModel *model;

@end
