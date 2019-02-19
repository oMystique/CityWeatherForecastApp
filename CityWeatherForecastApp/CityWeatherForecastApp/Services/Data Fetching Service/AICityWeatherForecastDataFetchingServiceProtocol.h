//
//  AICityWeatherForecastDataFetchingServiceProtocol.h
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AICityWeatherForecastDataFetchingServiceDelegate.h"

@protocol AICityWeatherForecastDataFetchingServiceProtocol

- (void)fetchWeatherData;

@property (nonatomic, weak) id<AICityWeatherForecastDataFetchingServiceDelegate> delegate;

@end
