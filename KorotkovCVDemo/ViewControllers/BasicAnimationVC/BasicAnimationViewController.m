//
//  BasicAnimationViewController.m
//  KorotkovCVDemo
//
//  Created by Alexey Korotkov on 27.10.15.
//  Copyright © 2015 Alexey Korotkov. All rights reserved.
//

#import "BasicAnimationViewController.h"

@interface BasicAnimationViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *rocket;
@property (weak, nonatomic) IBOutlet UIImageView *earth;

@end

@implementation BasicAnimationViewController

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"Basic animation";
    self.navigationItem.backBarButtonItem.title = @"";
}

- (void)viewWillDisappear:(BOOL)animated {
    [self.earth removeFromSuperview];
}

#pragma mark - Button Actions

- (IBAction)startAnimationPressed {
    [self animateRocket];
}

#pragma mark - Rocket Animation

- (void)animateRocket {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @(self.rocket.frame.origin.x + (self.rocket.frame.size.width / 2));
    animation.toValue = @455;
    animation.duration = 1;
    
    [self.rocket.layer addAnimation:animation forKey:@"basic"];
}

@end
