//
//  SEETagViewController.h
//  SEETools
//
//  Created by 景彦铭 on 2017/9/4.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEETagView.h"
NS_ASSUME_NONNULL_BEGIN

@interface SEETagViewController : UIViewController

/**
 内容滚动视图
 */
@property(nonatomic,strong,readonly)UIScrollView * scrollView;

/**
 使用控制器创建

 @param vcs 控制器
 */
- (instancetype)initWithViewControllers:(NSArray <UIViewController *> *)vcs;

/**
 使用控制器创建

 @param vcs 控制器
 @param titles 字符串或者属性字符
 @return 控制器
 */
- (instancetype)initWithViewControllers:(NSArray <UIViewController *> *)vcs titles:(nullable NSArray *)titles NS_DESIGNATED_INITIALIZER;

/**
 使用class创建

 @param classes classes
 */
- (instancetype)initWithClasses:(NSArray <Class> *)classes;

/**
 使用class创建
 
 @param classes classes
 @param titles 字符串或者属性字符
 @return 控制器
 */
- (instancetype)initWithClasses:(NSArray <Class> *)classes titles:(nullable NSArray *)titles;


//=============  UI  =============//
- (void)configureHeaderHeight:(CGFloat)height;
- (void)configureHeaderAnimationMode:(TageViewAnimationMode)mode;
- (void)selectAtIndex:(NSInteger)index;



- (instancetype)init NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
- (instancetype)initWithNibName:(nullable NSString *)nibNameOrNil bundle:(nullable NSBundle *)nibBundleOrNil NS_UNAVAILABLE;
@end

NS_ASSUME_NONNULL_END
