//
//  RegistView.h
//  封装页面
//
//  Created by lanou3g on 14-5-26.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LTView.h"
//注册页面
@interface RegistView : UIView<UITextFieldDelegate>
@property(nonatomic,retain,readonly)UIButton * registBT;
@property(nonatomic,retain,readonly)UIButton * cancelBT;
@property(nonatomic,retain,readonly)LTView * viewLT;
@end
