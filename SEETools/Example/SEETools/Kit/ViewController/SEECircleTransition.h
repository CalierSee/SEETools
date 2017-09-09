//
//  SEECircleTransition.h
//  SEECircleTransition
//
//  Created by 景彦铭 on 2016/12/16.
//  Copyright © 2016年 景彦铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SEECircleTransition : NSObject<UIViewControllerTransitioningDelegate>

/**
 起始中心点
 */
@property (nonatomic,assign)CGPoint centerPoint;

@end
