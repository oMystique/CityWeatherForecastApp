//
//  AICityWeatherForecastPresenter.m
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AICityWeatherForecastPresenter.h"
#import "AICityWeatherForecastInteractorInputProtocol.h"
#import "AICityWeatherForecastViewInputProtocol.h"
#import "AICityWeatherForecastPlainObject.h"

@interface AICityWeatherForecastPresenter ()
@property (nonatomic, strong) id<AICityWeatherForecastInteractorInputProtocol> interactor;
@end

@implementation AICityWeatherForecastPresenter

- (instancetype)initWithInteractor:(id<AICityWeatherForecastInteractorInputProtocol>)interactor {
    NSAssert(interactor, @"AICityWeatherForecastPresenter: interactor is nil");
    
    self = [super init];
    if (self) {
        self.interactor = interactor;
    }
    
    return self;
}

#pragma mark - AICityWeatherForecastViewOutputProtocol

- (void)viewIsReady {
    [_interactor obtainForecast];
}

#pragma mark - AICityWeatherForecastInteractorOutputProtocol

- (void)weatherForecastDataReady:(AICityWeatherForecastPlainObject *)forecastData {
    [_view showWeatherForecastData:forecastData];
}

- (void)obtainingForecastDataHasError:(NSString *)error {
    [_view showObtainingForecastDataProcessingError:error];
}

@end
