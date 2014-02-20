//
//  ACAlarmTableCell.h
//  AlarmClock
//
//  Created by ysy on 14-2-13.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACAlarmTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *alarmTimeLabel;
@property (strong, nonatomic) IBOutlet UILabel *loopDayLabel;
@property (strong, nonatomic) IBOutlet UILabel *tagLabel;


@end
