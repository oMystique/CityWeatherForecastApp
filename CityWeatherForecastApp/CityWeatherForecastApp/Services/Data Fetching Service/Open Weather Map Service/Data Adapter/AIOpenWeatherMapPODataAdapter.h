//
//  AIOpenWeatherMapPODataAdapter.h
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

@class AICityWeatherForecastPlainObject;
@protocol AIOpenWeaherMapParsedDataProtocol;

@interface AIOpenWeatherMapPODataAdapter : NSObject

+ (AICityWeatherForecastPlainObject *)adaptPlainObjectFromOpenWeatherMapData:(id<AIOpenWeaherMapParsedDataProtocol>)data;

@end
