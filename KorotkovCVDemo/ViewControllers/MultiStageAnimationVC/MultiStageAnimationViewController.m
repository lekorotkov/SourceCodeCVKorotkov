//
//  MultiStageAnimationViewController.m
//  KorotkovCVDemo
//
//  Created by Alexey Korotkov on 27.10.15.
//  Copyright © 2015 Alexey Korotkov. All rights reserved.
//

#import "MultiStageAnimationViewController.h"

@interface MultiStageAnimationViewController ()

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@end

@implementation MultiStageAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem.title = @"";
}

#pragma mark - Button Actions

- (IBAction)animateIncorrectEntryPressed {
    [self animateIncorrectEntry];
}

#pragma mark - Text Field Animation

- (void)animateIncorrectEntry {
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"position.x";
    animation.values = @[ @0, @10, @-10, @10, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.4;
    
    animation.additive = YES;
    
    [self.passwordTextField.layer addAnimation:animation forKey:@"shake"];
}

@end
