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

- (AFHTTPRequestOperation *)postPath:(NSString *)path
                          parameters:(NSDictionary *)parameters
                          completion:(void (^)(id result))completion
                             failure:(void (^)(id error, BOOL isCancelled))failure
{
    NSString *urlString = [[self.baseURL absoluteString] stringByAppendingString:path];
    
    NSDictionary *convertedParameters = [self convertParameterKeyPairArrayToSet:parameters];
    
    NSMutableURLRequest * request = [self.requestSerializer requestWithMethod:@"POST"
                                                                    URLString:urlString
                                                                   parameters:convertedParameters
                                                                        error:nil];
    
    NSLog(@"request = %@", request);
    
    AFHTTPRequestOperation * operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation * operation, id responseObject) {
        
        NSError * error = nil;
        id result = [self resultForOperation:operation error:&error];
        
        if (error) {
            result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            error = nil;
        }
        
        
        if (error) {
            if (failure) failure(error, NO);
        }
        
        if (result == nil) {
            if (failure) failure(nil, NO);
        }
        
        if (completion) completion(result);
        
    } failure:^(AFHTTPRequestOperation * operation, NSError * error) {
        
        if (failure) failure(error, operation.cancelled);
        
    }];
    
    return operation;
}

- (NSDictionary *)convertParameterKeyPairArrayToSet:(NSDictionary *)parameters
{
    NSMutableDictionary *convertedParameters = [NSMutableDictionary dictionary];
    
    for (id key in parameters.allKeys) {
        
        id value = parameters[key];
        
        if ([value isKindOfClass:[NSArray class]] == YES) {
            
            NSArray *arrayValue = value;
            
            NSSet *convertedSet = [NSSet setWithArray:arrayValue];
            
            [convertedParameters setObject:convertedSet forKey:key];
            
        } else {
            [convertedParameters setObject:value forKey:key];
        }
    }
    
    return convertedParameters;
}

- (id)resultForOperation:(AFHTTPRequestOperation *)operation error:(NSError **)error {

    return [NSJSONSerialization JSONObjectWithData:operation.responseData options:0 error:error];
}


@end
