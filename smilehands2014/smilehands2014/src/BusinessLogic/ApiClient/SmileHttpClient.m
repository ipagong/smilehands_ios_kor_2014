//
//  SmileHttpClient.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 21..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SmileHTTPClient.h"

#define SMILE_HANDS_HTTP_METHOD_POST @"POST"
#define SMILE_HANDS_HTTP_METHOD_GET  @"GET"

@implementation SmileHTTPClient

+ (instancetype)apiClient;
{
    static SmileHTTPClient * apiClient = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        apiClient = [[SmileHTTPClient alloc] initWithBaseURL:[NSURL URLWithString:SMILE_HANDS_BASE_URL_STRING]];
        apiClient.requestSerializer  = [AFHTTPRequestSerializer serializer];
        apiClient.responseSerializer = [AFJSONResponseSerializer serializer];
        
        [apiClient.operationQueue setMaxConcurrentOperationCount:1];
    });
    
    return apiClient;
}

#pragma mark -
#pragma mark Result Parse

- (NSURLSessionDataTask *)postPath:(NSString *)path
                        parameters:(NSDictionary *)parameters
                        completion:(void (^)(id result))completion
                           failure:(void (^)(id error, BOOL isCancelled))failure
{
    return [self POST:path parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {

        if (responseObject == nil) {
             if (failure) failure(nil, NO);
        }
        
        if (completion) completion(responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self removeCookieData];
        
        if (failure) failure(error, task.state == NSURLSessionTaskStateCanceling);
        
    }];
}


- (NSURLSessionDataTask *)getPath:(NSString *)path
                       parameters:(NSDictionary *)parameters
                       completion:(void (^)(id result))completion
                          failure:(void (^)(id error, BOOL isCancelled))failure
{
    return [self GET:path parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        if (responseObject == nil) {
            if (failure) failure(nil, NO);
        }
        
        if (completion) completion(responseObject);
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        [self removeCookieData];
        
        if (failure) failure(error, task.state == NSURLSessionTaskStateCanceling);
        
    }];
}

- (void)removeCookieData
{
    NSHTTPCookieStorage *storage = [NSHTTPCookieStorage sharedHTTPCookieStorage];
    for (NSHTTPCookie *cookie in [storage cookies]) {
        [storage deleteCookie:cookie];
    }
}

@end
