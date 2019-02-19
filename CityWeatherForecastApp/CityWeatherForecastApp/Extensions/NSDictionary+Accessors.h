//
//  NSDictionary+Accessors.h
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Accessors)

- (NSString*)stringValueForKey:(NSString*)key withDefaultValue:(NSString*)defaultValue;
- (NSInteger)integerValueForKey:(NSString*)key withDefaultValue:(NSInteger)defaultValue;
- (CGFloat)floatValueForKey:(NSString*)key withDefaultValue:(CGFloat)defaultValue;
- (NSArray*)arrayValueForKey:(NSString *)key withDefaultValue:(NSArray*)array;

@end
