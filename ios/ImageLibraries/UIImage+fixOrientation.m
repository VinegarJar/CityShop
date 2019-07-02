//
//  UIImage+fixOrientation.m
//  ryp_rn_supplier
//
//  Created by ZeroSmell on 2018/6/11.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "UIImage+fixOrientation.h"
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>

@implementation UIImage (fixOrientation)
- (UIImage *)fixOrientation {
  if (self.imageOrientation == UIImageOrientationUp) return self;
  
  // We need to calculate the proper transformation to make the image upright.
  // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
  CGAffineTransform transform = CGAffineTransformIdentity;
  
  switch (self.imageOrientation) {
    case UIImageOrientationDown:
    case UIImageOrientationDownMirrored:
      transform = CGAffineTransformTranslate(transform, self.size.width, self.size.height);
      transform = CGAffineTransformRotate(transform, M_PI);
      break;
      
    case UIImageOrientationLeft:
    case UIImageOrientationLeftMirrored:
      transform = CGAffineTransformTranslate(transform, self.size.width, 0);
      transform = CGAffineTransformRotate(transform, M_PI_2);
      break;
      
    case UIImageOrientationRight:
    case UIImageOrientationRightMirrored:
      transform = CGAffineTransformTranslate(transform, 0, self.size.height);
      transform = CGAffineTransformRotate(transform, -M_PI_2);
      break;
    case UIImageOrientationUp:
    case UIImageOrientationUpMirrored:
      break;
  }
  
  switch (self.imageOrientation) {
    case UIImageOrientationUpMirrored:
    case UIImageOrientationDownMirrored:
      transform = CGAffineTransformTranslate(transform, self.size.width, 0);
      transform = CGAffineTransformScale(transform, -1, 1);
      break;
      
    case UIImageOrientationLeftMirrored:
    case UIImageOrientationRightMirrored:
      transform = CGAffineTransformTranslate(transform, self.size.height, 0);
      transform = CGAffineTransformScale(transform, -1, 1);
      break;
    case UIImageOrientationUp:
    case UIImageOrientationDown:
    case UIImageOrientationLeft:
    case UIImageOrientationRight:
      break;
  }
  
  // Now we draw the underlying CGImage into a new context, applying the transform
  // calculated above.
  CGContextRef ctx = CGBitmapContextCreate(NULL, self.size.width, self.size.height,
                                           CGImageGetBitsPerComponent(self.CGImage), 0,
                                           CGImageGetColorSpace(self.CGImage),
                                           CGImageGetBitmapInfo(self.CGImage));
  CGContextConcatCTM(ctx, transform);
  switch (self.imageOrientation) {
    case UIImageOrientationLeft:
    case UIImageOrientationLeftMirrored:
    case UIImageOrientationRight:
    case UIImageOrientationRightMirrored:
      // Grr...
      CGContextDrawImage(ctx, CGRectMake(0,0,self.size.height,self.size.width), self.CGImage);
      break;
      
    default:
      CGContextDrawImage(ctx, CGRectMake(0,0,self.size.width,self.size.height), self.CGImage);
      break;
  }
  
  // And now we just create a new UIImage from the drawing context
  CGImageRef cgimg = CGBitmapContextCreateImage(ctx);
  UIImage *img = [UIImage imageWithCGImage:cgimg];
  CGContextRelease(ctx);
  CGImageRelease(cgimg);
  return img;
}


#pragma mark -  将图片旋转弧度radians
- (UIImage *)imageRotatedByRadians:(CGFloat)radians{
  UIView *rotatedViewBox = [[UIView alloc] initWithFrame:CGRectMake(0,0,self.size.width, self.size.height)];
  CGAffineTransform t = CGAffineTransformMakeRotation(radians);
  rotatedViewBox.transform = t;
  CGSize rotatedSize = rotatedViewBox.frame.size;
  
  UIGraphicsBeginImageContext(rotatedSize);
  CGContextRef bitmap = UIGraphicsGetCurrentContext();
  
  CGContextTranslateCTM(bitmap, rotatedSize.width/2, rotatedSize.height/2);
  CGContextRotateCTM(bitmap, radians);
  
  CGContextScaleCTM(bitmap, 1.0, -1.0);
  CGContextDrawImage(bitmap, CGRectMake(-self.size.width / 2, -self.size.height / 2, self.size.width, self.size.height), [self CGImage]);
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return newImage;
}


#pragma mark - 截取当前image对象rect区域内的图像
-(UIImage *)clippedImageWithRect:(CGRect)rect{
  CGImageRef  imageRef = CGImageCreateWithImageInRect([self fixOrientation].CGImage, rect);
  UIGraphicsBeginImageContext(rect.size);
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGContextDrawImage(context, rect, imageRef);
  UIImage * clipImage = [UIImage imageWithCGImage:imageRef];
  UIGraphicsEndImageContext();
  UIImageWriteToSavedPhotosAlbum(clipImage, nil, nil, nil);
  return clipImage;
}

