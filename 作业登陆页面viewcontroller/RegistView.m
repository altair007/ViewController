//
//  RegistView.m
//  封装页面
//
//  Created by lanou3g on 14-5-26.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "RegistView.h"
#import "LTView.h"

@interface RegistView ()
{
    LTView * _viewLT;
}

@end


@implementation RegistView


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
    self.backgroundColor = [UIColor whiteColor];
    self.tag = 130;
    
    //创建lable的数组
    NSArray * arr = @[   @"用户名",
                         @"密码",
                         @"确认密码",
                         @"手机号",
                         @"邮箱",
                         @"地址",];
    for (NSString * lableName in arr) {
        static  float a = 0;
        CGRect  labelRect = CGRectMake(30, 60 + a, 260, 30);
        _viewLT = [[LTView alloc] initWithFrame:labelRect];
         a = a + 50;
        _viewLT.textFieldLT.delegate = self;
        _viewLT.labeLT.text = lableName;
        [self addSubview:_viewLT];
        [_viewLT release];
     }
    
    //注册按钮
    _registBT = [UIButton buttonWithType:UIButtonTypeSystem];
    _registBT.frame = CGRectMake(60, 400, 80, 30);
    [_registBT setTitle:@"注册" forState:UIControlStateNormal];
     [self addSubview:_registBT];
    
   //取消按钮
    _cancelBT = [UIButton buttonWithType:UIButtonTypeSystem];
    _cancelBT.frame = CGRectMake(180, 400, 80, 30);
    [_cancelBT setTitle:@"取消" forState:UIControlStateNormal];
    [self addSubview:_cancelBT];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
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
