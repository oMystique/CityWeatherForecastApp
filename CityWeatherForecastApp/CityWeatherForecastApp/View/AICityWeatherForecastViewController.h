//
//  AICityWeatherForecastViewController.h
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AICityWeatherForecastViewInputProtocol.h"

@protocol AICityWeatherForecastViewOutputProtocol;

@interface AICityWeatherForecastViewController : UIViewController<AICityWeatherForecastViewInputProtocol>

@property (nonatomic, strong) id<AICityWeatherForecastViewOutputProtocol> presenter;

@end

