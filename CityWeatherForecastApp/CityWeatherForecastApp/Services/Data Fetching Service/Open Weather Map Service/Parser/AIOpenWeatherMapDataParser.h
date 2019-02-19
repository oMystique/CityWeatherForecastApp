//
//  AICityWeatherForecastParser.h
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

@protocol AIOpenWeaherMapParsedDataProtocol;

@interface AIOpenWeatherMapDataParser : NSObject

+ (id<AIOpenWeaherMapParsedDataProtocol>)parseData:(id)jsonData;

@end
