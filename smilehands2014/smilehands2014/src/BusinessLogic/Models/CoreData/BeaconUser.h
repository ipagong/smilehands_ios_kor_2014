//
//  BeaconUser.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface BeaconUser : NSManagedObject <SHCommonModelProtocol>

@property (nonatomic, retain) NSString * majorId;
@property (nonatomic, retain) NSString * minorId;
@property (nonatomic, retain) NSString * uuid;
@property (nonatomic, retain) NSString * statusCode;
@property (nonatomic, retain) NSString * macAddress;
@property (nonatomic, retain) NSString * userId;
@property (nonatomic, retain) NSString * userImage;
@property (nonatomic, retain) NSNumber * markDeleted;

#pragma mark - predicate methods

+ (NSPredicate *)predicateExistBeaconUser;
+ (NSPredicate *)predicateExistBeaconUserWithStatusCode:(NSString *)statusCode;

#pragma mark - sortDescriptor

+ (NSString *)sortByCreateMajorId;

@end
