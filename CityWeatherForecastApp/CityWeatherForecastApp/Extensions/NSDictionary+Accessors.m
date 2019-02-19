//
//  NSDictionary+Accessors.m
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "NSDictionary+Accessors.h"

@implementation NSDictionary(Accessors)

- (NSString*)stringValueForKey:(NSString*)key withDefaultValue:(NSString*)defaultValue {
    return [self valueForKey:key withDefaultValue:defaultValue forClass:[NSString class]];
}

- (NSInteger)integerValueForKey:(NSString*)key withDefaultValue:(NSInteger)defaultValue {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value integerValue];
    }
    if ([value isKindOfClass:[NSString class]]) {
        return [value integerValue];
    }
    return defaultValue;
}

- (CGFloat)floatValueForKey:(NSString*)key withDefaultValue:(CGFloat)defaultValue {
    id value = [self objectForKey:key];
    if ([value isKindOfClass:[NSNumber class]]) {
        return [value floatValue];
    }
    if ([value isKindOfClass:[NSString class]]) {
        return [value floatValue];
    }
    return defaultValue;
}

- (NSArray*)arrayValueForKey:(NSString *)key withDefaultValue:(NSArray*)array
{
    return [self valueForKey:key withDefaultValue:array forClass:[NSArray class]];
}

#pragma mark - imlementation

- (id)valueForKey:(NSString*)key withDefaultValue:(id)defaultValue forClass:(Class)valueClass {
    id value = [self objectForKey:key];
    if (value == nil) {
        return defaultValue;
    }
    if (![value isKindOfClass:valueClass]) {
        return defaultValue;
    }
    return value;
}

@end
