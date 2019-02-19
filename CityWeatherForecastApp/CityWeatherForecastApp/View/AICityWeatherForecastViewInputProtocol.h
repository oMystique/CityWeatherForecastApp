//
//  AICityWeatherForecastViewInputProtocol.h
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

@class AICityWeatherForecastPlainObject;

@protocol AICityWeatherForecastViewInputProtocol

- (void)showWeatherForecastData:(AICityWeatherForecastPlainObject *)forecastData;
- (void)showObtainingForecastDataProcessingError:(NSString *)errorText;

@end
