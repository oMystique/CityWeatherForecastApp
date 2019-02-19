//
//  AICityWeatherForecastDataFetchingServiceDelegate.h
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

@class AICityWeatherForecastPlainObject;

@protocol AICityWeatherForecastDataFetchingServiceDelegate

- (void)cityWeatherForecastDataWasFetched:(AICityWeatherForecastPlainObject *)cityWeatherForecaseData;
- (void)cityWeatherForecastFetchingHasError:(NSError *)error;

@end
