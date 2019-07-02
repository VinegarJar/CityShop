//
//  ImagePickerPhoto.m
//  ryp_rn_supplier
//
//  Created by ryp-app01 on 2018/7/12.
//  Copyright © 2018年 Facebook. All rights reserved.
// 

#import "ImagePickerPhoto.h"
#import <AssetsLibrary/AssetsLibrary.h>
#import "GlobalMacros.h"
#import "ImageDownMenu.h"
#import "ImagePhotoManager.h"
#import "PhotoAlbumModel.h"
#import "ImagePickerPhotoCell.h"
#import "ZeroSDCSafety.h"
#import "ImagePickerList.h"
#import "PhotoPreview.h"
#import "NSString+IMAdditions.h"

#import "ImagePickerController.h"
#import "UIImage+fixOrientation.h"


@implementation ImageNavigationBar
+(instancetype)initImageNavigationBarWithFrame:(CGRect)frame  {
  ImageNavigationBar *bar= [[[NSBundle mainBundle] loadNibNamed:@"ImageNavigationBar" owner:self options:nil] firstObject];
  bar.frame = frame;
  return bar;
}

- (void)goBack:(id)targe action:(SEL)action{
   [self.goBack addTarget:targe action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)camera:(id)targe action:(SEL)action{
   [self.camera addTarget:targe action:action forControlEvents:UIControlEventTouchUpInside];
}

- (void)selected:(id)targe action:(SEL)action{
     [self.check addTarget:targe action:action forControlEvents:UIControlEventTouchUpInside];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        CGPoint newPoint = [self.goBack convertPoint:point fromView:self];
        if (CGRectContainsPoint(self.goBack.bounds, newPoint)) {
            view = self.goBack;
        }
    }
    return view;
}

@end



@interface ImagePickerPhoto ()<ImageDownMenuDelegate,UICollectionViewDataSource,UICollectionViewDelegate,
 ImagePickerListDelegate,ImagePickerPhotoDelegate,PhotoPreviewDelegate,UIScrollViewDelegate>
@property(nonatomic,strong)ImageNavigationBar *bar;
@property (nonatomic, strong)ImageDownMenu*downMenu;
@property (nonatomic, copy)  NSArray*arraySource;
@property (nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong)ImagePickerList *imageAlertView;
@property(nonatomic,strong) NSMutableArray*imageSource;
@property (nonatomic, assign) BOOL isEndDecelerating;
 @property (nonatomic, strong)UIActivityIndicatorView *activityView;
@end



static NSString *CellIdentifier = @"PhotoCell";


@implementation ImagePickerPhoto

- (instancetype)initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  if (self) {
    [self imageSource];
    [self addSubviews];
    [self activityView];
    [self getSystemPhotos];
    
  }
  return self;
}

-(UIActivityIndicatorView*)activityView{
  if (!_activityView) {
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
    _activityView.center = self.center;
    [self addSubview:_activityView];
    _activityView.hidesWhenStopped = YES;
  }
  return _activityView;
}

- (ImagePickerController *)picker{
   return (ImagePickerController *)[self viewController];
}


-(NSMutableArray*)imageSource{
    if (!_imageSource) {
        _imageSource = [[NSMutableArray alloc]init];
    }
    return _imageSource;
}


-(void)getSystemPhotos{
    [_activityView startAnimating];
      dispatch_async(dispatch_get_global_queue(0, 0), ^{
          [[ImagePhotoManager sharedManager ]getALAssetsLibraryGroups:^(id obj) {
              dispatch_async(dispatch_get_main_queue(), ^{
                    [_downMenu setArraySource:obj];
                    [_activityView stopAnimating];
                  });
            }];
    });
}

-(void)addSubviews{
    [self addSubview:self.collectionView];
    [self addSubview:self.bar];
    [self addSubview:self.downMenu];
    [self imageAlertView];
}

-(ImageNavigationBar*)bar{
    if (!_bar) {
        _bar = [ImageNavigationBar initImageNavigationBarWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , 50)];
      [ _bar  goBack:self action:@selector(goBack:)];
        [ _bar  camera:self action:@selector(camera:)];
    }
    return _bar;
}

-(void)camera:(UIButton*)sender{
    if (!sender.isSelected) {
        sender.selected = YES;
        [_downMenu showAlertView];
    }else{
        sender.selected = NO;
        [_downMenu dismissAlertView];
    }
}


-(void)goBack:(UIButton*)sender{
  if ([self.delegate respondsToSelector:@selector(goBack:)]){
       [self.delegate goBack:self];
  }
}

-(ImageDownMenu *)downMenu{
    if (!_downMenu){
        _downMenu = [[ImageDownMenu alloc]initWithFrame:[UIScreen mainScreen].bounds];
        _downMenu.delegate = self;
    }
    return _downMenu;
}


-(void)didSelectRowAtIndexPath:(ImageDownMenu *)didSelectRowAtIndexPath model:(PhotoAlbumModel *)model title:(NSString *)title{
      _bar.camera .selected = NO;
    if (title) {
      _arraySource = model.dataSource;
      dispatch_async(dispatch_get_main_queue(), ^{
        [_bar.camera setTitle:title forState:UIControlStateNormal];
        [_collectionView reloadData];
      });
    }
}


