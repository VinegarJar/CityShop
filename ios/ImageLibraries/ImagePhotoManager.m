//
//  ImagePhotoManager.m
//  ryp_rn_supplier
//
//  Created by ryp-app01 on 2018/7/13.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "ImagePhotoManager.h"
#import "PhotoAlbumModel.h"
#import "GlobalMacros.h"
#import "UIImage+fixOrientation.h"

static ImagePhotoManager *manager = nil;
@interface ImagePhotoManager ()
/**
 @brief 相册库,Library
 */
@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;
/**
 @brief 文件缓存地址,the file cache path
 */
@property (nonatomic, copy) NSString *cachePath;
@end


@implementation ImagePhotoManager
- (id)copyWithZone:(NSZone *)zone {
  return [[ImagePhotoManager allocWithZone:zone] init];
}
+ (id)allocWithZone:(NSZone *)zone{
  return [self sharedManager];
}

+(instancetype)sharedManager{
  static dispatch_once_t dispatch;
  dispatch_once(&dispatch , ^{
      manager = [[super allocWithZone:NULL] init];
  });
  return manager;
}

#pragma mark-获取相机胶卷
-(void)getCameraRollAlbum:(BOOL)allowPickingVideo completed:(ImagePhotoCompletedBlock)completed{
    PHAssetCollection *assetCollection = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary options:nil].lastObject;
    NSMutableArray*arraySource = [[NSMutableArray alloc]init];
    PhotoAlbumModel*model =[PhotoAlbumModel  parseWithResult:assetCollection titel:assetCollection.localizedTitle];
    [arraySource addObject:model];
    if (arraySource.count) {
         completed(arraySource);
    }
}



#pragma mark-获取系统所有相册(相机胶卷/自定义相册/截图/自拍)
-(void)getOriginalImages:(BOOL)allowPickingVideo completed:(ImagePhotoCompletedBlock)completed{
  
      NSMutableArray*arraySource = [[NSMutableArray alloc]init];
     //相机胶卷
     PHAssetCollection *assetCollection = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeSmartAlbumUserLibrary options:nil].lastObject;
     PhotoAlbumModel*model =[PhotoAlbumModel  parseWithResult:assetCollection titel:assetCollection.localizedTitle];
     [arraySource addObject:model];
  
     //自定义相册
     PHFetchResult<PHAssetCollection *> *assetCollections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeAlbum  subtype:PHAssetCollectionSubtypeAlbumRegular options:nil];
     [assetCollections  enumerateObjectsUsingBlock:^(PHAssetCollection * _Nonnull collection, NSUInteger idx, BOOL *stop) {
       PhotoAlbumModel*model =[PhotoAlbumModel  parseWithResult:collection titel:collection.localizedTitle];
       if (model.count>0) {
         [arraySource addObject:model];
       }
     }];

     //截图
     if (@available(iOS 9.0, *)) {
       PHFetchResult<PHAssetCollection *> *assetCollections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum subtype:PHAssetCollectionSubtypeSmartAlbumScreenshots options:nil];
       [assetCollections  enumerateObjectsUsingBlock:^(PHAssetCollection * _Nonnull collection, NSUInteger idx, BOOL *stop) {
         PhotoAlbumModel*model =[PhotoAlbumModel  parseWithResult:collection titel:collection.localizedTitle];
         if (model.count>0) {
           [arraySource addObject:model];
         }
       }];
     }

     //自拍
     if (@available(iOS 9.0, *)) {
       PHFetchResult<PHAssetCollection *> *assetCollections = [PHAssetCollection fetchAssetCollectionsWithType:PHAssetCollectionTypeSmartAlbum  subtype:PHAssetCollectionSubtypeSmartAlbumSelfPortraits options:nil];
       [assetCollections  enumerateObjectsUsingBlock:^(PHAssetCollection * _Nonnull collection, NSUInteger idx, BOOL *stop) {

         PhotoAlbumModel*model =[PhotoAlbumModel  parseWithResult:collection titel:collection.localizedTitle];
         if (model.count>0) {
           [arraySource addObject:model];
         }
       }];
     }
     if (arraySource.count) {
       completed([arraySource copy]);
     }

}



