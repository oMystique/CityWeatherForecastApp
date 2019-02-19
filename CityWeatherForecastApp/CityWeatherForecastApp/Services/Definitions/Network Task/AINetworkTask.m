//
//  AINetworkTask.m
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

#import "AINetworkTask.h"
#import <AFNetworking/AFHTTPRequestOperation.h>

static const NSTimeInterval kDefaultTimeoutIntervalInSeconds = 120;

@interface AINetworkTask ()
@property (nonatomic, strong, nonnull) AFHTTPRequestOperation *operation;
@property (nonatomic, strong) NetworkTaskSuccessCallback successBlock;
@property (nonatomic, strong) NetworkTaskFailureCallback failureBlock;
@end

@implementation AINetworkTask

+ (AINetworkTask * _Nullable)taskWithRequest:(NSURLRequest *)request
                            withSuccessBlock:(NetworkTaskSuccessCallback)successBlock
                             andFailureBlock:(NetworkTaskFailureCallback)failureBlock {
    
    if (!request) {
        return nil;
    }
    
    NSMutableURLRequest *mutableRequestCopy = [request mutableCopy];
    [mutableRequestCopy setTimeoutInterval:kDefaultTimeoutIntervalInSeconds];
    
    return [[AINetworkTask new] initWithRequest:mutableRequestCopy
                               withSuccessBlock:successBlock
                                andFailureBlock:failureBlock];
}

- (instancetype)initWithRequest:(NSURLRequest *)request
               withSuccessBlock:(NetworkTaskSuccessCallback)successBlock
                andFailureBlock:(NetworkTaskFailureCallback)failureBlock {
    NSParameterAssert(request);
    
    self = [super init];
    if (self) {
        _completionQueue = dispatch_get_main_queue();
        _successBlock = successBlock;
        _failureBlock = failureBlock;
        _operation = [[AFHTTPRequestOperation new] initWithRequest:request];
    }
    
    return self;
}

- (void)dealloc {
    if (_operation) {
        [_operation cancel];
    }
}

- (void)run {
    
    __weak typeof(self) weakSelf = self;
    
    [_operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) {
            NSLog(@"AINetworkTask: %@", @"Task object desctructed");
            return;
        }
        
        strongSelf.successBlock(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (!strongSelf) {
            NSLog(@"AINetworkTask: %@", @"Task object desctructed");
            return;
        }
        
        strongSelf.failureBlock(error);
    }];
    
    _operation.completionQueue = _completionQueue;
    
    if (![_operation isExecuting]) {
        [_operation start];
    }
}

- (void)cancel {
    [_operation cancel];
    _operation = nil;
}

@end
