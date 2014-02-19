//
//  ACEditorAlarmVC.m
//  AlarmClock
//
//  Created by ysy on 14-2-13.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import "ACEditorAlarmVC.h"
#import "ACButtomView.h"
#import "ACAppDelegate.h"
#import "AlarmClock.h"

@interface ACEditorAlarmVC ()<ACButtomViewDelegate>



@end

@implementation ACEditorAlarmVC
@synthesize editorData;
@synthesize dataDic;

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
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:YES];
    ACAppDelegate *del = [[UIApplication sharedApplication] delegate];
    [del deleteCoreData:editorData];

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
            break;
        }
            // 确定
        case 1:
        {
            
            // save data to sqlite
            if ([self checkDataCompletion])
            {
                NSDictionary *dataDic12 = @{@"startBool":editorData.startBool,@"timeStr":editorData.timeStr,@"loopStr":editorData.loopStr,@"ringStr":editorData.ringStr,@"shankerBool":editorData.shankerBool,@"tagStr":editorData.tagStr};
                ACAppDelegate *del = [[UIApplication sharedApplication] delegate];
                
            }
            
            break;
        }
            // 删除
        case 2:
        {
            NSLog(@"删除");
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
            editorData.startBool = [NSNumber numberWithBool:YES];
            break;
        }
            // 时间
        case 502:
        {
            NSLog(@"时间");
            editorData.timeStr = @"09:00";
            break;
        }
            // 重复
        case 503:
        {
            NSLog(@"重复");
            editorData.loopStr = @"12345";
            break;
        }
            // 铃声
        case 504:
        {
            NSLog(@"铃声");
            editorData.ringStr = @"xiaomianyang";
            break;
        }
            // 振动
        case 505:
        {
            NSLog(@"振动");
            editorData.shankerBool = [NSNumber numberWithBool:YES];
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
        editorData.tagStr = textField.text;
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
    if (editorData.startBool == nil)
    {
        NSLog(@"startBool nil");
        return NO;
    }else if (editorData.timeStr == nil || editorData.timeStr.length == 0)
    {
        NSLog(@"timeStr nil");
        return NO;
    }else if (editorData.loopStr == nil || editorData.loopStr.length == 0)
    {
        NSLog(@"loopStr nil");
        return NO;
    }else if (editorData.ringStr == nil || editorData.ringStr.length == 0)
    {
        NSLog(@"ringStr nil");
        return NO;
    }else if (editorData.shankerBool == nil)
    {
        NSLog(@"shankerBool nil");
        return NO;
    }else if (editorData.tagStr == nil || editorData.tagStr.length == 0)
    {
        NSLog(@"tagStr nil");
        return NO;
    }
    return YES;
}

#pragma mark -set data
- (void)setDataMethod
{
    // editor
    if ([[dataDic objectForKey:@"type"] integerValue] == 3) {
        editorData = [dataDic objectForKey:@"data"];
    }
    // create
    else
    {
        ACAppDelegate *del = [[UIApplication sharedApplication] delegate];
        editorData = [del createAlarmClass];
    }
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
