//
//  DateHelper.m
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 24/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

@implementation DateHelper

//Public Class Methods
+ (NSComparisonResult)compareOnlyDates:(NSDate *)date1 toDate:(NSDate *)date2
{
    //Comparing two Dates excluding time
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSInteger comps = (NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear);
    NSDateComponents *date1Components = [calendar components:comps
                                                    fromDate: date1];
    NSDateComponents *date2Components = [calendar components:comps
                                                    fromDate: date2];
    
    date1 = [calendar dateFromComponents:date1Components];
    date2 = [calendar dateFromComponents:date2Components];
    if ([date1 compare:date2] == NSOrderedSame) {
        return NSOrderedSame;
    }
    else if ([date1 compare:date2] == NSOrderedAscending) {
        return NSOrderedAscending;
    }
    else{
        return NSOrderedDescending;
    }
}

@end
