//
//  ACCommon.m
//  AlarmClock
//
//  Created by User on 2/20/14.
//  Copyright (c) 2014 com.deirlym.www. All rights reserved.
//

#import "ACCommon.h"
#import "AlarmClock.h"

@implementation ACCommon


// class data to dictionary data hasn't alarm id
+ (void)classTransDictionary:(AlarmClock *)classData withDictionary:(NSMutableDictionary *)dicData
{
    [dicData setObject:classData.startBool forKey:@"startBool"];
    [dicData setObject:classData.timeStr forKey:@"timeStr"];
    [dicData setObject:classData.loopStr forKey:@"loopStr"];
    [dicData setObject:classData.ringStr forKey:@"ringStr"];
    [dicData setObject:classData.shankerBool forKey:@"shankerBool"];
    [dicData setObject:classData.tagStr forKey:@"tagStr"];
}

// dictionary data to class data
+ (void)dictionaryclassTrans:(NSMutableDictionary *)dicData withClass:(AlarmClock *)classData
{
    classData.alarmId = [dicData objectForKey:@"alarmId"];
    classData.startBool = [dicData objectForKey:@"startBool"];
    classData.timeStr = [dicData objectForKey:@"timeStr"];
    classData.loopStr = [dicData objectForKey:@"loopStr"];
    classData.ringStr = [dicData objectForKey:@"ringStr"];
    classData.shankerBool = [dicData objectForKey:@"shankerBool"];
    classData.tagStr = [dicData objectForKey:@"tagStr"];
}

// set alarm struct data has alarm id
+ (void)dataTransMethod:(NSDictionary *)data toClass:(AlarmClock *)classStruct
{
    if (data != nil) {
        classStruct.alarmId = [data objectForKey:@"alarmId"];
        classStruct.startBool = [data objectForKey:@"startBool"];
        classStruct.timeStr = [data objectForKey:@"timeStr"];
        classStruct.loopStr = [data objectForKey:@"loopStr"];
        classStruct.ringStr = [data objectForKey:@"ringStr"];
        classStruct.shankerBool = [data objectForKey:@"shankerBool"];
        classStruct.tagStr = [data objectForKey:@"tagStr"];
    }
}

// trans long long data to nsdate
+ (NSDate *)getDateTimeFromLongLong:(long long) miliSeconds
{
    NSTimeInterval tempMilli = miliSeconds;
    NSTimeInterval seconds = tempMilli/1000.0;
    return [NSDate dateWithTimeIntervalSince1970:seconds];
}

// get current nsdata trans to long long get alarmid
+ (long long)getLongLongFromDateTime:(NSDate *)datetime
{
    NSTimeInterval interval = [datetime timeIntervalSince1970];
    long long totalMilliSeconds = interval * 1000;
    return totalMilliSeconds;
}

// start a location notification
+ (BOOL)startLocationNotification:(NSDictionary *)dicData
{
//    [[NSNotificationCenter defaultCenter] seta]
    // location notification
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm:ss"];
    // notification fire time
    //NSDate *now = [formatter dateFromString:@"15:30"];
    notification.fireDate = [[NSDate date] dateByAddingTimeInterval:15];
    // notification timezone
    notification.timeZone = [NSTimeZone defaultTimeZone];
    // notification repeatInterval
    notification.repeatInterval = NSCalendarUnitWeekday;
    // notification alert title
    notification.alertBody = @"还不起床？速度！";
    // notification soundinfo UILocalNotificationDefaultSoundName
    notification.soundName = nil;
    // notification userinfo
    NSDictionary *dic = @{@"key":@"name",Location_Notification_ID:[dicData objectForKey:Location_Notification_ID]};
    notification.userInfo = dic;
    // notification actions
    notification.hasAction = YES;
    notification.alertAction = @"歇5分钟";
    // notification start
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
    
    return YES;
}

// cacel a location notification
+ (BOOL)cacelLocationNotification:(NSString *)identificationStr
{
    // get notification
    UILocalNotification *notificationToCancel = nil;
    for(UILocalNotification *aNotif in [[UIApplication sharedApplication] scheduledLocalNotifications])
    {
        if([aNotif.userInfo[Location_Notification_ID] isEqualToString:identificationStr])
        {
            notificationToCancel = aNotif;
            [[UIApplication sharedApplication] cancelLocalNotification:notificationToCancel];
            return YES;
        }
    }
    return NO;
}

@end
