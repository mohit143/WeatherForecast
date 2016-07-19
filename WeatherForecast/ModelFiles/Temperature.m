//
//  Temperature.m
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 23/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

@implementation Temperature

#pragma mark - Public

-(Temperature *)setObject:(NSDictionary *)weatherDict{
    //Setting Temperature Object
    self.morningTemperature=[[[weatherDict objectForKey:@"temp"] objectForKey:@"morn"] floatValue];
    self.dayTemperature=[[[weatherDict objectForKey:@"temp"] objectForKey:@"day"] floatValue];
    self.eveningTemperature=[[[weatherDict objectForKey:@"temp"] objectForKey:@"eve"] floatValue];
    self.nightTemperature=[[[weatherDict objectForKey:@"temp"] objectForKey:@"night"] floatValue];
    self.minTemperature=[[[weatherDict objectForKey:@"temp"] objectForKey:@"min"] floatValue];
    self.maxTemperature=[[[weatherDict objectForKey:@"temp"] objectForKey:@"max"] floatValue];
    return self;
    
}

@end
