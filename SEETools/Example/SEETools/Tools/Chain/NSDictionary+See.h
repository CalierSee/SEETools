//
//  NSDictionary+See.h
//  SEETools
//
//  Created by 景彦铭 on 2017/9/1.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface NSDictionary (See)

@property(nonatomic,strong,readonly)NSMutableDictionary * attributedDict;

/**
 字体大小
 */
@property(nonatomic,copy,readonly)NSDictionary *(^sFontSize)(CGFloat size);

/**
 字体
 */
@property(nonatomic,copy,readonly)NSDictionary * (^sFont)(UIFont * font);

/**
 前景色
 */
@property(nonatomic,copy,readonly)NSDictionary * (^sForegroundColor)(UIColor * color);

/**
 背景色
 */
@property(nonatomic,copy,readonly)NSDictionary * (^sBackgroundColor)(UIColor * color);


@end
