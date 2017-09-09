//
//  UILabel+See.h
//  SEETools
//
//  Created by 景彦铭 on 2017/8/31.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (See)

/**
 设置文字 以及文字颜色
 */
@property(nonatomic,copy,readonly)UILabel * (^sText)(NSString * text, UIColor * color);

/**
 设置字体
 */
@property(nonatomic,copy,readonly)UILabel * (^sFont)(UIFont * font);

/**
 文字布局方案
 */
@property(nonatomic,copy,readonly)UILabel * (^sTextAlignment)(NSTextAlignment alignment);

/**
 设置行数
 */
@property(nonatomic,copy,readonly)UILabel * (^sNumberOfLines)(NSInteger number);

@end
