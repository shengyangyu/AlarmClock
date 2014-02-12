//
//  ACMainViewController.h
//  AlarmClock
//
//  Created by ysy on 14-2-12.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACMainViewController : UIViewController

@property (strong, nonatomic) NSDateFormatter *dateFormatter;
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
@property (strong, nonatomic) IBOutlet UILabel *dayLabel;

@end
