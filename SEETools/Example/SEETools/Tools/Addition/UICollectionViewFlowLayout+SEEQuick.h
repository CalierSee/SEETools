//
//  UICollectionViewFlowLayout+SEEQuick.h
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/12.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionViewFlowLayout (SEEQuick)
///  创建flowlayout对象
///
///  @param minimumLineSpacing      行间距
///  @param minimumInteritemSpacing item间距
///  @param scrollDirection         滚动方向
///  @param cla         自定义FlowLayout类
+ (instancetype)see_createWithClassName:(Class)cla minimumLineSpacing:(CGFloat)minimumLineSpacing minimumInteritemSpacing:(CGFloat)minimumInteritemSpacing scrollDirection:(UICollectionViewScrollDirection)scrollDirection;
@end
