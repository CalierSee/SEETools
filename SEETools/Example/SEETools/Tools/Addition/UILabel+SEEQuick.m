//
//  UILabel+SEEQuick.m
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/7.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "UILabel+SEEQuick.h"
#import "NSString+SEEQuick.h"
@implementation UILabel (SEEQuick)
+ (instancetype)see_createWithFrame:(CGRect)frame textColor:(UIColor *)color fontSize:(CGFloat)size textAlignment:(NSTextAlignment)alignment text:(NSString *)text {
    UILabel * label = [[UILabel alloc]initWithFrame:frame];
    [label setText:text];
    [label setTextColor:color];
    [label setFont:[UIFont systemFontOfSize:size]];
    label.textAlignment = alignment;
    return label;
}

+ (instancetype)see_createWithFrame:(CGRect)frame textColor:(UIColor *)color fontSize:(CGFloat)size text:(NSString *)text{
    return [self see_createWithFrame:frame textColor:color fontSize:size textAlignment:NSTextAlignmentLeft text:text];
}

+ (instancetype)see_createWithSizeToFitTextColor:(UIColor *)color fontSize:(CGFloat)size text:(NSString *)text{
    UILabel * label = [[UILabel alloc]init];
    label.text = text;
    label.textColor = color;
    [label setFont:[UIFont systemFontOfSize:size]];
    [label sizeToFit];
    return label;
}

+(instancetype)see_messageLabelWithFrame:(CGRect)frame message:(NSString *)message {
    UILabel * label = [[UILabel alloc]initWithFrame:frame];
    [label setText:message];
    [label setTextColor:[UIColor whiteColor]];
    [label setBackgroundColor:[UIColor blackColor]];
    label.layer.cornerRadius = 10;
    label.layer.masksToBounds = YES;
    label.alpha = 0.8;
    label.textAlignment = NSTextAlignmentCenter;
    return label;
}

- (void)see_automaticInCharWrapping {
    self.numberOfLines = 0;
    self.lineBreakMode = NSLineBreakByCharWrapping;
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, [self.text see_heightWithWidth:self.frame.size.width fontSize:self.font.pointSize]);
    
}
@end
