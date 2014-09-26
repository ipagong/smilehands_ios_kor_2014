//
//  Etiquette.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class KindHandicap;

@interface Etiquette : NSManagedObject <SHCommonModelProtocol>

@property (nonatomic, retain) NSString * situation;
@property (nonatomic, retain) NSString * situationCode;
@property (nonatomic, retain) NSString * majorId;
@property (nonatomic, retain) NSString * explain;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSNumber * markDeleted;
@property (nonatomic, retain) NSString * reserved1;
@property (nonatomic, retain) NSString * reserved2;
@property (nonatomic, retain) NSNumber * isFavorite;
@property (nonatomic, retain) NSDate * lastDate;

@property (nonatomic, retain) KindHandicap *handicap;

#pragma mark - predicate methods

+ (NSPredicate *)predicateExistEtiquette;
+ (NSPredicate *)predicateExistEtiquetteWithMajorId:(NSString *)majorId;
+ (NSPredicate *)predicateFavoriteEtiquetteWithMajorId:(NSString *)majorId;
+ (NSPredicate *)predicateWithSituationCode:(NSString *)code;
+ (NSPredicate *)predicateWithSearchText:(NSString *)text majorId:(NSString *)majorId;

#pragma mark - sortDescriptor

+ (NSString *)sortByCreateSituation;
+ (NSString *)sortByLastDate;


@end
