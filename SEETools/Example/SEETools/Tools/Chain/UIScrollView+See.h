//
//  UIScrollView+See.h
//  SEETools
//
//  Created by 景彦铭 on 2017/9/6.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (See)

/**
 是否允许弹性
 */
@property(nonatomic,copy,readonly)UIScrollView * (^sBounces)(BOOL bounces);

/**
 是否分页
 */
@property(nonatomic,copy,readonly)UIScrollView * (^sPagingEnabled)(BOOL pagingEnabled);

/**
 代理
 */
@property(nonatomic,copy,readonly)UIScrollView * (^sDelegate)(id <UIScrollViewDelegate> delegate);

/**
 滚动范围
 */
@property(nonatomic,copy,readonly)UIScrollView * (^sContentSize)(CGSize contentSize);

/**
 偏移量
 */
@property(nonatomic,copy,readonly)UIScrollView * (^sContentOffset)(CGPoint contentOffset, BOOL animate);

/**
 设置指示条
 */
@property(nonatomic,copy,readonly)UIScrollView * (^sIndicator)(BOOL vertical, BOOL horizontal);

/**
 内容间距
 */
@property(nonatomic,copy,readonly)UIScrollView * (^sContentInsets)(UIEdgeInsets inset);

/**
 指示器间距
 */
@property(nonatomic,copy,readonly)UIScrollView * (^sIndicatorInsets)(UIEdgeInsets inset);

@end
