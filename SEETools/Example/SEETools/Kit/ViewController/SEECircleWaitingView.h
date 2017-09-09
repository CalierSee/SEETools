//
//  SEECircleProgressView.h
//  progressAnimation
//
//  Created by 景彦铭 on 2017/1/24.
//  Copyright © 2017年 景彦铭. All rights reserved.
//
/*
 圆形进度视图
 功能：
 1.显示进度
 2.loading 动画
 
 
 
 */

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol SEECircleWaitingViewDelegate ;

@interface SEECircleWaitingView : UIView

/**
 指定构造方法

 @param frame frame
 @param borderWidth 圆环边框宽度
 @param borderColor 圆环边框颜色
 */
- (instancetype)initWithFrame:(CGRect)frame borderWidth:(CGFloat)borderWidth borderColor:(nullable UIColor *)borderColor  NS_DESIGNATED_INITIALIZER;

- (void)setBorderColor:(nullable UIColor *)color; //default black color

/**
 loading动画
 */
- (void)startAutoAnimation;
- (void)stopAutoAnimation;

/**
 进度
 */
- (void)setProgress:(CGFloat)progress;

@property (nonatomic,assign)NSTimeInterval duration; // default 4s
@property (nonatomic,assign)CGFloat proportion; // (0,1] default 0.15

@property(nonatomic,weak,nullable)id <SEECircleWaitingViewDelegate> waitingDelegate;


- (instancetype)initWithFrame:(CGRect)frame NS_UNAVAILABLE;
- (instancetype)initWithCoder:(NSCoder *)aDecoder NS_UNAVAILABLE;
@end

@protocol SEECircleWaitingViewDelegate <NSObject>

@optional

/**
 圆环 -> 圆点
 */
- (void)circleWaitingViewDidBecomeCircle:(SEECircleWaitingView *)view;

/**
 圆点 -> 圆环
 */
- (void)circleWaitingViewDidBecomePoint:(SEECircleWaitingView *)view;

@end

NS_ASSUME_NONNULL_END
