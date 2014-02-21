//
//  ACMainViewController.m
//  AlarmClock
//
//  Created by ysy on 14-2-12.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import "ACMainViewController.h"
#import "ACSetAlarmVC.h"


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

// get current time and display
- (void)getCurrentTime
{
    // current systime
    __block NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"HH:mm"];
    self.timeLabel.text = [formatter stringFromDate:[NSDate date]];
    // day and year and other
    __block NSDateFormatter *otherFormatter = [[NSDateFormatter alloc] init];
    otherFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh_CN"];
    [otherFormatter setDateFormat:@"yyyy-MM-d EEEE"];
    self.dayLabel.text = [otherFormatter stringFromDate:[NSDate date]];
    // current systime sec
    __block NSDateFormatter *secFormatter = [[NSDateFormatter alloc] init];
    [secFormatter setDateFormat:@"ss"];
    self.secLabel.text = [secFormatter stringFromDate:[NSDate date]];
    // timer change label
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0);
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
                if (![self.timeLabel.text isEqualToString:[formatter stringFromDate:[NSDate date]]]) {
                    self.timeLabel.text = [formatter stringFromDate:[NSDate date]];
                }
                // day month year ..
                if (![self.dayLabel.text isEqualToString:[otherFormatter stringFromDate:[NSDate date]]]) {
                    self.dayLabel.text = [otherFormatter stringFromDate:[NSDate date]];
                }
                // sec
                self.secLabel.text = [secFormatter stringFromDate:[NSDate date]];
            });
        }
    });  
    dispatch_resume(_timer);
}

// set alarm method
- (IBAction)setAlarmMethod:(UIButton *)sender
{
    ACSetAlarmVC *vc = [[ACSetAlarmVC alloc] initWithNibName:@"ACSetAlarmVC" bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
    
}


@end