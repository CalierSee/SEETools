//
//  UIScrollView+See.m
//  SEETools
//
//  Created by 景彦铭 on 2017/9/6.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import "UIScrollView+See.h"

@implementation UIScrollView (See)

- (UIScrollView *(^)(BOOL))sBounces {
    return ^UIScrollView *(BOOL bounces) {
        self.bounces = bounces;
        return self;
    };
}

- (UIScrollView *(^)(BOOL))sPagingEnabled {
    return ^UIScrollView *(BOOL enabled) {
        self.pagingEnabled = enabled;
        return self;
    };
}

- (UIScrollView *(^)(id<UIScrollViewDelegate>))sDelegate {
    return ^UIScrollView *(id <UIScrollViewDelegate> delegate) {
        self.delegate = delegate;
        return self;
    };
}

- (UIScrollView *(^)(CGSize))sContentSize {
    return ^UIScrollView *(CGSize contentSize) {
        self.contentSize = contentSize;
        return self;
    };
}

- (UIScrollView *(^)(CGPoint, BOOL))sContentOffset {
    return ^UIScrollView *(CGPoint contentOffset,BOOL animate) {
        [self setContentOffset:contentOffset animated:animate];
        return self;
    };
}

- (UIScrollView *(^)(BOOL, BOOL))sIndicator {
    return ^UIScrollView *(BOOL vertical, BOOL horizontal) {
        self.showsVerticalScrollIndicator = vertical;
        self.showsHorizontalScrollIndicator = horizontal;
        return self;
    };
}

- (UIScrollView *(^)(UIEdgeInsets))sContentInsets {
    return ^UIScrollView *(UIEdgeInsets insets) {
        self.contentInset = insets;
        return self;
    };
}

- (UIScrollView *(^)(UIEdgeInsets))sIndicatorInsets {
    return ^UIScrollView *(UIEdgeInsets insets) {
        self.scrollIndicatorInsets = insets;
        return self;
    };
}

@end
