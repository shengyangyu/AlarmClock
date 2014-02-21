//
//  ACSetAlarmVC.h
//  AlarmClock
//
//  Created by shengyang_yu on 14-2-12.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACSetAlarmVC : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *alarmTable;


@end
