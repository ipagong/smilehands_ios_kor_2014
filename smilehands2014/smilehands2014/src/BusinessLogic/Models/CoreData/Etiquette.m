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

#pragma mark - sortDescriptor

+ (NSString *)sortByCreateSituation
{
    return @"situationCode,situation";
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
