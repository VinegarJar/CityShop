//
//  PhotoPageViewController.m
//  ryp_rn_supplier
//
//  Created by ryp-app01 on 2018/9/25.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "PhotoPageViewController.h"
#import "GlobalMacros.h"
@interface PhotoPageViewController ()
@property (nonatomic, strong)UIButton *barButton;

@end

@implementation PhotoPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

     self.view.backgroundColor = [UIColor orangeColor];
     [self addSubviews];
      
}

-(void)addSubviews{
  [self setupBackButton];
  [self setupRightBarButton];
}

- (void)setupBackButton{
  UIBarButtonItem *leftBarButton= [[UIBarButtonItem alloc] initWithImage:
                                   [UIImage imageNamed:@"goBack"]style:
                                   UIBarButtonItemStylePlain target:self
                                                                  action:@selector(goBack:)];
  leftBarButton.tintColor = UIColorFromRGB(gobackColor);
  self.navigationItem.leftBarButtonItem = leftBarButton;
}

-(void)goBack:(UIBarButtonItem*)sender{
     [self.navigationController popViewControllerAnimated:YES];
}

- (void)setupRightBarButton{
  _barButton = [UIButton buttonWithType:UIButtonTypeCustom];
  _barButton.frame = CGRectMake(0, 0, 60, 45);
  [ _barButton setImage:[UIImage imageNamed:@"unselected"] forState:UIControlStateNormal];
  [ _barButton setImage:[UIImage imageNamed:@"selected"] forState: UIControlStateSelected];
  [_barButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
  UIBarButtonItem *barItem = [[UIBarButtonItem alloc] initWithCustomView:_barButton];
  self.navigationItem.rightBarButtonItem = barItem;
}


-(void)buttonClick:(UIButton*)sender{
  if (!sender.isSelected) {
    sender.selected = YES;
       DEBUG_NSLog(@"YES");
  }else{
    sender.selected = NO;
      DEBUG_NSLog(@"NO");
  }
  
}







- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
