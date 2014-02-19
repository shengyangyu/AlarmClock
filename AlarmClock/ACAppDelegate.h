//
//  ACAppDelegate.h
//  AlarmClock
//
//  Created by ysy on 14-2-12.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//  ysy 2

#import <UIKit/UIKit.h>

@class AlarmClock;

@interface ACAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

// coredate
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;

- (NSURL *)applicationDocumentsDirectory;

// insertCoreData
- (BOOL)insertCoreData:(NSDictionary *)dataDic;

// queryCoreData
- (NSMutableArray *)dataFetchRequest;

// create class
- (AlarmClock *)createAlarmClass;


@end
