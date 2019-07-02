//
//  ImageViewController.m
//  ryp_rn_supplier
//
//  Created by ryp-app01 on 2018/9/25.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "ImageViewController.h"
#import "GlobalMacros.h"
#import "ImageDownButton.h"
#import "ImageDownMenu.h"
#import "ImagePhotoManager.h"
#import "ImagePickerList.h"
#import "PhotoAlbumModel.h"
#import "ImagePickerPhotoCell.h"
#import "ZeroSDCSafety.h"
#import "PhotoPageViewController.h"
@interface ImageViewController ()<ImageDownMenuDelegate,UICollectionViewDataSource,UICollectionViewDelegate,
ImagePickerListDelegate,ImagePickerPhotoDelegate>
@property (nonatomic, strong)ImageDownButton*down;
@property (nonatomic, strong)ImageDownMenu*downMenu;
 @property (nonatomic, strong)UIActivityIndicatorView *activityView;
@property (nonatomic, copy)  NSArray*arraySource;
@property (nonatomic,strong) UICollectionView *collectionView;
@property(nonatomic,strong)ImagePickerList *imageAlertView;
@property(nonatomic,strong) NSMutableArray*imageSource;
@end

static NSString *CellIdentifier = @"PhotoCell";
@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor orangeColor];
    [self imageSource];
    [self addSubviews];
    [self activityView];
    [self getSystemPhotos];
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



-(NSMutableArray*)imageSource{
  if (!_imageSource) {
    _imageSource = [[NSMutableArray alloc]init];
  }
  return _imageSource;
}


-(void)addSubviews{
   [self setupBackButton];
   [self down];
   [self collectionView];
   [self downMenu];
   [self imageAlertView];
}

- (void)setupBackButton{
  UIBarButtonItem *leftBarButton= [[UIBarButtonItem alloc] initWithImage:
                                   [UIImage imageNamed:@"goBack"]style:
                                   UIBarButtonItemStylePlain target:self
                                                                  action:@selector(dismiss:)];
  leftBarButton.tintColor = UIColorFromRGB(gobackColor);
  self.navigationItem.leftBarButtonItem = leftBarButton;
}

-(ImageDownButton*)down{
  if (!_down) {
    _down = [[ImageDownButton alloc]initWithFrame:CGRectMake(0, 0, 150, 45)];
    [_down addTarget:self action:@selector(downClick:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = _down;
  }
  return _down;
}

-(ImageDownMenu *)downMenu{
  if (!_downMenu){
    _downMenu = [[ImageDownMenu alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _downMenu.delegate = self;
    [self.view addSubview:_downMenu];
  }
  return _downMenu;
}
-(UIActivityIndicatorView*)activityView{
  if (!_activityView) {
    _activityView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray];
    _activityView.center = self.view.center;
    [self.view addSubview:_activityView];
    _activityView.hidesWhenStopped = YES;
  }
  return _activityView;
}

-(ImagePickerList*)imageAlertView{
  if (!_imageAlertView) {
    _imageAlertView = [ImagePickerList  imagePickerListViewWithFrame:CGRectMake(0, SCREEN_HEIGHT-120, SCREEN_WIDTH, 120) delegate:self];
    [_imageAlertView setMaxCount:_maxCount];
  }
  return _imageAlertView;
}



- (UICollectionView *)collectionView{
  if (!_collectionView){
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    _collectionView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT ) collectionViewLayout:flowLayout];
    _collectionView.dataSource=self;
    _collectionView.delegate=self;
    _collectionView.showsVerticalScrollIndicator = YES;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor =UIColorFromRGB( bagRefColor);
    [ _collectionView registerNib:[UINib nibWithNibName:@"ImagePickerPhotoCell" bundle:nil] forCellWithReuseIdentifier:CellIdentifier];
    [self.view addSubview:_collectionView];
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

#pragma mark-所有点击事件处理
-(void)didSelectRowAtIndexPath:(ImageDownMenu *)didSelectRowAtIndexPath model:(PhotoAlbumModel *)model title:(NSString *)title{
    _down.selected = NO;
  if (title) {
     _arraySource = model.dataSource;
    dispatch_async(dispatch_get_main_queue(), ^{
      [_down setTitle:title forState:UIControlStateNormal];
        [_collectionView reloadData];
    });
  }
}


-(void)downClick:(UIButton*)sender{
  if (!sender.isSelected) {
       sender.selected = YES;
     [_downMenu showAlertView];
  }else{
       sender.selected = NO;
      [_downMenu dismissAlertView];
  }
}

-(void)dismiss:(UIBarButtonItem*)sender{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}





#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
  
  PhotoPageViewController*controller = [[PhotoPageViewController alloc]init];
  [self.navigationController pushViewController:controller animated:YES];
//  PhotoPreview*preview = [PhotoPreview photoPreviewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) delegate:self];
//  [ preview  showWithController:self];
//  [preview  setMaxCount:_maxCount];
//  [preview setImageSource:_imageSource];
//  [preview setArraySource:[_arraySource copy]];
//  [preview setScrollToIndex:indexPath];
}


#pragma mark-预览选中图片回调
//-(void)refreshSelectItem:(PhotoPreview *)selectItem{
//  [_collectionView reloadData];
//  [_imageAlertView showWithController:self];
//  [_imageSource removeAllObjects];
//  [_arraySource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//    ImageModel *model = (ImageModel*)obj;
//    if (model.isSelected) {
//      [_imageSource  addObject:model];
//    }
//  }];
//  [_imageAlertView setIcons:_imageSource];
//}

//#pragma mark-预览确认选中图片回调
//- (void)refreshConFirmSelectImage:(PhotoPreview *)conFirmSelectImage{
//  [_collectionView reloadData];
//  [_imageSource removeAllObjects];
//  [_arraySource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//    ImageModel *model = (ImageModel*)obj;
//    if (model.isSelected) {
//      [_imageSource  addObject:model];
//    }
//  }];
//  [self confirm:nil];
//}



#pragma mark-选中图片回调
- (void)didSelectItemCell:(ImagePickerPhotoCell *)didSelectItemCell  iconViewindex:(NSInteger)iconViewindex{
  
  if (_imageSource.count==0) {
       [_imageAlertView showWithController:self.view];
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
  
  
  
  if ([_delegate respondsToSelector:@selector(getImagePhoto:)]&&self.delegate&&arraySource.count) {
        [_delegate getImagePhoto:[arraySource copy]];
  }
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


- (UIEdgeInsets)collectionView:(UICollectionView*)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
  return UIEdgeInsetsMake(5, 5, 0, 5);
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
  return CGSizeMake(SCREEN_WIDTH/3-10,SCREEN_WIDTH/3-10);
}

-(void)setMaxCount:(NSInteger)maxCount{
  _maxCount = maxCount;
  
}

@end
