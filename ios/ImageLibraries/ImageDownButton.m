//
//  ImageDownButton.m
//  ryp_rn_supplier
//
//  Created by ryp-app01 on 2018/9/25.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "ImageDownButton.h"
#import "GlobalMacros.h"
@implementation ImageDownButton

- (instancetype)initWithFrame:(CGRect)frame{
  if (self = [super initWithFrame:frame]) {
    self.adjustsImageWhenHighlighted = NO;
    [self setTitleColor: UIColorFromRGB(gobackColor) forState:UIControlStateNormal];
    [self setTitleColor: [UIColor blackColor] forState:UIControlStateNormal];
   [self setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"up"] forState:  UIControlStateSelected];
    [self setTitle:@"胶卷相册" forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont systemFontOfSize:17];
    [self setImageEdgeInsets:UIEdgeInsetsMake(10, 115, 0, 0)];
    [self setTitleEdgeInsets:UIEdgeInsetsMake(10, 10, 0, 30)];
  }
  return self;
}


@end
