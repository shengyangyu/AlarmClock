//
//  AlarmClock.h
//  AlarmClock
//
//  Created by User on 2/20/14.
//  Copyright (c) 2014 com.deirlym.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface AlarmClock : NSManagedObject

@property (nonatomic, retain) NSString * loopStr;
@property (nonatomic, retain) NSString * ringStr;
@property (nonatomic, retain) NSNumber * shankerBool;
@property (nonatomic, retain) NSNumber * startBool;
@property (nonatomic, retain) NSString * tagStr;
@property (nonatomic, retain) NSString * timeStr;
@property (nonatomic, retain) NSNumber * alarmId;

@end
