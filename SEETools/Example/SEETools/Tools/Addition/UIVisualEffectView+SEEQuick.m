//
//  UIVisualEffectView+SEEQuick.m
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/7.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "UIVisualEffectView+SEEQuick.h"

@implementation UIVisualEffectView (SEEQuick)
+ (instancetype)see_createWithFrame:(CGRect)frame{
    UIBlurEffect * effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    UIVisualEffectView * effectView = [[UIVisualEffectView alloc]initWithEffect:effect];
    effectView.frame = frame;
    return effectView;
}
@end
