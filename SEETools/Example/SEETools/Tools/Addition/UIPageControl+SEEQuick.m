//
//  UIPageControl+SEEQuick.m
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/7.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "UIPageControl+SEEQuick.h"

@implementation UIPageControl (SEEQuick)
- (void)see_numberOfPage:(NSInteger)page currentPage:(NSInteger)currentPage currentPageIndicatorTintColor:(UIColor *)currentPageColor pageIndicatorTintColor:(UIColor *)pageColor {
    self.numberOfPages = page;
    self.currentPage = currentPage;
    self.currentPageIndicatorTintColor = currentPageColor;
    self.pageIndicatorTintColor = pageColor;
}
@end
