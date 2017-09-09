//
//  UIColor+SEEQuick.h
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/11.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (SEEQuick)
///  根据十六进制数返回一个颜色
///
///  @param hex 十六进制颜色
+ (instancetype)see_colorWithHex:(uint32_t)hex;

///  根据rgb返回一个颜色
///
///  @param red   red
///  @param green green
///  @param blue  blue
///  @param alpha 透明度
+ (instancetype)see_colorWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue alpha:(CGFloat)alpha;
@end
