//
//  AIOpenWeatherMapNetworkService.h
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AICityWeatherForecastDataFetchingServiceProtocol.h"

@class AICityWeatherForecastPlainObject;

NS_ASSUME_NONNULL_BEGIN

@interface AIOpenWeatherMapNetworkService : NSObject<AICityWeatherForecastDataFetchingServiceProtocol>

- (instancetype)initWithCityId:(NSInteger)cityId andApiKey:(NSString *)openWeatherApiKey;

@end

NS_ASSUME_NONNULL_END
