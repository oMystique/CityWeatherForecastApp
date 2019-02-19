//
//  AIOpenWeatherMapDataParser.m
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AIOpenWeatherMapDataParser.h"
#import "AIOpenWeaherMapParsedDataProtocol.h"
#import "NSDictionary+Accessors.h"

#pragma mark - Json Parse Constants

static NSString* const kWeatherBlock = @"weather";
static NSString* const kWeatherBlockMain = @"main";

static NSString* const kMainBlock = @"main";
static NSString* const kMainBlockTemp = @"temp";
static NSString* const kMainBlockPressure = @"pressure";
static NSString* const kMainBlockHumidity = @"humidity";
static NSString* const kMainBlockMinTemp = @"temp_min";
static NSString* const kMainBlockMaxTemp = @"temp_max";

static NSString* const kWindBlock = @"wind";
static NSString* const kWindBlockSpeed = @"speed";
static NSString* const kWindBlockDegree = @"deg";

static NSString* const kSysBlock = @"sys";
static NSString* const kSysBlockSunrise = @"sunrise";
static NSString* const kSysBlockSunset = @"sunset";

static NSString* const kCityName = @"name";

#pragma mark - Pimp My Impl Idiom for AIOpenWeaherMapParsedDataProtocol

@interface AIOpenWeaherMapParsedDataImpl : NSObject<AIOpenWeaherMapParsedDataProtocol>
@property (nonatomic, strong) NSString *cityName;
@property (nonatomic, strong) NSString *weatherCharacteristic;
@property (nonatomic, assign) CGFloat temperatureInKelvin;
@property (nonatomic, assign) CGFloat pressure;
@property (nonatomic, assign) CGFloat humidity;
@property (nonatomic, assign) CGFloat minTempInKelvin;
@property (nonatomic, assign) CGFloat maxTempInKelvin;
@property (nonatomic, assign) CGFloat windSpeed;
@property (nonatomic, assign) CGFloat windDegree;
@property (nonatomic, assign) NSUInteger sunriseTimestamp;
@property (nonatomic, assign) NSUInteger sunsetTimestamp;
@end

@implementation AIOpenWeaherMapParsedDataImpl
//Not impl
@end

#pragma mark - Implementation of AIOpenWeatherMapDataParser

@implementation AIOpenWeatherMapDataParser

+ (id<AIOpenWeaherMapParsedDataProtocol>)parseData:(id)jsonData {
    
    NSDictionary *jsonDict = [AIOpenWeatherMapDataParser tryToSerializeJsonData:jsonData];
    if (!jsonDict || [jsonDict count] == 0) {
        return nil;
    }
    
    AIOpenWeaherMapParsedDataImpl *outputData = [AIOpenWeaherMapParsedDataImpl new];
    
    outputData.cityName = [jsonDict stringValueForKey:kCityName withDefaultValue:nil];
    NSArray *weatherArray = [jsonDict arrayValueForKey:kWeatherBlock withDefaultValue:nil];
    if (weatherArray && [weatherArray count] != 0) {
        NSDictionary *weatherBlock = [weatherArray objectAtIndex:0];
        outputData.weatherCharacteristic = [weatherBlock stringValueForKey:kWeatherBlockMain withDefaultValue:nil];
    }
    
    NSDictionary *mainBlock = [jsonDict objectForKey:kMainBlock];
    outputData.temperatureInKelvin = [mainBlock floatValueForKey:kMainBlockTemp withDefaultValue:0.f];
    outputData.pressure = [mainBlock floatValueForKey:kMainBlockPressure withDefaultValue:0.f];
    outputData.humidity = [mainBlock floatValueForKey:kMainBlockHumidity withDefaultValue:0.f];
    outputData.minTempInKelvin = [mainBlock floatValueForKey:kMainBlockMinTemp withDefaultValue:0.f];
    outputData.maxTempInKelvin = [mainBlock floatValueForKey:kMainBlockMaxTemp withDefaultValue:0.f];
    
    NSDictionary *windBlock = [jsonDict objectForKey:kWindBlock];
    outputData.windSpeed = [windBlock floatValueForKey:kWindBlockSpeed withDefaultValue:0.f];
    outputData.windDegree = [windBlock floatValueForKey:kWindBlockDegree withDefaultValue:0.f];
    
    NSDictionary *sysBlock = [jsonDict objectForKey:kSysBlock];
    outputData.sunriseTimestamp = [sysBlock integerValueForKey:kSysBlockSunrise withDefaultValue:0];
    outputData.sunsetTimestamp = [sysBlock integerValueForKey:kSysBlockSunset withDefaultValue:0];
    
    return outputData;
}

+ (NSDictionary *)tryToSerializeJsonData:(id)jsonData {
    NSError *error = nil;
    
    id rootObject = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:&error];
    
    if (error) {
        NSLog(@"AIOpenWeatherMapDataParser: %@", [error localizedDescription]);
        return nil;
    }
    
    if (![rootObject isKindOfClass:[NSDictionary class]]) {
        NSLog(@"AIOpenWeatherMapDataParser: %@", @"Could not cast root object to NSDictionary");
        return nil;
    }
    
    return rootObject;
}

+ (NSDictionary *)parseBlockFromJsonDict:(NSDictionary *)jsonDict forKey:(NSString *)key {
    return [jsonDict objectForKey:key];
}

@end
