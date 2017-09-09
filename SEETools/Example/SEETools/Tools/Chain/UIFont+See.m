//
//  UIFont+See.m
//  SEETools
//
//  Created by 景彦铭 on 2017/8/31.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import "UIFont+See.h"

@implementation UIFont (See)

+ (UIFont *(^)(CGFloat))sSystemFont {
    return ^UIFont * (CGFloat size) {
        return [UIFont systemFontOfSize:size];
    };
}

+ (UIFont *(^)(NSString *, CGFloat))sFont {
    return ^UIFont *(NSString * fontName, CGFloat size) {
        return [UIFont fontWithName:fontName size:size];
    };
}


@end
