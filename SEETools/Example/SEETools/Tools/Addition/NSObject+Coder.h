//
//  NSObject+Coder.h
//  run..
//
//  Created by 景彦铭 on 2017/2/7.
//  Copyright © 2017年 景彦铭. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 归档
 @param obj 对象
 @param path 路径
 */
#define Archiver(obj,path) [NSKeyedArchiver archiveRootObject:obj toFile:path];

/**
 解档
 @param path 路径
 @return 对象
 */
#define Unarchiver(path) [NSKeyedUnarchiver unarchiveObjectWithData:[NSData dataWithContentsOfFile:path]];

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Coder) <NSCoding>

/**
 返回归档忽略参数名
 */
- (NSArray <NSString *>*)ignorePreporty;
+ (NSArray<NSString *> *)ignorePreportyName;
@end

NS_ASSUME_NONNULL_END
