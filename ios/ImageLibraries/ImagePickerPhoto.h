//
//  ImagePickerPhoto.h
//  ryp_rn_supplier
//
//  Created by ryp-app01 on 2018/7/12.
//  Copyright © 2018年 Facebook. All rights reserved.
// @property (nonatomic, strong) UIView*appBar;

#import <UIKit/UIKit.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface ImageNavigationBar : UIView
@property (weak, nonatomic) IBOutlet UIButton *goBack;
@property (weak, nonatomic) IBOutlet UIButton *camera;
@property (weak, nonatomic) IBOutlet UIButton *check;
+(instancetype)initImageNavigationBarWithFrame:(CGRect)frame;
- (void)goBack:(id)targe action:(SEL)action;
- (void)camera:(id)targe action:(SEL)action;
- (void)selected:(id)targe action:(SEL)action;
@end


@class ImagePickerPhoto;

@protocol ImagePickerPhotoDelegate <NSObject>

@optional
- (void)goBack:(ImagePickerPhoto*)goBack;
- (void)getImageList:(ImagePickerPhoto*)imagelist  arraySource:(NSArray*)arraySource ;
@end

NS_ASSUME_NONNULL_BEGIN
@interface ImagePickerPhoto : UIView
@property (nonatomic, weak) id<ImagePickerPhotoDelegate> delegate;
/* 提供给JS使用的属性**/
@property (nonatomic, assign) NSInteger maxCount;
-(void)getSystemPhotos;
NS_ASSUME_NONNULL_END
@end
