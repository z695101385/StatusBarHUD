//
//  ZCStatusBarHUDController.m
//  ZCStatusBarHUDDemo
//
//  Created by 张晨 on 2016/7/10.
//  Copyright © 2016年 zhangchen. All rights reserved.
//

#import "ZCStatusBarHUDController.h"

@interface ZCStatusBarHUDController ()

@end

@implementation ZCStatusBarHUDController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor clearColor];
    
}

//** 添加window会导致状态栏消失，
- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (void)dealloc
{
    NSLog(@"%s",__func__);
}
@end
