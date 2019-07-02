//
//  PhotoAlbumModel.h
//  ImagePickerPhoto
//
//  Created by Smell Zero on 2018/7/15.
//  Copyright © 2018年 SmellZero. All rights reserved.
//  

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>

//相冊模型
@interface PhotoAlbumModel : NSObject
+ (PhotoAlbumModel *)parseWithResult:(PHAssetCollection*)result titel:(NSString *)titel;
+ (PhotoAlbumModel *)parseWithALAssetsGroup:(ALAssetsGroup*)result;
@property(nonatomic,copy)NSString*titel;
@property (nonatomic, assign)NSInteger count;
@property(nonatomic,copy)NSArray*dataSource;
@property(nonatomic,copy)UIImage*imgeUrl;

@end


//照片模型
@interface ImageModel : NSObject

@property(nonatomic,copy)NSString*titel;
@property(nonatomic,copy)NSArray *results;
@property (nonatomic,assign) BOOL isSelected;  // 状态
+(NSArray<ImageModel*>*)parsePhotoMode:(PHAssetCollection *)assetCollection;
+(NSArray<ImageModel*>*)parseAssetsPhotoMode:(ALAssetsGroup*)group;
@end

