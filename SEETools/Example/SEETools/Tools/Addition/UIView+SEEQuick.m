
//
//  UIView+SEEQuick.m
//  CSShare
//
//  Created by 景彦铭 on 2017/3/4.
//  Copyright © 2017年 三只鸟. All rights reserved.
//

#import "UIView+SEEQuick.h"

@implementation UIView (SEEQuick)

- (CGFloat)x {
    return self.frame.origin.x;
}

- (CGFloat)y {
    return self.frame.origin.y;
}

- (CGFloat)width {
    return self.frame.size.width;
}

- (CGFloat)height {
    return self.frame.size.height;
}



@end
