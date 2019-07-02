//
//  UIImage+fixOrientation.h
//  ryp_rn_supplier
//
//  Created by ZeroSmell  on 2018/6/11.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (fixOrientation)
- (UIImage *)fixOrientation;
-(UIImage *)clippedImageWithRect:(CGRect)rect;
- (UIImage *)circleImage;
-(UIImage*)assetScaleToSize:(CGSize)size;
- (UIImage *)zoomFileSize:(UIImage *)image;
+ (NSData *)animatedDataWithGIF:(UIImage *)image;
- (NSData *)resetSizeOfImageData:(UIImage *)sourceImage maxSize:(NSInteger)maxSize;
@end

@interface UIView (Additions)
- (UIViewController *)viewController;
@end
