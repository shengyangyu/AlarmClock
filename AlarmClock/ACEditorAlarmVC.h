//
//  ACEditorAlarmVC.h
//  AlarmClock
//
//  Created by ysy on 14-2-13.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AlarmClock;
@interface ACEditorAlarmVC : UIViewController<UITextFieldDelegate>

// nsdic has view type and editor data
@property (nonatomic, strong)NSDictionary *dataDic;
// buttom three or two button
@property (strong, nonatomic) IBOutlet UIView *buttomView;
// info scrollview
@property (strong, nonatomic) IBOutlet UIScrollView *centerScrollView;
// tag textfield can input
@property (strong, nonatomic) IBOutlet UITextField *tagTextField;
// current editor data
@property (nonatomic, strong) AlarmClock *editorClass;
// check data completion
- (BOOL)checkDataCompletion;

@end
