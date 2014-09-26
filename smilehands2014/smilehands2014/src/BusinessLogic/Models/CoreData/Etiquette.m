//
//  Etiquette.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "Etiquette.h"
#import "KindHandicap.h"


@implementation Etiquette

@dynamic situation;
@dynamic situationCode;
@dynamic majorId;
@dynamic explain;
@dynamic status;
@dynamic markDeleted;
@dynamic reserved1;
@dynamic reserved2;
@dynamic handicap;
@dynamic lastDate;
@dynamic isFavorite;

#pragma mark - predicate methods

+ (NSPredicate *)predicateExistEtiquette
{
    return [NSPredicate predicateWithFormat:@"(markDeleted == NO)"];
}

+ (NSPredicate *)predicateExistEtiquetteWithMajorId:(NSString *)majorId
{
    return [NSPredicate predicateWithFormat:@"(markDeleted == NO) AND (majorId == %@)", majorId];
}

+ (NSPredicate *)predicateWithSituationCode:(NSString *)code
{
    return [NSPredicate predicateWithFormat:@"(markDeleted == NO) AND (situationCode == %@)", code];
}

+ (NSPredicate *)predicateFavoriteEtiquetteWithMajorId:(NSString *)majorId
{
    return [NSPredicate predicateWithFormat:@"(markDeleted == NO) AND (isFavorite == YES) AND (majorId == %@)",
            majorId];
}

+ (NSPredicate *)predicateWithSearchText:(NSString *)text majorId:(NSString *)majorId
{
    NSString *wildcardedString = [NSString stringWithFormat:@"*%@*", text];

    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"((situation CONTAINS[cd] %@) OR (explain CONTAINS[cd] %@))", text, text];
    return predicate;
}

#pragma mark - sortDescriptor

+ (NSString *)sortByCreateSituation
{
    return @"isFavorite,situationCode,situation";
}

+ (NSString *)sortByLastDate
{
    return @"lastDate";
}

#pragma mark - model protocol

- (NSString *)cellKey
{
    return @"SHEtiquetteInfoViewCell";
}

- (Class)cellClazz
{
    return NSClassFromString(self.cellKey);
}

- (CGSize)cellSize
{
    return CGSizeZero;
}

@end
