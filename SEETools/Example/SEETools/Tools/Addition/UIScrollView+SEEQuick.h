//
//  UIScrollView+SEEQuick.h
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/7.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (SEEQuick)
///  创建UIScrollView
///
///  @param frame      frame
///  @param bounces    弹簧效果
///  @param vertical   是否显示垂直滚动条
///  @param horizontal 是否显示水平滚动条
///  @param page       是否分页
///  @param delegate   代理
///
///  @return UIScrollView
+ (instancetype)see_createWithFrame:(CGRect)frame bounces:(BOOL)bounces verticalScrollIndicator:(BOOL)vertical horizontalScrollIndicator:(BOOL)horizontal pageEnable:(BOOL)page delegate:(id)delegate;
@end
