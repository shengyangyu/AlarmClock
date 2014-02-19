//
//  ACAppDelegate.m
//  AlarmClock
//
//  Created by ysy on 14-2-12.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import "ACAppDelegate.h"
#import "ACMainViewController.h"
#import "AlarmClock.h"

#define UIColorFromRGB(r,g,b,a) [UIColor colorWithRed:(float)(r)/255.0 green:(float)(g)/255.0 blue:(float)(b)/255.0 alpha:a]


@implementation ACAppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    ACMainViewController *vc = [[ACMainViewController alloc] initWithNibName:@"ACMainViewController" bundle:nil];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    
    self.window.rootViewController = nav;
    
    self.window.backgroundColor = [UIColor whiteColor];
    
    [self.window makeKeyAndVisible];
    
    // UINavigaronBar
    if ([[[UIDevice currentDevice]systemVersion]floatValue] >= 7.0)
    {
        [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(124,252,0,0.7)];
        
    }else{
    
        [[UINavigationBar appearance] setTintColor:UIColorFromRGB(124,252,0,0.7)];
    }
    
    NSShadow *shadow = [[NSShadow alloc] init];
    
    shadow.shadowColor = UIColorFromRGB(0,0,0,0.8);
    
    shadow.shadowOffset = CGSizeMake(0, 1);
    
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:UIColorFromRGB(240,255,255,1), NSForegroundColorAttributeName,shadow, NSShadowAttributeName,[UIFont fontWithName:@"HelveticaNeue-CondensedBlack" size:21.0], NSFontAttributeName, nil]];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self saveContext];
}
- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"AlarmClock" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"AlarmClock.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

#pragma mark - insertCoreData
- (BOOL)insertCoreData:(NSDictionary *)dataDic
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    AlarmClock *alarmClockInfo = [NSEntityDescription insertNewObjectForEntityForName:@"AlarmClock" inManagedObjectContext:context];
    [self dataTransMethod:dataDic toClass:alarmClockInfo];
    NSError *error;
    if(![context save:&error])
    {
        NSLog(@"不能保存：%@",[error localizedDescription]);
        return NO;
    }
    return YES;
}
#pragma mark -set alarm struct data
- (void)dataTransMethod:(NSDictionary *)data toClass:(AlarmClock *)classStruct
{
    if (data != nil) {
        classStruct.startBool = [data objectForKey:@"startBool"];
        classStruct.timeStr = [data objectForKey:@"timeStr"];
        classStruct.loopStr = [data objectForKey:@"loopStr"];
        classStruct.ringStr = [data objectForKey:@"ringStr"];
        classStruct.shankerBool = [data objectForKey:@"shankerBool"];
        classStruct.tagStr = [data objectForKey:@"tagStr"];
    }
}
#pragma mark - queryCoreData
- (NSMutableArray *)dataFetchRequest
{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"AlarmClock" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (AlarmClock *info in fetchedObjects) {
        NSLog(@"tagStr:%@", info.tagStr);
        [dataArray addObject:info];
    }
    return dataArray;
}
#pragma mark - deleteCoreData
- (void)deleteCoreData
{
    
}

#pragma mark -create class
- (AlarmClock *)createAlarmClass
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"AlarmClock" inManagedObjectContext:context];
    NSManagedObject *obj = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    AlarmClock *alarmClockInfo = (AlarmClock *)obj;
    
    return alarmClockInfo;
}


@end
