//
//  ImagePickerList.m
//  ImagePickerPhoto
//
//  Created by ryp-app01 on 2018/7/16.
//  Copyright © 2018年 SmellZero. All rights reserved.
//

#import "ImagePickerList.h"
#import "GlobalMacros.h"
#import "ZeroSDCSafety.h"
#import "NSString+IMAdditions.h"

@interface ImagePickerCell()
@property (nonatomic ,weak) UIImageView *imageView;
@property (nonatomic, weak) UIButton *close;

@end
@implementation ImagePickerCell

- (UIImageView *)imageView
{
    if (!_imageView) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
        imageView.userInteractionEnabled = YES;
        [self addSubview:imageView];
        _imageView = imageView;
    }
    return _imageView;
}

- (UIButton *)close{
    if (!_close) {
        UIButton *close =[[UIButton alloc] initWithFrame:CGRectZero];
        [close setImage:[UIImage imageNamed:@"cancle@2x.png"] forState:UIControlStateNormal];
        [close addTarget:self action:@selector(deleteShotCell:) forControlEvents:UIControlEventTouchUpInside];
        [self.imageView addSubview:close];
        _close = close;
    }
    return _close;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        CGPoint newPoint = [self.close convertPoint:point fromView:self];
        if (CGRectContainsPoint(self.close.bounds, newPoint)) {
            view = self.close;
        }
    }
    return view;
}



-(void)setModel:(ImageModel *)model{
     //self.imageView.image = model.imgeUrl;

     ALAsset *asset = model.results[0];
     self.imageView.image =    [UIImage imageWithCGImage:asset.thumbnail];
    self.close.imageView.contentMode = UIViewContentModeCenter;
}

- (void)deleteShotCell:(UIButton *)sender{
    
    if ([self.delegate respondsToSelector:@selector(deleteCell:iconViewindex:)]&&self.delegate) {
        [self.delegate deleteCell:self iconViewindex:self.index];
    }
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _imageView.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(self.bounds));
    _close.frame = CGRectMake(CGRectGetWidth(self.bounds)-30, -15, 50, 50);
}


@end

#define ImagePickerHeight 120

@interface ImagePickerList ()<ImagePickerCellDelegate,UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong)UIView *alertView;
@property(nonatomic,strong)UIButton* dissmis;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, assign) BOOL isCanClick;
@property (nonatomic, assign) NSInteger indexPath;
@end

static NSString * const reuseIdentifier = @"Cell";

@implementation ImagePickerList

+ (instancetype)imagePickerListViewWithFrame:(CGRect)frame delegate:(id<ImagePickerListDelegate>)delegate{
    ImagePickerList *imageView = [[self alloc] initWithFrame:frame];
    imageView.delegate = delegate;
    return imageView;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self  alertView];
        [self dissmis];
        [self title];
        [self collectionView];
      
    }
    return self;
}


-(UIView*)alertView{
    if (!_alertView) {
        _alertView = [[UIView alloc]initWithFrame:CGRectMake(0, self.bounds.size.height, self.bounds.size.width , ImagePickerHeight)];
        _alertView.backgroundColor = [UIColor whiteColor];
        [self addSubview:_alertView];
    }
    return _alertView;
}


- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 5, 0, 5);
        flowLayout.itemSize = CGSizeMake(85, 85);
        flowLayout.minimumLineSpacing = 10;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width-70, ImagePickerHeight) collectionViewLayout:flowLayout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
     [_collectionView registerClass:[ImagePickerCell class] forCellWithReuseIdentifier:reuseIdentifier];
      [_alertView addSubview:_collectionView];
    }
    return _collectionView;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _icons.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ImagePickerCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    cell.index = indexPath.row;
    ImageModel*model =  [_icons SafetyObjectAtIndex:indexPath.row];
    [cell setModel:model];
    return cell;
}


-(void)deleteCell:(ImagePickerCell *)deleteCell iconViewindex:(NSInteger)iconViewindex{
    ImageModel*model =  [_icons SafetyObjectAtIndex:iconViewindex];
    if (iconViewindex<self.icons.count) {
        [_icons removeObjectAtIndex:iconViewindex];
         _title.text = [NSString stringWithFormat:@"%lu%@%ld",_icons.count,@"/",_maxCount];
    }
 

    if ([self.delegate respondsToSelector:@selector(deleteImage:deleteModel:)]&&self.delegate) {
         [self.delegate  deleteImage:self deleteModel:model];
    }
    
    if (self.icons.count<1) {
        [self disMiss];
    }
    [self.collectionView reloadData];
    DEBUG_NSLog(@"%ld",iconViewindex);
    
}




-(UIButton*)dissmis{
    if (!_dissmis) {
        _dissmis = [[UIButton alloc]initWithFrame:CGRectMake(self.bounds.size.width-70 ,0,70, ImagePickerHeight)];
        _dissmis.backgroundColor = UIColorFromRGB(verifyColor);
        [_dissmis addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [_dissmis setTitle:@"确定" forState:UIControlStateNormal ];
        [_dissmis setTitleEdgeInsets:UIEdgeInsetsMake(0,0, -40, 0)];
        [_alertView addSubview:_dissmis];
    }
    return _dissmis;
}

-(UILabel*)title{
    if (!_title) {
        _title = [[UILabel alloc] initWithFrame:CGRectMake(self.bounds.size.width-70,30, 70, 30)];
        _title.textColor = [UIColor whiteColor];
         _title.text = [NSString stringWithFormat:@"%@%@%ld",@"0",@"/",_maxCount];
        _title.font = [UIFont systemFontOfSize:17];
        _title.textAlignment =  NSTextAlignmentCenter ;
        _title.numberOfLines = 0;
        [_alertView addSubview:_title];
    }
    return _title;
}

-(void)clicked:(UIButton *)sender{
    if ([self.delegate respondsToSelector:@selector(confirm:)]&&self.delegate) {
        [self.delegate confirm:self];
    }
    [self disMiss];
}


-(void)showWithController:(UIView *)viewController{
  
    [viewController addSubview:self];
    [UIView animateWithDuration:0.25 animations:^{
        _alertView.frame = CGRectMake(0, self.bounds.size.height-ImagePickerHeight, self.bounds.size.width,  ImagePickerHeight);
    } completion:nil];
}

-(void)disMiss{
    [UIView animateWithDuration:0.25 animations:^{
        _alertView.frame = CGRectMake(0, self.bounds.size.height, self.bounds.size.width, ImagePickerHeight);
    } completion:^(BOOL finished) {  
         [self removeFromSuperview];
    }];
}


-(void)setIcons:(NSMutableArray *)icons{
    _icons = icons;
    _title.text = [NSString stringWithFormat:@"%lu%@%ld",_icons.count,@"/",_maxCount];
    if (_icons&&_icons.count>0) {
           [_collectionView reloadData];
    }
    if (icons.count==0) {
        [self disMiss];
    }
}

-(void)setMaxCount:(NSInteger)maxCount{
    _maxCount = maxCount;
}
@end
