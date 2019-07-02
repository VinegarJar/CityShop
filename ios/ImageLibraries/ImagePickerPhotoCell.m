//
//  ImagePickerPhotoCell.m
//  ImagePickerPhoto
//
//  Created by ryp-app01 on 2018/7/16.
//  Copyright © 2018年 SmellZero. All rights reserved.
//

#import "ImagePickerPhotoCell.h"
#import "GlobalMacros.h"
#import "NSString+IMAdditions.h"
@interface ImagePickerPhotoCell ()

@property (weak, nonatomic) IBOutlet  UIImageView  *isSelected;
@property (weak, nonatomic) IBOutlet UIImageView *imgeUrl;
@end


@implementation ImagePickerPhotoCell


- (void)awakeFromNib {
    [super awakeFromNib];

    UITapGestureRecognizer *top = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(doTapChange:)];
    [_isSelected  addGestureRecognizer:top];
}

-(void)setModel:(ImageModel *)model{
     _model = model;
    ALAsset *asset = model.results[0];
   _imgeUrl.image =    [UIImage imageWithCGImage:asset.thumbnail];
  
  if (_model.isSelected) {
      _isSelected.image = [UIImage imageNamed:@"selected.png"];
    }else{
      _isSelected.image = [UIImage imageNamed:@"unselected.png"];
    }

}

-(void)doTapChange:(UITapGestureRecognizer *)sender{
    if ([self.delegate respondsToSelector:@selector(didSelectItemCell:iconViewindex:)]&&self.delegate) {
         [self.delegate didSelectItemCell:self iconViewindex:self.index];
    }
}


@end
