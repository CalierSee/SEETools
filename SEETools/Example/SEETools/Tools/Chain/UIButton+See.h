//
//  UIButton+See.h
//  SEETools
//
//  Created by 景彦铭 on 2017/8/31.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIView+See.h"
@interface UIButton (See)

@property (nonatomic,assign)NSNumber * state;

/**
 设置状态
 */
@property(nonatomic,copy,readonly)UIButton * (^sState)(UIControlState state);

/**
 设置图片
 */
@property(nonatomic,copy,readonly)UIButton * (^sImage)(UIImage * image);

/**
 设置title
 */
@property(nonatomic,copy,readonly)UIButton * (^sTitle)(NSString * title);

/**
 设置titleColor
 */
@property(nonatomic,copy,readonly)UIButton * (^sTitleColor)(UIColor * color);

/**
 设置属性字符串
 */
@property(nonatomic,copy,readonly)UIButton * (^sAttributedTitle)(NSAttributedString * title);


@end
