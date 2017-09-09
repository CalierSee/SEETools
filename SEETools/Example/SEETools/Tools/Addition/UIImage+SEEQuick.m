//
//  UIImage+SEEQuick.m
//  画板Max
//
//  Created by 景彦铭 on 2016/10/1.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "UIImage+SEEQuick.h"

@implementation UIImage (SEEQuick)

- (UIColor *)colorAtPixel:(CGPoint)point {
    // Cancel if point is outside image coordinates
    if (!CGRectContainsPoint(CGRectMake(0.0f, 0.0f, self.size.width, self.size.height), point)) {
        return nil;
    }
    NSInteger pointX = trunc(point.x);
    NSInteger pointY = trunc(point.y);
    CGImageRef cgImage = self.CGImage;
    NSUInteger width = self.size.width;
    NSUInteger height = self.size.height;
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    int bytesPerPixel = 4;
    int bytesPerRow = bytesPerPixel * 1;
    NSUInteger bitsPerComponent = 8;
    unsigned char pixelData[4] = { 0, 0, 0, 0 };
    CGContextRef context = CGBitmapContextCreate(pixelData,1,1,bitsPerComponent,bytesPerRow,colorSpace,kCGImageAlphaPremultipliedLast | kCGBitmapByteOrder32Big);
    CGColorSpaceRelease(colorSpace);
    CGContextSetBlendMode(context, kCGBlendModeCopy);
    
    // Draw the pixel we are interested in onto the bitmap context
    CGContextTranslateCTM(context, -pointX, pointY-(CGFloat)height);
    CGContextDrawImage(context, CGRectMake(0.0f, 0.0f, (CGFloat)width, (CGFloat)height), cgImage);
    CGContextRelease(context);
    
    // Convert color values [0..255] to floats [0.0..1.0]
    CGFloat red   = (CGFloat)pixelData[0] / 255.0f;
    CGFloat green = (CGFloat)pixelData[1] / 255.0f;
    CGFloat blue  = (CGFloat)pixelData[2] / 255.0f;
    CGFloat alpha = (CGFloat)pixelData[3] / 255.0f;
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (instancetype)see_blankImageWithSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [UIColor colorWithRed:0 green:0 blue:0 alpha:0].CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    return image;
}

+ (instancetype)see_imageWithSize:(CGSize)size color:(UIColor *)color {
    UIGraphicsBeginImageContext(size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, color.CGColor);
    CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    return image;
}

- (void)see_cutImageAsyncWithRadius:(CGFloat)radius imageSize:(CGSize)size complete:(void(^)(UIImage * image))complete {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        UIImage * resultImage = [self see_cutImageWithRadius:radius imageSize:size];
        dispatch_async(dispatch_get_main_queue(), ^{
            complete(resultImage);
        });
    });
}

- (UIImage *)see_cutImageWithRadius:(CGFloat)radius imageSize:(CGSize)size {
    UIImage * resultImage = self;
    CGRect drawRect = CGRectZero;
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        size = self.size;
        drawRect = CGRectMake(0, 0, size.width, size.height);
    }
    else {
        CGFloat originalScale = self.size.width / self.size.height;
        CGFloat scale = size.width / size.height;
        if (originalScale == scale) {
            drawRect = CGRectMake(0, 0, size.width, size.height);
        }
        else if (originalScale > scale) { //self.size.width > size.width
            CGFloat width = originalScale * size.height;
            drawRect = CGRectMake(-(width - size.width) / 2, 0, width, size.height);
        }
        else if (originalScale < scale) { //self.size.height > size.height
            CGFloat height = size.width / originalScale;
            drawRect = CGRectMake(0, -(height - size.height) / 2, size.width, height);
        }
    }
    UIGraphicsBeginImageContextWithOptions(size, false, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGMutablePathRef path = CGPathCreateMutable();
    UIBezierPath * pathB = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, size.width, size.height) cornerRadius:radius];
    CGPathAddPath(path, NULL, pathB.CGPath);
    CGContextAddPath(context, path);
    CGContextClip(context);
    [self drawInRect:drawRect];
    resultImage = UIGraphicsGetImageFromCurrentImageContext();
    CGPathRelease(path);
    UIGraphicsEndImageContext();
    return resultImage;
}

- (UIImage *)see_imageWithSize:(CGSize)size {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    [self drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage * resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultImage;
}

+ (instancetype)see_screenShot {
    //开启屏幕大小的上下文
    UIGraphicsBeginImageContextWithOptions([UIScreen mainScreen].bounds.size, NO, [UIScreen mainScreen].scale);
    //将window上的内容绘制到上下文
    [[UIApplication sharedApplication].keyWindow drawViewHierarchyInRect:[UIApplication sharedApplication].keyWindow.bounds afterScreenUpdates:NO];
    
    //获取图片
    
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    
    //关闭上下文
    UIGraphicsEndImageContext();
    
    return image;
}

+ (instancetype)see_gradientImageWithSize:(CGSize)size startPoint:(CGPoint)start endPoint:(CGPoint)end startColor:(CGColorRef)startColor endColor:(CGColorRef)endColor {
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGFloat locations[] = {0.0,1.0};
    NSArray * colors = @[(__bridge id)startColor,(__bridge id)endColor];
    CGGradientRef gradient = CGGradientCreateWithColors(colorSpace, (__bridge CFArrayRef)colors, locations);
    CGContextDrawLinearGradient(context, gradient, start, end, 0);
    CGGradientRelease(gradient);
    CGColorSpaceRelease(colorSpace);
    UIImage * image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}


@end