-(ImagePickerList*)imageAlertView{
    if (!_imageAlertView) {
        _imageAlertView = [ImagePickerList  imagePickerListViewWithFrame:CGRectMake(0, SCREEN_HEIGHT-120, SCREEN_WIDTH, 120) delegate:self];
    }
    return _imageAlertView;
}



- (UICollectionView *)collectionView{
    if (!_collectionView){
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_HEIGHT - 50) collectionViewLayout:flowLayout];
       _collectionView.dataSource=self;
       _collectionView.delegate=self;
      [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];
       _collectionView.showsVerticalScrollIndicator = YES;
       _collectionView.showsHorizontalScrollIndicator = NO;
     _collectionView.backgroundColor =UIColorFromRGB( bagRefColor);
     [ _collectionView registerNib:[UINib nibWithNibName:@"ImagePickerPhotoCell" bundle:nil] forCellWithReuseIdentifier:CellIdentifier];
    }
    return _collectionView;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _arraySource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    ImagePickerPhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.index = indexPath.row;
    cell.delegate = self;
    ImageModel *model = [_arraySource SafetyObjectAtIndex:indexPath.item];
     [cell setModel:model];
    return  cell;
}



- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
  return CGSizeMake(SCREEN_WIDTH, 120);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
  UICollectionReusableView *footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
  footerView.backgroundColor = UIColorFromRGB( bagRefColor);
  return footerView;
}


#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
      PhotoPreview*preview = [PhotoPreview photoPreviewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) delegate:self];
      [ preview  showWithController:self];
      [preview  setMaxCount:_maxCount];
      [preview setImageSource:_imageSource];
      [preview setArraySource:[_arraySource copy]];
      [preview setScrollToIndex:indexPath];
}


#pragma mark-预览选中图片回调
-(void)refreshSelectItem:(PhotoPreview *)selectItem{
      [_collectionView reloadData];
      [_imageAlertView showWithController:self];
      [_imageSource removeAllObjects];
      [_arraySource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ImageModel *model = (ImageModel*)obj;
        if (model.isSelected) {
            [_imageSource  addObject:model];
        }
    }];
    [_imageAlertView setIcons:_imageSource];
}

#pragma mark-预览确认选中图片回调
- (void)refreshConFirmSelectImage:(PhotoPreview *)conFirmSelectImage{
  [_collectionView reloadData];
  [_imageSource removeAllObjects];
  [_arraySource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    ImageModel *model = (ImageModel*)obj;
    if (model.isSelected) {
      [_imageSource  addObject:model];
    }
  }];
   [self confirm:nil];
}

#pragma mark-选中图片回调
- (void)didSelectItemCell:(ImagePickerPhotoCell *)didSelectItemCell  iconViewindex:(NSInteger)iconViewindex{
  
    if (_imageSource.count==0) {
        [_imageAlertView showWithController:self];
    }
    ImageModel *model = [_arraySource SafetyObjectAtIndex:iconViewindex];
    if (_imageSource.count<_maxCount) {//限制选择数量
         model.isSelected = !model.isSelected;
    }
    
    if (model.isSelected) {//选中和取消状态
            if (_imageSource.count<_maxCount) {
                [_imageSource addObject:model];
              dispatch_async(dispatch_get_main_queue(), ^{
                [_imageAlertView setIcons:_imageSource ];
              });
            }else{
                 model.isSelected = !model.isSelected;
                [self unselectPickerPhoto:model];
            }
    }else{
        [self unselectPickerPhoto:model];
    }
    [_collectionView reloadData];
}



#pragma mark-取消选中图片回调
-(void)unselectPickerPhoto:( ImageModel*)model{
    [_imageSource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        ImageModel *deleteModel = (ImageModel*)obj;
        if ( [deleteModel isEqual:model]) {
            [_imageSource  removeObjectAtIndex:idx];
        }
    }];
    [_imageAlertView setIcons:_imageSource];
}

#pragma mark-删除图片回调
-(void)deleteImage:(ImagePickerList *)deleteImage deleteModel:(ImageModel *)deleteModel{
    deleteModel.isSelected = !deleteModel.isSelected;
    [_collectionView reloadData];
}

#pragma mark-确认选择图片回调
-(void)confirm:(ImagePickerList *)confirm{
  NSMutableArray*arraySource = [[NSMutableArray alloc]init];
  [_imageSource  enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
    ImageModel *model = (ImageModel*)obj;
       @autoreleasepool {
           ALAsset *asset = model.results[0];
         [[ImagePhotoManager sharedManager]getLibraryImageChePath:asset completed:^(id obj) {
              [arraySource addObject:obj];
         }];
       }
  }];

  if ([self.delegate respondsToSelector:@selector(getImageList:arraySource:)]&&self.delegate&&arraySource.count){
        [self.delegate getImageList:self arraySource:[arraySource copy]];
  }
}


- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 0, 5);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(SCREEN_WIDTH/3-10,SCREEN_WIDTH/3-10);
}

-(void)setMaxCount:(NSInteger)maxCount{
  _maxCount = maxCount;
    [_imageAlertView setMaxCount:_maxCount];
}



@end
