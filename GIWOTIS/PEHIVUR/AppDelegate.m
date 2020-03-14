//
//  AppDelegate.m
//  PEHIVUR
//
//  Created by PEHIVUR on 2020/3/12.
//  Copyright © 2020 PEHIVUR. All rights reserved.
//

#import "AppDelegate.h"
#import "PEHIVURShe.h"

#import <AVOSCloud/AVOSCloud.h>
#import <Firebase.h>
#import "AppToolsHeader.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [AVOSCloud setApplicationId:APP_ID clientKey:APP_KEY serverURLString:API_URL];
    [FIRApp configure];
    
    //5e6cb51c21b47e00697f9408
     
    [self getRulesSuceessful];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    self.window.rootViewController = [[PEHIVURShe alloc]init];
    
    return YES;
}


- (void)getRulesSuceessful{

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
         __weak typeof(self) weakSelf = self;
        // 查询数据
        AVQuery *query = [AVQuery queryWithClassName:@"Giwotis"];

        [query getObjectInBackgroundWithId:@"5e6cb51c21b47e00697f9408" block:^(AVObject * _Nullable object, NSError * _Nullable error) {

            NSLog(@"查询数据=%@",object);
    
        }];
    });

    
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"PEHIVUR"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
