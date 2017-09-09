//
//  UIView+DrawRect.m
//  sliderTitleView
//
//  Created by 三只鸟 on 2017/5/18.
//  Copyright © 2017年 三只鸟. All rights reserved.
//

#import "UIView+DrawRect.h"

@implementation UIView (DrawRect)

/**
 设置圆角、边框

 @param radiu 设置角度
 @param borderWith 边框宽度
 @param color 边框颜色
 */
-(void)drawConerRadiusConerRadius:(CGFloat)radiu borderWith:(CGFloat)borderWith boorderColor:(UIColor *)color
{
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radiu , radiu)];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = self.bounds;
    maskLayer.path = path.CGPath;
    self.layer.mask = maskLayer;
    if(borderWith >0) {
//        设置圆角
        CAShapeLayer*borderLayer = [CAShapeLayer layer];
        // 用贝赛尔曲线画线，path 其实是在线的中间，这样会被 layer.mask（遮罩层)遮住一半，故在 halfWidth 处新建 path，刚好产生一个内描边
        CGFloat halfWidth = borderWith /2.0f;
        CGRect f =CGRectMake(halfWidth, halfWidth,CGRectGetWidth(self.bounds) - borderWith,CGRectGetHeight(self.bounds) - borderWith);
        
        borderLayer.path = [UIBezierPath bezierPathWithRoundedRect:f byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(radiu , radiu)].CGPath;
        borderLayer.fillColor = [UIColor clearColor].CGColor;
        borderLayer.strokeColor = color.CGColor;
        borderLayer.lineWidth = borderWith;
        borderLayer.frame = CGRectMake(0,0,CGRectGetWidth(f),CGRectGetHeight(f));
        [self.layer addSublayer:borderLayer];
    }
    
}


@end
