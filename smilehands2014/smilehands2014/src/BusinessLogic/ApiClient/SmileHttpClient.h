//
//  SmileHttpClient.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 21..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "AFHTTPSessionManager.h"
#import "AFHTTPRequestOperation.h"

@interface SmileHTTPClient : AFHTTPSessionManager

+ (instancetype)sharedApiClient;

- (NSURLSessionDataTask *)postPath:(NSString *)path
                        parameters:(NSDictionary *)parameters
                        completion:(void (^)(id result))completion
                           failure:(void (^)(id error, BOOL isCancelled))failure;

- (NSURLSessionDataTask *)getPath:(NSString *)path
                       parameters:(NSDictionary *)parameters
                       completion:(void (^)(id result))completion
                          failure:(void (^)(id error, BOOL isCancelled))failure;

@end
