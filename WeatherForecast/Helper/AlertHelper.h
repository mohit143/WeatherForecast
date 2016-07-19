//
//  AlertHelper.h
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 23/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

@interface AlertHelper : NSObject

+(void) displayAlert:(NSString *)messageString withDelegate:(UIViewController *)controller;
+(void) displayAlertBlock:(NSString *)messageString forViewController:(UIViewController *)controller withCallBack:(AllApi)alertCallBack;

@end
