//
//  UIScrollView+SEEQuick.m
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/7.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "UIScrollView+SEEQuick.h"

@implementation UIScrollView (SEEQuick)
+ (instancetype)see_createWithFrame:(CGRect)frame bounces:(BOOL)bounces verticalScrollIndicator:(BOOL)vertical horizontalScrollIndicator:(BOOL)horizontal pageEnable:(BOOL)page delegate:(id)delegate  {
    UIScrollView * scrollView = [[UIScrollView alloc]initWithFrame:frame];
    scrollView.bounces = bounces;
    scrollView.showsVerticalScrollIndicator = vertical;
    scrollView.showsHorizontalScrollIndicator = horizontal;
    scrollView.pagingEnabled = page;
    scrollView.delegate = delegate;
    return scrollView;
}
@end
