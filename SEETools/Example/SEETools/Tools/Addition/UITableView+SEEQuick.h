//
//  UITableView+SEEQuick.h
//  Moment
//
//  Created by 景彦铭 on 16/9/11.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (SEEQuick)

///  快速创建tableView 使用class注册cell
///
///  @param frame      frame
///  @param style      类型
///  @param class      cell 类
///  @param reuseID    cell 重用ID
///  @param delegate   代理
///  @param dataSource 数据源
+ (instancetype)see_createWithFrame:(CGRect)frame style:(UITableViewStyle)style registerClass:(Class)class reuseIdentifier:(NSString *)reuseID delegate:(id)delegate dataSource:(id)dataSource;

///  快速创建tableView 使用Nib注册cell
///
///  @param frame      frame
///  @param style      类型
///  @param nib        cell NIB
///  @param reuseID    cell 重用ID
///  @param delegate   代理
///  @param dataSource 数据源
+ (instancetype)see_createWithFrame:(CGRect)frame style:(UITableViewStyle)style registerNib:(UINib *)nib reuseIdentifier:(NSString *)reuseID delegate:(id)delegate dataSource:(id)dataSource;
@end
