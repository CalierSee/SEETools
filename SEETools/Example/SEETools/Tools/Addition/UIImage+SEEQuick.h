//
//  UIImage+SEEQuick.h
//  画板Max
//
//  Created by 景彦铭 on 2016/10/1.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (SEEQuick)

/**
 得到指定点的颜色

 @param point 点
 */
- (UIColor *)colorAtPixel:(CGPoint)point;

/**
 渐变色图片
 */
+ (instancetype)see_gradientImageWithSize:(CGSize)size startPoint:(CGPoint)start endPoint:(CGPoint)end startColor:(CGColorRef)startColor endColor:(CGColorRef)endColor;

/**
 返回一张透明图片

 @param size 图片大小
 */
+ (instancetype)see_blankImageWithSize:(CGSize)size;

+ (instancetype)see_imageWithSize:(CGSize)size color:(UIColor *)color;

//获得屏幕截图
+ (instancetype)see_screenShot;

/**
 切图  如果图片尺寸和目标尺寸比例不同则按照比例缩放图片后裁切 AspectFill

 @param radius 半径
 @param size 目标图片大小
 */
- (nullable UIImage *)see_cutImageWithRadius:(CGFloat)radius imageSize:(CGSize)size;
- (void)see_cutImageAsyncWithRadius:(CGFloat)radius imageSize:(CGSize)size complete:(void(^)(UIImage * image))complete;

- (UIImage *)see_imageWithSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
