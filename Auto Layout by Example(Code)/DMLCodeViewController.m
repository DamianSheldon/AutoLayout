//
//  DMLViewController.m
//  Auto Layout by Example(Code)
//
//  Created by dongmeiliang on 5/1/14.
//  Copyright (c) 2014 dongmeilianghy@sina.com. All rights reserved.
//

#import "DMLCodeViewController.h"

@interface DMLCodeViewController ()

@property (nonatomic) UIView *brownColorView;
@property (nonatomic) UIView *purpleColorView;

@end

@implementation DMLCodeViewController

#pragma mark - Managing the View

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1. Individual constraints
    self.brownColorView = [UIView new];
    self.brownColorView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:self.brownColorView];
    
    [self configureBrownColorViewConstraints];
    
    // 2. VFL constraints
    self.purpleColorView = [UIView new];
    self.purpleColorView.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:self.purpleColorView];
    
    [self configurePurpleColorViewConstraints];
}

- (void)configureBrownColorViewConstraints
{
    [self.brownColorView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.brownColorView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.topLayoutGuide attribute:NSLayoutAttributeBottom multiplier:1.0 constant:20.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.brownColorView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeft multiplier:1.0 constant:20.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.brownColorView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeWidth multiplier:0.25 constant:0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.brownColorView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeHeight multiplier:0.125 constant:0]];
}

- (void)configurePurpleColorViewConstraints
{
    [self.purpleColorView setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    UIView *brownColorView = self.brownColorView, *purpleColorView = self.purpleColorView;
    
    NSDictionary *views = NSDictionaryOfVariableBindings(brownColorView, purpleColorView);
    NSDictionary *metrics = @{@"spacing":@20.0};
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[brownColorView]->=spacing-[purpleColorView(brownColorView)]-spacing-|" options:NSLayoutFormatAlignAllTop metrics:metrics views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[purpleColorView(brownColorView)]" options:0 metrics:metrics views:views]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.purpleColorView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.brownColorView attribute:NSLayoutAttributeTop multiplier:1.0 constant:0]];
}

@end
