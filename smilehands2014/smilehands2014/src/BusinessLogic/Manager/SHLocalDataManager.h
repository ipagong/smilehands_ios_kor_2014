//
//  SHLocalDataManager.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHLocalDataManager : NSObject

+ (instancetype)sharedInstance;

#pragma mark - handicap
+ (NSDictionary *)defaultHandicapInfoList;

- (void)addKindHandicapWithMajorId:(NSString *)majorId
                         imagePath:(NSString *)imagePath
                            status:(NSString *)status;

- (BOOL)haveNotUpdatedKindHandicapped;
- (NSArray *)allHandlicappedList;

#pragma mark - etiquette

- (void)addEtiqutteList:(NSArray *)etiquetteList;

- (NSArray *)etiqutteListWithMajorId:(NSString *)majorId
                                page:(NSInteger)page;

- (NSArray *)etiqutteListWithSearchText:(NSString *)majorId;


#pragma mark - beacon
- (NSArray *)oldBeaconUserNotInCurrentList:(NSArray *)currentBeaconList
                                  maxCount:(NSInteger)count;

- (NSArray *)beaconUserListInCurrentList:(NSArray *)currentBeaconList;

- (void)addBeaconInfoList:(NSArray *)beaconUserInfList;


#pragma mark - favorite
- (void)setFavoriteSituationCode:(NSString *)situationCode
                      isFavorite:(BOOL)isFavorite;
@end
