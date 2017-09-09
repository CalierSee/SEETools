//
//  NSArray+SEEQuick.h
//  支付宝
//
//  Created by 景彦铭 on 16/9/16.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray (SEEQuick)

///  根据plist返回一个模型数组
///
///  @param name  plist文件名
///  @param cla  模型类
+ (instancetype)see_arrayWithPlist:(NSString *)name modeClass:(Class)cla;


/**
 数组转模型数组
 如果模型中包含容器类型属性 需要在模型类中实现 +containerClass方法 方法返回值为字典
 +containerClass 方法返回NSDictionary类型的对象 声明容器类型属性中包含的数据类型
 例如  @property Dog * dog;
 返回值 @{@"dog": @"Dog"}

 @param cla 模型类
 @param json 数组
 */
+ (instancetype)see_arrayWithClass:(Class)cla json:(NSArray *)json;

@end

NS_ASSUME_NONNULL_END
