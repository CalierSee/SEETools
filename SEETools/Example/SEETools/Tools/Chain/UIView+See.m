//
//  UIView+See.m
//  SEETools
//
//  Created by 景彦铭 on 2017/8/31.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import "UIView+See.h"

@implementation UIView (See)

- (UIView *(^)(UIColor *))sBackgroundColor {
    return ^UIView * (UIColor * backgroundColor) {
        self.backgroundColor = backgroundColor;
        return self;
    };
}

- (UIView *(^)(CGRect))sFrame {
    return ^UIView *(CGRect frame){
        self.frame = frame;
        return self;
    };
}

- (UIView *(^)(CGRect))sBounds {
    return ^UIView *(CGRect bounds) {
        self.bounds = bounds;
        return self;
    };
}

- (UIView *(^)(NSInteger))sTag {
    return ^UIView *(NSInteger tag) {
        self.tag = tag;
        return self;
    };
}

@end
