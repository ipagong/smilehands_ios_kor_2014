//
//  SHLocalDataManager.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kDefaultHandicapTitle         @"DefaultHandicapTitle"
#define kDefaultHandicapBgImage       @"DefaultHandicapBgImage"
#define kDefaultHandicapSuccessStatus @"200"

@interface SHLocalDataManager : NSObject

+ (instancetype)sharedInstance;

#pragma mark - handicap
+ (NSDictionary *)defaultHandicapInfoList;

- (void)createKindHandicapWithMajorId:(NSString *)majorId
                            imagePath:(NSString *)imagePath
                                title:(NSString *)title
                               status:(NSString *)status;

- (NSArray *)allHandlicappedList;
- (BOOL)isExistHandicappedWithMajorId:(NSString *)majorId;


#pragma mark - etiquette

- (void)addEtiqutteList:(NSArray *)etiquetteList majorId:(NSString *)majorId;

- (NSArray *)etiqutteListWithMajorId:(NSString *)majorId
                                page:(NSInteger)page;

- (NSArray *)etiqutteListWithSearchText:(NSString *)majorId;
- (NSArray *)favoriteEtiqutteListWithMajorId:(NSString *)majorId
                                        page:(NSInteger)page;

#pragma mark - beacon
- (NSArray *)oldBeaconUserNotInCurrentList:(NSArray *)currentBeaconList
                                  maxCount:(NSInteger)count;

- (NSArray *)beaconUserListInCurrentList:(NSArray *)currentBeaconList;

- (void)addBeaconInfoList:(NSArray *)beaconUserInfList;


#pragma mark - favorite
- (void)setFavoriteEtiquette:(id)etiquette
                  isFavorite:(BOOL)isFavorite;
@end
