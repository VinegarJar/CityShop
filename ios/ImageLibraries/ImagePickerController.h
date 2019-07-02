//
//  ImagePickerController.h
//  ryp_rn_supplier
//
//  Created by ryp-app01 on 2018/8/4.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@class ImagePickerController;

@protocol ImagePickerControllerDelegate <NSObject>

@optional

- (void)imagepath:(ImagePickerController*)imagepath arraySource:(NSArray*)arraySource;
@end

@interface ImagePickerController : UIViewController
- (instancetype)initWithMaxCount:(NSInteger)maxCount;
@property (nonatomic, weak) id<ImagePickerControllerDelegate> delegate;

@end
