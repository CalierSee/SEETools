//
//  CALayer+See.h
//  SEETools
//
//  Created by 景彦铭 on 2017/8/31.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (See)

/**
 设置圆角
 */
@property(nonatomic,copy,readonly)CALayer *(^sCornerRadius)(CGFloat radius);

/**
 设置阴影
 */
@property(nonatomic,copy,readonly)CALayer * (^sShadow)(CGFloat opacity, UIColor * _Nullable color, CGPathRef _Nullable path, CGFloat radius, CGSize offset);



@end

NS_ASSUME_NONNULL_END
