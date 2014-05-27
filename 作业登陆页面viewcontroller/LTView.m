//
//  LTView.m
//  封装页面
//
//  Created by lanou3g on 14-5-26.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "LTView.h"

@implementation LTView

- (void)dealloc
{
    [_labeLT release];
    [_textFieldLT release];
    [super dealloc];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setupSubview];
        
    }
    return self;
}

- (void)setupSubview
{
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    //标签
    _labeLT = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, width/3, height)];
    [self addSubview:_labeLT];
    //文本框
    _textFieldLT = [[UITextField alloc] initWithFrame:CGRectMake(width/3, 0, width - width/3, height)];
   
    _textFieldLT.borderStyle = UITextBorderStyleRoundedRect;
    [self addSubview:_textFieldLT];
}

- (void)inputTextFieldLTDelegate:(id)delegate
{
    _textFieldLT.delegate = delegate;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
