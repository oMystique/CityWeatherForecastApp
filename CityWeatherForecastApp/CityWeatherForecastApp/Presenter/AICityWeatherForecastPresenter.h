//
//  AICityWeatherForecastPresenter.h
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AICityWeatherForecastInteractorOutputProtocol.h"
#import "AICityWeatherForecastViewOutputProtocol.h"

@protocol AICityWeatherForecastViewInputProtocol;
@protocol AICityWeatherForecastInteractorInputProtocol;

NS_ASSUME_NONNULL_BEGIN

@interface AICityWeatherForecastPresenter : NSObject<AICityWeatherForecastInteractorOutputProtocol,
                                                    AICityWeatherForecastViewOutputProtocol>

- (instancetype)initWithInteractor:(id<AICityWeatherForecastInteractorInputProtocol>)interactor;

@property (nonatomic, strong) id<AICityWeatherForecastViewInputProtocol> view;
//Alarm! Router not needed in this task :)

@end

NS_ASSUME_NONNULL_END
