//
//  UIView+DrawRect.h
//  sliderTitleView
//
//  Created by 三只鸟 on 2017/5/18.
//  Copyright © 2017年 三只鸟. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (DrawRect)
/**
 设置圆角、边框
 
 @param radiu 设置角度
 @param borderWith 边框宽度
 @param color 边框颜色
 */
-(void)drawConerRadiusConerRadius:(CGFloat)radiu borderWith:(CGFloat)borderWith boorderColor:(UIColor *)color;

@end
