//
//  ImagePickerController.m
//  ryp_rn_supplier
//
//  Created by ryp-app01 on 2018/8/4.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "ImagePickerController.h"
#import "ImagePickerPhoto.h"
#import <Photos/PHPhotoLibrary.h>
#import "GlobalMacros.h"
#import "NSString+IMAdditions.h"
#import "ImageViewController.h"
#import "PhotoPageViewController.h"
@interface ImagePickerController ()<ImagePickerPhotoDelegate,ImageViewPhotoDelegate>
@property (nonatomic, strong) ImagePickerPhoto*pickerPhoto;
@property (nonatomic, assign) NSInteger maxCount;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) CGFloat maxFileSize;
@end

static const CGFloat maxFileCacheSize =30; // MaxFileSize

@implementation ImagePickerController

- (instancetype)initWithMaxCount:(NSInteger)maxCount{
  self = [super init];
  if (self) {
        _maxCount = maxCount;
        _maxFileSize = maxFileCacheSize;
  }
  return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

  [self pickerPhoto];
  if ([PHPhotoLibrary authorizationStatus] != PHAuthorizationStatusAuthorized) {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.25 target:self selector:@selector(observeAuthrizationStatusChange:) userInfo:nil repeats:YES];
  }
  
}


-(void)loadViewLibrary{

  ImageViewController*imageController = [[ImageViewController alloc]init];
  imageController.delegate = self;
  [imageController setMaxCount:self.maxCount];
  UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:imageController];
  self.view.backgroundColor = [UIColor whiteColor];
  [controller willMoveToParentViewController:self];
  [controller.view setFrame:self.view.bounds];
  [self.view addSubview:controller.view];
  [self addChildViewController:controller];
  [controller didMoveToParentViewController:self];
}

- (void)observeAuthrizationStatusChange:(NSTimer *)timer{
  if ([PHPhotoLibrary authorizationStatus] == PHAuthorizationStatusAuthorized) {
         [timer invalidate];
          self.timer = nil;
         [self.pickerPhoto getSystemPhotos];
  }
}




-(ImagePickerPhoto*)pickerPhoto{
  if (!_pickerPhoto) {
     _pickerPhoto = [[ImagePickerPhoto alloc]initWithFrame:[UIScreen mainScreen].bounds];
     _pickerPhoto.delegate = self;
    [_pickerPhoto setMaxCount:self.maxCount];
    [self.view addSubview:_pickerPhoto];
  }
  return _pickerPhoto;
}


-(void)goBack:(ImagePickerPhoto *)goBack{
      [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)getImageList:(ImagePickerPhoto *)imagelist arraySource:(NSArray *)arraySource{
  
  if ([self.delegate respondsToSelector:@selector(imagepath:arraySource:)]&&self.delegate&&arraySource.count){
       [ self.delegate imagepath:self arraySource:arraySource];
  }
   [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)getImagePhoto:(NSArray*)arraySource{
  if ([self.delegate respondsToSelector:@selector(imagepath:arraySource:)]&&self.delegate&&arraySource.count){
    [ self.delegate imagepath:self arraySource:arraySource];
  }
  
}



-(void)dealloc{
  self.timer = nil;
  self.delegate = nil;
}


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  DEBUG_NSLog(@"------------->内存爆掉------------->")
  [self clearCache];
}


-(void)clearCache{
  dispatch_async(dispatch_get_global_queue(0, 0), ^{
    NSString*path =  [NSString docPathcacheFolder];
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
      [fileManager removeItemAtPath:path error:nil];
    }
  });
 
}


- (long long)folderSizeAtPath:(NSString *)folderPath{
  NSFileManager *fileManager = [NSFileManager defaultManager];
  if (![fileManager fileExistsAtPath:folderPath]) return 0;
  NSEnumerator *filesEnumerator = [[fileManager subpathsAtPath:folderPath] objectEnumerator];
  NSString *fileName;
  long long folerSize = 0;
  while ((fileName = [filesEnumerator nextObject]) != nil) {
    NSString *filePath = [folderPath stringByAppendingPathComponent:fileName];
    folerSize += [self fileSizeAtPath:filePath];
  }
  return (folerSize/1024/1024);
}

- (long long)fileSizeAtPath:(NSString *)filePath{
  NSFileManager *fileManager = [NSFileManager defaultManager];
  if (![fileManager fileExistsAtPath:filePath]){
        return 0;
  }else{
     return [[fileManager attributesOfItemAtPath:filePath error:nil] fileSize];
  }
}




@end
