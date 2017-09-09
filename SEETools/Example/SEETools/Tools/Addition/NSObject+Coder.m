//
//  NSObject+Coder.m
//  run..
//
//  Created by 景彦铭 on 2017/2/7.
//  Copyright © 2017年 景彦铭. All rights reserved.
//

#import "NSObject+Coder.h"
#import <objc/runtime.h>
@implementation NSObject (Coder)

#ifdef DEBUG
+ (void)load {
    SEL deal = NSSelectorFromString(@"dealloc");
    Method m1 = class_getInstanceMethod([self class], deal);
    Method m2 = class_getInstanceMethod([self class], @selector(css_dealloc));
    method_exchangeImplementations(m1, m2);
}
#endif

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [self init]) {
        [self code:aDecoder];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [self encode:aCoder];
}

- (void)code:(NSCoder *)aDecoder {
    Class c = self.class;
    NSString * nameString;
    //一层一层向上找父类的属性
    while (c && c != [NSObject class]) {
        unsigned int outCount = 0;
        objc_property_t * propertys = class_copyPropertyList(c, &outCount);
        for (NSInteger i  = 0; i < outCount; i++) {
            const char * propertyName = property_getName(propertys[i]);
            nameString = [NSString stringWithUTF8String:propertyName];
            if ([self respondsToSelector:@selector(ignorePreporty)]) {
                if ([[self ignorePreporty] containsObject:nameString]) {
                    continue;
                }
            }
            if ([aDecoder decodeObjectForKey:nameString]) {
                [self setValue:[aDecoder decodeObjectForKey:nameString] forKey:nameString];
            }
        }
        free(propertys);
        c = c.superclass;
    }
}

- (void)encode:(NSCoder *)aCoder {
    Class c = self.class;
    NSString * nameString;
    while(c && c != [NSObject class]) {
        unsigned int outCount = 0;
        objc_property_t * propertys = class_copyPropertyList(c, &outCount);
        for (NSInteger i  = 0; i < outCount; i++) {
            objc_property_t property = propertys[i];
            const char * propertyName = property_getName(property);
            nameString = [NSString stringWithUTF8String:propertyName];
            if ([self respondsToSelector:@selector(ignorePreporty)]) {
                if ([[self ignorePreporty] containsObject:nameString]) {
                    continue;
                }
            }
            [aCoder encodeObject:[self valueForKey:nameString] forKey:nameString];
        }
        free(propertys);
        c = c.superclass;
    }
}

- (NSArray <NSString *>*)ignorePreporty {
    return @[];
}

+ (NSArray<NSString *> *)ignorePreportyName {
    return @[];
}

- (void)css_dealloc {

    if ([self isKindOfClass:[UIViewController class]] && [NSStringFromClass([self class]) hasPrefix:@"CS"]) {
        NSLog(@"销毁控制器%@",[self class]);
    }
    
//    if ([self isKindOfClass:[UIView class]] && ([NSStringFromClass([self class]) hasPrefix:@"CSS"] || [NSStringFromClass([self class]) hasPrefix:@"SEE"])) {
//        CSSLog(@"销毁视图%@",[self class]);
//    }
    [self css_dealloc];
}

@end
