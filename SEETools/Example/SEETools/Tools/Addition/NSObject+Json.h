//
//  NSObject+Json.h
//  SEEQuickTools
//
//  Created by 景彦铭 on 2017/2/8.
//  Copyright © 2017年 景彦铭. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Json)

/**
 字典转模型
+containerClass 方法返回NSDictionary类型的对象 声明容器类型属性中包含的数据类型 
 例如  @property Dog * dog;
 返回值 @{@"dog": @"Dog"}
 @param dict 字典
 */
+ (instancetype)see_objWithJson:(NSDictionary *)dict;
- (NSDictionary *)see_dictionary;

+ (NSDictionary *)containerClass;

@end
