//
//  UIImageView+SEEQuick.m
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/7.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "UIImageView+SEEQuick.h"

@implementation UIImageView (SEEQuick)
+ (instancetype)see_animateWithFrame:(CGRect)frame animateDuration:(NSTimeInterval)duration repeatCount:(NSInteger)repeatCount imagesNameFormat:(NSString *)format startIndex:(NSInteger)index count:(NSInteger)count {
    UIImageView * image = [[UIImageView alloc]initWithFrame:frame];
    NSMutableArray * arr = [NSMutableArray array];
    UIImage * images = [[UIImage alloc]init];
    for (NSInteger i = index; i < count+index; i++) {
        images = [UIImage imageNamed:[NSString stringWithFormat:format,i]];
        [arr addObject:images];
    }
    image.animationImages = arr;
    image.animationDuration = duration;
    image.animationRepeatCount = repeatCount;
    [image startAnimating];
    return image;
}

+ (instancetype)see_createWithFrame:(CGRect)frame image:(id)image contentMode:(UIViewContentMode)contentMode {
    UIImageView * imageView = [[UIImageView alloc]initWithFrame:frame];
    imageView.image = [image isKindOfClass:[UIImage class]] ? image : [UIImage imageNamed:image];
    if(contentMode){
        imageView.contentMode = contentMode;
    }
    return imageView;
}
    
+ (instancetype)see_createWithImage:(id)image contentMode:(UIViewContentMode)contentMode {
    return [self see_createWithFrame:CGRectZero image:image contentMode:contentMode];
}
@end
