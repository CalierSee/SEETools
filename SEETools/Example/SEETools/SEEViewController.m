//
//  SEEViewController.m
//  SEETools
//
//  Created by 436005247@qq.com on 08/31/2017.
//  Copyright (c) 2017 436005247@qq.com. All rights reserved.
//

#import "SEEViewController.h"
#import "See.h"
#import "SEETagView.h"
#import "SEETagViewController.h"
#import <Masonry/Masonry.h>
#import "SEEQuick.h"
#import "SEECircleAnimateView.h"
@interface SEEViewController ()

@end

@implementation SEEViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    SEECircleAnimateView * view = [[SEECircleAnimateView alloc]init];
    view.frame = CGRectMake(50, 100, 50, 50);
    view.backgroundColor = [UIColor redColor];
    [view startAnimation];
    [self.view addSubview:view];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}

@end
