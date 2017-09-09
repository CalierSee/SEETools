//
//  SEECircleProgressView.m
//  progressAnimation
//
//  Created by 景彦铭 on 2017/1/24.
//  Copyright © 2017年 景彦铭. All rights reserved.


#import "SEECircleWaitingView.h"
#define FPS 300
@interface SEECircleWaitingView ()
/**
 圆环边框宽度、颜色
 */
@property (nonatomic,assign)CGFloat borderWidth;
@property(nonatomic,strong)UIColor * borderColor;

/**
 圆环圆心、半径
 */
@property (nonatomic,assign)CGPoint centerOfCircle;
@property (nonatomic,assign)CGFloat radius;

/**
 圆环起始结束弧度、圆环最短弧度
 */
@property (nonatomic,assign)CGFloat startAngle;
@property (nonatomic,assign)CGFloat endAngle;
@property (nonatomic,assign)CGFloat marginAngle;

@property (nonatomic,assign)BOOL isFull;
@property (nonatomic,assign)NSInteger signalCount; //动画帧数
@property (nonatomic,assign)NSTimeInterval signalTime;  //动画每帧时长
@property (nonatomic,assign)NSInteger index; //动画当前帧数

@property (nonatomic,assign)BOOL isStop; //为YES动画停止

@end

@implementation SEECircleWaitingView

- (instancetype)initWithFrame:(CGRect)frame borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    if (self = [super initWithFrame:frame]) {
        _borderWidth = borderWidth;
        _borderColor = borderColor;
        _startAngle = -M_PI_2;
        _endAngle = -M_PI_2;
        self.backgroundColor = [UIColor colorWithWhite:1 alpha:0];
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddArc(context, self.centerOfCircle.x, self.centerOfCircle.y, self.radius, self.startAngle, self.endAngle, 0);
    [self.borderColor set];
    CGContextSetLineWidth(context, self.borderWidth);
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextStrokePath(context);
}

#pragma mark - private method

- (void)setProgress:(CGFloat)progress {
    CGFloat angle = (2 * M_PI) * progress;
    _endAngle = angle - M_PI_2;
    [self setNeedsDisplay];
}

- (void)startAutoAnimation {
    self.isStop = NO;
    _startAngle = -M_PI_2;
    _endAngle = -M_PI_2;
    CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.toValue = @(2 * M_PI);
    animation.repeatCount = MAXFLOAT;
    animation.duration = self.duration * 0.5;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [self.layer addAnimation:animation forKey:nil];
    [self changeAngle];
}

- (void)stopAutoAnimation {
    self.isStop = YES;
}

- (void)changeAngle {
    _index = 0;
    if (!_isStop) {
        [self calculateAngle];
        return;
    }
}

- (void)calculateAngle {
    if (_index > self.signalCount) {
        _isFull = !_isFull;
        if (_isFull) {
            if ([_waitingDelegate respondsToSelector:@selector(circleWaitingViewDidBecomeCircle:)]) {
                [_waitingDelegate circleWaitingViewDidBecomeCircle:self];
            }
        }
        else {
            if ([_waitingDelegate respondsToSelector:@selector(circleWaitingViewDidBecomePoint:)]) {
                [_waitingDelegate circleWaitingViewDidBecomePoint:self];
            }
        }
        if (!self.isStop) {
            [self performSelector:@selector(changeAngle) withObject:nil afterDelay:self.signalTime * self.signalCount * 4 inModes:@[NSRunLoopCommonModes]];
        }
    }
    else {
        _index ++;
        CGFloat stepAngle = (1.7 * M_PI) / self.signalCount;
        if (_isFull) {
            self.startAngle += stepAngle;
        }
        else {
            self.endAngle += stepAngle;
        }
        [self setNeedsDisplay];
        if (!self.isStop) {
            [self performSelector:@selector(calculateAngle) withObject:nil afterDelay:self.signalTime inModes:@[NSRunLoopCommonModes]];
        }
    }
}

#pragma mark - getter & setter {

- (CGFloat)borderWidth {
    if (_borderWidth == 0) {
        _borderWidth = 4;
    }
    return _borderWidth;
}

- (UIColor *)borderColor {
    if (_borderColor == nil) {
        _borderColor = [UIColor blackColor];
    }
    return _borderColor;
}

- (CGPoint)centerOfCircle {
    if (CGPointEqualToPoint(_centerOfCircle, CGPointZero)) {
        _centerOfCircle = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    }
    return _centerOfCircle;
}

- (CGFloat)radius {
    if (_radius == 0) {
        _radius = MIN(self.bounds.size.width, self.bounds.size.height) / 2.0 - self.borderWidth;
    }
    return _radius;
}

- (CGFloat)endAngle {
    if (_endAngle == _startAngle) {
        _endAngle = self.startAngle + self.marginAngle;
    }
    return _endAngle;
}

- (CGFloat)marginAngle {
    if (_marginAngle == 0) {
        _marginAngle = self.borderWidth / (M_PI * 2 * self.radius) / 2;
    }
    return _marginAngle;
}

- (NSTimeInterval)duration {
    if (_duration == 0) {
        _duration = 3;
    }
    return _duration;
}

- (CGFloat)proportion {
    if (_proportion == 0) {
        _proportion = 0.2;
    }
    return _proportion;
}

- (NSInteger)signalCount {
    if (_signalCount == 0) {
        _signalCount = FPS * (self.duration * self.proportion / 5);
    }
    return _signalCount;
}

- (NSTimeInterval)signalTime {
    if (_signalTime == 0) {
        _signalTime = 1.0 / FPS;
    }
    return _signalTime;
}

- (void)setIsStop:(BOOL)isStop {
    _isStop = isStop;
    if (isStop) {
        [self.layer removeAllAnimations];
    }
}

@end
