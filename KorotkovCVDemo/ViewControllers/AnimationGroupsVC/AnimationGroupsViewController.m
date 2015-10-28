//
//  AnimationGroupsViewController.m
//  KorotkovCVDemo
//
//  Created by Alexey Korotkov on 28.10.15.
//  Copyright © 2015 Alexey Korotkov. All rights reserved.
//

#import "AnimationGroupsViewController.h"

#pragma mark - Animation Constants

static const CFTimeInterval kAnimationDuration = 1.2;
static const int            kAnimationSideDistance = 110;
static const int            kAnimationHeightDistance = 20;
static const float          kAnimationMaxRotationAngle = 0.14;

@interface AnimationGroupsViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *cover1;
@property (weak, nonatomic) IBOutlet UIImageView *cover2;

@end

@implementation AnimationGroupsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.cover1.layer.zPosition = 1;
    self.cover2.layer.zPosition = 2;
}

#pragma mark - Button Actions

- (IBAction)startAnimationPressed {
    [self animate];
}

#pragma mark - Covers Animation

- (void)animate {
    [self animateCover1];
    [self animateCover2];
}

- (void)animateCover1{
    CABasicAnimation *zPosition2 = [CABasicAnimation animation];
    zPosition2.keyPath = @"zPosition";
    
    if (self.cover1.layer.zPosition == 1) {
        zPosition2.fromValue = @1;
        zPosition2.toValue = @2;
    } else {
        zPosition2.fromValue = @2;
        zPosition2.toValue = @1;
    }
    
    zPosition2.duration = kAnimationDuration;
    
    CAKeyframeAnimation *rotation2 = [CAKeyframeAnimation animation];
    rotation2.keyPath = @"transform.rotation";
    rotation2.values = @[ @0, @(-kAnimationMaxRotationAngle), @0 ];
    rotation2.duration = kAnimationDuration;
    rotation2.timingFunctions = @[
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                  ];
    
    CAKeyframeAnimation *position2 = [CAKeyframeAnimation animation];
    position2.keyPath = @"position";
    position2.values = @[
                         [NSValue valueWithCGPoint:CGPointZero],
                         [NSValue valueWithCGPoint:CGPointMake(-kAnimationSideDistance, -kAnimationHeightDistance)],
                         [NSValue valueWithCGPoint:CGPointZero]
                         ];
    position2.timingFunctions = @[
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                  [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                  ];
    position2.additive = YES;
    position2.duration = kAnimationDuration;
    
    CAAnimationGroup *group2 = [CAAnimationGroup animation];
    group2.animations = @[ zPosition2, rotation2, position2 ];
    group2.duration = kAnimationDuration;
    
    [self.cover1.layer addAnimation:group2 forKey:nil];
    
    if (self.cover1.layer.zPosition == 1) {
        self.cover1.layer.zPosition = 2;
    } else {
        self.cover1.layer.zPosition = 1;
    }
}

- (void)animateCover2{
    CABasicAnimation *zPosition = [CABasicAnimation animation];
    zPosition.keyPath = @"zPosition";
    
    if (self.cover2.layer.zPosition == 1) {
        zPosition.fromValue = @1;
        zPosition.toValue = @2;
    } else {
        zPosition.fromValue = @2;
        zPosition.toValue = @1;
    }
    
    zPosition.duration = kAnimationDuration;
    
    CAKeyframeAnimation *rotation = [CAKeyframeAnimation animation];
    rotation.keyPath = @"transform.rotation";
    rotation.values = @[ @0, @(kAnimationMaxRotationAngle), @0 ];
    rotation.duration = kAnimationDuration;
    rotation.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                 ];
    
    CAKeyframeAnimation *position = [CAKeyframeAnimation animation];
    position.keyPath = @"position";
    position.values = @[
                        [NSValue valueWithCGPoint:CGPointZero],
                        [NSValue valueWithCGPoint:CGPointMake(kAnimationSideDistance, -kAnimationHeightDistance)],
                        [NSValue valueWithCGPoint:CGPointZero]
                        ];
    position.timingFunctions = @[
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                 [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]
                                 ];
    position.additive = YES;
    position.duration = kAnimationDuration;
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = @[ zPosition, rotation, position ];
    group.duration = kAnimationDuration;
    
    [self.cover2.layer addAnimation:group forKey:nil];
    
    if (self.cover2.layer.zPosition == 1) {
        self.cover2.layer.zPosition = 2;
    } else {
        self.cover2.layer.zPosition = 1;
    }
}

@end
