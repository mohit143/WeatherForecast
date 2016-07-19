//
//  Temperature.h
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 23/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

@interface Temperature : NSObject

@property(nonatomic)float morningTemperature;
@property(nonatomic)float dayTemperature;
@property(nonatomic)float eveningTemperature;
@property(nonatomic)float nightTemperature;
@property(nonatomic)float minTemperature;
@property(nonatomic)float maxTemperature;

-(Temperature *)setObject:(NSDictionary *)weatherDict;

@end
