//
//  ACButtomView.m
//  AlarmClock
//
//  Created by ysy on 14-2-14.
//  Copyright (c) 2014年 com.deirlym.www. All rights reserved.
//

#import "ACButtomView.h"

#define UIColorFromRGB(r,g,b,a) [UIColor colorWithRed:(float)(r)/255.0 green:(float)(g)/255.0 blue:(float)(b)/255.0 alpha:a]

@implementation ACButtomView
@synthesize delegate;
@synthesize btnCount;

- (id)initWithFrame:(CGRect)frame withCount:(NSInteger)count
{
    self = [super initWithFrame:frame];
    if (self) {
        btnCount = count;
        [self commonInit];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self commonInit];
    }
    return self;
}
#pragma mark - Layout
- (void)layoutSubviews
{
    [super layoutSubviews];
}

#pragma mark -realize method
- (void)commonInit
{
    self.backgroundColor = UIColorFromRGB(124,252,0,0.7);
    CGSize mSize = self.frame.size;
    // left button
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.showsTouchWhenHighlighted = YES;
    [leftBtn setFrame:CGRectMake(0, 0, mSize.width/btnCount, mSize.height)];
    [leftBtn setTitle:@"取消" forState:UIControlStateNormal];
    [leftBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [leftBtn addTarget:self action:@selector(buttonMethod:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.tag = 101;
    [self addSubview:leftBtn];
    
    // when editor alarm need delete button
    if (btnCount == 3) {
        // center button
        UIButton *centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        centerBtn.showsTouchWhenHighlighted = YES;
        [centerBtn setFrame:CGRectMake(mSize.width/btnCount, 0, mSize.width/self.btnCount, mSize.height)];
        [centerBtn setTitle:@"删除" forState:UIControlStateNormal];
        [centerBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [centerBtn addTarget:self action:@selector(buttonMethod:) forControlEvents:UIControlEventTouchUpInside];
        centerBtn.tag = 103;
        [self addSubview:centerBtn];
    }
    
    // right button
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.showsTouchWhenHighlighted = YES;
    [rightBtn setFrame:CGRectMake((btnCount - 1) * mSize.width/btnCount, 0, mSize.width/self.btnCount, mSize.height)];
    [rightBtn setTitle:@"确定" forState:UIControlStateNormal];
    [rightBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [rightBtn addTarget:self action:@selector(buttonMethod:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tag = 102;
    [self addSubview:rightBtn];
}

#pragma mark -method for button 
- (void)buttonMethod:(UIButton *)sender
{
    if ([delegate respondsToSelector:@selector(choiceBtnMethod:)]) {
        
        [delegate choiceBtnMethod:(sender.tag - 101)];
    }
}

@end
