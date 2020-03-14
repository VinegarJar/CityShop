//
//  PEHIVURShe.m
//  PEHIVUR
//
//  Created by PEHIVUR on 2020/3/12.
//  Copyright © 2020 PEHIVUR. All rights reserved.
//

#import "PEHIVURShe.h"
#import "ShepoaView.h"
#import "UILabel+huas.h"

@interface PEHIVURShe ()

@property (nonatomic, strong)UIScrollView *scView;

@end

@implementation PEHIVURShe

-(void)PEHIVURSheTap:(UITapGestureRecognizer *)PEHIVURSheTap {
    UIImageView *PEHIVURSheIV = (UIImageView *)PEHIVURSheTap.view;
    NSArray *activityItems = @[@"GIWOTIS",PEHIVURSheIV.image,@""];
    UIActivityViewController *activityController=[[UIActivityViewController alloc]initWithActivityItems:activityItems applicationActivities:nil];
    activityController.excludedActivityTypes = @[UIActivityTypePrint, UIActivityTypeCopyToPasteboard,UIActivityTypeAssignToContact,UIActivityTypeSaveToCameraRoll];
    [self presentViewController:activityController animated:YES completion:nil];
}


-(void)PEHIVURShe {
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    CGFloat  PEHIVURSheH = ([UIScreen mainScreen].bounds.size.height > 764 ? 86:64);
    UIView *PEHIVURSheView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, PEHIVURSheH)];
    PEHIVURSheView.backgroundColor = [UIColor colorWithRed:255/255.0 green:186/255.0 blue:151/255.0 alpha:1.0];
    [self.view addSubview:PEHIVURSheView];
    
    UILabel *PEHIVURSheLa = [[UILabel alloc]initWithFrame:CGRectMake(0, 20, PEHIVURSheView.frame.size.width, PEHIVURSheH > 64 ? 75:40)];
    PEHIVURSheLa.text = @"GIWOTIS";
 
    [PEHIVURSheView addSubview:PEHIVURSheLa];
    
    
    PEHIVURSheLa.textAlignment = NSTextAlignmentCenter;
    PEHIVURSheLa.textColor = [UIColor whiteColor];
    PEHIVURSheLa.font = [UIFont systemFontOfSize:23];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    UIScrollView *PEHIVURSheSC = [[UIScrollView alloc]initWithFrame:CGRectMake(0, PEHIVURSheH, PEHIVURSheView.frame.size.width, [UIScreen mainScreen].bounds.size.height - PEHIVURSheH)];
    PEHIVURSheSC.contentSize = CGSizeMake(PEHIVURSheSC.frame.size.width,PEHIVURSheSC.frame.size.height + 1);
    PEHIVURSheSC.backgroundColor = [UIColor whiteColor];
    PEHIVURSheSC.showsVerticalScrollIndicator = NO;
    [self.view addSubview:PEHIVURSheSC];
    
    
    for (NSInteger i = 0; i < 24; i++) {
        UIImageView *PEHIVURSheIV = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/3 * (i%3), [UIScreen mainScreen].bounds.size.width/3 * (i/3), [UIScreen mainScreen].bounds.size.width/3 , [UIScreen mainScreen].bounds.size.width/3 )];
        [PEHIVURSheIV setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld",i+1]]];
        [PEHIVURSheSC addSubview:PEHIVURSheIV];
        PEHIVURSheIV.tag = i;
        PEHIVURSheIV.userInteractionEnabled = YES;
        [PEHIVURSheIV addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(PEHIVURSheTap:)]];
        
        if (PEHIVURSheIV.frame.origin.y + PEHIVURSheIV.frame.size.height > PEHIVURSheSC.contentSize.height) {
            PEHIVURSheSC.contentSize = CGSizeMake(PEHIVURSheSC.frame.size.width,PEHIVURSheIV.frame.origin.y + PEHIVURSheIV.frame.size.height + 1);
        }
    }
    
    
}






@end
