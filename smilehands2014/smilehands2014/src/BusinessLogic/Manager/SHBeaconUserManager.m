//
//  SHBeaconUserManager.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 28..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHBeaconUserManager.h"


@interface SHBeaconUserManager () <CLLocationManagerDelegate>


@property (nonatomic, assign) BOOL isMonitoring;

@end

@implementation SHBeaconUserManager

+ (instancetype)sharedInstance
{
    static SHBeaconUserManager * manager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        manager = [[SHBeaconUserManager alloc] init];
    });
    
    return manager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.locationManager = [[CLLocationManager alloc] init];
        [self.locationManager setDelegate:self];
        [self.locationManager setDesiredAccuracy:kCLLocationAccuracyNearestTenMeters];
        
        if ([self.locationManager respondsToSelector:@selector(pausesLocationUpdatesAutomatically)]) {
            self.locationManager.pausesLocationUpdatesAutomatically = NO;
        }
        self.lostMacAddressList = [NSMutableOrderedSet orderedSet];
        
        self.longitude = NSNotFound;
        self.latitude  = NSNotFound;
        
        [self registNotification];
        
    }
    return self;
}

- (void)registNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(findNewBeacon:)
                                                 name:SHBeaconManagerNotificationDidFind
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(notifyLostBeacon:)
                                                 name:SHBeaconManagerNotificationDidLostNotify
                                               object:nil];
}

- (void)unregistNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)findNewBeacon:(NSNotification *)noti
{
    if ([noti.object isKindOfClass:[WZBeacon class]] == NO) {
        return;
    }
    
    if ([AppUtility nowRunInBackground] == YES &&
        [SHPreferences isOnAutoAlarm] == YES) {
        [AppUtility registLocalNotification];
    }
    
    WZBeacon *beacon = noti.object;
    
    [SHServiceManager findLostInfoWithMacAddr:beacon.BDAddress
                                   completion:^(id result) {
                                       
                                       if ( [result isKindOfClass:[NSArray class]] == YES)
                                           [self.lostMacAddressList addObjectsFromArray:result];
                                       
                                       //for test
//                                       [self notifyLostBeacon:nil];
                                       
                                   } failure:^(id error, BOOL isCancelled) {
                                       
                                   }];
}

- (void)notifyLostBeacon:(NSNotification *)noti
{
    if (noti.object) {
        if ([noti.object isKindOfClass:[WZBeacon class]] == NO) {
            return;
        }

        if (self.latitude == NSNotFound || self.longitude == NSNotFound) return;
        
        WZBeacon *beacon = noti.object;
        
        [SHServiceManager notifyLostInfoWithMacAddr:beacon.BDAddress
                                               date:[NSDate date]
                                           latitude:[NSString stringWithFormat:@"%lf", self.latitude]
                                          longitude:[NSString stringWithFormat:@"%lf", self.longitude]
                                         completion:^(id result) {
                                             
                                             DLog(@"notify ---> %@", result);
                                             
                                         } failure:^(id error, BOOL isCancelled) {
                                             
                                         }];
        
    } else {
        
        //just notify lost beacon
        if (self.latitude == NSNotFound || self.longitude == NSNotFound) return;
        
        for (WZBeacon *beacon in [SHBeaconManager sharedInstance].validDevices) {

            if ([self.lostMacAddressList containsObject:beacon.BDAddress] == YES) {
                [SHServiceManager notifyLostInfoWithMacAddr:beacon.BDAddress
                                                       date:[NSDate date]
                                                   latitude:[NSString stringWithFormat:@"%lf", self.latitude]
                                                  longitude:[NSString stringWithFormat:@"%lf", self.longitude]
                                                 completion:^(id result) {
                                                     
                                                     DLog(@"notify ---> %@", result);
                                                     
                                                 } failure:^(id error, BOOL isCancelled) {
                                                     
                                                 }];
            }
        }
    }
}

- (void)finishTracking {
    [self.locationManager stopUpdatingLocation];
    [self.locationManager stopMonitoringSignificantLocationChanges];
    self.isMonitoring = NO;
}

- (void)startUpdateLocation {
    self.isMonitoring = YES;
    [self.locationManager stopMonitoringSignificantLocationChanges];
    [self.locationManager startUpdatingLocation];
}

- (void)startMonitoringLocation {
    self.isMonitoring = YES;
    [self.locationManager startMonitoringSignificantLocationChanges];
}

#pragma mark -
#pragma mark CLLocationManager delegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    if(self.isMonitoring) {
        
        CLLocation *location = [manager location];

        CLLocationCoordinate2D coordinate = [location coordinate];
        
        self.latitude  = coordinate.latitude;
        self.longitude = coordinate.longitude;
        
    }
}

- (void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {

}

- (void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {

}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region {
    NSLog(@"Started monitoring %@ region", region.identifier);
}

- (void)checkAuthorizationIfOverIOS8
{
    if ([AppUtility isIOS8x] == YES)
        [self.locationManager requestAlwaysAuthorization];
}

@end