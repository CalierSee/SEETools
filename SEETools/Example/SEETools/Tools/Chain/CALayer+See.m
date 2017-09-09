//
//  CALayer+See.m
//  SEETools
//
//  Created by 景彦铭 on 2017/8/31.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import "CALayer+See.h"

@implementation CALayer (See)

- (CALayer * (^)(CGFloat radius))sCornerRadius {
    return ^CALayer *(CGFloat radius){
        self.cornerRadius = radius;
        self.masksToBounds = NO;
        return self;
    };
}

- (CALayer *(^)(CGFloat opacity, UIColor * color, CGPathRef path, CGFloat radius, CGSize offset))sShadow {
    return ^CALayer *(CGFloat opacity, UIColor * color, CGPathRef path, CGFloat radius, CGSize offset) {
        if (opacity) {
            self.shadowOpacity = opacity;
        }
        if (color) {
            self.shadowColor = color.CGColor;
        }
        if (path) {
            self.shadowPath = path;
        }
        if (CGSizeEqualToSize(offset, CGSizeZero)) {
            self.shadowOffset = offset;
        }
        if (radius) {
            self.shadowRadius = radius;
        }
        return self;
    };
}

@end
