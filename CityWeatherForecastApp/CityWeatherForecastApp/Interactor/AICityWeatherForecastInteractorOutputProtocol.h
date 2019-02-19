//
//  AICityWeatherForecastInteractorOutputProtocol.h
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

@class AICityWeatherForecastPlainObject;

@protocol AICityWeatherForecastInteractorOutputProtocol

- (void)weatherForecastDataReady:(AICityWeatherForecastPlainObject *)forecastData;
- (void)obtainingForecastDataHasError:(NSString *)error;

@end
