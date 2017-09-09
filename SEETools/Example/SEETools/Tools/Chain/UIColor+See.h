//
//  UIColor+See.h
//  SEETools
//
//  Created by 景彦铭 on 2017/8/31.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (See)

+ (UIColor *(^)(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha))sRGB;

+ (UIColor *(^)(uint32_t hex, CGFloat alpha))sHex;


@end
