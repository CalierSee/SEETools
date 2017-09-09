//
//  SEELoadingView.h
//  SEETools
//
//  Created by 景彦铭 on 2017/7/3.
//  Copyright © 2017年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>
//单次加载最大数据条数
#define SEELoadingViewMaxCount 20

typedef NS_ENUM(NSInteger,SEELoadingViewStatus) {
    SEELoadingViewStatusNormal,  //普通
    SEELoadingViewStatusLoading, //正在加载
    SEELoadingViewStatusDisable  //已经加载所有内容
};

@interface SEELoadingView : UIView

@property (nonatomic,assign,readonly)SEELoadingViewStatus status;

+ (instancetype)loadingView;


@property (nonatomic,copy)void(^loadingBlock)(void(^completeHanlder)(NSInteger count));

/**
 开始加载动画
 */
- (void)loading;

/**
 停止加载动画
 
 @param count 加载数据条数
 当数据条数小于CSSBaseTableViewControllerMaxLoadCount时说明已经加载完后台中的所有数据，此时下拉更多控件会被禁用。如果要再次启用使用 reset 重置控件状态
 */
- (void)stopLoadingWithResultCount:(NSInteger)count;

/**
 重置控件状态
 */
- (void)reset;


@end
