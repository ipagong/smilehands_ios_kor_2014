//
//  SHLocalDataManager.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHLocalDataManager.h"

@implementation SHLocalDataManager

+ (instancetype)sharedInstance
{
    static SHLocalDataManager *manager = nil;
    static dispatch_once_t pred = 0;
    
    dispatch_once(&pred, ^{
        manager = [[SHLocalDataManager alloc] init];
    });
    
    return manager;
}


#pragma mark - handicap
+ (NSDictionary *)defaultHandicapInfoList
{
    return nil;
}

- (void)addKindHandicapWithMajorId:(NSString *)majorId
                         imagePath:(NSString *)imagePath
                            status:(NSString *)status
{
    return;
}

- (BOOL)haveNotUpdatedKindHandicapped
{
    return nil;
}

- (NSArray *)allHandlicappedList
{
    return nil;
}

#pragma mark - etiquette

- (void)addEtiqutteList:(NSArray *)etiquetteList
{
    return;
}

- (NSArray *)etiqutteListWithMajorId:(NSString *)majorId
                                page:(NSInteger)page
{
    return nil;
}

- (NSArray *)etiqutteListWithSearchText:(NSString *)majorId
{
    return nil;
}


#pragma mark - beacon
- (NSArray *)oldBeaconUserNotInCurrentList:(NSArray *)currentBeaconList
                                  maxCount:(NSInteger)count
{
    return nil;
}

- (NSArray *)beaconUserListInCurrentList:(NSArray *)currentBeaconList
{
    return nil;
}

- (void)addBeaconInfoList:(NSArray *)beaconUserInfList
{
    return;
}


#pragma mark - favorite
- (void)setFavoriteSituationCode:(NSString *)situationCode
                      isFavorite:(BOOL)isFavorite
{
    return;
}

@end
