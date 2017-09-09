//
//  UIVisualEffectView+SEEQuick.h
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/7.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIVisualEffectView (SEEQuick)
///  快速创建蒙版
///
///  @param frame frame
///
///  @return 蒙版对象
+ (instancetype)see_createWithFrame:(CGRect)frame;
@end
