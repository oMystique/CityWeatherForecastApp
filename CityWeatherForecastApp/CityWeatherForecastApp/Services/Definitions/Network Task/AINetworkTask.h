//
//  AINetworkTask.h
//  CityWeatherForecastApp
//
//  Created by user on 19/02/2019.
//  Copyright © 2019 a.ildarkin. All rights reserved.
//

typedef void (^NetworkTaskSuccessCallback)(__nullable id info);
typedef void (^NetworkTaskFailureCallback)(NSError* __nullable error);

NS_ASSUME_NONNULL_BEGIN

@interface AINetworkTask : NSObject

+ (AINetworkTask * _Nullable)taskWithRequest:(NSURLRequest *)request
                            withSuccessBlock:(NetworkTaskSuccessCallback)successBlock
                             andFailureBlock:(NetworkTaskFailureCallback)failureBlock;
- (void)run;
- (void)cancel;

// main thread by default
@property (nonatomic, strong, nonnull) dispatch_queue_t completionQueue;

@end

NS_ASSUME_NONNULL_END
