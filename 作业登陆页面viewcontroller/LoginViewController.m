//
//  LoginViewController.m
//  作业登陆页面viewcontroller
//
//  Created by lanou3g on 14-5-27.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginView.h"
#import "LTView.h"
#define USERNAME @"123"
#define PASSWORD @"123"

@interface LoginViewController ()

@property(nonatomic,retain)LoginView * loginView;

@end

@implementation LoginViewController
- (void)dealloc
{
    [_loginView release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
    self.loginView = [[[LoginView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.view = _loginView;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [_loginView.loginBT addTarget:self action:@selector(didClickLoginBTAction:) forControlEvents:UIControlEventTouchUpInside];
    
}
//loginBT登陆按钮判断，密码是否正确，出消息提示框
- (void)didClickLoginBTAction:(UIButton *)button
{
    if ([ _loginView.userLT.textFieldLT.text isEqualToString:USERNAME]&&[_loginView.passwordLT.textFieldLT.text isEqualToString:PASSWORD]) {
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"保管好你的密码" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
        [alertView release];
    }else{
        UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示" message:@"密码/用户名错误" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        [alertView show];
        [alertView release];
     }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
