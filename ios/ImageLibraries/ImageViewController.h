//
//  ImageViewController.h
//  ryp_rn_supplier
//
//  Created by ryp-app01 on 2018/9/25.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import <UIKit/UIKit.h>


@class  ImageViewController;

@protocol ImageViewPhotoDelegate <NSObject>

@optional
- (void)getImagePhoto:(NSArray*)arraySource;
@end



@interface ImageViewController : UIViewController
@property (nonatomic, weak) id<ImageViewPhotoDelegate> delegate;
@property (nonatomic, assign) NSInteger maxCount;
-(void)getSystemPhotos;
@end
