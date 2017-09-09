//
//  UIControl+See.m
//  SEETools
//
//  Created by 景彦铭 on 2017/9/4.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import "UIControl+See.h"
#import <objc/runtime.h>
const void * eventKey = "event";

@implementation UIControl (See)

- (void)setEvent:(NSNumber *)event {
    objc_setAssociatedObject(self, eventKey, event, OBJC_ASSOCIATION_ASSIGN);
}

- (NSNumber *)event {
    return objc_getAssociatedObject(self, eventKey);
}

- (UIControl *(^)(UIControlEvents))sEvent {
    return ^UIControl *(UIControlEvents event) {
        self.event = @(event);
        return self;
    };
}

- (UIControl *(^)(id, SEL))sAddTarget {
    return ^UIControl *(id target, SEL selector) {
        [self addTarget:target action:selector forControlEvents:self.event.integerValue];
        return self;
    };
}

@end
