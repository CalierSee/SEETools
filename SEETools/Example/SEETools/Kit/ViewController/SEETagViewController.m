//
//  SEETagViewController.m
//  SEETools
//
//  Created by 景彦铭 on 2017/9/4.
//  Copyright © 2017年 436005247@qq.com. All rights reserved.
//

#import "SEETagViewController.h"
#import "See.h"

@interface SEETagViewController ()<UIScrollViewDelegate>

/**
 内容滚动视图
 */
@property(nonatomic,strong)UIScrollView * scrollView;

/**
 控制器
 */
@property(nonatomic,strong)NSArray <UIViewController *> * vcs;

/**
 标题
 */
@property(nonatomic,strong)NSArray * titles;

/**
 头部选择视图
 */
@property(nonatomic,strong)SEETagView * headerView;
@property (nonatomic,assign)CGFloat headerHeight;

@end

@implementation SEETagViewController

#pragma mark - life circle
- (instancetype)initWithClasses:(NSArray<Class> *)classes {
    return [self initWithClasses:classes titles:nil];
}

- (instancetype)initWithClasses:(NSArray<Class> *)classes titles:(NSArray *)titles {
    NSMutableArray * vcs = [NSMutableArray array];
    [classes enumerateObjectsUsingBlock:^(Class  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        UIViewController * vc = [[obj alloc]init];
        [vcs addObject:vc];
    }];
    return [self initWithViewControllers:vcs.copy titles:titles];
}

- (instancetype)initWithViewControllers:(NSArray<UIViewController *> *)vcs {
    return [self initWithViewControllers:vcs titles:nil];
}

- (instancetype)initWithViewControllers:(NSArray<UIViewController *> *)vcs titles:(NSArray *)titles {
    if (self = [super initWithNibName:nil bundle:nil]) {
        self.vcs = vcs;
        self.titles = titles;
        self.headerHeight = 40;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self see_loadUI];
    self.automaticallyAdjustsScrollViewInsets = NO;
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.scrollView.frame = CGRectMake(0, self.headerView.frame.size.height + self.headerView.frame.origin.y, self.view.bounds.size.width, self.view.bounds.size.height - self.headerHeight);
    [self.vcs enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.view.frame = CGRectMake(self.scrollView.bounds.size.width * idx, 0, self.scrollView.bounds.size.width, self.scrollView.bounds.size.height);
    }];
    self.scrollView.sContentSize(CGSizeMake(self.scrollView.bounds.size.width * self.vcs.count, self.scrollView.bounds.size.height)).sContentInsets(UIEdgeInsetsZero).sIndicatorInsets(UIEdgeInsetsZero);
}

#pragma mark - public method
- (void)configureHeaderHeight:(CGFloat)height {
    self.headerHeight = height;
    self.headerView.frame = CGRectMake(self.headerView.frame.origin.x, self.headerView.frame.origin.y, self.headerView.frame.size.width, height);
    [self.view layoutIfNeeded];
}

- (void)configureHeaderAnimationMode:(TageViewAnimationMode)mode {
    [self.headerView configureWithAnimationMode:mode];
}

- (void)selectAtIndex:(NSInteger)index {
    [self.headerView selectAtIndex:index];
}

- (void)configureWithTitleColor:(UIColor *)color forState:(UIControlState)state {
    [self.headerView configureWithTitleColor:color forState:state];
}

- (void)configureIndicatorColor:(UIColor *)color {
    self.headerView.indicatorColor = color;
}

#pragma mark - private method
- (void)see_loadUI {
    self.view.sBackgroundColor([UIColor whiteColor]);
    CGFloat y = 0;
    if (self.navigationController != nil) {
        y = 64;
    }
    self.headerView.sFrame(CGRectMake(0, y, self.view.bounds.size.width, self.headerHeight));
    self.scrollView = [[UIScrollView alloc]init];
    self.scrollView.sBounces(NO).sPagingEnabled(YES).sDelegate(self).sIndicator(NO, NO);
    [self.view addSubview:self.scrollView];
    NSMutableArray <NSString *> * array = [NSMutableArray array];
    BOOL flag = NO;
    if (self.titles.count != self.vcs.count) {
        flag = YES;
    }
    [self.vcs enumerateObjectsUsingBlock:^(UIViewController * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [self addChildViewController:obj];
        [self.scrollView addSubview:obj.view];
        [obj didMoveToParentViewController:self];
        if (flag) {
            [array addObject:obj.title ? obj.title : @"no title"];
        }
    }];
    if (flag) {
        self.titles = array.copy;
    }
    if ([self.titles.firstObject isKindOfClass:[NSAttributedString class]]) {
        [self.headerView configureWithAttributeTitles:self.titles];
    }
    else {
        [self.headerView configureWithTitles:self.titles];
    }
    [self.view addSubview:self.headerView];
    
}

#pragma mark - action method
- (void)see_headerDidChange:(SEETagView *)sender {
    if (self.scrollView.dragging || self.scrollView.tracking || self.scrollView.decelerating) {
        return;
    }
    else {
        [self.scrollView setContentOffset:CGPointMake(self.scrollView.bounds.size.width * sender.currentTag, 0) animated:YES];
    }
}

#pragma mark - delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (self.scrollView.dragging || self.scrollView.tracking) {
        NSInteger page = (scrollView.contentOffset.x + scrollView.bounds.size.width * 0.5) / scrollView.bounds.size.width;
        [self.headerView selectAtIndex:page];
        
    }
}


#pragma mark - getter & setter
- (SEETagView *)headerView {
    if (_headerView == nil) {
        if ([self.titles.firstObject isKindOfClass:[NSAttributedString class]]) {
            _headerView = [[SEETagView alloc]initWithAttributeTitles:self.titles];
        }
        else {
            _headerView = [[SEETagView alloc]initWithTitles:self.titles];

        }
        _headerView.needIndicator = YES;
        _headerView.sEvent(UIControlEventValueChanged).sAddTarget(self, @selector(see_headerDidChange:));
    }
    return _headerView;
}


@end
