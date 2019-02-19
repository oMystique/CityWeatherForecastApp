//
//  AICityWeatherForecastTimeoutService.h
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AICityWeatherForecastTimeoutServiceProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface AICityWeatherForecastTimeoutService : NSObject<AICityWeatherForecastTimeoutServiceProtocol>

- (instancetype)initWithTimeoutValue:(NSInteger)timeoutValue;

@end

NS_ASSUME_NONNULL_END
