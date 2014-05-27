//
//  LoginView.m
//  封装页面
//
//  Created by lanou3g on 14-5-26.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

//登陆页面
#import "LoginView.h"
#import "LTView.h"
//#define USERNAME @"123"
//#define PASSWORD @"123"

//@interface LoginView ()
//{
//    LTView * _userLT;
//    LTView * _passwordLT;
//}
//
//@end
@implementation LoginView
- (void)dealloc
{
    [_userLT release];
    [_passwordLT release];
    [super dealloc];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupView];
     }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width;
    CGPoint userLTCenter = _userLT.center;
    userLTCenter.x = width/2;
    _userLT.center = userLTCenter;
    
    CGPoint passwordCenter = _passwordLT.center;
    passwordCenter.x = width/2;
    _passwordLT.center = passwordCenter;
    
    CGPoint findPasswordBTCenter = _findPasswordBT.center;
    findPasswordBTCenter.x = width/2;
    _findPasswordBT.center = findPasswordBTCenter;
    
    CGPoint registBTCenter = _registBT.center;
    registBTCenter.x = width/4;
    _registBT.center = registBTCenter;
    
    CGPoint loginBTCenter = _loginBT.center;
    loginBTCenter.x = 3*width/4;
    _loginBT.center = loginBTCenter;
       
//    if (UIInterfaceOrientationIsLandscape
//        ([UIApplication sharedApplication].statusBarOrientation)) {
//        CGFloat width = self.bounds.size.width;
//        CGPoint center = _userLT.center;
//        center.x = width/2;
//        _userLT.center = center;
//    }else{
//    
//        _userLT.frame = CGRectMake(20, 50, 260, 30);
//    }
}
- (void)setupView
{
    //设置view的背景和tag
    self.backgroundColor = [UIColor whiteColor];
    self.tag = 110;
    //创建用户名的自定义视图label和textField
    _userLT = [[LTView alloc] initWithFrame:CGRectMake(20, 50, 260, 30)];
    _userLT.labeLT.text = @"用户名";
    _userLT.textFieldLT.delegate = self;
    [self addSubview:_userLT];
    
    //创建密码的label和textField
    _passwordLT = [[LTView alloc]initWithFrame:CGRectMake(20, 100, 260, 30)];
    _passwordLT.labeLT.text = @"密码";
    _passwordLT.textFieldLT.secureTextEntry = YES;
    _passwordLT.textFieldLT.delegate = self;
    [self addSubview:_passwordLT];
    
    //创建注册按钮
   _registBT = [UIButton buttonWithType:UIButtonTypeSystem];
    _registBT.frame = CGRectMake(40, 150, 50, 30);
    [_registBT setTitle:@"注册" forState:UIControlStateNormal];
    [self addSubview:_registBT];
    
    //创建找回密码按钮
   _findPasswordBT = [UIButton buttonWithType:UIButtonTypeSystem];
   _findPasswordBT.frame = CGRectMake(120, 150, 70, 30);
    [ _findPasswordBT setTitle:@"找回密码" forState:UIControlStateNormal];
    [self addSubview: _findPasswordBT];
    
    //创建登陆按钮
    _loginBT = [UIButton buttonWithType:UIButtonTypeSystem];
    _loginBT.frame = CGRectMake(220, 150, 50, 30);
    [_loginBT setTitle:@"登陆" forState:UIControlStateNormal];
    //登陆按钮的实习方法
//    [loginBT addTarget:self action:@selector(didClickLoginBTAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_loginBT];
}

//第一响应如果是用户TF，按return换行
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (_userLT.textFieldLT == textField) {
    [_passwordLT.textFieldLT becomeFirstResponder];
    }else{
        [textField resignFirstResponder];
    }
    return YES;
}

////loginBT登陆按钮判断，密码是否正确，出消息提示框
//- (void)didClickLoginBTAction:(UIButton *)button
//{
//    if ([_userLT.textFieldLT.text isEqualToString:USERNAME]&&[_passwordLT.textFieldLT.text isEqualToString:PASSWORD]) {
//        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"保管好你的密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//        [alertView show];
//        [alertView release];
//    }else{
//        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码/用户名错误" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
//        [alertView show];
//        [alertView release];
//     }
//}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
