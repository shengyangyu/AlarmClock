//
//  ACMainViewController.m
//  AlarmClock
//
//  Created by ysy on 14-2-12.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import "ACMainViewController.h"

@interface ACMainViewController ()

@end

@implementation ACMainViewController
@synthesize dateFormatter;

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
    self.title = @"alarm clock";
    self.navigationController.navigationBar.translucent = NO;
    [self getCurrentTime];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getCurrentTime
{
    // current systime
    __block NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    self.timeLabel.text = [formatter stringFromDate:[NSDate date]];
    // timer change label
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),60.0*NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        if(0){
            //timer over
            dispatch_source_cancel(_timer);
            //dispatch_release(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
            });
        }else{
            // get main queue change label
            dispatch_async(dispatch_get_main_queue(), ^{
                // changed UI the label
                self.timeLabel.text = [formatter stringFromDate:[NSDate date]];
            });
        }
    });  
    dispatch_resume(_timer);
}

@end