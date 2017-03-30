//
//  FirstTabViewController.m
//  InteractivePopGestureBugDemo
//
//  Created by Peter0065 on 17/3/29.
//  Copyright © 2017年 Peter0065. All rights reserved.
//

#import "FirstTabViewController.h"
#import "ShowNavBarViewController.h"

@interface FirstTabViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIButton *button;

@end

@implementation FirstTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"FirstTabViewController";
    self.view.backgroundColor = [UIColor purpleColor];
    
    [self.view addSubview:self.button];
    
    self.button.center = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds),
                                     CGRectGetMidY([UIScreen mainScreen].bounds));
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

#pragma mark - Actions
- (void)actionTapButton {
    [self.navigationController pushViewController:[ShowNavBarViewController new] animated:YES];
}

#pragma mark - Accessor
- (UIButton *)button {
    if (!_button) {
        _button = [UIButton buttonWithType:UIButtonTypeCustom];
        _button.backgroundColor = [UIColor brownColor];
        [_button addTarget:self action:@selector(actionTapButton) forControlEvents:UIControlEventTouchUpInside];
        _button.bounds = CGRectMake(0, 0, 100, 100);
    }
    return _button;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    return YES;
}

@end
