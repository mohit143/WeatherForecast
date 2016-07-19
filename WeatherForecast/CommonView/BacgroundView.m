//
//  BacgroundView.m
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 24/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

#import "BacgroundView.h"

@implementation BacgroundView

#pragma mark - View layoutSubviews

- (void)layoutSubviews
{
    //Setting the background color
    CAGradientLayer *backgroundLayer = [ColorHelper setGradient:[UIColor colorWithRed:30.0/255.0 green:30.0/255.0 blue:30.0/255.0 alpha:1.0] and:[UIColor colorWithRed:240.0/255.0 green:240.0/255.0 blue:240.0/255.0 alpha:1.0]];
    backgroundLayer.frame = self.bounds;
    [self.layer insertSublayer:backgroundLayer atIndex:0];
}
@end
