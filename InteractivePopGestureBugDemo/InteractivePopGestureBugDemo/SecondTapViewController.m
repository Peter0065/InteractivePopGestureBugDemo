//
//  SecondTapViewController.m
//  InteractivePopGestureBugDemo
//
//  Created by Peter0065 on 17/3/29.
//  Copyright © 2017年 Peter0065. All rights reserved.
//

#import "SecondTapViewController.h"
#import "HideNavBarViewController.h"

@interface SecondTapViewController () <UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIButton *button;

@end

@implementation SecondTapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"SecondTapViewController";
    self.view.backgroundColor = [UIColor blueColor];

    [self.view addSubview:self.button];
    
    self.button.center = CGPointMake(CGRectGetMidX([UIScreen mainScreen].bounds),
                                     CGRectGetMidY([UIScreen mainScreen].bounds));

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}


#pragma mark - Actions
- (void)actionTapButton {
    [self.navigationController pushViewController:[HideNavBarViewController new] animated:YES];
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
