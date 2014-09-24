//
//  SHBeaconManager.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 21..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHBeaconManager.h"

#import "WZBeaconSDK.h"

NSString * const SHBeaconManagerNotificationDidUpdate = @"SHBeaconManagerNotificationDidUpdate";

@interface SHBeaconManager () <WZBeaconBLEManagerDelegate>

@property (nonatomic, strong) NSMutableArray *validUUIDs;

@property (nonatomic, strong) WZBeaconBLEManager *beaconManager;

@property (nonatomic, assign) BOOL isRegistObserving;
@property (nonatomic, assign) BOOL isRunning;
@end

@implementation SHBeaconManager

+ (instancetype)sharedInstance
{
    static SHBeaconManager * manager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[SHBeaconManager alloc] init];
    });
    
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.beaconManager = [WZBeaconBLEManager sharedInstance];
        self.beaconManager.delegate = self;
        
        self.validUUIDs = [[NSMutableArray alloc] init];
    }
    return self;
}

- (CBCentralManager *)centralManager
{
    return self.beaconManager.getManager;
}

- (void)updateValidUUIDs:(NSArray *)uuids
{
    [self.validUUIDs removeAllObjects];
    
    [self.validUUIDs addObjectsFromArray:uuids];
}

- (void)cleanUp
{
    self.isRunning = NO;
    
    [self.beaconManager cleanScannedDevices];
    
    @try {
        [self.beaconManager stopBLEScan];
    }
    @catch (NSException *exception) {
        
    }
}

- (void)scanDevice
{
    [self.beaconManager cleanScannedDevices];
    [self.beaconManager startBLEScan];

    self.isRunning = YES;
}

- (void)stopScan
{
   [self.beaconManager stopBLEScan];
    
    self.isRunning = NO;
}

#pragma mark - WZBeaconBLEManagerDelegate

- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    switch (central.state) {
        case CBCentralManagerStatePoweredOn:
        {
            [self scanDevice];
        }
            break;
            
        default:
        {
            [self stopScan];
        }
            break;
    }
}

- (void)beaconManager:(WZBeaconBLEManager *)manager didConnect:(WZBeacon *)beacon
{
    //do nothing...
}

- (void)beaconManager:(WZBeaconBLEManager *)manager didFailToConnect:(WZBeacon *)beacon error:(NSError *)error
{
    // do nothing...
}

- (void)beaconManager:(WZBeaconBLEManager *)manager didDisconnect:(WZBeacon *)beacon error:(NSError *)error
{
    if(error == nil) {
        
        [self performSelectorOnMainThread:@selector(scanDevice) withObject:nil waitUntilDone:YES];
        
    }
}

- (void)beaconManager:(WZBeaconBLEManager *)manager didFoundNewBeacon:(WZBeacon *)beacon
{
    [[NSNotificationCenter defaultCenter] postNotificationName:SHBeaconManagerNotificationDidUpdate object:nil];
}

- (void)beaconManager:(WZBeaconBLEManager *)manager didUpdateRSSI:(WZBeacon *)beacon
{
    [[NSNotificationCenter defaultCenter] postNotificationName:SHBeaconManagerNotificationDidUpdate object:nil];
}

- (NSArray *)validDevices
{
    if (self.validUUIDs && self.validUUIDs.count > 0) {
        [self.beaconManager.devices filteredArrayUsingPredicate:[self predicateForValidUUIDs]];
    }
    return nil;
}

- (NSPredicate *)predicateForValidUUIDs
{
    return [NSPredicate predicateWithFormat:@"self.proximityUUID IN %@", self.validUUIDs];
}

@end
