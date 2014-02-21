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
#import "ACCoreDataManager.h"
#import "AlarmClock.h"

@interface ACSetAlarmVC ()

// local alarm clock data array
@property (nonatomic, strong)NSMutableArray *dataArray;

@end

@implementation ACSetAlarmVC
@synthesize dataArray;

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

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    // query data local
    dataArray = [NSMutableArray array];
    [dataArray addObjectsFromArray:[[ACCoreDataManager sharedManager] dataFetchRequest]];
    // table reload
    [self.alarmTable reloadData];
}

#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [dataArray count];
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
    AlarmClock *data = (AlarmClock *)[dataArray objectAtIndex:indexPath.row];
    cell.alarmTimeLabel.text = data.timeStr;
    cell.loopDayLabel.text = data.loopStr;
    cell.tagLabel.text = data.tagStr;
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self editorAlarmMethod:@{@"title":@"editor Alarm",@"type":@"3",@"data":dataArray[indexPath.row]}];
}
#pragma mark -addAlarmMeth
- (void)addAlarmMethod
{
    [self editorAlarmMethod:@{@"title":@"add Alarm",@"type":@"2",@"data":@""}];
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
