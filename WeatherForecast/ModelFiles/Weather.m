//
//  Weather.m
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 23/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

@implementation Weather

#pragma mark - Initialization

- (id)init {
    //Initialization
    self = [super init];
    if (self) {
        
        self.temperature = [[Temperature alloc] init];
        
    }
    return self;
}

#pragma mark - Public

- (Weather *)setObject:(NSDictionary *)weatherDict{
    //Setting Weather Object
    self.date=[NSDate dateWithTimeIntervalSince1970:[[weatherDict objectForKey:@"dt"] doubleValue]];
    self.pressure=[[weatherDict objectForKey:@"pressure"] floatValue];
    self.humidity=[[weatherDict objectForKey:@"humidity"] doubleValue];
    self.speed=[[weatherDict objectForKey:@"speed"] doubleValue];
    self.degree=[[weatherDict objectForKey:@"deg"] doubleValue];
    self.clouds=[[weatherDict objectForKey:@"clouds"] doubleValue];
    self.rain=[[weatherDict objectForKey:@"rain"] doubleValue];
    self.weatherDescription=[[[[weatherDict objectForKey:@"weather"]objectAtIndex:0] objectForKey:@"description"] capitalizedString];
    self.icon=[[[weatherDict objectForKey:@"weather"]objectAtIndex:0] objectForKey:@"icon"];
    [self.temperature setObject:weatherDict];
    
    return self;

}

@end
