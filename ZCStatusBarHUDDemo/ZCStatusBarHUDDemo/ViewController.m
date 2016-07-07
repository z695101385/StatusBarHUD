//
//  ViewController.m
//  ZCStatusBarHUDDemo
//
//  Created by 张晨 on 16/7/7.
//  Copyright © 2016年 zhangchen. All rights reserved.
//

#import "ViewController.h"
#import "ZCStatusBarHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)success {
    [ZCStatusBarHUD showSuccess:@"success"];
}
- (IBAction)error {
    [ZCStatusBarHUD showError:@"error"];
}
- (IBAction)text {
    [ZCStatusBarHUD showMessage:@"2222"];
}
- (IBAction)defineBySelf {
    [ZCStatusBarHUD showMessage:@"11111" withImage:[UIImage imageNamed:@"alarm"]];
}
- (IBAction)loadind {
    [ZCStatusBarHUD showLoading:@"loading...."];
}
- (IBAction)hide {
    [ZCStatusBarHUD hide];
}

@end
