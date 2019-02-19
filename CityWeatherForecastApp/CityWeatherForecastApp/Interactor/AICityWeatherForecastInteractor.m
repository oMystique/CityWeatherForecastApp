//
//  AICityWeatherForecastInteractor.m
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AICityWeatherForecastInteractor.h"
#import "AICityWeatherForecastDataFetchingServiceProtocol.h"
#import "AICityWeatherForecastTimeoutServiceProtocol.h"
#import "AICityWeatherForecastInteractorOutputProtocol.h"

@interface AICityWeatherForecastInteractor ()
@property (nonatomic, strong) id<AICityWeatherForecastDataFetchingServiceProtocol> dataFetchingService;
@property (nonatomic, strong) id<AICityWeatherForecastTimeoutServiceProtocol> timeoutService;
@property (nonatomic, strong) dispatch_queue_t fetchingDataServiceQueue;
@end

@implementation AICityWeatherForecastInteractor

- (instancetype)initWithCityWeatherForecastDataFetchingService:(id<AICityWeatherForecastDataFetchingServiceProtocol>)dataFetchingService andTimeoutService:(id<AICityWeatherForecastTimeoutServiceProtocol>)timeoutService {
    
    NSAssert(dataFetchingService, @"AICityWeatherForecastInteractor: data fetching service is empty");
    
    self = [super init];
    if (self) {
        _dataFetchingService = dataFetchingService;
        _timeoutService = timeoutService;
        _fetchingDataServiceQueue = dispatch_queue_create("ai.fetching_data_service_queue", DISPATCH_QUEUE_SERIAL);
    }
    
    return self;
}

- (void)startDataFetchingWithTimer {
    [_timeoutService stopTimer];
    
    dispatch_async(_fetchingDataServiceQueue, ^{
        [self.dataFetchingService fetchWeatherData];
    });
    
    [_timeoutService startTimer];
}

#pragma mark - AICityWeatherForecastInteractorInputProtocol

- (void)obtainForecast {
    NSAssert([NSThread isMainThread], @"AICityWeatherForecastInteractor: called not in main thread");
    
    [self startDataFetchingWithTimer];
}

#pragma mark - AICityWeatherForecastDataFetchingServiceDelegate

- (void)cityWeatherForecastDataWasFetched:(AICityWeatherForecastPlainObject *)cityWeatherForecaseData {
    NSAssert([NSThread isMainThread], @"AICityWeatherForecastInteractor: called not in main thread");
    if (cityWeatherForecaseData) {
        [_presenter weatherForecastDataReady:cityWeatherForecaseData];
    }
    else {
        [_presenter obtainingForecastDataHasError:NSLocalizedString(@"PARSING_DATA_ERROR_TEXT", nil)];
    }
}

- (void)cityWeatherForecastFetchingHasError:(NSError *)error {
    NSAssert([NSThread isMainThread], @"AICityWeatherForecastInteractor: called not in main thread");
    [_presenter obtainingForecastDataHasError:error.localizedDescription];
}

#pragma mark - AICityWeatherForecastTimeoutServiceDelegate

- (void)didTriggerTimer {
    NSAssert([NSThread isMainThread], @"AICityWeatherForecastInteractor: called not in main thread");
    [self startDataFetchingWithTimer];
}

@end
