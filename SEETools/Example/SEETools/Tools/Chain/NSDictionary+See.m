//
//  NSDictionary+See.m
//  SEETools
//
//  Created by 景彦铭 on 2017/9/1.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import "NSDictionary+See.h"
#import <objc/runtime.h>

const void * attributeDictKey = "attributeDict";

@implementation NSDictionary (See)

- (NSMutableDictionary *)attributedDict {
    if (objc_getAssociatedObject(self, attributeDictKey) == nil) {
        objc_setAssociatedObject(self, attributeDictKey, [NSMutableDictionary dictionary], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    }
    return objc_getAssociatedObject(self, attributeDictKey);
    
}

- (void)setAttributedDict:(NSMutableDictionary *)attributedDict {
    objc_setAssociatedObject(self, attributeDictKey, attributedDict, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSDictionary *(^)(UIColor * color))sForegroundColor {
    return ^NSDictionary *(UIColor * color){
        [self.attributedDict setObject:color forKey:NSForegroundColorAttributeName];
        return self.attributedDict.copy;
    };
}

- (NSDictionary *(^)(UIColor *))sBackgroundColor {
    return ^NSDictionary *(UIColor * color){
        [self.attributedDict setObject:color forKey:NSBackgroundColorAttributeName];
        return self.attributedDict.copy;
    };
}

- (NSDictionary *(^)(UIFont * font))sFont {
    return ^NSDictionary *(UIFont * font){
        [self.attributedDict setObject:font forKey:NSFontAttributeName];
        return self.attributedDict.copy;
    };
}

- (NSDictionary *(^)(CGFloat size))sFontSize {
    return ^NSDictionary *(CGFloat size){
        [self.attributedDict setObject:[UIFont systemFontOfSize:size] forKey:NSFontAttributeName];
        return self.attributedDict.copy;
    };
}

@end
