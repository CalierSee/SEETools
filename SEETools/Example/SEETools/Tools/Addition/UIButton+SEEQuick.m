//
//  UIButton+SEEQuick.m
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/7.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "UIButton+SEEQuick.h"
#import "NSAttributedString+SEEQuick.h"
@implementation UIButton (SEEQuick)

+ (instancetype)see_buttonWithImage:(id)image imageSize:(CGSize)size title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)fontSize lineSpace:(CGFloat)space {
    UIButton * button = [[UIButton alloc]init];
    [button see_buttonWithImage:image imageSize:size title:title titleColor:color fontSize:fontSize lineSpace:space];
    return button;
}
    
- (void)see_buttonWithImage:(id)image imageSize:(CGSize)size title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)fontSize lineSpace:(CGFloat)space {
    //设置属性文字
    [self setAttributedTitle:[NSAttributedString see_attributedStringWithImage:([image isKindOfClass:[UIImage class]] ? image : [UIImage imageNamed:image]) imageSize:size title:title titleColor:color fontSize:fontSize lineSpace:space] forState:UIControlStateNormal];
    //设置自动换行和居中显示
    self.titleLabel.numberOfLines = 0;
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
}

+ (instancetype)see_buttonWithTitle:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size target:(id)target selector:(SEL)selector event:(UIControlEvents)even {
    return [self see_buttonWithTitle:title titleColor:color fontSize:size backgroundColor:nil target:target selector:selector event:even];
}

+ (instancetype)see_buttonWithTitle:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size backgroundColor:(UIColor *)bgColor target:(id)target selector:(SEL)selector event:(UIControlEvents)even {
    return [self see_buttonWithFrame:CGRectZero title:title titleColor:color fontSize:size backgroundColor:bgColor backgroundImage:nil image:nil selectedImage:nil target:target selector:selector event:even sizeToFit:YES];
}

+ (instancetype)see_buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size target:(id)target selector:(SEL)selector event:(UIControlEvents)event {
    return [self see_buttonWithFrame:frame title:title titleColor:color fontSize:size backgroundColor:nil target:target selector:selector event:event];
}

+ (instancetype)see_buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size backgroundColor:(UIColor *)bgColor target:(id)target selector:(SEL)selector event:(UIControlEvents)event {
    return [self see_buttonWithFrame:frame title:title titleColor:color fontSize:size backgroundColor:bgColor backgroundImage:nil image:nil selectedImage:nil target:target selector:selector event:event sizeToFit:NO];
}

+ (instancetype)see_buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size backgroundColor:(UIColor *)bgColor backgroundImage:(id)bgimage image:(id)image selectedImage:(id)selectedImage target:(id)target selector:(SEL)selector event:(UIControlEvents)event sizeToFit:(BOOL)fit {
    UIButton * button = [[UIButton alloc]initWithFrame:frame];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    if(size) button.titleLabel.font = [UIFont systemFontOfSize:size];
    button.backgroundColor = bgColor;
    [button setBackgroundImage:[bgimage isKindOfClass:[UIImage class]] ? bgimage : [UIImage imageNamed:bgimage] forState:UIControlStateNormal];
    [button setImage:[image isKindOfClass:[UIImage class]] ? image : [UIImage imageNamed:image] forState:UIControlStateNormal];
    [button setImage:[selectedImage isKindOfClass:[UIImage class]] ? selectedImage : [UIImage imageNamed:selectedImage] forState:UIControlStateSelected];
    [button addTarget:target action:selector forControlEvents:event];
    if(fit) [button sizeToFit];
    return button;
}

+ (instancetype)see_buttonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size backgroundImage:(id)bgimage target:(id)target selector:(SEL)selector event:(UIControlEvents)event {
    return [self see_buttonWithFrame:frame title:title titleColor:color fontSize:size backgroundColor:nil backgroundImage:bgimage image:nil selectedImage:nil target:target selector:selector event:event sizeToFit:NO];
}

+ (instancetype)see_buttonWithFrame:(CGRect)frame backgroundImage:(id)bgimage target:(id)target selector:(SEL)selector event:(UIControlEvents)event {
    return [self see_buttonWithFrame:frame title:nil titleColor:nil fontSize:0 backgroundImage:bgimage target:target selector:selector event:event];
}

+ (instancetype)see_buttonWithTitle:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)size backgroundImage:(id)bgimage target:(id)target selector:(SEL)selector event:(UIControlEvents)event {
    return [self see_buttonWithFrame:CGRectZero title:title titleColor:color fontSize:size backgroundColor:nil backgroundImage:bgimage image:nil selectedImage:nil target:target selector:selector event:event sizeToFit:YES];
}

+ (instancetype)see_buttonWithBackgroundImage:(id)bgimage target:(id)target selector:(SEL)selector event:(UIControlEvents)event {
    return [self see_buttonWithTitle:nil titleColor:nil fontSize:0 backgroundImage:bgimage target:target selector:selector event:event];
}

+ (instancetype)see_buttonWithImage:(id)image selectedImage:(id)selectedImage target:(id)target selector:(SEL)selector event:(UIControlEvents)event {
    return [self see_buttonWithFrame:CGRectZero title:nil titleColor:nil fontSize:0 backgroundColor:nil backgroundImage:nil image:image selectedImage:selectedImage target:target selector:selector event:event sizeToFit:YES];
}

+ (instancetype)see_buttonWithImage:(id)image target:(id)target selector:(SEL)selector event:(UIControlEvents)event {
    return [self see_buttonWithImage:image selectedImage:nil target:target selector:selector event:event];
}



@end
