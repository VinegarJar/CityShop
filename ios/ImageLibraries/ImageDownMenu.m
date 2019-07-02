//
//  ImageDownMenu.m
//  ryp_rn_supplier
//
//  Created by ryp-app01 on 2018/7/13.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "ImageDownMenu.h"
#import "ZeroSDCSafety.h"
#import "GlobalMacros.h"


#define PhotoCellHeight 70

@implementation  ImagePhotoCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
  if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    _imge = [[UIImageView alloc]initWithFrame:CGRectMake(15, (PhotoCellHeight-45)/2, 45, 45)];
  
    _imge.clipsToBounds = true;
    _imge.layer.cornerRadius = 10;
    _imge.layer.borderWidth = 1;
    _imge.layer.borderColor = [[UIColor clearColor] CGColor];
    [self addSubview:_imge];
    
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(PhotoCellHeight, (PhotoCellHeight-30)/2, 200, 30)];
    _titleLabel.textColor = UIColorFromRGB(titleColor);
    _titleLabel.font = [UIFont systemFontOfSize:15];
    _titleLabel.textAlignment =  NSTextAlignmentLeft;
    _titleLabel.numberOfLines = 0;
    [self addSubview:_titleLabel];
  }
  return self;
}


@end

@interface ImageDownMenu ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UIView *menuBlackView;
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)UIView *headView;
@end


@implementation ImageDownMenu

- (instancetype)initWithFrame:(CGRect)frame{
  if (self = [super initWithFrame:frame]) {
    self.backgroundColor = [UIColor clearColor];
    self.hidden = YES;
  }
  return self;
}

-(void)setArraySource:(NSArray *)arraySource{
    _arraySource = arraySource;
   PhotoAlbumModel*model = [_arraySource SafetyObjectAtIndex:_arraySource.count-1];
      [_tableView reloadData];
  if ([self.delegate respondsToSelector:@selector(didSelectRowAtIndexPath:model:title:)]){
    [self.delegate didSelectRowAtIndexPath:self model:model title:model.titel];
  }
}

-(UITableView *)tableView{
  if (!_tableView){
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 55, SCREEN_WIDTH , 0) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.tableFooterView = [UIView new];
    [_tableView registerClass:[ImagePhotoCell class] forCellReuseIdentifier:@"Cell"];
  }
  return _tableView;
}

-(UIView*)menuBlackView{
  if (!_menuBlackView) {
    _menuBlackView = [[UIView alloc]initWithFrame:CGRectMake(0, 55, SCREEN_WIDTH , SCREEN_HEIGHT-55)];
    _menuBlackView.backgroundColor = [UIColor colorWithRed:(0)/255.0f green:(0)/255.0f blue:(0)/255.0f alpha:(0.5)];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissView)];
    [_menuBlackView addGestureRecognizer:tapGesture];
  }
  return _menuBlackView;
}

-(UIView*)headView{
  if (!_headView) {
    _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH , 50)];
    _headView.backgroundColor = [UIColor clearColor];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissView)];
    [ _headView addGestureRecognizer:tapGesture];
  }
  return _headView;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  ImagePhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    PhotoAlbumModel*model = [_arraySource SafetyObjectAtIndex:indexPath.row];
  cell.titleLabel.text = [NSString stringWithFormat:@"%@%@%lu%@",model.titel,@"    (",(unsigned long)model.count,@")"];
   cell.imge.image = model.imgeUrl;
  return cell;
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return _arraySource.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
  return PhotoCellHeight;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
  [self dismissAlertView];
  PhotoAlbumModel*model = [_arraySource SafetyObjectAtIndex:indexPath.row];
  if ([self.delegate respondsToSelector:@selector(didSelectRowAtIndexPath:model:title:)]){
      [self.delegate didSelectRowAtIndexPath:self model:model title:model.titel];
  }
}

-(void)dismissView{
  [self dismissAlertView];
  if ([self.delegate respondsToSelector:@selector(didSelectRowAtIndexPath:model:title:)]){
      [self.delegate didSelectRowAtIndexPath:self model:nil title:nil];
  }
}

-(void)showAlertView{
  [self addSubview:self.headView];
  [self addSubview:self.menuBlackView];
  [self addSubview:self.tableView];
  [self.tableView reloadData];
  [UIView animateWithDuration:0.25f animations:^{
    self.menuBlackView.alpha = 1;
    self.headView.alpha = 1;
    self.hidden = NO;
    CGFloat Height;
    if (self->_arraySource.count>3) {
        Height = PhotoCellHeight* 4;
    }else{
      Height = PhotoCellHeight* self->_arraySource.count;
    }
    self.tableView.frame = CGRectMake(0, 55, SCREEN_WIDTH,Height);
  }];
  
  
}


-(void)dismissAlertView{
  [UIView animateWithDuration:0.25f animations:^{
    self.menuBlackView.alpha = 0;
      self.headView.alpha = 0;
    self.tableView.frame = CGRectMake(0, 55, SCREEN_WIDTH, 0);
  } completion:^(BOOL finished) {
    [self.menuBlackView removeFromSuperview];
    [self.headView removeFromSuperview];
    self.hidden = YES;
  }];
  
}
@end
