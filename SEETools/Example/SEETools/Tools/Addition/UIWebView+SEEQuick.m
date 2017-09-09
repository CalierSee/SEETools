//
//  UIWebView+SEEQuick.m
//  OC与javascript交互
//
//  Created by 景彦铭 on 2016/11/8.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "UIWebView+SEEQuick.h"

@implementation UIWebView (SEEQuick)
//通过这个方法来截获网页的alert事件  可以用于在网页向app传递数据
- (void)webView:(UIWebView *)sender runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(UIWebView *)frame {
    [[NSNotificationCenter defaultCenter]postNotificationName:SEEReceiveAlertActionNotificationKey object:nil userInfo:@{SEEReceiveAlertActionNotificationKey : message}];
    NSLog(@"message %@",message);
    // 拿到信息之后,发一个通知给控制器
}

@end
