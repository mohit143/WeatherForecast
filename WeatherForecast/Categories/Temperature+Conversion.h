//
//  Temperature+Conversion.h
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 23/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

@interface Temperature (Conversion)

- (Temperature *)convertIntoCelsius:(Temperature *)Fahrenheit;
- (Temperature *)convertIntoFahrenheit:(Temperature *)Celsius;

@end
