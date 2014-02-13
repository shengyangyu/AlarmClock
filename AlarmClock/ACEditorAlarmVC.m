//
//  ACEditorAlarmVC.m
//  AlarmClock
//
//  Created by ysy on 14-2-13.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import "ACEditorAlarmVC.h"

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
