//
//  UIColor+See.m
//  SEETools
//
//  Created by 景彦铭 on 2017/8/31.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import "UIColor+See.h"

@implementation UIColor (See)

+ (UIColor *(^)(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha))sRGB {
    return ^UIColor *(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha){
        return [UIColor colorWithRed:red/255.0 green:green/255.0 blue:blue/255.0 alpha:alpha];
    };
}

+ (UIColor *(^)(uint32_t, CGFloat))sHex {
    return ^UIColor * (uint32_t hex, CGFloat alpha) {
        int red = (hex & 0xff0000) >> 16;
        int green = (hex & 0x00ff00) >> 8;
        int blue = hex & 0x0000ff;
        return UIColor.sRGB(red,green,blue,alpha);
    };
}

@end
