//
//  ACEditorAlarmVC.m
//  AlarmClock
//
//  Created by ysy on 14-2-13.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import "ACEditorAlarmVC.h"
#import "ACButtomView.h"
#import "ACCoreDataManager.h"
#import "AlarmClock.h"
#import "ACCommon.h"

@interface ACEditorAlarmVC ()<ACButtomViewDelegate>

// class struct to data dictionary
@property (nonatomic, strong) NSMutableDictionary *classDic;

@end

@implementation ACEditorAlarmVC
@synthesize editorClass;
@synthesize dataDic;
@synthesize classDic;

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
    self.title = [dataDic objectForKey:@"title"];
    self.navigationController.navigationBar.translucent = NO;
    // add buttom view
    ACButtomView *view = [[ACButtomView alloc] initWithFrame:CGRectMake(0, 0, 320, 44) withCount:[[dataDic objectForKey:@"type"] integerValue]];
    view.delegate = self;
    [self.buttomView addSubview:view];
    // set data
    [self setDataMethod];
    [ACCommon startLocationNotification:@{Location_Notification_ID:@"yangge"}];
    [self.centerScrollView setContentSize:CGSizeMake(320, 900)];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
}

#pragma mark -ACButtomView delegate
- (void)choiceBtnMethod:(NSInteger)btnIndex
{
    switch (btnIndex)
    {
            // 取消
        case 0:
        {
            NSLog(@"取消");
            [self.navigationController popViewControllerAnimated:YES];
            break;
        }
            // 确定
        case 1:
        {
            NSLog(@"确定");
            // save data to sqlite
            if ([self checkDataCompletion])
            {
                // editor when editor infomation just need trans class to dictionary
                if ([[dataDic objectForKey:@"type"] integerValue] == 3) {
                    
                    [[ACCoreDataManager sharedManager] updateData:[classDic objectForKey:@"alarmId"] withChangeData:classDic];
                }
                // create
                else
                {
                    // current nsdate to long long
                    [classDic setValue:[NSNumber numberWithLongLong:[ACCommon getLongLongFromDateTime:[NSDate date]]] forKey:@"alarmId"];
                    [[ACCoreDataManager sharedManager] insertCoreData:classDic];
                }
            }
            
            break;
        }
            // 删除
        case 2:
        {
            NSLog(@"删除");
            // editor when editor infomation just need trans class to dictionary
            if ([[dataDic objectForKey:@"type"] integerValue] == 3) {
                
                [[ACCoreDataManager sharedManager] deleteCoreData:editorClass];
            }
            break;
        }
        default:
            break;
    }
}

#pragma mark -view button method
- (IBAction)viewBtnMethod:(UIButton *)sender
{

    switch (sender.tag)
    {
            // 启用闹钟
        case 501:
        {
            NSLog(@"启用闹钟");
            [classDic setObject:[NSNumber numberWithBool:YES] forKey:@"startBool"];
            break;
        }
            // 时间
        case 502:
        {
            NSLog(@"时间");
            [classDic setObject:@"09:00" forKey:@"timeStr"];
            break;
        }
            // 重复
        case 503:
        {
            NSLog(@"重复");
            [classDic setObject:@"12345" forKey:@"loopStr"];
            break;
        }
            // 铃声
        case 504:
        {
            NSLog(@"铃声");
            [classDic setObject:@"xiaomianyang" forKey:@"ringStr"];
            break;
        }
            // 振动
        case 505:
        {
            NSLog(@"振动");
            [classDic setObject:[NSNumber numberWithBool:YES] forKey:@"shankerBool"];
            break;
        }
        default:
            break;
    }
}
#pragma mark -textfield delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self.centerScrollView setContentOffset:CGPointMake(0, 205) animated:YES];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if (textField.text.length != 0) {
        [classDic setObject:textField.text forKey:@"tagStr"];
    }
    [self.centerScrollView setContentOffset:CGPointMake(0, 0) animated:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -tapMethod
- (IBAction)tapMethod:(UISwipeGestureRecognizer *)sender
{
    [self.tagTextField resignFirstResponder];
}
#pragma mark -check data completion
- (BOOL)checkDataCompletion
{
    if ([classDic objectForKey:@"startBool"]  == nil)
    {
        NSLog(@"startBool nil");
        return NO;
    }else if ([classDic objectForKey:@"timeStr"] == nil)
    {
        NSLog(@"timeStr nil");
        return NO;
    }else if ([classDic objectForKey:@"loopStr"] == nil)
    {
        NSLog(@"loopStr nil");
        return NO;
    }else if ([classDic objectForKey:@"ringStr"] == nil)
    {
        NSLog(@"ringStr nil");
        return NO;
    }else if ([classDic objectForKey:@"shankerBool"] == nil)
    {
        NSLog(@"shankerBool nil");
        return NO;
    }else if ([classDic objectForKey:@"tagStr"] == nil)
    {
        NSLog(@"tagStr nil");
        return NO;
    }
    return YES;
}

#pragma mark -set data
- (void)setDataMethod
{
    classDic = [NSMutableDictionary dictionary];
    // editor when editor infomation just need trans class to dictionary
    if ([[dataDic objectForKey:@"type"] integerValue] == 3) {
        editorClass = [dataDic objectForKey:@"data"];
        [ACCommon classTransDictionary:editorClass withDictionary:classDic];
    }
    // create
    else
    {
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
