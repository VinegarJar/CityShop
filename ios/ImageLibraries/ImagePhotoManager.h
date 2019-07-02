//
//  ImagePhotoManager.h
//  ryp_rn_supplier
//
//  Created by ryp-app01 on 2018/7/13.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <Photos/Photos.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface ImagePhotoModel : NSObject

@end

typedef void (^ImagePhotoCompletedBlock)(id obj);

@interface ImagePhotoManager : NSObject
+(instancetype)sharedManager;
- (void)getCameraRollAlbum:(BOOL)allowPickingVideo  completed:(ImagePhotoCompletedBlock)completed;
-(void)getOriginalImages:(BOOL)allowPickingVideo completed:(ImagePhotoCompletedBlock)completed;
-(void)getALAssetsLibraryGroups:(ImagePhotoCompletedBlock)completed ;
-(void)getLibraryImageChePath:(ALAsset *)asset  completed:(ImagePhotoCompletedBlock)completed;
@end
