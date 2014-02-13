//
//  ACEditorAlarmVC.m
//  AlarmClock
//
//  Created by ysy on 14-2-13.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import "ACEditorAlarmVC.h"
#import "ACAlarmTableCell.h"

@interface ACEditorAlarmVC ()

@end

@implementation ACEditorAlarmVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = [self.dataDic objectForKey:@"title"];
    self.navigationController.navigationBar.translucent = NO;
    self.tabBarController.tabBar.translucent = NO;
}
#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* cellIdentifier = @"ACAlarmTableCell";
    ACAlarmTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil)
    {
        NSArray *cellArray = [[NSBundle mainBundle] loadNibNamed:@"ACAlarmTableCell" owner:self options:nil];
        cell = [cellArray objectAtIndex:0];
        //cell.selectionStyle = 0;
    }
    cell.alarmTimeLabel.text = @"sss";
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
