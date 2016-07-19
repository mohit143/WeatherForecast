//
//  Temperature+Conversion.m
//  WeatherForecast
//
//  Created by MOHIT MATHUR on 23/06/16.
//  Copyright © 2016 mohit. All rights reserved.
//

@implementation Temperature (Conversion)

#pragma mark - Public

- (Temperature *)convertIntoCelsius:(Temperature *)fahrenheit
{
    //Converting Fahrenheit to Celsius
    fahrenheit.morningTemperature = [self celsiusConversion:fahrenheit.morningTemperature];
    fahrenheit.dayTemperature = [self celsiusConversion:fahrenheit.dayTemperature];
    fahrenheit.eveningTemperature = [self celsiusConversion:fahrenheit.eveningTemperature];
    fahrenheit.nightTemperature = [self celsiusConversion:fahrenheit.nightTemperature];
    fahrenheit.minTemperature = [self celsiusConversion:fahrenheit.minTemperature];
    fahrenheit.maxTemperature = [self celsiusConversion:fahrenheit.maxTemperature];
    return fahrenheit;
    
}
- (Temperature *)convertIntoFahrenheit:(Temperature *)celsius
{
    //Converting Celsius to Fahrenheit
    celsius.morningTemperature = [self fahrenheitConversion:celsius.morningTemperature];
    celsius.dayTemperature = [self fahrenheitConversion:celsius.dayTemperature];
    celsius.eveningTemperature = [self fahrenheitConversion:celsius.eveningTemperature];
    celsius.nightTemperature = [self fahrenheitConversion:celsius.nightTemperature];
    celsius.minTemperature = [self fahrenheitConversion:celsius.minTemperature];
    celsius.maxTemperature = [self fahrenheitConversion:celsius.maxTemperature];
    return celsius;
}

#pragma mark - Public

-(float)celsiusConversion:(float)fahrenheitValue
{
    //Celsius Conversion
    return (fahrenheitValue - 32) / 1.8;
}

-(float)fahrenheitConversion:(float)celsiusValue
{
    //Fahrenheit Conversion
    return (celsiusValue * 1.8) + 32;
}
@end
