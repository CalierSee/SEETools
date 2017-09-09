//
//  UIPageControl+SEEQuick.h
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/7.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIPageControl (plus)
///  配置UIPageControl
///
///  @param page             总页数
///  @param currentPage      当前页
///  @param currentPageColor 当前页颜色
///  @param pageColor        页控件颜色
- (void)see_numberOfPage:(NSInteger)page currentPage:(NSInteger)currentPage currentPageIndicatorTintColor:(UIColor *)currentPageColor pageIndicatorTintColor:(UIColor *)pageColor;
@end
