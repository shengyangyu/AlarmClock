//
//  ACSetAlarmVC.m
//  AlarmClock
//
//  Created by shengyang_yu on 14-2-12.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import "ACSetAlarmVC.h"

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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
