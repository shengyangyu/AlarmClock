//
//  ACCoreDataManager.h
//  AlarmClock
//
//  Created by gw_ysy on 14-2-21.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import <Foundation/Foundation.h>


@class AlarmClock;
@interface ACCoreDataManager : NSObject

// coredate
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

// manage instance
+ (ACCoreDataManager *)sharedManager;

// local file address url
- (NSURL *)applicationDocumentsDirectory;

// save coredata context
- (void)saveContext;

// insertCoreData
- (BOOL)insertCoreData:(NSDictionary *)dataDic;

// queryCoreData
- (NSMutableArray *)dataFetchRequest;

// create class
- (AlarmClock *)createAlarmClass;

// delete CoreData object
- (void)deleteCoreData:(AlarmClock *)dataObj;

// update core data
- (void)updateData:(NSNumber *)alarmId withChangeData:(NSMutableDictionary *)lastData;



@end
