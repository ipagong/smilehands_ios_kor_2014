//
//  SHServiceManager.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHServiceManager.h"
#import "SmileHTTPClient.h"

#define KServiceParameterPublish @"P"

@implementation SHServiceManager


+ (void)etiquetteListLastDate:(NSDate *)date
                   completion:(void (^)(id result))completion
                      failure:(void (^)(id error, BOOL isCancelled))failure
{
    NSString *lastDateString = nil;
    
    if (date == nil) {
        lastDateString = @"1986-04-08 00:00:00";
    } else {
        lastDateString = [AppUtility dateStringWithDate:date];
    }
    
    NSDictionary *parameter = @{@"lastDate": lastDateString,
                                @"status" : KServiceParameterPublish};
    
    [[SmileHTTPClient apiClient] postPath:@"/etiquette/list.do"
                               parameters:parameter
                               completion:^(id result) {
                                   
                                   if ([result isKindOfClass:[NSDictionary class]] == NO) {
                                       if (failure) failure(nil, NO);
                                       return;
                                   }
                                   
                                   NSDictionary *contents = result;
                                   
                                   NSArray *list = contents[@"list"];
                                   
                                   NSMutableArray *resultList = [[NSMutableArray alloc] initWithCapacity:list.count];
                                   
                                   [list enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                                       [resultList addObject:[[SHEtiquetteResponseModel alloc] initWithDictionary:obj]];
                                   }];
                                   
                                   if (completion)
                                       completion(resultList);
                                   
                               } failure:failure];
}


+ (void)registBeaconInfoWithMacAddr:(NSString *)macAddr
                         completion:(void (^)(id result))completion
                            failure:(void (^)(id error, BOOL isCancelled))failure
{
    NSDictionary *parameter = @{@"majorId":@""};
    
    [[SmileHTTPClient apiClient] postPath:@"/beacon/insert.do"
                               parameters:parameter
                               completion:^(id result) {
                                   
                               } failure:failure];
}

+ (void)findLostInfoWithMacAddr:(NSArray *)macAddrList
                       lostCode:(NSString *)lostCode
                     completion:(void (^)(id result))completion
                        failure:(void (^)(id error, BOOL isCancelled))failure
{
    NSDictionary *parameter = @{@"majorId":@""};
    
    [[SmileHTTPClient apiClient] postPath:@"/beacon/find.do"
                               parameters:parameter
                               completion:^(id result) {
                                   
                               } failure:^(id error, BOOL isCancelled) {
                                   
                               }];
}

+ (void)notifyLostInfoWithMacAddr:(NSString *)macAddr
                             date:(NSDate *)date
                         latitude:(NSString *)latitude
                        longitude:(NSString *)longitude
                       completion:(void (^)(id result))completion
                          failure:(void (^)(id error, BOOL isCancelled))failure
{
    NSDictionary *parameter = @{@"majorId":@""};
    
    [[SmileHTTPClient apiClient] postPath:@"/lost/insert.do"
                               parameters:parameter
                               completion:^(id result) {
                                   
                               } failure:^(id error, BOOL isCancelled) {
                                   
                               }];
}

@end
