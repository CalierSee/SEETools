//
//  SEECircleAnimateView.m
//  SEETools
//
//  Created by 景彦铭 on 2017/9/6.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import "SEECircleAnimateView.h"

#define SEEFPS 60


@interface SEECircleAnimateView ()

/**
 开始角度
 */
@property (nonatomic,assign)CGFloat startAngle;

/**
 结束角度
 */
@property (nonatomic,assign)CGFloat endAngle;

/**
 是否停止
 */
@property (nonatomic,assign,getter=isStop)BOOL stop;

@property (nonatomic,assign)CGFloat singleFPSAngle;

@property (nonatomic,assign) CircleAnimateViewDirection direction;

@end

@implementation SEECircleAnimateView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.startAngle = -M_PI_2;
        self.singleWhiteTime = 0.5;
        self.singleCircleTime = 20;
        self.duration = 5;
        self.borderWidth = 4;
        self.borderColor = [UIColor blackColor];
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddArc(context, rect.size.width / 2, rect.size.height / 2, rect.size.width > rect.size.height ? rect.size.height / 2 - self.borderWidth / 2  : rect.size.width / 2 - self.borderWidth / 2, _startAngle, _endAngle, 0);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetLineJoin(context, kCGLineJoinRound);
    CGContextSetLineWidth(context, self.borderWidth);
    CGContextSetStrokeColorWithColor(context, self.borderColor.CGColor);
    CGContextStrokePath(context);
}

#pragma mark - public method
- (void)startAnimation {
    self.stop = NO;
    _endAngle += self.initMarginAngle;
    self.direction = CircleAnimateViewDirectionCircle;
    [self calculateAngle];
    [self see_addBasicAnimation];
}


- (void)stopAnimation {
    self.stop = YES;
    [self.layer removeAnimationForKey:@"basicAnimation"];
}

#pragma mark - private method
- (void)see_addBasicAnimation {
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.fromValue = @(0);
    animation.toValue = @(2 * M_PI);
    animation.duration = self.duration;
    animation.fillMode = kCAFillModeForwards;
    animation.removedOnCompletion = NO;
    animation.repeatCount = MAXFLOAT;
    
    [self.layer addAnimation:animation forKey:@"basicAnimation"];
}

- (void)calculateAngle {
    if (!self.stop) {
        if ((ABS(self.endAngle - self.startAngle) == self.initMarginAngle && self.direction == CircleAnimateViewDirectionPoint) || (ABS(self.endAngle - self.startAngle) >= M_PI * 1.7 && self.direction == CircleAnimateViewDirectionCircle)) {
            self.direction = !self.direction;
            _startAngle += _endAngle;
            _endAngle = _startAngle - _endAngle;
            _startAngle = _startAngle - _endAngle;
            [self performSelector:@selector(calculateAngle) withObject:nil afterDelay:self.singleWhiteTime inModes:@[NSRunLoopCommonModes]];
        }
        else {
            _endAngle += self.singleMarginAngle;
            [self performSelector:@selector(calculateAngle) withObject:nil afterDelay:1 / SEEFPS inModes:@[NSRunLoopCommonModes]];
        }
    }
    else {
        self.startAngle = -M_PI_2;
        self.endAngle = -M_PI_2;
    }
    [self setNeedsDisplay];
}

#pragma mark - getter & setter
//起始圆点角度
- (CGFloat)initMarginAngle {
    return (self.borderWidth) / (self.bounds.size.width > self.bounds.size.height ? self.bounds.size.height / 2 - self.borderWidth / 2 : self.bounds.size.width / 2 - self.borderWidth / 2);
}

- (CGFloat)singleMarginAngle {
    return 1.7 * M_PI / (SEEFPS * self.singleCircleTime);
}


@end
