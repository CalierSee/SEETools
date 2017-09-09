//
//  UICollectionView+SEEQuick.m
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/12.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "UICollectionView+SEEQuick.h"

@implementation UICollectionView (SEEQuick)

+ (instancetype)see_createWithFrame:(CGRect)frame registerClass:(Class)class cellReuseIdentifier:(NSString *)identifier layout:(UICollectionViewLayout *)layout delegate:(id)delegate dataSource:(id)dataSource {
    //创建collectionView控件
    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    //注册Cell
    [collectionView registerClass:class forCellWithReuseIdentifier:identifier];
    //设置代理
    collectionView.delegate = delegate;
    collectionView.dataSource = dataSource;
    collectionView.backgroundColor = [UIColor whiteColor];
    return collectionView;
}

+ (instancetype)see_createWithFrame:(CGRect)frame registerNib:(UINib *)cellNib cellReuseIdentifier:(NSString *)identifier layout:(UICollectionViewLayout *)layout delegate:(id)delegate dataSource:(id)dataSource{
    //创建collectionView控件
    UICollectionView * collectionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:layout];
    //注册Cell
    [collectionView registerNib:cellNib forCellWithReuseIdentifier:identifier];
    //设置代理
    collectionView.delegate = delegate;
    collectionView.dataSource = dataSource;
    collectionView.backgroundColor = [UIColor whiteColor];
    return collectionView;
}

@end
