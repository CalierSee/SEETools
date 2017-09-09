//
//  NSObject+Json.m
//  SEEQuickTools
//
//  Created by 景彦铭 on 2017/2/8.
//  Copyright © 2017年 景彦铭. All rights reserved.
//

#import "NSObject+Json.h"
#import <objc/runtime.h>
#import "NSArray+SEEQuick.h"
#import "NSObject+Coder.h"
@implementation NSObject (Json)

//+ (void)load {
////    Method m1 = class_getInstanceMethod([self class], @selector(valueForKey:));
////    Method m2 = class_getInstanceMethod([self class], @selector(see_valueForKey:));
////    
////    method_exchangeImplementations(m1, m2);
//    
//}

+ (instancetype)see_objWithJson:(NSDictionary *)modelDictionary {
    Class c = [self class];
    id obj = [[self alloc]init];
    while (c && c != [NSObject class]) {
        unsigned int outCount = 0;
        Ivar * ivars = class_copyIvarList(c, &outCount);
        //创建属性列表数组
        NSMutableArray * propertyNames = [NSMutableArray arrayWithCapacity:outCount];
        //获取属性列表
        for (NSInteger i  = 0; i < outCount; i++) {
            const char * propertyName = ivar_getName(ivars[i]) + 1;
            [propertyNames addObject:[NSString stringWithUTF8String:propertyName]];
        }
        [propertyNames enumerateObjectsUsingBlock:^(NSString * propertyName, NSUInteger idx, BOOL * _Nonnull stop) {
            //1.处理key和属性不匹配问题
            if (modelDictionary[propertyName] == nil) {
                return;
            }
            //2.处理属性为数组的情况
            const char * propertyType = ivar_getTypeEncoding(ivars[idx]);
            if (!strcmp(propertyType, "@\"NSArray\"")) {
                if (class_getClassMethod(c, @selector(containerClass))) {
                    NSDictionary * dict = [c containerClass];
                    if (dict[propertyName]) {
                        Class subCla = NSClassFromString(dict[propertyName]);
                        NSAssert(subCla != nil, @"NSObject+Json line 38: className \"%@\" not found!",dict[propertyName]);
                        [obj setValue:[NSArray see_arrayWithClass:subCla json:modelDictionary[propertyName]] forKey:propertyName];
                    }
                    else {
                        [obj setValue:[obj reduceValue:modelDictionary[propertyName]] forKey:propertyName];
                    }
                }
            }
            //3.处理属性为另一个模型对象的情况
            if (propertyType[0] == '@' && !(propertyType[2] == 'N' && propertyType[3] == 'S')) {
                Class subCla = NSClassFromString([[NSString stringWithUTF8String:propertyType] substringWithRange:NSMakeRange(2,strlen(propertyType) - 3)]);
                [obj setValue:[subCla see_objWithJson:modelDictionary[propertyName]] forKey:propertyName];
            }
            //4.基本数据类型直接赋值
            [obj setValue:modelDictionary[propertyName] forKey:propertyName];
        }];
        free(ivars);
        c = c.superclass;
    }
    return obj;
}

- (NSDictionary *)see_dictionary {
    Class c = [self class];
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    while (c && c!= [NSObject class]) {
        unsigned int outCount;
        Ivar * ivars = class_copyIvarList(c, &outCount);
        for (NSInteger i  = 0; i < outCount; i++) {
            const char * ivar = ivar_getName(ivars[i]);
            NSString * ivarName = [NSString stringWithUTF8String:ivar + 1];
            if (class_getInstanceMethod(c, @selector(ignorePreporty))) {
                BOOL flag = NO;
                NSArray * arr = [[[c alloc]init] ignorePreporty];
                for (NSString * property in arr) {
                    if ([ivarName isEqualToString:property]) {
                        flag = YES;
                        break;
                    }
                }
                if (flag) {
                    continue;
                }
            }
            const char * type = ivar_getTypeEncoding(ivars[i]);
            //处理数组
            if (!strcmp(type, "@\"NSArray\"")) {
                id value = [self valueForKey:ivarName];
                if (value) {
                    if (class_getClassMethod(c, @selector(containerClass))) {
                        NSDictionary * dicts = [c containerClass];
                        if (dicts[ivarName]) {
                            NSMutableArray * arr = [NSMutableArray array];
                            for (id obj in value) {
                                [arr addObject:[obj see_dictionary]];
                            }
                            [dict setObject:arr.copy forKey:ivarName];
                        }
                        else {
                            [dict setObject:value forKey:ivarName];
                        }
                    }
                }
                else {
                    [dict setObject:@"" forKey:ivarName];
                }
            }
            else if (type[0] == '@' && type[2] != 'N' && type[3] != 'S') {
                [dict setObject:[[self valueForKey:ivarName] see_dictionary] forKey:ivarName];
            }
            else {
                id value = [self valueForKey:ivarName];
                [dict setObject:[self reduceValue:value] forKey:ivarName];
            }
        }
        free(ivars);
        c = c.superclass;
    }
    return dict;
}

+ (NSDictionary *)containerClass {
    return @{};
}

- (id)reduceValue:(id)value {
    if (value == nil) {
        value = @"";
    }
    return value;
}

@end
