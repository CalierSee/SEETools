//
//  UIButton+See.m
//  SEETools
//
//  Created by 景彦铭 on 2017/8/31.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import "UIButton+See.h"
#import <objc/runtime.h>

const void * stateKey = "state";

@implementation UIButton (See)

- (void)setState:(NSNumber *)state {
    objc_setAssociatedObject(self, stateKey, state, OBJC_ASSOCIATION_ASSIGN);
}

- (NSNumber *)state {
    return objc_getAssociatedObject(self, stateKey);
}

- (UIButton *(^)(UIControlState))sState {
    return ^UIButton *(UIControlState state) {
        self.state = @(state);
        return self;
    };
}

- (UIButton *(^)(NSString *))sTitle {
    return ^UIButton *(NSString * title) {
        NSLog(@"%zd",self.state.intValue);
        [self setTitle:title forState:self.state.integerValue];
        return self;
    };
}

- (UIButton *(^)(UIColor *))sTitleColor {
    return ^UIButton *(UIColor *color) {
        [self setTitleColor:color forState:self.state.integerValue];
        return self;
    };
}

- (UIButton *(^)(UIImage *))sImage {
    return ^UIButton *(UIImage * image) {
        [self setImage:image forState:self.state.integerValue];
        return self;
    };
}

- (UIButton *(^)(NSAttributedString *))sAttributedTitle {
    return ^UIButton *(NSAttributedString * title){
        [self setAttributedTitle:title forState:self.state.integerValue];
        return self;
    };
}



@end
