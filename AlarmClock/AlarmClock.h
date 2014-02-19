//
//  AlarmClock.h
//  AlarmClock
//
//  Created by ysy on 14-2-14.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface AlarmClock : NSManagedObject

@property (nonatomic, retain) NSNumber * startBool;
@property (nonatomic, retain) NSString * timeStr;
@property (nonatomic, retain) NSString * loopStr;
@property (nonatomic, retain) NSString * ringStr;
@property (nonatomic, retain) NSNumber * shankerBool;
@property (nonatomic, retain) NSString * tagStr;


@end
