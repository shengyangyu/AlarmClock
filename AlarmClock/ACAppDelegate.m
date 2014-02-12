//
//  ACAppDelegate.m
//  AlarmClock
//
//  Created by ysy on 14-2-12.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import "ACAppDelegate.h"
#import "ACMainViewController.h"

#define UIColorFromRGB(r,g,b,a) [UIColor colorWithRed:(float)(r)/255.0 green:(float)(g)/255.0 blue:(float)(b)/255.0 alpha:a]


@implementation ACAppDelegate

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
        //[[UINavigationBar appearance] setTranslucent:NO];
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
}

@end
