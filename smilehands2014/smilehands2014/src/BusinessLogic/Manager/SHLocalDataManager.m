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
    return @{
             @"100":@{
                      kDefaultHandicapTitle :   @"시각",
                      kDefaultHandicapBgImage : @"bg_main_01"
                      },
             @"200":@{
                     kDefaultHandicapTitle :   @"청각 / 언어",
                     kDefaultHandicapBgImage : @"bg_main_02"
                     },
             @"300":@{
                     kDefaultHandicapTitle :   @"뇌병변 / 지체",
                     kDefaultHandicapBgImage : @"bg_main_03"
                     },
             @"400":@{
                     kDefaultHandicapTitle :   @"자폐 / 지적",
                     kDefaultHandicapBgImage : @"bg_main_04"
                     },
             };
}

- (void)createKindHandicapWithMajorId:(NSString *)majorId
                            imagePath:(NSString *)imagePath
                                title:(NSString *)title
                               status:(NSString *)status

{
    [MagicalRecord saveUsingCurrentThreadContextWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        KindHandicap *handicap = [KindHandicap MR_createEntity];
        
        [handicap setMajorId:majorId];
        [handicap setTitle:title];
        [handicap setImagePath:imagePath];
        [handicap setStatus:status];
        
    }];

}

- (NSArray *)allHandlicappedList
{
    return [KindHandicap MR_findAllSortedBy:[KindHandicap sortByCreateMajorId]
                                  ascending:NO
                              withPredicate:[KindHandicap predicateExistHandicap]];
}

- (BOOL)isExistHandicappedWithMajorId:(NSString *)majorId
{
    NSArray *array = [KindHandicap MR_findAllSortedBy:[KindHandicap sortByCreateMajorId]
                                            ascending:NO
                                        withPredicate:[KindHandicap predicateExistHandicapWithMajorId:majorId]];
    if (array && array.count > 0) {
        return YES;
    }
    return NO;
}

- (NSDate *)lastDateEtiquette
{
    Etiquette *etiquette = [Etiquette MR_findFirstWithPredicate:[Etiquette predicateExistEtiquette]
                                                       sortedBy:[Etiquette sortByLastDate]
                                                      ascending:NO];
    
    return etiquette.lastDate;
}

#pragma mark - etiquette

- (void)addEtiqutteList:(NSArray *)etiquetteList
{
    for (SHEtiquetteResponseModel *model in etiquetteList) {
        
        Etiquette *findEtiquette = [self findEtiquetteWithKey:model.eId];
        
        if (findEtiquette == nil) {
        
            [MagicalRecord saveUsingCurrentThreadContextWithBlockAndWait:^(NSManagedObjectContext *localContext) {
                Etiquette *etiquette = [Etiquette MR_createEntity];
                
                [etiquette setExplain:model.explain];
                [etiquette setMajorId:model.majorId];
                
                [etiquette setSituationCode:model.eId];
                [etiquette setSituation:model.situation];
                
            }];
            
        } else {
            
            [MagicalRecord saveUsingCurrentThreadContextWithBlockAndWait:^(NSManagedObjectContext *localContext) {

                Etiquette *etiquette = [findEtiquette MR_inThreadContext];
                
                [etiquette setExplain:model.explain];
                [etiquette setMajorId:model.majorId];
                
                [etiquette setSituationCode:model.eId];
                [etiquette setSituation:model.situation];
                
            }];
            
        }
    }
}

- (id)findEtiquetteWithKey:(NSString *)key
{
    return [Etiquette MR_findFirstWithPredicate:[Etiquette predicateWithSituationCode:key]];
}

- (NSArray *)etiqutteListWithMajorId:(NSString *)majorId
                                page:(NSInteger)page
{
    return [Etiquette MR_findAllSortedBy:[Etiquette sortByCreateSituation]
                               ascending:NO
                           withPredicate:[Etiquette predicateExistEtiquetteWithMajorId:majorId]];
}

- (NSArray *)favoriteEtiqutteListWithMajorId:(NSString *)majorId
                                        page:(NSInteger)page
{
    return [Etiquette MR_findAllSortedBy:[Etiquette sortByCreateSituation]
                               ascending:NO
                           withPredicate:[Etiquette predicateFavoriteEtiquetteWithMajorId:majorId]];
}

- (NSArray *)etiqutteListWithSearchText:(NSString *)text majorId:(NSString *)majorId
{
    return [Etiquette MR_findAllSortedBy:[Etiquette sortByCreateSituation]
                               ascending:NO
                           withPredicate:[Etiquette predicateWithSearchText:text majorId:majorId]];
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

- (void)setFavoriteEtiquette:(id)etiquette
                  isFavorite:(BOOL)isFavorite;
{
    if ([etiquette isKindOfClass:[Etiquette class]] == NO) return;
    
    [MagicalRecord saveUsingCurrentThreadContextWithBlockAndWait:^(NSManagedObjectContext *localContext) {
        
        [[etiquette MR_inThreadContext] setIsFavorite:@(isFavorite)];

    }];
}

@end
