//
//  SHBeaconUserManager.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 28..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHBeaconUserManager : NSObject

@property (nonatomic, assign) float longitude;
@property (nonatomic, assign) float latitude;

@property (nonatomic, strong) NSMutableOrderedSet *lostMacAddressList;

+ (instancetype)sharedInstance;

- (void)startUpdateLocation;
- (void)finishTracking;

- (void)unregistNotification;
- (void)registNotification;

@end
