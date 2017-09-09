//
//  UIButton+SEEQuick.h
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/7.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (SEEQuick)

///  为一个button对象设置图文混合文字
///
///  @param image    图片
///  @param size    图片大小
///  @param title   文字
///  @param color   文字颜色
///  @param fontSize 文字大小
///  @param space    行间距
- (void)see_buttonWithImage:(id)image imageSize:(CGSize)size title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)fontSize lineSpace:(CGFloat)space;

/**
 title color fintSize
 */
+ (instancetype)see_buttonWithTitle:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size target:(id)target selector:(SEL)selector event:(UIControlEvents)even;
    

    
/**
 frame title color fontSize
 */
+ (instancetype)see_buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size target:(id)target selector:(SEL)selector event:(UIControlEvents)event;
    
/**
 title color fontSize bgColor
 */
+ (instancetype)see_buttonWithTitle:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size backgroundColor:(UIColor *)bgColor target:(id)target selector:(SEL)selector event:(UIControlEvents)even;

/**
 frame title color fontSize bgColor
 */
+ (instancetype)see_buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size backgroundColor:(UIColor *)bgColor target:(id)target selector:(SEL)selector event:(UIControlEvents)event;

/**
 frame title color fontSize bgColor bgImage image selectedImage
 */
+ (instancetype)see_buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size backgroundColor:(UIColor *)bgColor backgroundImage:(id)bgimage image:(id)image selectedImage:(id)selectedImage target:(id)target selector:(SEL)selector event:(UIControlEvents)event sizeToFit:(BOOL)fit;

/**
 frame bgImage
*/
+ (instancetype)see_buttonWithFrame:(CGRect)frame backgroundImage:(id)bgimage target:(id)target selector:(SEL)selector event:(UIControlEvents)event;
    
/**
 frame title color fontSize bgImage
*/
+ (instancetype)see_buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size backgroundImage:(id)bgimage target:(id)target selector:(SEL)selector event:(UIControlEvents)event;
    
/**
 title color fontSize bgImage
*/
+ (instancetype)see_buttonWithTitle:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size backgroundImage:(id)bgimage target:(id)target selector:(SEL)selector event:(UIControlEvents)event;

/**
 bgImage
*/
+ (instancetype)see_buttonWithBackgroundImage:(id)bgimage target:(id)target selector:(SEL)selector event:(UIControlEvents)event;

/**
 image selectedImage
 */
+ (instancetype)see_buttonWithImage:(id)image selectedImage:(id)selectedImage target:(id)target selector:(SEL)selector event:(UIControlEvents)event;

/**
 image
 */
+ (instancetype)see_buttonWithImage:(id)image target:(id)target selector:(SEL)selector event:(UIControlEvents)event;
@end
