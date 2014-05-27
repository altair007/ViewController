//
//  LTView.h
//  封装页面
//
//  Created by lanou3g on 14-5-26.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTView : UIView
@property(nonatomic,retain,readonly)UILabel * labeLT;
@property(nonatomic,retain,readonly)UITextField * textFieldLT;
- (void)inputTextFieldLTDelegate:(id)delegate;

@end