- (UIImage *)circleImage{
  //1.开启跟原始图片一样大小的上下文
  UIGraphicsBeginImageContextWithOptions(self.size, NO, 0);
  //2.设置一个圆形裁剪区域
  //2.1绘制一个圆形
  UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, self.size.width, self.size.height)];
  //2.2.把圆形的路径设置成裁剪区域
  [path addClip];//超过裁剪区域以外的内容都给裁剪掉
  //3.把图片绘制到上下文当中(超过裁剪区域以外的内容都给裁剪掉)
  [self drawAtPoint:CGPointZero];
  //4.从上下文当中取出图片
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  //5.关闭上下文
  UIGraphicsEndImageContext();
  return newImage;
  
}

+ (UIImage *)imageWithBorder:(CGFloat)borderW color:(UIColor *)borderColor image:(UIImage *)image{ //1.开启一个上下文
  CGSize size = CGSizeMake(image.size.width + 2 * borderW, image.size.height + 2 * borderW);
  UIGraphicsBeginImageContextWithOptions(size, NO, 0); //2.绘制大圆,显示出来
  UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
  [borderColor set];
  [path fill]; //3.绘制一个小圆,把小圆设置成裁剪区域
  UIBezierPath *clipPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)]; [clipPath addClip]; //4.把图片绘制到上下文当中
  [image drawAtPoint:CGPointMake(borderW, borderW)]; //5.从上下文当中取出图片
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext(); //6.关闭上下文
  UIGraphicsEndImageContext();
  return newImage;
  
}

-(UIImage*)assetScaleToSize:(CGSize)size
{
  if (size.width <= 0 || size.height <= 0) return nil;
  
  if (CGSizeEqualToSize(self.size, size)) {
    return self;
  }
  
  CGSize oldsize = self.size;
  
  CGRect rect;
  
  if (size.width/size.height > oldsize.width/oldsize.height) {
    rect.size.width = size.width;
    rect.size.height = size.width*oldsize.height/oldsize.width;
    rect.origin.x = -(size.width - rect.size.width)/2;
    rect.origin.y = 0;
  }
  else{
    rect.size.width = size.height*oldsize.width/oldsize.height;
    rect.size.height = size.height;
    rect.origin.x = 0;
    rect.origin.y = -(size.height - rect.size.height)/2;
  }
  
  
  UIGraphicsBeginImageContextWithOptions(size, NO, self.scale);
  [self drawInRect:rect];
  UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  
  return image;
}

- (UIImage *)zoomFileSize:(UIImage *)image
{
  CGFloat scale = 1.0;
  
  NSData *tmpData = UIImagePNGRepresentation(image);
  
  if (tmpData.length > 0.5*1024*1024) {
    scale = (0.5*1024*1024)/tmpData.length;
  }
  
  NSData *data = UIImageJPEGRepresentation(image, scale);
  
  UIImage *imaged = [UIImage imageWithData:data];
  
  return imaged;
}

+ (NSData *)animatedDataWithGIF:(UIImage *)image
{
  if (!image.images) {
    return UIImageJPEGRepresentation(image, 1);
  }
  
  size_t frameCount = image.images.count;
  NSTimeInterval frameDuration = (/* DISABLES CODE */ (0) <= 0.0 ? image.duration / frameCount : 0);
  NSDictionary *frameProperties = @{
                                    (__bridge NSString *)kCGImagePropertyGIFDictionary: @{
                                        (__bridge NSString *)kCGImagePropertyGIFDelayTime: @(frameDuration)
                                        }
                                    };
  
  NSMutableData *mutableData = [NSMutableData data];
  CGImageDestinationRef destination = CGImageDestinationCreateWithData((__bridge CFMutableDataRef)mutableData, kUTTypeGIF, frameCount, NULL);
  
  NSDictionary *imageProperties = @{ (__bridge NSString *)kCGImagePropertyGIFDictionary: @{
                                         (__bridge NSString *)kCGImagePropertyGIFLoopCount: @(0)
                                         }
                                     };
  CGImageDestinationSetProperties(destination, (__bridge CFDictionaryRef)imageProperties);
  
  for (size_t idx = 0; idx < image.images.count; idx++) {
    CGImageDestinationAddImage(destination, [[image.images objectAtIndex:idx] CGImage], (__bridge CFDictionaryRef)frameProperties);
  }
  
  BOOL success = CGImageDestinationFinalize(destination);
  CFRelease(destination);
  
  if (!success) {
    
  }
  
  return [NSData dataWithData:mutableData];
}

