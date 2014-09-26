//
//  SHApplicationEventHelper.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHApplicationEventHelper.h"
#import "SHServiceManager.h"

@implementation SHApplicationEventHelper

+ (void)applicationDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initDefaultHandicapListIfNotExist];
    
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

+ (void)updateEtiqutteListIfNeeds
{
    NSArray *handicapList = [[SHLocalDataManager sharedInstance] allHandlicappedList];
    
    for (KindHandicap *handicap in handicapList) {
        
        KindHandicap *handicapInContext = [handicap MR_inThreadContext];
        
        NSString *majorId = handicapInContext.majorId;
        
        [SHServiceManager etiquetteListWithMajorId:majorId
                                        completion:^(NSArray *result) {
                                            DLog(@"====> success");
                                            [[SHLocalDataManager sharedInstance] addEtiqutteList:result
                                                                                         majorId:majorId];
                                            
                                        }
                                           failure:^(id error, BOOL isCancelled) {
                                             
                                               //TODO : 예외처리
                                               DLog(@"----> error"
                                                    );
                                               
                                           }];
    
    }
}

@end
