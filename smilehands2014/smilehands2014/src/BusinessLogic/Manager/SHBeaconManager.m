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
NSString * const SHBeaconManagerNotificationDidFind = @"SHBeaconManagerNotificationDidFind";
NSString * const SHBeaconManagerNotificationDidLostNotify = @"SHBeaconManagerNotificationDidLostNotify";

@interface SHBeaconManager () <WZBeaconBLEManagerDelegate>

@property (nonatomic, strong) NSMutableArray *validUUIDs;

@property (nonatomic, strong) WZBeaconBLEManager *beaconManager;

@property (nonatomic, assign) BOOL isRegistObserving;
@property (nonatomic, assign) BOOL isRunning;

@property (nonatomic, strong) NSMutableArray *previousBeacons;
@property (nonatomic, strong) NSMutableArray *currentBeacons;

@property (nonatomic, strong) NSTimer *beaconTimer;

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
        
        self.previousBeacons = [NSMutableArray array];
        self.currentBeacons  = [NSMutableArray array];
        
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

- (void)startTimer
{
    if (self.beaconTimer && [self.beaconTimer isValid] == YES) {
        [self.beaconTimer invalidate];
        self.beaconTimer = nil;
    }
    
    
    self.beaconTimer = [NSTimer scheduledTimerWithTimeInterval:15
                                                        target:self
                                                      selector:@selector(checkBeaconList)
                                                      userInfo:nil
                                                       repeats:YES];
}

- (void)stopTimer
{
    if (self.beaconTimer && [self.beaconTimer isValid] == YES) {
        [self.beaconTimer invalidate];
        self.beaconTimer = nil;
    }
}

- (void)checkBeaconList
{
    if (self.previousBeacons.count < 1) {
        [self.previousBeacons addObjectsFromArray:self.validDevices];
        
        for (WZBeacon *beacon in self.previousBeacons) {
            
            if ([self.currentBeacons containsObject:beacon] == NO) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    [[NSNotificationCenter defaultCenter] postNotificationName:SHBeaconManagerNotificationDidFind
                                                                        object:beacon];
                });
                
            }
        }
        
        return;
    }
    
    [self.currentBeacons removeAllObjects];
    [self.currentBeacons addObjectsFromArray:self.validDevices];
    
    for (WZBeacon *beacon in self.currentBeacons) {
        
        if ([self.previousBeacons containsObject:beacon] == NO) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [[NSNotificationCenter defaultCenter] postNotificationName:SHBeaconManagerNotificationDidLostNotify
                                                                    object:beacon];
            });
            
        }
    }
    
    for (WZBeacon *beacon in self.previousBeacons) {
        
        if ([self.currentBeacons containsObject:beacon] == NO) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [[NSNotificationCenter defaultCenter] postNotificationName:SHBeaconManagerNotificationDidFind
                                                                    object:beacon];
            });
            
        }
    }
    
    [self.previousBeacons removeAllObjects];
    [self.previousBeacons addObjectsFromArray:self.currentBeacons];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:SHBeaconManagerNotificationDidFind object:nil];
    });
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:SHBeaconManagerNotificationDidLostNotify
                                                            object:nil];
    });
    
}

- (void)scanDevice
{
    [self.beaconManager cleanScannedDevices];
    [self.beaconManager startBLEScan];

    [self performSelectorOnMainThread:@selector(startTimer) withObject:nil waitUntilDone:NO];
    
    self.isRunning = YES;
}

- (void)stopScan
{
   [self.beaconManager stopBLEScan];
    
    self.isRunning = NO;
    
    [self performSelectorOnMainThread:@selector(stopTimer) withObject:nil waitUntilDone:NO];
}

- (void)stopScanForDelay
{
    [self.beaconManager stopBLEScan];
    
    [self performSelector:@selector(scanDeviceWithOutCleanUp) withObject:nil afterDelay:5];

}

- (void)scanDeviceWithOutCleanUp
{
    [self.beaconManager startBLEScan];
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
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:SHBeaconManagerNotificationDidUpdate object:nil];
    });
}

- (void)beaconManager:(WZBeaconBLEManager *)manager didUpdateRSSI:(WZBeacon *)beacon
{
    dispatch_async(dispatch_get_main_queue(), ^{
        [[NSNotificationCenter defaultCenter] postNotificationName:SHBeaconManagerNotificationDidUpdate object:nil];
    });
}

- (NSArray *)validDevices
{
    NSSortDescriptor *sortDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"BDAddress" ascending:NO];
    
    NSArray *filterDevices = [self.beaconManager.devices filteredArrayUsingPredicate:self.predicateForValidDevice];
    
    return [filterDevices sortedArrayUsingDescriptors:@[sortDescriptor]];
}

- (NSPredicate *)predicateForValidDevice
{
    return [NSPredicate predicateWithFormat:@"self.minor.stringValue == %@", @"9999"];
}

@end
