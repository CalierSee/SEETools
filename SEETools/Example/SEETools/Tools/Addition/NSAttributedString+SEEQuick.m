//
//  NSAttributedString+SEEQuick.m
//  支付宝
//
//  Created by 景彦铭 on 16/9/16.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "NSAttributedString+SEEQuick.h"

@implementation NSAttributedString (SEEQuick)

+ (instancetype)see_attributedStringWithImage:(UIImage *)image imageSize:(CGSize)size title:(NSString *)title titleColor:(UIColor *)color fontSize:(CGFloat)fontSize lineSpace:(CGFloat)space {
    
    //创建文本附件
    NSTextAttachment * atta = [[NSTextAttachment alloc]init];
    //设置图片
    atta.image = image;
    //设置图片大小
    atta.bounds = CGRectMake(0, 0, size.width, size.height);
    NSAttributedString * att = [NSAttributedString attributedStringWithAttachment:atta];
    //追加空行
    NSMutableAttributedString * attM = [[NSMutableAttributedString alloc]initWithAttributedString:att];
    NSAttributedString * str = [[NSAttributedString alloc]initWithString:@"\n " attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:space]}];
    [attM appendAttributedString:str];
    
    //追加文字
    NSAttributedString * titles = [[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"\n%@",title] attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSForegroundColorAttributeName:color}];
    [attM appendAttributedString:titles];
    
    return attM.copy;
}

@end
