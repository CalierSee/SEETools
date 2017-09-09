//
//  UIImageView+SEEQuick.h
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/7.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SEEQuick)
///  创建一个帧动画
///
///  @param frame     frame
///  @param duration  持续事件
///  @param count     帧数
///  @param format    图片名称格式
///  @param index     第一张图片编号
+ (instancetype)see_animateWithFrame:(CGRect)frame animateDuration:(NSTimeInterval)duration repeatCount:(NSInteger)repeatCount imagesNameFormat:(NSString *)format startIndex:(NSInteger)index count:(NSInteger)count;

///  根据frame创建UIImageView
///
///  @param frame       frame
///  @param image       图片
///  @param contentMode 如果给0默认为默认模式
+ (instancetype)see_createWithFrame:(CGRect)frame image:(UIImage *)image contentMode:(UIViewContentMode)contentMode;
    
+ (instancetype)see_createWithImage:(id)image contentMode:(UIViewContentMode)contentMode;
@end
