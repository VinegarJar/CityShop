//
//  PhotoAlbumModel.m
//  ImagePickerPhoto
//
//  Created by Smell Zero on 2018/7/15.
//  Copyright © 2018年 SmellZero. All rights reserved.
//

#import "PhotoAlbumModel.h"
#import "GlobalMacros.h"
#import <objc/runtime.h>
#import "NSString+IMAdditions.h"
#import "ALAssetsGroup+attribute.h"

@implementation PhotoAlbumModel
- (NSString *)description{
  NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
  uint count;
  objc_property_t *properties = class_copyPropertyList([self class], &count);
  for (int i = 0; i < count; i++){
    objc_property_t property = properties[i];
    NSString *name = @(property_getName(property));
    id value = [self valueForKey:name]?:@"nil";
    [dictionary setObject:value forKey:name];
  }
  free(properties);
  return [NSString stringWithFormat:@"<%@:%p> -- %@", [self class], self, dictionary];
}

+ (PhotoAlbumModel *)parseWithResult:(PHAssetCollection*)result titel:(NSString *)titel {
   PhotoAlbumModel *model = [[PhotoAlbumModel  alloc] init];
    model.titel= titel;
    model.dataSource =  [ImageModel parsePhotoMode:result];
    model.count = model.dataSource.count;
    NSString*url = [NSString stringWithFormat:@"%@%@%@",[NSString docPathcacheFolder],@"/",[[ImageModel parsePhotoMode:result] firstObject].titel];
    UIImage*image = [UIImage imageNamed:url];
    model.imgeUrl = image;
    return model;
}



+ (PhotoAlbumModel *)parseWithALAssetsGroup:(ALAssetsGroup*)group{
    PhotoAlbumModel *model = [[PhotoAlbumModel  alloc] init];
    model.titel= group.title;
    model.count = group.numberOfAssets;
    model.imgeUrl = [UIImage imageWithCGImage:group.posterImage];
    model.dataSource =  [ImageModel parseAssetsPhotoMode:group];
    return model;
}


@end



@implementation ImageModel

- (NSString *)description{
  NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
  uint count;
  objc_property_t *properties = class_copyPropertyList([self class], &count);
  for (int i = 0; i < count; i++){
    objc_property_t property = properties[i];
    NSString *name = @(property_getName(property));
    id value = [self valueForKey:name]?:@"nil";
    [dictionary setObject:value forKey:name];
  }
  free(properties);
  return [NSString stringWithFormat:@"<%@:%p> -- %@", [self class], self, dictionary];
}


+(NSArray<ImageModel*>*)parseAssetsPhotoMode:(ALAssetsGroup*)group{
  NSMutableArray*arraySource = [[NSMutableArray alloc]init];
  if (group) {
    [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
      if (result) {
         @autoreleasepool {
            ImageModel*model = [[ImageModel alloc]init];
            NSMutableArray *results = [NSMutableArray array];
            [results insertObject:result atIndex:0];
            model.isSelected = NO;
            model.results = [results copy];
            [arraySource addObject:model];
          }
      }
    }];
  }
  return [arraySource copy];
  
}


+(NSArray<ImageModel*>*)parsePhotoMode:(PHAssetCollection *)assetCollection{
  NSMutableArray*arraySource = [[NSMutableArray alloc]init];
  PHImageRequestOptions *options = [[PHImageRequestOptions alloc] init];
  options.synchronous = NO;
  PHFetchOptions *option = [[PHFetchOptions alloc] init];
  option.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"creationDate" ascending:YES]];
  PHFetchResult<PHAsset *> *assets = [PHAsset fetchAssetsInAssetCollection:assetCollection options:option];
  [assets enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    @autoreleasepool {
      PHAsset *asset = (PHAsset *)obj;
      CGSize size =  CGSizeMake(asset.pixelWidth/2, asset.pixelHeight/2);
      ImageModel*model = [[ImageModel alloc]init];
      model.titel =[asset valueForKey:@"filename"];
      model.isSelected = NO; // 默认不选中
      [[PHImageManager defaultManager] requestImageForAsset:asset targetSize:size contentMode:PHImageContentModeDefault options:options resultHandler:^(UIImage * _Nullable result, NSDictionary * _Nullable info) {
         [model saveImageCacheFile:[asset valueForKey:@"filename"] result:result];
      }];
      [arraySource addObject:model];
    }

  }];

  return [arraySource copy];
}


- (void)saveImageCacheFile:( NSString*)fileName  result:(UIImage * _Nullable)result{
  //判断一个给定路径是否为文件夹
  if (![[NSFileManager defaultManager] fileExistsAtPath:[NSString docPathcacheFolder]]) {
    [[NSFileManager defaultManager] createDirectoryAtPath:[NSString docPathcacheFolder] withIntermediateDirectories:YES attributes:nil error:nil];
  }
  dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    NSString *cacheFile = [[NSString docPathcacheFolder] stringByAppendingPathComponent:fileName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:cacheFile]) {
      if ([UIImageJPEGRepresentation(result, 0.8) writeToFile:cacheFile atomically:YES]) {
            NSString*url = [NSString stringWithFormat:@"%@%@%@",[NSString docPathcacheFolder],@"/",fileName];
            DEBUG_NSLog(@"保存成功,url=%@",url);
      }else{
            DEBUG_NSLog(@"保存失败");
      }
    }else{
             DEBUG_NSLog(@"路径存在了。。。");
    }
  });

}






@end

