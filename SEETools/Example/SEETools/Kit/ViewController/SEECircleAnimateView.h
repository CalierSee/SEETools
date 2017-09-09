//
//  SEECircleAnimateView.h
//  SEETools
//
//  Created by 景彦铭 on 2017/9/6.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, CircleAnimateViewDirection) {
    CircleAnimateViewDirectionCircle,
    CircleAnimateViewDirectionPoint,
};

@interface SEECircleAnimateView : UIView

/**
 圆环线宽
 */
@property (nonatomic,assign)CGFloat borderWidth;

/**
 圆环颜色
 */
@property (nonatomic,assign)UIColor * borderColor;




/**
 圆环->圆点 或者  圆点->圆环   一次的时间
 */
@property (nonatomic,assign)NSTimeInterval singleCircleTime;

/**
 每两次圆环与圆点切换间隔时间
 */
@property (nonatomic,assign)NSTimeInterval singleWhiteTime;

/**
 一次完整动画时长
 */
@property (nonatomic,assign)NSTimeInterval duration;


- (void)stopAnimation;
- (void)startAnimation;
@end
