//
//  LoginView.h
//  封装页面
//
//  Created by lanou3g on 14-5-26.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTView;
//登陆页面
@interface LoginView : UIView<UITextFieldDelegate>

//注册按钮
@property(nonatomic,retain,readonly)UIButton * registBT;
@property(nonatomic,retain,readonly)UIButton *
findPasswordBT;
@property(nonatomic,retain,readonly)UIButton * loginBT;
@property(nonatomic,retain,readonly) LTView * userLT;
@property(nonatomic,retain,readonly)LTView * passwordLT;

@end
