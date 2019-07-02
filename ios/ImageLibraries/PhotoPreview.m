//
//  PhotoPreview.m
//  ImagePickerPhoto
//
//  Created by ryp-app01 on 2018/7/16.
//  Copyright © 2018年 SmellZero. All rights reserved.
//

#import "PhotoPreview.h"
#import "GlobalMacros.h"
#import "ImagePickerPhoto.h"
#import "ZeroSDCSafety.h"
#import "ImagePickerList.h"
#import "NSString+IMAdditions.h"
@implementation PhotoPreviewCell

-(instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupImageView];
    }
    return self;
}

- (void)setupImageView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    _imageView = imageView;
   // _imageView.contentMode =  UIViewContentModeCenter;
    [_imageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.contentView addSubview:imageView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
   _imageView.frame = self.bounds;
}


-(void)setModel:(ImageModel *)model{
    _model = model;  
  ALAsset *asset = model.results[0];
  self.imageView.image =    [UIImage imageWithCGImage:[[asset defaultRepresentation] fullResolutionImage]];
}


@end


NSString *const ReuseIdent = @"SDCycleCell";

@interface PhotoPreview ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDataSourcePrefetching,ImagePickerListDelegate>
@property(nonatomic,strong)UIView *zeroAlertView;
@property(nonatomic,strong)UIButton* dissmis;
@property(nonatomic,strong)ImageNavigationBar *bar;
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic, assign) NSInteger currentIndex;
@property(nonatomic,strong)ImagePickerList *imageAlertView;
@end


@implementation PhotoPreview
+ (instancetype)photoPreviewWithFrame:(CGRect)frame delegate:(id<PhotoPreviewDelegate>)delegate {
    PhotoPreview *preview = [[self alloc] initWithFrame:frame];
    preview.delegate = delegate;
    return preview;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
        [self  zeroAlertView];
        [self.zeroAlertView addSubview:self.bar];
        [self.zeroAlertView addSubview:self.collectionView];
        [self imageAlertView];
    }
    return self;
}


-(ImageNavigationBar*)bar{
    if (!_bar) {
        _bar = [ImageNavigationBar initImageNavigationBarWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , 50)];
        _bar.camera.hidden = YES;
        _bar.check.hidden = NO;
        [ _bar  goBack:self action:@selector(goBack:)];
        [ _bar  selected:self action:@selector(selected:)];
    }
    return _bar;
}

-(UIView*)zeroAlertView{
    if (!_zeroAlertView) {
        _zeroAlertView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, SCREEN_HEIGHT)];
        _zeroAlertView.backgroundColor = [UIColor blackColor];
        [self addSubview:_zeroAlertView];
    }
    return _zeroAlertView;
}


-(UICollectionView*)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        flowLayout.itemSize = self.frame.size;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumLineSpacing = 0;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_HEIGHT) collectionViewLayout:flowLayout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.scrollsToTop = NO;
        _collectionView.bounces = NO;
        if (@available(iOS 10.0, *)) {
            [_collectionView setPrefetchingEnabled:NO];
        }
        _collectionView.backgroundColor = [UIColor clearColor];
        [_collectionView registerClass:[PhotoPreviewCell class] forCellWithReuseIdentifier:ReuseIdent];
    }
    return _collectionView;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    PhotoPreviewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ReuseIdent forIndexPath:indexPath];
      ImageModel*model =   [_arraySource SafetyObjectAtIndex:indexPath.item];
     [cell setModel:model];
    return cell;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return  _arraySource.count;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
      [self goBack:_bar.goBack];
}

-(void)selected:(UIButton*)sender{
    
    if (_imageSource.count==0) {
           [_imageAlertView showWithController:self];
    }
    _selectItem++;
    if (_selectItem<=_maxCount) {//限制选择数量
      
        ImageModel*model =   [_arraySource SafetyObjectAtIndex:_currentIndex];
        model.isSelected = !model.isSelected;
        [self checkStatus:model.isSelected];
        if (model.isSelected) {
            if (_imageSource.count<_maxCount) {
                [_imageSource addObject:model];
                [_imageAlertView setIcons:_imageSource ];
            }
        }else{
              [self  deleteModel:model];
        }
    }
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    _currentIndex = (int) (scrollView.contentOffset.x/scrollView.bounds.size.width)%(_arraySource.count );
    ImageModel*model =   [_arraySource SafetyObjectAtIndex:_currentIndex];
    [self checkStatus:model.isSelected];
}


