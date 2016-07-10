//
//  ZCStatusBarHUD.h
//  ZCStatusBarHUDDemo
//
//  Created by 张晨 on 16/7/7.
//  Copyright © 2016年 zhangchen. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCStatusBarHUD : NSObject
/**
 *  显示图片与信息
 *
 *  @param msg   显示消息
 *  @param image 显示图片
 */
+ (void)showMessage:(NSString *)msg withImage:(UIImage *)image;
/**
 *  显示成功信息
 *
 *  @param msg 显示消息
 */
+ (void)showSuccess:(NSString *)msg;
/**
 *  显示失败消息
 *
 *  @param msg 显示消息
 */
+ (void)showError:(NSString *)msg;
/**
 *  显示消息
 *
 *  @param msg 显示消息
 */
+ (void)showMessage:(NSString *)msg;
/**
 *  显示载入消息
 *
 *  @param msg 显示消息
 */
+ (void)showLoading:(NSString *)msg;
/**
 *  隐藏HUD
 */
+ (void)hide;

+ (void)showTopWindow;

@end
