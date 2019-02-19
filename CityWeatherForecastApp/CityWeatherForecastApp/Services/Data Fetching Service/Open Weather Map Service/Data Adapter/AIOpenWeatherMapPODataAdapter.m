//
//  AIOpenWeatherMapPODataAdapter.m
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AIOpenWeatherMapPODataAdapter.h"
#import "AIOpenWeaherMapParsedDataProtocol.h"
#import "AICityWeatherForecastPlainObject.h"

@implementation AIOpenWeatherMapPODataAdapter

+ (AICityWeatherForecastPlainObject *)adaptPlainObjectFromOpenWeatherMapData:(id<AIOpenWeaherMapParsedDataProtocol>)data {
    CGFloat tempInCelsius = [AIOpenWeatherMapPODataAdapter adaptTemperatureUnitToCelsiusFromKelvin:data.temperatureInKelvin];
    CGFloat minTempInCelsius = [AIOpenWeatherMapPODataAdapter adaptTemperatureUnitToCelsiusFromKelvin:data.minTempInKelvin];
    CGFloat maxTempInCelsius = [AIOpenWeatherMapPODataAdapter adaptTemperatureUnitToCelsiusFromKelvin:data.maxTempInKelvin];
    NSString *windDirection = [AIOpenWeatherMapPODataAdapter calculateWindDirectionFromDegree:data.windDegree];
    NSString *sunriseDateStr = [AIOpenWeatherMapPODataAdapter adaptTimeFromTimestampString:data.sunriseTimestamp];
    NSString *sunsetDateStr = [AIOpenWeatherMapPODataAdapter adaptTimeFromTimestampString:data.sunsetTimestamp];
    
    
    return [AICityWeatherForecastPlainObject createWithCityName:data.cityName
                                          weatherCharacteristic:data.weatherCharacteristic
                                                  tempInCelsius:tempInCelsius
                                                       pressure:data.pressure
                                                       humidity:data.humidity
                                               minTempInCelsius:minTempInCelsius
                                               maxTempInCelsius:maxTempInCelsius
                                                      windSpeed:data.windSpeed
                                                  windDirection:windDirection
                                                    sunriseTime:sunriseDateStr
                                                     sunsetTime:sunsetDateStr];
}

+ (CGFloat)adaptTemperatureUnitToCelsiusFromKelvin:(CGFloat)temperatureInKelvin {
    return temperatureInKelvin - 273.f;
}

+ (NSString *)calculateWindDirectionFromDegree:(CGFloat)degrees {
    static NSArray *directions;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Initialize array on first call
        directions = @[@"N", @"NNE", @"NE", @"ENE", @"E", @"ESE", @"SE", @"SSE",
                       @"S", @"SSW", @"SW", @"WSW", @"W", @"WNW", @"NW", @"NNW"];
    });
    
    int i = (degrees + 11.25) / 22.5;
    return directions[i % 16];
}

+ (NSString *)adaptTimeFromTimestampString:(NSUInteger)timestamp {
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timestamp];
    NSDateFormatter *formatter= [NSDateFormatter new];
    formatter.dateFormat = @"hh:mm a";
    
    return [formatter stringFromDate:date];
}

@end
