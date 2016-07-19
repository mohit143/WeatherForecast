//
//  ColorHelper.m
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 24/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

@implementation ColorHelper

//Public Class Methods
+(CAGradientLayer *)setGradient:(UIColor *)topColor and:(UIColor *)bottomColor{
    
    //Setting gradient Color
    NSArray *gradientColors = [NSArray arrayWithObjects:(id)topColor.CGColor, (id)bottomColor.CGColor, nil];
    NSArray *gradientLocations = [NSArray arrayWithObjects:[NSNumber numberWithInt:0.0],[NSNumber numberWithInt:1.0], nil];
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = gradientColors;
    gradientLayer.locations = gradientLocations;
    
    return gradientLayer;
}

@end
