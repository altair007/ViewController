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
    // ???: 你可以使用点语法 :  self.userLT = nil;
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
// ???: 如果你再有些耐心的话,会发现另外一个规律:想要得到旋转时,总能自动居中的效果,只需要满足一个条件:  翻转前,控件的中心点(x0,y0)距离屏幕的竖直中分线的距离(width/2-x0) 等于  翻转后,控件的中心点(x1,y1)距离屏幕的竖直中分线的距离(height/2 - x1).==> x1-x0 = (height - width)/2  ==> x1 = x0 + (height - width)/2 ==>意思是说,任何控件,只需要在选转后,让其x坐标在原来的基础上加上一个固定值---屏幕的(height - width) / 2  就可以正确居中!可以试一下,真的可行!!!!
// ???:另外,上述算法无法处理逆时针home键从左到上再到右或者home键从右到上再到左的情况.经验证,对于上述两种情况:前者,ios会直接识别成,从home键在左的方向,顺时针直接旋转到home键在右的方向;后者,ios会直接识别成,从houme键在右的方向,逆时针直接旋转到home键在右的方向.前者的起始位置是UIDeviceOrientationLandscapeLeft, 将要旋转到的方向是UIDeviceOrientationLandscapeRight;后者的起始位置是UIDeviceOrientationLandscapeRight,将要旋转到的位置是UIDeviceOrientationLandscapeLeft.这两种情况应该区别对待.仔细观察下,规律就是:frame保持不变!
// ???: 综上:你需要在控制器的willRotateToInterfaceOrientation:duration:的方法里实现此算法的简化版本.另外可以通过[UIApplication sharedApplication].statusBarOrientation获取屏幕的当前方向,可以根据willRotateToInterfaceOrientation:duration:的toInterfaceOrientation参数获取屏幕的将要旋转到的方向.我觉得以上足以写出完整的代码了!!!
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
