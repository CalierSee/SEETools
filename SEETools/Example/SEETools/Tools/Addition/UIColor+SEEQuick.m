//
//  UIColor+SEEQuick.m
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/11.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "UIColor+SEEQuick.h"

@implementation UIColor (SEEQuick)
+ (instancetype)see_colorWithHex:(uint32_t)hex {
    uint32_t red = (hex & 0xFF0000) >> 16;
    uint32_t green = (hex & 0x00FF00) >> 8;
    uint32_t blue = hex & 0x0000FF;
    return [UIColor see_colorWithRed:red green:green blue:blue alpha:1.0];
}

+ (instancetype)see_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:alpha];
}
@end
