//
//  AICityWeatherForecastTimeoutServiceProtocol.h
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AICityWeatherForecastTimeoutServiceDelegate.h"

@protocol AICityWeatherForecastTimeoutServiceProtocol

- (void)startTimer;
- (void)stopTimer;

@property (nonatomic, weak) id<AICityWeatherForecastTimeoutServiceDelegate> delegate;

@end
