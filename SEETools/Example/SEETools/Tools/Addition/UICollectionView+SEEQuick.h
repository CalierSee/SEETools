//
//  UICollectionView+SEEQuick.h
//  SEEQuick
//
//  Created by 景彦铭 on 16/9/12.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (SEEQuick)
///  创建collectionView CLASScell
///
///  @param frame      frame
///  @param cellClass      cell 类
///  @param identifier 重用标识
///  @param layout     布局对象
///  @param delegate   代理
///  @param dataSource 数据源
+ (instancetype)see_createWithFrame:(CGRect)frame registerClass:(Class)cellClass cellReuseIdentifier:(NSString *)identifier layout:(UICollectionViewLayout *)layout delegate:(id)delegate dataSource:(id)dataSource;

///  创建collectionView NIBcell
///
///  @param frame      frame
///  @param cellNib    nib
///  @param identifier 重用标识
///  @param layout     布局对象
///  @param delegate   代理
///  @param dataSource 数据源
+ (instancetype)see_createWithFrame:(CGRect)frame registerNib:(UINib *)cellNib cellReuseIdentifier:(NSString *)identifier layout:(UICollectionViewLayout *)layout delegate:(id)delegate dataSource:(id)dataSource;
@end
