//
//  Weather.h
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 23/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

@interface Weather : NSObject

@property(nonatomic)float pressure;
@property(nonatomic)float humidity;
@property(nonatomic)float speed;
@property(nonatomic)float degree;
@property(nonatomic)float clouds;
@property(nonatomic)float rain;
@property(nonatomic)NSString *weatherDescription;
@property(nonatomic)NSString *place;
@property(nonatomic)NSString *icon;
@property(nonatomic)NSDate *date;
@property(strong,nonatomic)Temperature *temperature;

-(Weather *)setObject:(NSDictionary *)weatherDict;
@end
