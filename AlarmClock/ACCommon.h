//
//  ACCommon.h
//  AlarmClock
//
//  Created by User on 2/20/14.
//  Copyright (c) 2014 com.deirlym.www. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AlarmClock;
@interface ACCommon : NSObject

// class data to dictionary data
+ (void)classTransDictionary:(AlarmClock *)classData withDictionary:(NSMutableDictionary *)dicData;

// dictionary data to class data
+ (void)dictionaryclassTrans:(NSMutableDictionary *)dicData withClass:(AlarmClock *)classData;

// set alarm struct data
+ (void)dataTransMethod:(NSDictionary *)data toClass:(AlarmClock *)classStruct;

// trans long long data to nsdate
+ (NSDate *)getDateTimeFromLongLong:(long long) miliSeconds;

// get current nsdata trans to long long get alarmid
+ (long long)getLongLongFromDateTime:(NSDate *)datetime;


@end
