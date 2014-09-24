//
//  KindHandicap.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "KindHandicap.h"
#import "Etiquette.h"


@implementation KindHandicap

@dynamic status;
@dynamic majorId;
@dynamic imagePath;
@dynamic markDeleted;
@dynamic reserved1;
@dynamic reserved2;
@dynamic etiquette;

+ (NSPredicate *)predicateExistHandicap
{
    return [NSPredicate predicateWithFormat:@"(deleted == NO)"];
}

+ (NSString *)sortByCreateMajorId
{
    return @"status";
}

#pragma mark - model protocol

- (NSString *)cellKey
{
    return @"SHEtiquetteTopViewCell";
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
