//
//  SEETagView.m
//  SEETools
//
//  Created by 景彦铭 on 2017/8/31.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import "SEETagView.h"
#import "See.h"

@interface SEETagView ()

/**
 按钮
 */
@property(nonatomic,strong)NSMutableArray <UIButton *> * buttons;

/**
 滑动指示线
 */
@property(nonatomic,strong)UIView * indicator;

/**
 title是否为属性字符串
 */
@property (nonatomic,assign)BOOL isAttributed;

/**
 分割线
 */
@property(nonatomic,strong)NSMutableArray <UIView *> * lineViews;

/**
 当前选中按钮
 */
@property (nonatomic,assign)NSInteger currentTag;

/**
 上一次选中的按钮
 */
@property (nonatomic,assign)NSInteger lastTag;

/**
 选中动画模式
 */
@property (nonatomic,assign)TageViewAnimationMode mode;

@end

@implementation SEETagView

#pragma mark - life circle

- (instancetype)initWithTitles:(nullable NSArray<NSString *> *)titles {
    if (self = [super init]) {
        [self see_loadUIWithTitle:titles];
    }
    return self;
}

- (instancetype)initWithAttributeTitles:(nullable NSArray<NSAttributedString *> *)titles {
    if (self = [super init]) {
        [self see_loadUIWithAttributeTitle:titles];
    }
    return self;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width / self.buttons.count;
    CGFloat height = self.bounds.size.height;
    [self.buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.sFrame(CGRectMake(width * idx, 0, width, height));
    }];
    [self.lineViews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.sFrame(CGRectMake(width * (idx + 1), height * 0.1, 2, height * 0.8));
    }];
    self.indicator.frame = CGRectMake(width * self.currentTag + 10, self.bounds.size.height - 2, width - 20, 2);
    if (!self.needIndicator) {
        if (self.indicator.superview) {
            [self.indicator removeFromSuperview];
        }
    }
    else {
        if (!self.indicator.superview) {
            [self addSubview:self.indicator];
        }
    }
}

#pragma mark - action method
- (void)see_buttonAction:(UIButton *)sender {
    if (self.currentTag == sender.tag) return;
    
    self.lastTag = self.currentTag;
    self.currentTag = sender.tag;
    
    [self sendActionsForControlEvents:UIControlEventValueChanged];
    
    if (!_needIndicator) {
        return;
    }
    
    switch (self.mode) {
        case TageViewAnimationModeDefault:
        {
            [self see_defaultAnimation];
        }
            break;
        case TageViewAnimationModeEasyInEasyOut:
        {
            [self see_animationWithTimeFunctionName:kCAMediaTimingFunctionEaseInEaseOut];
        }
            break;
        case TageViewAnimationModeChangeWidth:
        {
            [self see_animationWithTimeFunctionName:kCAMediaTimingFunctionLinear];
        }
            break;
            
        default:
            break;
    }
    
}

#pragma mark - public method
- (void)configureWithTitles:(NSArray<NSString *> *)titles {
    [self see_clearUI];
    [self see_loadUIWithTitle:titles];
}

- (void)configureWithAttributeTitles:(NSArray<NSAttributedString *> *)titles {
    [self see_clearUI];
    [self see_loadUIWithAttributeTitle:titles];
}

- (void)configureWithTitleColor:(UIColor *)color forState:(UIControlState)state {
    [self.buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.sState(state).sTitleColor(color);
    }];
}

- (void)configureWithAnimationMode:(TageViewAnimationMode)mode {
    self.mode = mode;
}

- (void)selectAtIndex:(NSInteger)index {
    if (index > self.buttons.count - 1) return;
    [self see_buttonAction:self.buttons[index]];
}

#pragma mark - private method
- (void)see_loadUIWithTitle:(NSArray <NSString *> *)titles {
    self.buttons = [NSMutableArray arrayWithCapacity:titles.count];
    [titles enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        self.isAttributed = NO;
        UIButton * button = [[UIButton alloc]init];
        button.sState(UIControlStateNormal).sTitle(obj).sTitleColor([UIColor blackColor]).sEvent(UIControlEventTouchUpInside).sAddTarget(self, @selector(see_buttonAction:));
        button.sBackgroundColor(UIColor.sRGB(255,255,255,1)).sTag(idx);
        button.titleLabel.sFont(UIFont.sSystemFont(14)).sTextAlignment(NSTextAlignmentCenter);
        [self addSubview:button];
        [self.buttons addObject:button];
    }];
    self.lineViews = [NSMutableArray array];
    for (NSInteger i  = 0; i < self.buttons.count - 1; i++) {
        UIView * view = [[UIView alloc]init];
        view.sBackgroundColor(UIColor.sHex(0xf1f1f1,1));
        [self addSubview:view];
        [self.lineViews addObject:view];
    }
}

