//
//  SHApplicationEventHelper.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHApplicationEventHelper.h"
#import "SHServiceManager.h"

#define kDefaultValidBeaconUUID @"a0000000-0000-0000-0000-000000000000"

@implementation SHApplicationEventHelper

+ (void)applicationDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initDefaultHandicapListIfNotExist];
    
    [self initBeaconUUIDs];
    
    [self updateEtiqutteListIfNeeds];
}

+ (void)applicationDidBecomeActive
{
    
}

+ (void)applicationWillTerminate
{
    
}

+ (void)initDefaultHandicapListIfNotExist
{
    NSDictionary *defaultHandicapList = [SHLocalDataManager defaultHandicapInfoList];
    
    for (NSString *majorId in defaultHandicapList.allKeys) {
        
        if ([[SHLocalDataManager sharedInstance] isExistHandicappedWithMajorId:majorId] == NO) {
            
            NSDictionary *metaData = defaultHandicapList[majorId];
            
            [[SHLocalDataManager sharedInstance] createKindHandicapWithMajorId:majorId
                                                                     imagePath:metaData[kDefaultHandicapBgImage]
                                                                         title:metaData[kDefaultHandicapTitle]
                                                                        status:kDefaultHandicapSuccessStatus];
            
        }
    }
}

+ (void)initBeaconUUIDs
{
    [[SHBeaconManager sharedInstance] updateValidUUIDs:@[kDefaultValidBeaconUUID]];
}

+ (void)updateEtiqutteListIfNeeds
{
    NSDate *lastDate = [[SHLocalDataManager sharedInstance] lastDateEtiquette];

    [SHServiceManager etiquetteListLastDate:lastDate
                                 completion:^(NSArray *result) {
                                     DLog(@"====> success");
                                     [[SHLocalDataManager sharedInstance] addEtiqutteList:result];
                                     
                                 }
                                    failure:^(id error, BOOL isCancelled) {
                                        
                                        //TODO : 예외처리
                                        DLog(@"----> error"
                                             );
                                        
                                    }];
    
}

@end
