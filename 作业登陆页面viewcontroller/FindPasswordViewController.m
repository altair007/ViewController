//
//  FindPasswordViewController.m
//  作业登陆页面viewcontroller
//
//  Created by lanou3g on 14-5-27.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "FindPasswordViewController.h"
#import "FindPasswordView.h"

@interface FindPasswordViewController ()
@property(nonatomic,retain)FindPasswordView * findPassword;

@end

@implementation FindPasswordViewController

- (void)dealloc
{
    [_findPassword release];
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
//自定义视图
- (void)loadView
{
    self.findPassword = [[[FindPasswordView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.view = _findPassword;


}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
