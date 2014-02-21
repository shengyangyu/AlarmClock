//
//  ACCoreDataManager.m
//  AlarmClock
//
//  Created by gw_ysy on 14-2-21.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import "ACCoreDataManager.h"
#import "AlarmClock.h"
#import "ACCommon.h"

@implementation ACCoreDataManager
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

#pragma mark - instance

+ (ACCoreDataManager *)sharedManager
{
//    static ACCoreDataManager *m_Manager = nil;
//    @synchronized(self) {
//        if (m_Manager == nil) {
//            m_Manager = [[ACCoreDataManager alloc] init];
//        }
//        return m_Manager;
//    }
//    return nil;
    static ACCoreDataManager *sharedManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedManagerInstance = [[self alloc] init];
    });
    return sharedManagerInstance;
}

#pragma mark -core data manager
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


#pragma mark -create class
- (AlarmClock *)createAlarmClass
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"AlarmClock" inManagedObjectContext:context];
    NSManagedObject *obj = [[NSManagedObject alloc] initWithEntity:entity insertIntoManagedObjectContext:context];
    AlarmClock *alarmClockInfo = (AlarmClock *)obj;
    return alarmClockInfo;
}

#pragma mark - saveContext
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
        }else if ([managedObjectContext save:&error]) {
            NSLog(@"saveContext:success!");
        }
    }
}


#pragma mark - queryCoreData query all data
- (NSMutableArray *)dataFetchRequest
{
    NSMutableArray *dataArray = [[NSMutableArray alloc] init];
    NSManagedObjectContext *context = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"AlarmClock"];
    // fetchRequest.predicate = [NSPredicate predicateWithFormat:@"fid==3"];
    NSError *error;
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    for (AlarmClock *info in fetchedObjects) {
        [dataArray addObject:info];
    }
    return dataArray;
}

#pragma mark - delete CoreData object
- (void)deleteCoreData:(AlarmClock *)dataObj
{
    NSManagedObjectContext *context = [self managedObjectContext];
    [context deleteObject:(NSManagedObject *)dataObj];
}

#pragma mark - insertCoreData
- (BOOL)insertCoreData:(NSDictionary *)dataDic
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    AlarmClock *alarmClockInfo = [NSEntityDescription
                                  insertNewObjectForEntityForName:@"AlarmClock"
                                  inManagedObjectContext:context];
    
    [ACCommon dataTransMethod:dataDic toClass:alarmClockInfo];
    NSError *error;
    if([context save:&error])
    {
        NSLog(@"insertCoreData:success!");
        return NO;
    }
    return YES;
}

#pragma mark - update coredata
- (void)updateData:(NSNumber *)alarmId withChangeData:(NSMutableDictionary *)lastData
{
    NSManagedObjectContext *context = [self managedObjectContext];
    NSPredicate *predicate = [NSPredicate
                              predicateWithFormat:@"alarmId == %llu",[alarmId longLongValue]];
    NSFetchRequest * request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription
                        entityForName:@"AlarmClock"
                        inManagedObjectContext:context]];
    [request setPredicate:predicate];
    NSError *error = nil;
    NSArray *resultArray = [context executeFetchRequest:request error:&error];
    
    for (AlarmClock *info in resultArray) {
        [ACCommon dictionaryclassTrans:lastData withClass:info];
    }
    if ([context save:&error]) {
        NSLog(@"updateData:success!");
    }
}


@end
