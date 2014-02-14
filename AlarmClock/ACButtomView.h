//
//  ACButtomView.h
//  AlarmClock
//
//  Created by ysy on 14-2-14.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ACButtomViewDelegate <NSObject>

@optional

- (void)choiceBtnMethod:(NSInteger)btnIndex;

@end

@interface ACButtomView : UIView

@property(nonatomic,assign) NSInteger btnCount;

@property(nonatomic,assign) id<ACButtomViewDelegate> delegate;

//  init method
- (id)initWithFrame:(CGRect)frame withCount:(NSInteger)count;

@end