-(void)goBack:(UIButton*)sender{
    if ([self.delegate respondsToSelector:@selector(refreshSelectItem:)]&&self.delegate) {
         [self.delegate refreshSelectItem:self];
    }
    [UIView animateWithDuration:0.4 animations:^{
        _zeroAlertView.transform = CGAffineTransformMakeScale(.2f, .2f);
        _zeroAlertView.alpha = 0;
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


-(void)showWithController:(UIView *)viewController{
      [viewController addSubview:self];
    _zeroAlertView.frame = CGRectMake(0, 0, SCREEN_WIDTH , SCREEN_HEIGHT);
    _zeroAlertView.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
    _zeroAlertView.alpha = 0;
    [UIView animateWithDuration:0.4 animations:^{
        _zeroAlertView.transform = CGAffineTransformMakeScale(1.0f, 1.0f);
        _zeroAlertView.alpha = 1;
    } completion:nil];
}


-(void)setArraySource:(NSArray *)arraySource{
    _arraySource = arraySource;
    [_collectionView reloadData];
    ImageModel*model =   [_arraySource SafetyObjectAtIndex:_currentIndex];
    [self checkStatus:model.isSelected];

}

-(void)setMaxCount:(NSInteger)maxCount{
    _maxCount = maxCount;
    [_imageAlertView setMaxCount:_maxCount];
}

-(void)setSelectItem:(NSInteger)selectItem{
       _selectItem = selectItem;
    
}

-(void)setScrollToIndex:(NSIndexPath *)scrollToIndex{
    _scrollToIndex = scrollToIndex;
    [self.collectionView scrollToItemAtIndexPath:_scrollToIndex atScrollPosition:  UICollectionViewScrollPositionCenteredHorizontally animated:NO];
    //[_collectionView reloadData];
}


-(ImagePickerList*)imageAlertView{
    if (!_imageAlertView) {
        _imageAlertView = [ImagePickerList  imagePickerListViewWithFrame:CGRectMake(0, SCREEN_HEIGHT-120, SCREEN_WIDTH, 120) delegate:self];
    }
    return _imageAlertView;
}

#pragma mark-删除图片回调
- (void)deleteImage:(ImagePickerList *)deleteImage deleteModel:(ImageModel*)deleteModel{
    deleteModel.isSelected = !deleteModel.isSelected;
    [self checkStatus:deleteModel.isSelected];
    [self deleteModel:deleteModel];
}

#pragma mark-取消选中图片回调
-(void)deleteModel:( ImageModel*)model{
    [_imageSource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ImageModel *deleteModel = (ImageModel*)obj;
        if ( [deleteModel isEqual:model]) {
             [_imageSource  removeObjectAtIndex:idx];
        }
    }];
    _selectItem = _imageSource.count;
    [_imageAlertView setIcons:_imageSource];
}


#pragma mark-确认选择图片回调
-(void)confirm:(ImagePickerList *)confirm{
  
  if ([self.delegate respondsToSelector:@selector(refreshConFirmSelectImage:)]&&self.delegate) {
      [self.delegate refreshConFirmSelectImage:self];
  }

  [UIView animateWithDuration:0.4 animations:^{
    _zeroAlertView.transform = CGAffineTransformMakeScale(.2f, .2f);
    _zeroAlertView.alpha = 0;
  }completion:^(BOOL finished) {
    [self removeFromSuperview];
  }];
  
}


-(void)setImageSource:(NSMutableArray *)imageSource{
    _imageSource = imageSource;
  _selectItem = _imageSource.count;
    if (_imageSource&&_imageSource.count>0) {
          [_imageAlertView showWithController:self];
          [_imageAlertView setIcons:_imageSource];
    }
}

-(void)checkStatus:(BOOL)isSelected{
    if (isSelected) {
        [_bar.check setImage:[UIImage imageNamed:@"selected.png"] forState:UIControlStateNormal];
    }else{
        [_bar.check setImage:[UIImage imageNamed:@"unselected.png"] forState:UIControlStateNormal];
    }
}



@end
