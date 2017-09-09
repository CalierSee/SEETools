//
//  NSString+SEEQuick.m
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/12.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "NSString+SEEQuick.h"

@implementation NSString (SEEQuick)

- (CGFloat)see_heightWithWidth:(CGFloat)width fontSize:(CGFloat)size{
    NSMutableParagraphStyle *paragraphstyle=[[NSMutableParagraphStyle alloc]init];
    paragraphstyle.lineBreakMode=NSLineBreakByCharWrapping;
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size],NSParagraphStyleAttributeName:paragraphstyle.copy} context:nil].size.height;
}

- (CGFloat)see_widthWithHeight:(CGFloat)height fontSize:(CGFloat)size{
    NSMutableParagraphStyle *paragraphstyle=[[NSMutableParagraphStyle alloc]init];
    paragraphstyle.lineBreakMode=NSLineBreakByWordWrapping;
    return [self boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size],NSParagraphStyleAttributeName:paragraphstyle.copy} context:nil].size.width;
}
    
+ (NSString *)see_cachePathForURL:(NSString *)url {
    
    return [self see_pathForURL:url forDirectory:NSCachesDirectory];
}
    
+ (NSString *)see_documentPathForURL:(NSString *)url {
    
    return [self see_pathForURL:url forDirectory:NSDocumentDirectory];
}
    
+ (NSString *)see_tempPathForURL:(NSString *)url {
    NSString * fileName = [url lastPathComponent];
    NSString * path = NSTemporaryDirectory();
    return [path stringByAppendingPathComponent:fileName];
}
    
    
+ (NSString *)see_pathForURL:(NSString *)url forDirectory:(NSSearchPathDirectory)directory {
    NSString * fileName = [url lastPathComponent];
    NSString * path = NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES).lastObject;
    return [path stringByAppendingPathComponent:fileName];
}

- (BOOL)see_isChinaPhoneNumber {
    if (self.length == 11) {
        NSString * regularString = @"(^1[34578]\\d{9}$)";
        NSError * error;
        NSRegularExpression * expression = [NSRegularExpression regularExpressionWithPattern:regularString options:NSRegularExpressionDotMatchesLineSeparators error:&error];
        if (error) {
            //匹配出错
            return NO;
        }
        if ([expression numberOfMatchesInString:self options:0 range:NSMakeRange(0, self.length)]) {
            return YES;
        }
        else {
            return NO;
        }
    }
    //手机号码位数不够
    return NO;
}

- (BOOL)see_isIdentityCode {
    NSString * regularString = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSError * error;
    NSRegularExpression * expression = [NSRegularExpression regularExpressionWithPattern:regularString options:NSRegularExpressionDotMatchesLineSeparators error:&error];
    if (error) {
        return NO;
    }
    if ([expression matchesInString:self options:0 range:NSMakeRange(0, self.length)].count) {
        if (self.length == 18) {
            NSMutableArray <NSNumber *> * arrayM = [NSMutableArray array];
            for (NSInteger i  = 0; i < 17; i++) {
                [arrayM addObject:@([self substringWithRange:NSMakeRange(i, 1)].integerValue)];
            }
            NSInteger idCardWi[17] = {7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2 };
            NSInteger idCardY[11] = {1,0,10,9,8,7,6,5,4,3,2};
            __block NSInteger idCardSum = 0;
            for (NSInteger i  = 0; i < arrayM.count; i++) {
                idCardSum += arrayM[i].integerValue * idCardWi[i];
            }
            NSInteger idCardMod = idCardSum % 11;
            NSString * lastString = [self substringFromIndex:self.length - 1];
            if (idCardMod == 2) {
                if ([lastString isEqualToString:@"X"] || [lastString isEqualToString:@"x"]) {
                    return YES;
                }
            }
            else {
                if (idCardY[idCardMod] == lastString.integerValue) {
                    return YES;
                }
            }
        }
        if (self.length == 15) {
            return YES;
        }
        return NO;
    }
    else {
        return NO;
    }
}

// 根据路径删除文件
+ (void)cleanCaches:(NSString *)path{
    // 利用NSFileManager实现对文件的管理
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        // 获取该路径下面的文件名
        NSArray *childrenFiles = [fileManager subpathsAtPath:path];
        for (NSString *fileName in childrenFiles) {
            // 拼接路径
            NSString *absolutePath = [path stringByAppendingPathComponent:fileName];
            // 将文件删除
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
}

@end
