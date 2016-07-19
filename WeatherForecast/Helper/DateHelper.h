//
//  DateHelper.h
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 24/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

@interface DateHelper : NSObject
+ (NSComparisonResult)compareOnlyDates:(NSDate *)date1 toDate:(NSDate *)date2;
@end
