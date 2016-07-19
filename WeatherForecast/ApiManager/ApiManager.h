//
//  ApiManager.h
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 23/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

@interface ApiManager : NSObject

typedef void (^AllApi)(NSDictionary *result, NSError *error, BOOL success);
+ (void)requestForAllApionView:(UIViewController *)currentController withResponse:(AllApi)callback;

@end
