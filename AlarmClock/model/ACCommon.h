//
//  ACCommon.h
//  AlarmClock
//  ysy
//  Created by User on 2/20/14.
//  Copyright (c) 2014 com.deirlym.www. All rights reserved.
//

#import <Foundation/Foundation.h>

#define Location_Notification_ID                   @"Notifiy_ID"
#define Location_Notification_TIME                 @"Notifiy_TIME"
#define Location_Notification_TAGSTRING            @"Notifiy_TAGSTRING"
#define Location_Notification_RINGSTRING           @"Notifiy_RINGSTRING"

@class AlarmClock;
@interface ACCommon : NSObject

// dictionary to class
// class data to dictionary data
+ (void)classTransDictionary:(AlarmClock *)classData withDictionary:(NSMutableDictionary *)dicData;
// dictionary data to class data
+ (void)dictionaryclassTrans:(NSMutableDictionary *)dicData withClass:(AlarmClock *)classData;
// set alarm struct data
+ (void)dataTransMethod:(NSDictionary *)data toClass:(AlarmClock *)classStruct;

// long long to nsdate
// trans long long data to nsdate
+ (NSDate *)getDateTimeFromLongLong:(long long) miliSeconds;
// get current nsdata trans to long long get alarmid
+ (long long)getLongLongFromDateTime:(NSDate *)datetime;

// location notification
// start a location notification
+ (BOOL)startLocationNotification:(NSDictionary *)dicData;
// cacel a location notification
+ (BOOL)cacelLocationNotification:(NSString *)identificationStr;

@end
