//
//  HideNavBarViewController.m
//  InteractivePopGestureBugDemo
//
//  Created by Peter0065 on 17/3/29.
//  Copyright © 2017年 Peter0065. All rights reserved.
//

#import "HideNavBarViewController.h"

@interface HideNavBarViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation HideNavBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"HideNavBarViewController";
    self.view.backgroundColor = [UIColor greenColor];
    
    [self.view addSubview:self.button];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

#pragma mark - Actions
- (void)actionTapButton {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Accessor
- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor brownColor];
        [_button addTarget:self action:@selector(actionTapButton) forControlEvents:UIControlEventTouchUpInside];
        _button.frame = CGRectMake(30, 30, 60, 60);
    }
    return _button;
}

@end
