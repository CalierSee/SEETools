//
//  UIFont+See.h
//  SEETools
//
//  Created by 景彦铭 on 2017/8/31.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (See)

/**
 返回系统字体
 */
+ (UIFont *(^)(CGFloat size))sSystemFont;

/**
 返回指定字体
 */
+ (UIFont *(^)(NSString * fontName, CGFloat size))sFont;

@end
