
//
//  UICollectionViewFlowLayout+SEEQuick.m
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/12.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "UICollectionViewFlowLayout+SEEQuick.h"

@implementation UICollectionViewFlowLayout (SEEQuick)
+ (instancetype)see_createWithClassName:(Class)cla minimumLineSpacing:(CGFloat)minimumLineSpacing minimumInteritemSpacing:(CGFloat)minimumInteritemSpacing scrollDirection:(UICollectionViewScrollDirection)scrollDirection {
    UICollectionViewFlowLayout * layout = [[cla alloc]init];
    layout.minimumLineSpacing = minimumLineSpacing;
    layout.minimumInteritemSpacing = minimumInteritemSpacing;
    layout.scrollDirection = scrollDirection;
    return layout;
}
@end
