//
//  ACSetAlarmVC.m
//  AlarmClock
//
//  Created by shengyang_yu on 14-2-12.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import "ACSetAlarmVC.h"
#import "ACAlarmTableCell.h"
#import "ACEditorAlarmVC.h"

@interface ACSetAlarmVC ()

@end

@implementation ACSetAlarmVC

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
    self.title = @"set alarm";
    self.navigationController.navigationBar.translucent = NO;
    // rightbuttom add new alarm
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAlarmMethod)];
    
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
    
    cell.alarmTimeLabel.text = @"08:00";
    cell.loopDayLabel.text = @"周一,周二,周三,周四,周五,周六";
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self editorAlarmMethod:@{@"title":@"editor Alarm",@"type":@"3"}];
}
#pragma mark -addAlarmMeth
- (void)addAlarmMethod
{
    [self editorAlarmMethod:@{@"title":@"add Alarm",@"type":@"2"}];
}

- (void)editorAlarmMethod:(NSDictionary *)passdata
{
    ACEditorAlarmVC *vc = [[ACEditorAlarmVC alloc] initWithNibName:@"ACEditorAlarmVC" bundle:nil];
    vc.dataDic = passdata;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
