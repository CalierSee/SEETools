//
//  UILabel+See.m
//  SEETools
//
//  Created by 景彦铭 on 2017/8/31.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import "UILabel+See.h"

@implementation UILabel (See)

- (UILabel *(^)(NSString *, UIColor *))sText {
    return ^UILabel *(NSString * text, UIColor * textColor) {
        self.text = text;
        self.textColor = textColor;
        return self;
    };
}

- (UILabel *(^)(UIFont *))sFont {
    return ^UILabel * (UIFont * font) {
        self.font = font;
        return self;
    };
}

- (UILabel *(^)(NSTextAlignment))sTextAlignment {
    return ^UILabel *(NSTextAlignment alignment){
        self.textAlignment = alignment;
        return self;
    };
}

- (UILabel *(^)(NSInteger))sNumberOfLines {
    return ^UILabel *(NSInteger number) {
        self.numberOfLines = number;
        return self;
    };
}

@end
