//
//  UIView+See.h
//  SEETools
//
//  Created by 景彦铭 on 2017/8/31.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (See)

/**
 背景颜色
 */
@property(nonatomic,copy,readonly)UIView *(^sBackgroundColor)(UIColor * color);

/**
 设置frame
 */
@property(nonatomic,copy,readonly)UIView * (^sFrame)(CGRect frame);

/**
 设置bounds
 */
@property(nonatomic,copy,readonly)UIView * (^sBounds)(CGRect bounds);

/**
 设置tag
 */
@property(nonatomic,copy,readonly)UIView * (^sTag)(NSInteger tag);

@end
