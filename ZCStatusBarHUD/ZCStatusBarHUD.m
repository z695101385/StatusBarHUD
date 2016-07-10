//
//  ZCStatusBarHUD.m
//  ZCStatusBarHUDDemo
//
//  Created by 张晨 on 16/7/7.
//  Copyright © 2016年 zhangchen. All rights reserved.
//

#import "ZCStatusBarHUD.h"
#import "ZCStatusBarHUDController.h"

#define ZCMessageFont [UIFont systemFontOfSize:12]

@interface ZCStatusBarHUD ()

@end

@implementation ZCStatusBarHUD

static CGFloat const windowH = 20;
/** 消息的停留时间 */
static CGFloat const ZCMessageDuration = 2.0;
/** 消息显示\隐藏的动画时间 */
static CGFloat const ZCAnimationDuration = 0.25;
//窗口
static UIWindow *window_;
//定时器
static NSTimer *timer_;
/**
 *  显示窗口
 */
+ (void)showWindow
{
    [timer_ invalidate];
    timer_ = nil;
    
    CGRect frame = CGRectMake(0, - windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc] initWithFrame:frame];
    window_.rootViewController = [[ZCStatusBarHUDController alloc] init];
    window_.windowLevel = UIWindowLevelStatusBar;
    window_.backgroundColor = [UIColor blackColor];
    window_.hidden = NO;
    
    frame.origin.y = 0;
    [UIView animateWithDuration:ZCAnimationDuration animations:^{
        window_.frame = frame;
    }];
    
}
/**
 *  显示图片与信息
 *
 *  @param msg   显示消息
 *  @param image 显示图片
 */
+ (void)showMessage:(NSString *)msg withImage:(UIImage *)image
{
    
    [self showWindow];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    [button setTitle:msg forState:UIControlStateNormal];
    [button setImage:image forState:UIControlStateNormal];
    [button.titleLabel setFont:ZCMessageFont];
    [window_ addSubview:button];
    
    timer_ = [NSTimer scheduledTimerWithTimeInterval:ZCMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**
 *  显示成功信息
 *
 *  @param msg 显示消息
 */
+ (void)showSuccess:(NSString *)msg
{
    UIImage *image = [UIImage imageNamed:@"ZCStatusBarHUD.bundle/success"];
    [self showMessage:msg withImage:image];
}

/**
 *  显示失败消息
 *
 *  @param msg 显示消息
 */
+ (void)showError:(NSString *)msg
{
    UIImage *image = [UIImage imageNamed:@"ZCStatusBarHUD.bundle/error"];
    [self showMessage:msg withImage:image];
}

/**
 *  显示消息
 *
 *  @param msg 显示消息
 */
+ (void)showMessage:(NSString *)msg
{
    [self showMessage:msg withImage:nil];
}

/**
 *  显示载入消息
 *
 *  @param msg 显示消息
 */
+ (void)showLoading:(NSString *)msg
{
    [self showWindow];
    
    // 添加文字
    UILabel *label = [[UILabel alloc] init];
    label.font = ZCMessageFont;
    label.frame = window_.bounds;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = msg;
    label.textColor = [UIColor whiteColor];
    [window_ addSubview:label];
    
    // 添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    // 文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : ZCMessageFont}].width;
    CGFloat centerX = (window_.frame.size.width - msgW) * 0.5 - 20;
    CGFloat centerY = window_.frame.size.height * 0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    
    [window_ addSubview:loadingView];
}

/**
 *  隐藏HUD
 */
+ (void)hide
{
    [UIView animateWithDuration:ZCAnimationDuration animations:^{
        CGRect frame = window_.frame;
        frame.origin.y = - windowH;
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}
@end
