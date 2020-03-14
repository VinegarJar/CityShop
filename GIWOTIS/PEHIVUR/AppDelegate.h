//
//  AppDelegate.h
//  PEHIVUR
//
//  Created by PEHIVUR on 2020/3/12.
//  Copyright © 2020 PEHIVUR. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end


