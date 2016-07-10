//
//  ZCTopWindow.m
//  百思不得姐
//
//  Created by 张晨 on 2016/7/10.
//  Copyright © 2016年 zhangchen. All rights reserved.
//

#import "ZCTopWindow.h"
#import "ZCStatusBarHUDController.h"

@implementation ZCTopWindow

static UIWindow *topWindow_;

+ (void)initialize
{
    topWindow_ = [[UIWindow alloc] init];
    
    topWindow_.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 20);
    
    topWindow_.rootViewController = [[ZCStatusBarHUDController alloc] init];
    
    topWindow_.windowLevel = UIWindowLevelAlert;
    
    topWindow_.backgroundColor = [UIColor clearColor];
    
    [topWindow_ addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)]];
}

+ (void)show
{
    
    topWindow_.hidden = NO;

}

+ (void)tap
{
    NSLog(@"%s",__func__);
    
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    [self searchScrollViewInView:window];
}

+ (void)searchScrollViewInView:(UIView *)superview
{
    for (UIScrollView *subview in superview.subviews) {
        
        
        //将原坐标系转到同一(keyWindow坐标系)
        CGRect newFrame = [subview.superview convertRect:subview.frame toView:[UIApplication sharedApplication].keyWindow];
        //CGRect newFrame = [[UIApplication sharedApplication].keyWindow convertRect:subview.frame fromView:subview.superview];
        
        //判断scrollview是否显示在当前屏幕（CGRectIntersectsRect判断scrollview是否与keyWindow相交）
        BOOL isShowingOnWindow = !subview.hidden && subview.alpha > 0.01 && CGRectIntersectsRect([UIApplication sharedApplication].keyWindow.bounds, newFrame);
        
        // 如果是scrollview,且显示在当前屏幕中,那么滚动最顶部
        if ([subview isKindOfClass:[UIScrollView class]]  && isShowingOnWindow) {
            
            CGPoint offset = subview.contentOffset;
            offset.y = - subview.contentInset.top;
            [subview setContentOffset:offset animated:YES];
            
        }
        
        // 如果当前控件存在子控件，那么继续查找子控件
        if (subview.subviews.count) {
            [self searchScrollViewInView:subview];
        }
    }
}

@end
