//
//  AICityWeatherForecastNetworkService.m
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AIOpenWeatherMapNetworkService.h"
#import "AINetworkTask.h"
#import "AICityWeatherForecastPlainObject.h"
#import "AIOpenWeatherMapDataParser.h"
#import "AIOpenWeaherMapParsedDataProtocol.h"
#import "AIOpenWeatherMapPODataAdapter.h"

static NSString* const kOpenWeatherMapCityDataAccessingByIdPathFormat = @"http://api.openweathermap.org/data/2.5/weather?id=%ld&APPID=%@";

@interface AIOpenWeatherMapNetworkService ()
@property (nonatomic, strong) AINetworkTask *task;
@property (nonatomic, assign) NSInteger openWeatherMapCityId;
@property (nonatomic, strong) NSString *openWeatherApiKey;
@end

@implementation AIOpenWeatherMapNetworkService

@synthesize delegate = _delegate;

- (instancetype)initWithCityId:(NSInteger)cityId andApiKey:(NSString *)openWeatherApiKey {
    self = [super init];
    
    if (self) {
        self.openWeatherMapCityId = cityId;
        self.openWeatherApiKey = openWeatherApiKey;
    }
    
    return self;
}

- (void)fetchWeatherData {
    
    NSAssert(_delegate, @"AIOpenWeatherMapNetworkService: delegate is nil");
    
    [self cancelCurrentTaskIfNeeded];
    [self configureTask];
    [self runTaskIfPossible];
}

- (void)cancelCurrentTaskIfNeeded {
    if (_task) {
        [_task cancel];
        _task = nil;
    }
}

- (void)configureTask {
    
    NSURLRequest *request = [self makeRequest];
    
    __weak typeof(self) weakSelf = self;
    
    _task = [AINetworkTask taskWithRequest:request withSuccessBlock:^(id  _Nullable info) {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) {
            NSLog(@"AIOpenWeatherMapNetworkService: %@", @"Service object desctructed");
            return;
        }
        
        AICityWeatherForecastPlainObject *plainObj = [strongSelf parseFetchedData:info];
        [strongSelf.delegate cityWeatherForecastDataWasFetched:plainObj];
        
    } andFailureBlock:^(NSError * _Nullable error) {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) {
            NSLog(@"AIOpenWeatherMapNetworkService: %@", @"Service object desctructed");
            return;
        }
        [strongSelf.delegate cityWeatherForecastFetchingHasError:error];
    }];
}

- (void)runTaskIfPossible {
    if (_task) {
        [_task run];
    }
    else {
        NSLog(@"AIOpenWeatherMapNetworkService: %@", @"Task was not configured");
    }
}

- (NSURLRequest *)makeRequest {
    NSURL *url = [self openWeatherMapApiUrl];
    return [[NSMutableURLRequest new] initWithURL:url];
}

- (NSURL *)openWeatherMapApiUrl {
    NSString *pathWithCityId = [NSString stringWithFormat:kOpenWeatherMapCityDataAccessingByIdPathFormat,
                                _openWeatherMapCityId,
                                _openWeatherApiKey];
    return [NSURL URLWithString:pathWithCityId];
}

- (AICityWeatherForecastPlainObject *)parseFetchedData:(NSData *)data {
    
    AICityWeatherForecastPlainObject *output = nil;
    @try {
        id<AIOpenWeaherMapParsedDataProtocol> parsedData = [AIOpenWeatherMapDataParser parseData:data];
        output = [AIOpenWeatherMapPODataAdapter adaptPlainObjectFromOpenWeatherMapData:parsedData];
    } @catch (NSException *exception) {
        NSLog(@"AIOpenWeatherMapNetworkService: exception (parsing) - %@", exception.reason);
    } @finally {
        return output;
    }
}

@end
