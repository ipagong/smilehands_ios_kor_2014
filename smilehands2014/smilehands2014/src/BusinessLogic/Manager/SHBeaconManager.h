//
//  SHBeaconManager.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 21..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const SHBeaconManagerNotificationDidUpdate;
extern NSString * const SHBeaconManagerNotificationDidFind;
extern NSString * const SHBeaconManagerNotificationDidLostNotify;

@interface SHBeaconManager : NSObject

+ (instancetype)sharedInstance;

- (void)updateValidUUIDs:(NSArray *)uuids;
- (void)cleanUp;

- (void)scanDevice;

@property (nonatomic, strong, readonly) NSArray *validDevices;
@property (nonatomic, assign, readonly) BOOL isRunning;

@end
