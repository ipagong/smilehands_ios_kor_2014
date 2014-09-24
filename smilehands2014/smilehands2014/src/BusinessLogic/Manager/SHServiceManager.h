//
//  SHServiceManager.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHServiceManager : NSObject

+ (void)etiquetteListWithMajorId:(NSString *)majorId
                      completion:(void (^)(id result))completion
                         failure:(void (^)(id error, BOOL isCancelled))failure;

+ (void)registBeaconInfoWithMacAddr:(NSString *)macAddr
                         completion:(void (^)(id result))completion
                            failure:(void (^)(id error, BOOL isCancelled))failure;

+ (void)findLostInfoWithMacAddr:(NSArray *)macAddrList
                       lostCode:(NSString *)lostCode
                     completion:(void (^)(id result))completion
                        failure:(void (^)(id error, BOOL isCancelled))failure;

+ (void)notifyLostInfoWithMacAddr:(NSString *)macAddr
                             date:(NSDate *)date
                         latitude:(NSString *)latitude
                        longitude:(NSString *)longitude
                       completion:(void (^)(id result))completion
                          failure:(void (^)(id error, BOOL isCancelled))failure;

@end