#pragma mark - 图片压缩
- (NSData *)resetSizeOfImageData:(UIImage *)sourceImage maxSize:(NSInteger)maxSize {
  //先判断当前质量是否满足要求，不满足再进行压缩
  __block NSData *finallImageData = UIImageJPEGRepresentation(sourceImage,1.0);
  NSUInteger sizeOrigin   = finallImageData.length;
  NSUInteger sizeOriginKB = sizeOrigin / 1000;
  
  if (sizeOriginKB <= maxSize) {
    return finallImageData;
  }
  
  //获取原图片宽高比
  CGFloat sourceImageAspectRatio = sourceImage.size.width/sourceImage.size.height;
  //先调整分辨率
  CGSize defaultSize = CGSizeMake(1024, 1024/sourceImageAspectRatio);
  UIImage *newImage = [self newSizeImage:defaultSize image:sourceImage];
  
  finallImageData = UIImageJPEGRepresentation(newImage,1.0);
  
  //保存压缩系数
  NSMutableArray *compressionQualityArr = [NSMutableArray array];
  CGFloat avg   = 1.0/250;
  CGFloat value = avg;
  for (int i = 250; i >= 1; i--) {
    value = i*avg;
    [compressionQualityArr addObject:@(value)];
  }
  
  /*
   调整大小
   说明：压缩系数数组compressionQualityArr是从大到小存储。
   */
  //思路：使用二分法搜索
  finallImageData = [self halfFuntion:compressionQualityArr image:newImage sourceData:finallImageData maxSize:maxSize];
  //如果还是未能压缩到指定大小，则进行降分辨率
  while (finallImageData.length == 0) {
    //每次降100分辨率
    CGFloat reduceWidth = 100.0;
    CGFloat reduceHeight = 100.0/sourceImageAspectRatio;
    if (defaultSize.width-reduceWidth <= 0 || defaultSize.height-reduceHeight <= 0) {
      break;
    }
    defaultSize = CGSizeMake(defaultSize.width-reduceWidth, defaultSize.height-reduceHeight);
    UIImage *image = [self newSizeImage:defaultSize
                                  image:[UIImage imageWithData:UIImageJPEGRepresentation(newImage,[[compressionQualityArr lastObject] floatValue])]];
    finallImageData = [self halfFuntion:compressionQualityArr image:image sourceData:UIImageJPEGRepresentation(image,1.0) maxSize:maxSize];
  }
  return finallImageData;
}
#pragma mark 调整图片分辨率/尺寸（等比例缩放）
- (UIImage *)newSizeImage:(CGSize)size image:(UIImage *)sourceImage {
  CGSize newSize = CGSizeMake(sourceImage.size.width, sourceImage.size.height);
  
  CGFloat tempHeight = newSize.height / size.height;
  CGFloat tempWidth = newSize.width / size.width;
  
  if (tempWidth > 1.0 && tempWidth > tempHeight) {
    newSize = CGSizeMake(sourceImage.size.width / tempWidth, sourceImage.size.height / tempWidth);
  } else if (tempHeight > 1.0 && tempWidth < tempHeight) {
    newSize = CGSizeMake(sourceImage.size.width / tempHeight, sourceImage.size.height / tempHeight);
  }
  
  UIGraphicsBeginImageContext(newSize);
  [sourceImage drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
  UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  return newImage;
}
#pragma mark 二分法
- (NSData *)halfFuntion:(NSArray *)arr image:(UIImage *)image sourceData:(NSData *)finallImageData maxSize:(NSInteger)maxSize {
  NSData *tempData = [NSData data];
  NSUInteger start = 0;
  NSUInteger end = arr.count - 1;
  NSUInteger index = 0;
  
  NSUInteger difference = NSIntegerMax;
  while(start <= end) {
    index = start + (end - start)/2;
    
    finallImageData = UIImageJPEGRepresentation(image,[arr[index] floatValue]);
    
    NSUInteger sizeOrigin = finallImageData.length;
    NSUInteger sizeOriginKB = sizeOrigin / 1024;
    //    NSLog(@"当前降到的质量：%ld", (unsigned long)sizeOriginKB);
    //    NSLog(@"\nstart：%zd\nend：%zd\nindex%zd\n压缩系数：%lf", start, end, (unsigned long)index, [arr[index] floatValue]);
    
    if (sizeOriginKB > maxSize) {
      start = index + 1;
    } else if (sizeOriginKB < maxSize) {
      if (maxSize-sizeOriginKB < difference) {
        difference = maxSize-sizeOriginKB;
        tempData = finallImageData;
      }
      if (index<=0) {
        break;
      }
      end = index - 1;
    } else {
      break;
    }
  }
  return tempData;
}

@end


@implementation UIView (Additions)

- (UIViewController *)viewController
{
  for (UIView *next = [self superview]; next; next = next.superview) {
    UIResponder *nextResponder = [next nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
      return (UIViewController *)nextResponder;
    }
  }
  return nil;
}

@end
