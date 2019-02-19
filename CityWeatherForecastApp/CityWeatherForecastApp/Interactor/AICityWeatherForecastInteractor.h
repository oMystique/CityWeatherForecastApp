//
//  AICityWeatherForecastInteractor.h
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AICityWeatherForecastInteractorInputProtocol.h"
#import "AICityWeatherForecastTimeoutServiceDelegate.h"
#import "AICityWeatherForecastDataFetchingServiceDelegate.h"
#import "AICityWeatherForecastTimeoutServiceDelegate.h"

@protocol AICityWeatherForecastDataFetchingServiceProtocol;
@protocol AICityWeatherForecastInteractorOutputProtocol;
@protocol AICityWeatherForecastTimeoutServiceProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface AICityWeatherForecastInteractor : NSObject<AICityWeatherForecastInteractorInputProtocol,
                                AICityWeatherForecastTimeoutServiceDelegate,
                                AICityWeatherForecastDataFetchingServiceDelegate>

- (instancetype)initWithCityWeatherForecastDataFetchingService:(id<AICityWeatherForecastDataFetchingServiceProtocol>)dataFetchingService andTimeoutService:(id<AICityWeatherForecastTimeoutServiceProtocol>)timeoutService;

@property (nonatomic, weak) id<AICityWeatherForecastInteractorOutputProtocol> presenter;

@end

NS_ASSUME_NONNULL_END
