//
//  AIOpenWeaherMapParsedDataProtocol.h
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//


@protocol AIOpenWeaherMapParsedDataProtocol

- (NSString *)cityName;
- (NSString *)weatherCharacteristic;
- (CGFloat)temperatureInKelvin;
- (CGFloat)pressure;
- (CGFloat)humidity;
- (CGFloat)minTempInKelvin;
- (CGFloat)maxTempInKelvin;
- (CGFloat)windSpeed;
- (CGFloat)windDegree;
- (NSUInteger)sunriseTimestamp;
- (NSUInteger)sunsetTimestamp;

@end
