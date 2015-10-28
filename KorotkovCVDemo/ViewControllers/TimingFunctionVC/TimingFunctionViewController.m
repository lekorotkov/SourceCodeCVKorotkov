//
//  TimingFunctionViewController.m
//  KorotkovCVDemo
//
//  Created by Alexey Korotkov on 27.10.15.
//  Copyright © 2015 Alexey Korotkov. All rights reserved.
//

#import "TimingFunctionViewController.h"

#pragma mark - IB Constants

static const CGFloat kInitialXBoxPosition = 60.f;
static const CGFloat kFinalXBoxPosition = 260.f;

@interface TimingFunctionViewController ()

@property (weak, nonatomic) IBOutlet UIView *firstBlueBox;
@property (weak, nonatomic) IBOutlet UIView *secondBlueBox;
@property (weak, nonatomic) IBOutlet UIView *thirdBlueBox;
@property (weak, nonatomic) IBOutlet UIView *fourthBlueBox;

@end

@implementation TimingFunctionViewController

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - Button Actions

- (IBAction)refreshPressed:(id)sender {
    self.firstBlueBox.layer.position = CGPointMake(kInitialXBoxPosition, self.firstBlueBox.frame.origin.y + self.firstBlueBox.frame.size.height/2);
    self.secondBlueBox.layer.position = CGPointMake(kInitialXBoxPosition, self.secondBlueBox.frame.origin.y + self.secondBlueBox.frame.size.height/2);
    self.thirdBlueBox.layer.position = CGPointMake(kInitialXBoxPosition, self.thirdBlueBox.frame.origin.y + self.thirdBlueBox.frame.size.height/2);
    self.fourthBlueBox.layer.position = CGPointMake(kInitialXBoxPosition, self.fourthBlueBox.frame.origin.y + self.fourthBlueBox.frame.size.height/2);
}

- (IBAction)startAnimationPressed {
    [self performBoxAnimations];
}

#pragma mark - Box Animations

- (void)performBoxAnimations {
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position.x";
    animation.fromValue = @(self.firstBlueBox.frame.origin.x + self.firstBlueBox.frame.size.width/2);
    animation.toValue = @(kFinalXBoxPosition);
    animation.duration = 1;
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    [self.firstBlueBox.layer addAnimation:animation forKey:@"basic"];
    
    self.firstBlueBox.layer.position = CGPointMake(kFinalXBoxPosition, self.firstBlueBox.frame.origin.y + self.firstBlueBox.frame.size.height/2);
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [self.secondBlueBox.layer addAnimation:animation forKey:@"basic"];
    
    self.secondBlueBox.layer.position = CGPointMake(kFinalXBoxPosition, self.secondBlueBox.frame.origin.y + self.secondBlueBox.frame.size.height/2);
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    [self.thirdBlueBox.layer addAnimation:animation forKey:@"basic"];
    
    self.thirdBlueBox.layer.position = CGPointMake(kFinalXBoxPosition, self.thirdBlueBox.frame.origin.y + self.thirdBlueBox.frame.size.height/2);
    
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [self.fourthBlueBox.layer addAnimation:animation forKey:@"basic"];
    
    self.fourthBlueBox.layer.position = CGPointMake(kFinalXBoxPosition, self.fourthBlueBox.frame.origin.y + self.fourthBlueBox.frame.size.height/2);
}

@end