- (void)see_loadUIWithAttributeTitle:(NSArray <NSAttributedString *> *)titles {
    self.buttons = [NSMutableArray arrayWithCapacity:titles.count];
    [titles enumerateObjectsUsingBlock:^(NSAttributedString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        self.isAttributed = YES;
        UIButton * button = [[UIButton alloc]init];
        button.sState(UIControlStateNormal).sAttributedTitle(obj).sEvent(UIControlEventTouchUpInside).sAddTarget(self, @selector(see_buttonAction:));
        button.sBackgroundColor(UIColor.sRGB(255,255,255,1)).sTag(idx);
        button.titleLabel.sNumberOfLines(0).sTextAlignment(NSTextAlignmentCenter);
        [self addSubview:button];
        [self.buttons addObject:button];
    }];
    self.lineViews = [NSMutableArray array];
    for (NSInteger i  = 0; i < self.buttons.count - 1; i++) {
        UIView * view = [[UIView alloc]init];
        view.sBackgroundColor(UIColor.sHex(0xf1f1f1,1));
        [self addSubview:view];
        [self.lineViews addObject:view];
    }
}

/**
 普通动画   frame.origin.x变化
 */
- (void)see_defaultAnimation {
    CGFloat width = self.bounds.size.width / self.buttons.count;
    [UIView animateWithDuration:0.5 animations:^{
        self.indicator.frame = CGRectMake(width * self.currentTag + 10, self.indicator.frame.origin.y, self.indicator.frame.size.width, self.indicator.frame.size.height);
    }];
}



- (void)see_animationWithTimeFunctionName:(NSString *)name {
    CGFloat width = self.bounds.size.width / self.buttons.count;
    CGFloat y = self.bounds.size.height - 2;
    if (self.lastTag < self.currentTag) {
        _indicator.layer.anchorPoint = CGPointZero;
        _indicator.layer.position = CGPointMake(self.lastTag * width + 10, y);
    }
    else {
        _indicator.layer.anchorPoint = CGPointMake(1, 0);
        _indicator.layer.position = CGPointMake((self.lastTag + 1) * width - 10, y);
    }
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    CAKeyframeAnimation * positionA = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    CAKeyframeAnimation * boundsA = [CAKeyframeAnimation animationWithKeyPath:@"bounds"];
    group.animations = @[positionA,boundsA];
    group.duration = 0.5;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    
    //=============  bounds  position  =============//
    boundsA.values = @[[NSValue valueWithCGRect:CGRectMake(0, 0, self.indicator.bounds.size.width, self.indicator.bounds.size.height)],[NSValue valueWithCGRect:CGRectMake(0, 0, self.indicator.bounds.size.width * 2, self.indicator.bounds.size.height)],[NSValue valueWithCGRect:CGRectMake(0, 0, self.indicator.bounds.size.width, self.indicator.bounds.size.height)]];
    boundsA.keyTimes = @[@(0),@(0.5),@(1)];
    boundsA.timingFunction = [CAMediaTimingFunction functionWithName:name];
    
    if (self.indicator.layer.anchorPoint.x == 0) {
        positionA.values = @[[NSValue valueWithCGPoint:CGPointMake(self.lastTag * width + 10,y)],[NSValue valueWithCGPoint:CGPointMake(self.lastTag * width + 10,y)],[NSValue valueWithCGPoint:CGPointMake(width * self.currentTag + 10,y)]];
    }
    else {
        positionA.values = @[[NSValue valueWithCGPoint:CGPointMake((self.lastTag + 1) * width - 10,y)],[NSValue valueWithCGPoint:CGPointMake((self.lastTag + 1) * width - 10,y)],[NSValue valueWithCGPoint:CGPointMake((self.currentTag + 1) * width - 10,y)]];
    }
    positionA.keyTimes = @[@(0),@(0.5),@(1)];
    positionA.timingFunction = [CAMediaTimingFunction functionWithName:name];
    
    [self.indicator.layer addAnimation:group forKey:@"group"];
}


/**
 清除UI
 */
- (void)see_clearUI {
    if (!self.buttons.count) {
        return;
    }
    [_indicator removeFromSuperview];
    _indicator = nil;
    [self.buttons enumerateObjectsUsingBlock:^(UIButton * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [self.buttons removeAllObjects];
    [self.lineViews enumerateObjectsUsingBlock:^(UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [self.lineViews removeAllObjects];
}

#pragma mark - getter & setter
- (UIView *)indicator {
    if (_indicator == nil) {
        _indicator = [[UIView alloc]init];
        _indicator.sBackgroundColor(self.indicatorColor);
    }
    return _indicator;
}

- (UIColor *)indicatorColor {
    if (_indicatorColor == nil) {
        return [UIColor redColor];
    }
    return _indicatorColor;
}

- (void)setNeedIndicator:(BOOL)needIndicator {
    _needIndicator = needIndicator;
}

@end
