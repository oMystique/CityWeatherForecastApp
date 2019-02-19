//
//  AICityWeatherForecastTimeoutService.m
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AICityWeatherForecastTimeoutService.h"

@interface AICityWeatherForecastTimeoutService ()
@property (nonatomic, assign) NSInteger timeoutValue;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation AICityWeatherForecastTimeoutService

@synthesize delegate = _delegate;

- (instancetype)initWithTimeoutValue:(NSInteger)timeoutValue {
    
    self = [super init];
    
    if (self) {
        self.timeoutValue = timeoutValue;
    }
    
    return self;
}

- (void)startTimer {
    
    if (_timer) {
        [self stopTimer];
    }
    
    __weak typeof(self) weakSelf = self;
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:_timeoutValue repeats:YES block:^(NSTimer * _Nonnull timer) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) {
            NSLog(@"AICityWeatherForecastTimeoutService: %@", @"Timer object desctructed");
            return;
        }
        
        [strongSelf.delegate didTriggerTimer];
    }];
}

- (void)stopTimer {
    [_timer invalidate];
    _timer = nil;
}

@end
