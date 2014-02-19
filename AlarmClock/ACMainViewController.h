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
// time ex: 09:00
@property (strong, nonatomic) IBOutlet UILabel *timeLabel;
// dat  ex: 2014-02-14 ..
@property (strong, nonatomic) IBOutlet UILabel *dayLabel;
// seconds ex: :02
@property (strong, nonatomic) IBOutlet UILabel *secLabel;

@end
