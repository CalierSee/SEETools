//
//  NSAttributedString+SEEQuick.h
//  支付宝
//
//  Created by 景彦铭 on 16/9/16.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (SEEQuick)

///  返回一个图文混合文字（制作图文混合Button）
///
///  @param image  图片
///  @param size   图片大小
///  @param title 字符串
///  @param color   文字颜色
///  @param fontSize  字体大小
///  @param space  行间距
+ (instancetype)see_attributedStringWithImage:(UIImage *)image imageSize:(CGSize)size title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)fontSize lineSpace:(CGFloat)space;
@end
