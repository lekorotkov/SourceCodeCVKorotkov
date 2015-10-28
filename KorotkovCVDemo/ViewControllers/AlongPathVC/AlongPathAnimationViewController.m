//
//  AlongPathAnimationViewController.m
//  KorotkovCVDemo
//
//  Created by Alexey Korotkov on 27.10.15.
//  Copyright © 2015 Alexey Korotkov. All rights reserved.
//

#import "AlongPathAnimationViewController.h"

#pragma mark - IB Constants

static const CGFloat kEarthWidth = 150.f;
static const CGFloat kEarthHeight = 150.f;
static const CGFloat kSpacingFromSatelliteToEarth = 8.f;
static const CGFloat kSatelliteHeight = 75.f;
static const CGFloat kSatelliteWidth = 75.f;

@interface AlongPathAnimationViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *satellite;
@property (weak, nonatomic) IBOutlet UIImageView *earth;
@property (weak, nonatomic) IBOutlet UISwitch *rotateSatelliteSwitch;

@end

@implementation AlongPathAnimationViewController

#pragma mark - View Controller Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.backBarButtonItem.title = @"";
}

#pragma mark - Button Actions

- (IBAction)animateSatellitePressed {
    [self animateSatellite];
}

#pragma maek - Switch Value Changed

- (IBAction)switchValueChanged {
    [self.satellite.layer removeAllAnimations];
}

#pragma mark - Sattellite Animation

- (void)animateSatellite {
    CGRect boundingRect = CGRectMake(- kSpacingFromSatelliteToEarth - (kSatelliteWidth / 2) - (kEarthWidth / 2), - kSatelliteHeight - (kSpacingFromSatelliteToEarth * 2) - kEarthHeight, kEarthWidth + (kSpacingFromSatelliteToEarth * 2) + kSatelliteWidth, kEarthHeight + (kSpacingFromSatelliteToEarth * 2) + kSatelliteHeight);
    
    CAKeyframeAnimation *orbit = [CAKeyframeAnimation animation];
    orbit.keyPath = @"position";
    orbit.path = CFAutorelease(CGPathCreateWithEllipseInRect(boundingRect, NULL));
    orbit.duration = 4;
    orbit.additive = YES;
    orbit.repeatCount = HUGE_VALF;
    orbit.calculationMode = kCAAnimationPaced;
    orbit.rotationMode = self.rotateSatelliteSwitch.isOn ? kCAAnimationRotateAuto : nil;
    
    [self.satellite.layer addAnimation:orbit forKey:@"orbit"];
}

@end
