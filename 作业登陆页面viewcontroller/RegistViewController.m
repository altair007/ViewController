//
//  RegistViewController.m
//  作业登陆页面viewcontroller
//
//  Created by lanou3g on 14-5-27.
//  Copyright (c) 2014年 lanou3g. All rights reserved.
//

#import "RegistViewController.h"
#import "RegistView.h"
#import "LTView.h"
@interface RegistViewController ()
@property(nonatomic,retain)RegistView * registView;
@end

@implementation RegistViewController

- (void)dealloc
{
    [_registView release];
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
    self.registView = [[[RegistView alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    self.view = _registView;


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
