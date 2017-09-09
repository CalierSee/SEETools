//
//  UITableView+SEEQuick.m
//  Moment
//
//  Created by 景彦铭 on 16/9/11.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import "UITableView+SEEQuick.h"
#import <objc/runtime.h>
@implementation UITableView (SEEQuick)
//
//+ (void)load {
//    Method m1 = class_getInstanceMethod([self class], @selector(setContentOffset:));
//    Method m2 = class_getInstanceMethod([self class], @selector(see_setContentOffset:));
//    method_exchangeImplementations(m1, m2);
//}

+ (instancetype)see_createWithFrame:(CGRect)frame style:(UITableViewStyle)style registerClass:(Class)class reuseIdentifier:(NSString *)reuseID delegate:(id)delegate dataSource:(id)dataSource {
    UITableView * tableV = [[UITableView alloc]initWithFrame:frame style:style];
    [tableV registerClass:class forCellReuseIdentifier:reuseID];
    tableV.delegate = delegate;
    tableV.dataSource = dataSource;
    return tableV;
}

+ (instancetype)see_createWithFrame:(CGRect)frame style:(UITableViewStyle)style registerNib:(UINib *)nib reuseIdentifier:(NSString *)reuseID delegate:(id)delegate dataSource:(id)dataSource {
    UITableView * tableV = [[UITableView alloc]initWithFrame:frame style:style];
    [tableV registerNib:nib forCellReuseIdentifier:reuseID];
    tableV.delegate = delegate;
    tableV.dataSource = dataSource;
    return tableV;
}

//- (void)see_setContentOffset:(CGPoint)offset {
//    [self see_setContentOffset:offset];
//    if (offset.y < -41) {
//        
//    }
//}

@end
