//
//  AICityWeatherForecastAppConfigurator.m
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AICityWeatherForecastConfigurator.h"
#import "AICityWeatherForecastInteractor.h"
#import "AICityWeatherForecastPresenter.h"
#import "AIOpenWeatherMapNetworkService.h"
#import "AICityWeatherForecastViewController.h"
#import "AICityWeatherForecastDataFetchingServiceProtocol.h"
#import "AICityWeatherForecastTimeOutServiceProtocol.h"
#import "AICityWeatherForecastTimeOutService.h"

@implementation AICityWeatherForecastConfigurator

+ (void)configureForView:(AICityWeatherForecastViewController *)view {
    
    const NSInteger fetchingTimeout = 10;
    
    id<AICityWeatherForecastDataFetchingServiceProtocol> dataFetchingService = [AICityWeatherForecastConfigurator configureDataFetchingService];
    id<AICityWeatherForecastTimeoutServiceProtocol> timeoutService = [[AICityWeatherForecastTimeoutService alloc] initWithTimeoutValue:fetchingTimeout];
    
    AICityWeatherForecastInteractor *interactor = [[AICityWeatherForecastInteractor alloc] initWithCityWeatherForecastDataFetchingService:dataFetchingService andTimeoutService:timeoutService];
    AICityWeatherForecastPresenter *presenter = [[AICityWeatherForecastPresenter alloc] initWithInteractor:interactor];
    
    interactor.presenter = presenter;
    view.presenter = presenter;
    presenter.view = view;
    
    dataFetchingService.delegate = interactor;
    timeoutService.delegate = interactor;
}

+ (id<AICityWeatherForecastDataFetchingServiceProtocol>)configureDataFetchingService {
    NSInteger cityMoscowId = 524901;
    NSString *apiKey = @"f58a07a2c27de1847baf266a3011231a";
    
    return [[AIOpenWeatherMapNetworkService new] initWithCityId:cityMoscowId andApiKey:apiKey];
}

@end
