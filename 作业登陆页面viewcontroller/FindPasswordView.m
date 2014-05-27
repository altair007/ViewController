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
    [_userTF release];
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
- (void)layoutSubviews
{
    [super layoutSubviews];
  CGFloat width = self.bounds.size.width;
    CGPoint userTFCenter = _userTF.center;
    userTFCenter.x = width/2;
    _userTF.center = userTFCenter;
    
    CGPoint cancleBTCenter = _cancelBT.center;
    cancleBTCenter.x = 10*width/16;
    _cancelBT.center = cancleBTCenter;
    
    CGPoint backBTCenter = _cancelBT.center;
    backBTCenter.x = 6*width/16;
    _backBT.center = backBTCenter;

}

- (void)setupSubview
{
    //设置背景颜色和tag
    self.backgroundColor = [UIColor whiteColor];
    self.tag = 120;
    
   
    
    //创建用户的textField
   _userTF = [[UITextField alloc] initWithFrame:CGRectMake(60, 80, 180, 30)];
    
    _userTF.borderStyle = UITextBorderStyleRoundedRect;
    _userTF.placeholder = @"用户名/邮箱";
    [self addSubview:_userTF];
    [_userTF release];
    
    //创建找回的按钮
    _backBT = [UIButton buttonWithType:UIButtonTypeSystem];
    _backBT.frame = CGRectMake(60, 120, 70, 30);
    [_backBT setTitle:@"找回" forState:UIControlStateNormal];
    //内部实现方法
//    [findBT addTarget:self action:@selector(didClickFindBTAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_backBT];
   
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
