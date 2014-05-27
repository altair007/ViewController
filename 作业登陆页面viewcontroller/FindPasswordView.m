//
//  FindPasswordView.m
//  封装页面
//
//  Created by lanou3g on 14-5-26.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "FindPasswordView.h"

@implementation FindPasswordView
- (void)dealloc
{
   
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
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
    //设置背景颜色和tag
    self.backgroundColor = [UIColor whiteColor];
    self.tag = 120;
    //创建用户的textField
    UITextField * userTF = [[UITextField alloc] initWithFrame:CGRectMake(60, 80, 180, 30)];
    userTF.borderStyle = UITextBorderStyleRoundedRect;
    userTF.placeholder = @"用户名/邮箱";
    [self addSubview:userTF];
    [userTF release];
    
    //创建找回的按钮
    UIButton * findBT = [UIButton buttonWithType:UIButtonTypeSystem];
    findBT.frame = CGRectMake(60, 120, 70, 30);
    [findBT setTitle:@"找回" forState:UIControlStateNormal];
    //内部实现方法
    [findBT addTarget:self action:@selector(didClickFindBTAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:findBT];
   
    //创建取消按钮
    _cancelBT = [UIButton buttonWithType:UIButtonTypeSystem];
    _cancelBT.frame = CGRectMake(150, 120, 70, 30);
    [_cancelBT setTitle:@"取消" forState:UIControlStateNormal];
    [self addSubview:_cancelBT];
}

- (void)didClickFindBTAction:(UIButton *)button
{
    NSLog(@"找回密码");
    UIAlertView * alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"找回密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    [alert show];
    [alert release];
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
