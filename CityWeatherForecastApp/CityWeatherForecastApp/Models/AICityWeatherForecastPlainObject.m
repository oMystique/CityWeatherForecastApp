//
//  AICityWeatherForecastPlainObject.m
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AICityWeatherForecastPlainObject.h"

@implementation AICityWeatherForecastPlainObject

+ (id)createWithCityName:(NSString *)cityName
                            weatherCharacteristic:(NSString *)weatherCharacteristic
                            tempInCelsius:(CGFloat)tempInCelsius
                            pressure:(CGFloat)pressure
                            humidity:(CGFloat)humidity
                            minTempInCelsius:(CGFloat)minTempInCelsius
                            maxTempInCelsius:(CGFloat)maxTempInCelsius
                            windSpeed:(CGFloat)windSpeed
                            windDirection:(NSString *)windDirection
                            sunriseTime:(NSString *)sunriseTime
                            sunsetTime:(NSString *)sunsetTime {
    
    AICityWeatherForecastPlainObject *obj = [AICityWeatherForecastPlainObject new];
    [obj loadWithCityName:cityName
        weatherCharacteristic:weatherCharacteristic
            tempInCelsius:tempInCelsius
                 pressure:pressure
                 humidity:humidity
         minTempInCelsius:minTempInCelsius
         maxTempInCelsius:maxTempInCelsius
                windSpeed:windSpeed
            windDirection:windDirection
              sunriseTime:sunriseTime
               sunsetTime:sunsetTime];
    
    return obj;
}

- (void)loadWithCityName:(NSString *)cityName
                            weatherCharacteristic:(NSString *)weatherCharacteristic
                            tempInCelsius:(CGFloat)tempInCelsius
                            pressure:(CGFloat)pressure
                            humidity:(CGFloat)humidity
                            minTempInCelsius:(CGFloat)minTempInCelsius
                            maxTempInCelsius:(CGFloat)maxTempInCelsius
                            windSpeed:(CGFloat)windSpeed
                            windDirection:(NSString *)windDirection
                            sunriseTime:(NSString *)sunriseTime
                            sunsetTime:(NSString *)sunsetTime {
    
    _cityName = cityName;
    _weatherCharacteristic = weatherCharacteristic;
    _tempInCelsius = tempInCelsius;
    _pressure = pressure;
    _humidity = humidity;
    _minTempInCelsius = minTempInCelsius;
    _maxTempInCelsius = maxTempInCelsius;
    _windSpeed = windSpeed;
    _windDirection = windDirection;
    _sunriseTime = sunriseTime;
    _sunsetTime = sunsetTime;
}

@end
