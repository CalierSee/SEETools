//
//  UILabel+SEEQuick.h
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/7.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (SEEQuick)
///  创建Label对象
///
///  @param frame frame
///  @param color 文字颜色
///  @param size  文字大小
///  @param alignment 对齐方式
///  @param text  显示文字
+ (instancetype)see_createWithFrame:(CGRect)frame textColor:(UIColor *)color fontSize:(CGFloat)size textAlignment:(NSTextAlignment)alignment text:(NSString *)text;

///  创建Label对象
///
///  @param frame frame
///  @param color 文字颜色
///  @param size  文字大小
///  @param text  文字内容
+ (instancetype)see_createWithFrame:(CGRect)frame textColor:(UIColor *)color fontSize:(CGFloat)size text:(NSString *)text;

///  sizeToFit label
///
///  @param color 文字颜色
///  @param size  字体大小
///  @param text  文字内容
+ (instancetype)see_createWithSizeToFitTextColor:(UIColor *)color fontSize:(CGFloat)size text:(NSString *)text;

///  创建消息提示label
///
///  @param frame   frame
///  @param message 消息内容
+(instancetype)see_messageLabelWithFrame:(CGRect)frame message:(NSString *)message;

///  根据label内容宽度设置高度
- (void)see_automaticInCharWrapping;
@end
