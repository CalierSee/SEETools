//
//  UIControl+See.h
//  SEETools
//
//  Created by 景彦铭 on 2017/9/4.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIControl (See)

@property (nonatomic,assign)NSNumber * event;

/**
 设置事件
 */
@property(nonatomic,copy,readonly)UIControl * (^sEvent)(UIControlEvents event);

/**
 添加事件
 */
@property(nonatomic,copy,readonly)UIControl * (^sAddTarget)(id target, SEL selector);

@end
