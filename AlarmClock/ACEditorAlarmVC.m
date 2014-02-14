//
//  ACEditorAlarmVC.m
//  AlarmClock
//
//  Created by ysy on 14-2-13.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import "ACEditorAlarmVC.h"
#import "ACButtomView.h"

@interface ACEditorAlarmVC ()<ACButtomViewDelegate>

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
    // add buttom view
    ACButtomView *view = [[ACButtomView alloc] initWithFrame:CGRectMake(0, 0, 320, 44) withCount:[[self.dataDic objectForKey:@"type"] integerValue]];
    view.delegate = self;
    [self.buttomView addSubview:view];
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
            NSLog(@"确定");
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
            break;
        }
            // 时间
        case 502:
        {
            NSLog(@"时间");
            break;
        }
            // 重复
        case 503:
        {
            NSLog(@"重复");
            break;
        }
            // 铃声
        case 504:
        {
            NSLog(@"铃声");
            break;
        }
            // 振动
        case 505:
        {
            NSLog(@"振动");
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
