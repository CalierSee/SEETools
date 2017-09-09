//
//  SEELoadingView.m
//  SEETools
//
//  Created by 景彦铭 on 2017/7/3.
//  Copyright © 2017年 景彦铭. All rights reserved.
//

#import "SEELoadingView.h"

@interface SEELoadingView ()

@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@property (nonatomic,assign)SEELoadingViewStatus status;

@end


@implementation SEELoadingView

+ (instancetype)loadingView {
    return [[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil].lastObject;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    self.titleLabel.hidden = NO;
    self.loadingView.hidden = YES;
    self.backgroundColor = [UIColor whiteColor];
    
}

#pragma mark - private method

- (void)loading {
    if (self.status == SEELoadingViewStatusDisable || self.status == SEELoadingViewStatusLoading) {
        return;
    }
    [self.loadingView startAnimating];
    self.titleLabel.hidden = YES;
    self.loadingView.hidden = NO;
    self.status = SEELoadingViewStatusLoading;
    __weak typeof(self) weakSelf = self;
    void(^completeHanlder)(NSInteger count) = ^(NSInteger count){
        [weakSelf stopLoadingWithResultCount:count];
    };
    if (self.loadingBlock) {
        self.loadingBlock(completeHanlder);
    }
}

- (void)stopLoadingWithResultCount:(NSInteger)count {
    if (self.status == SEELoadingViewStatusLoading) {
        BOOL flag = (count % SEELoadingViewMaxCount == 0);
        [self.loadingView stopAnimating];
        self.loadingView.hidden = !flag;
        self.titleLabel.hidden = flag;
        self.status = flag ? SEELoadingViewStatusNormal : SEELoadingViewStatusDisable;
    }
}

- (void)reset {
    self.status = SEELoadingViewStatusNormal;
}


@end
