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

// delete CoreData object
- (void)deleteCoreData:(AlarmClock *)dataObj;

// save coredata object
- (void)saveCoreData;

// cancel create data
/*
1. 插入

AppDelegate *app = [[UIApplication sharedApplication] delegate];

NSManagedObjectContext *context = [app managedObjectContext];

NSManagedObject ＊newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:@"entityname" inManagedObjectContext:context];

[newManagedObject setValue:value forKey:@"propertyname"];

NSError *error; if (![context save:&error]) {
    
    // Handle the error…
    
}

//查询

NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
NSEntityDescription *entity = [NSEntityDescription entityForName:@"Hero" inManagedObjectContext:managedObjectContext];
NSSortDescriptor *sortDescriptor1 = [[NSSortDescriptor alloc]
                                     initWithKey:@”name” ascending:YES];
NSSortDescriptor *sortDescriptor2 = [[NSSortDescriptor alloc]
                                     initWithKey:@”secretIdentity” ascending:YES];
NSArray *sortDescriptors = [[NSArray alloc]
                            initWithObjects:sortDescriptor1, sortDescriptor2, nil];
[fetchRequest setSortDescriptors:sortDescriptors];
[fetchRequest setEntity:entity];
[fetchRequest setFetchBatchSize:20];
NSArray *objecs = [context executeFetchRequest: fetchRequest error:&error];
//删除

NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;

[context deleteObject:[objecs objectIndex:index];
 
 // Save the context.
 
 NSError *error; if (![context save:&error]) {
     
     // Update to handle the error appropriately.
     
     NSLog(@”Unresolved error %@, %@”, error, [error userInfo]);
     
     exit(-1); // Fail
     
 }
 
 //属性
 
 NSManagedObject *managedObject;
 
 NSString *keypath;
 
 NSString *labelString;
 
 NSString *currentValue = [self.managedObject valueForKeyPath:self.keypath];
 
 NSEntityDescription *ed = [self.managedObject entity];
 
 NSDictionary *properties = [ed propertiesByName];
 
 NSAttributeDescription *ad = [properties objectForKey:self.keypath];
 
 NSString *defaultValue = nil;
 
 if (ad != nil)
 
 defaultValue = [ad defaultValue];
 
 //core data relation  查询 或 修改
 
 NSManagedObject *child = [NSEntityDescription insertNewObjectForEntityForName: @"Person" inManagedObjectContext:thePerson.managedObjectContext];
 
 NSMutableSet *children = [person mutableSetValueForKey:@"children"]; //查询，可修改
 
 [children addObject:child];
 
 [children removeObject:childToBeRemoved];
 
 [[children managedObjectContext] deleteObject:childToBeRemoved]; //真正的删除
 
 
 
 NSSet *children = [person valueForKey:@"children"]; //查询，不可修改
 
 for (NSManagedObject *oneChild in children) {
     
     // do something
     
 }
 
 补充：
 
 1 是否将图片存储到Core Data中，以及NSData如何存储的一些规则
 
 First, always store your images in a usable format such as PNG or JPEG instead of NSData. This will save you a lot of headaches.
 
 Second, the rule for storing binary data is:
 
 < 100kb store in the same table as the relevant data
 < 1mb store in a separate table attached via a relationship to avoid loading unnecessarily
 > 1mb store on disk and reference it inside of Core Data
 (1。图片尽量保存为文件 2。<100k 和相关数据保存在一张表中  <1M保存在单独的一张表中 >1M保存到磁盘文件)
 */
@end