-(void)getALAssetsLibraryGroups:(ImagePhotoCompletedBlock)completed   {
   ALAssetsFilter *assetsFilter = [ALAssetsFilter allPhotos];
   NSMutableArray*arraySource = [[NSMutableArray alloc]init];
  ALAssetsLibraryGroupsEnumerationResultsBlock listGroupBlock = ^(ALAssetsGroup *group, BOOL *stop) {
    if (group &&group.numberOfAssets > 0) {
            [group setAssetsFilter:assetsFilter];
            PhotoAlbumModel*model =[PhotoAlbumModel parseWithALAssetsGroup:group];
            [arraySource addObject:model];
    }else{
            completed([arraySource copy]);
    }
  };
  
  ALAssetsLibraryAccessFailureBlock failureBlock = ^(NSError *error){
    NSString *errorMessage = nil;
    switch ([error code]) {
      case ALAssetsLibraryAccessUserDeniedError:
      case ALAssetsLibraryAccessGloballyDeniedError:
        errorMessage = @"用户拒绝访问相册,请在<隐私>中开启";
        break;
      default:
        errorMessage = @"Reason unknown.";
        break;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
      UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"错误,无法访问!"
                                                         message:errorMessage
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil, nil];
      [alertView show];
    });
  };
  
  
  [[[ImagePhotoManager sharedManager]assetsLibrary] enumerateGroupsWithTypes:ALAssetsGroupAll
                               usingBlock:listGroupBlock failureBlock:failureBlock];
 
}


-(void)getLibraryImageChePath:(ALAsset *)asset  completed:(ImagePhotoCompletedBlock)completed{
     NSString * imagePath = [[[ImagePhotoManager sharedManager] cachePath] stringByAppendingFormat:@"/%@-image.jpg", [[NSUUID UUID] UUIDString]];
     UIImage *image = [UIImage imageWithCGImage:[[asset defaultRepresentation] fullScreenImage]];
      if (image) {
          UIImage *imaged = nil;
          CGFloat widthScale = image.size.width/960.0;
          CGFloat heightScale = image.size.height/1080.0;
          if (widthScale > 1.0 && heightScale > 1.0) {
              CGFloat minScale = MIN(widthScale, heightScale);
              imaged = [image assetScaleToSize:CGSizeMake(image.size.width/minScale, image.size.height/minScale)];
          }
          else {
              imaged = image;
          }
  
        if ([UIImageJPEGRepresentation(image, 0.8) writeToFile:imagePath atomically:YES]) {
                DEBUG_NSLog(@"保存成功%@",imagePath);
                if (imagePath) {
                    completed(imagePath);
                }
        }else{
                DEBUG_NSLog(@"保存失败");
        }
        
      }else{
             DEBUG_NSLog(@"未获取到图片");
      }
        
}


- (ALAssetsLibrary *)assetsLibrary{
  if (nil == _assetsLibrary) {
    static ALAssetsLibrary *assetsLibrary_ = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
      assetsLibrary_ = [[ALAssetsLibrary alloc] init];
    });
    _assetsLibrary = assetsLibrary_;
    DEBUG_NSLog(@"_assetsLibrary =%@", _assetsLibrary );
  }
  return _assetsLibrary;
}

- (NSString *)cachePath{
  if (nil == _cachePath) {
    _cachePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"SuppliersAsset"];
    [[NSFileManager defaultManager] createDirectoryAtPath:_cachePath withIntermediateDirectories:YES attributes:NULL error:NULL];
  }
  return _cachePath;
}


+ (NSInteger)authorizationStatus {
  if (@available(iOS 8.0, *)) {
    return [PHPhotoLibrary authorizationStatus];
  } else {
    return [ALAssetsLibrary authorizationStatus];
  }
}
  
@end
