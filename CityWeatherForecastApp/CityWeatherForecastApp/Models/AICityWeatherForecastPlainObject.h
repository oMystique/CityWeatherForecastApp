//
//  AICityWeatherForecastPlainObject.h
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN

@interface AICityWeatherForecastPlainObject : NSObject

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
                        sunsetTime:(NSString *)sunsetTime;

//Main information block
@property (readonly, strong) NSString *cityName;
@property (readonly, strong) NSString *weatherCharacteristic;

//Temperature block
@property (readonly, assign) CGFloat tempInCelsius;
@property (readonly, assign) CGFloat pressure;
@property (readonly, assign) CGFloat humidity;
@property (readonly, assign) CGFloat minTempInCelsius;
@property (readonly, assign) CGFloat maxTempInCelsius;

//Wind block
@property (readonly, assign) CGFloat windSpeed;
@property (readonly, strong) NSString *windDirection;

//Sun actions
@property (readonly, strong) NSString *sunriseTime;
@property (readonly, strong) NSString *sunsetTime;

@end

NS_ASSUME_NONNULL_END
