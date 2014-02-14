//
//  ACEditorAlarmVC.h
//  AlarmClock
//
//  Created by ysy on 14-2-13.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ACEditorAlarmVC : UIViewController<UITextFieldDelegate>

@property (nonatomic, strong)NSDictionary *dataDic;

@property (strong, nonatomic) IBOutlet UIView *buttomView;

@property (strong, nonatomic) IBOutlet UIScrollView *centerScrollView;

@property (strong, nonatomic) IBOutlet UITextField *tagTextField;

@end
