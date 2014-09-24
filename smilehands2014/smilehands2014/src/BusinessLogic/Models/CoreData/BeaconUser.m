//
//  BeaconUser.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "BeaconUser.h"


@implementation BeaconUser

@dynamic majorId;
@dynamic minorId;
@dynamic uuid;
@dynamic statusCode;
@dynamic macAddress;
@dynamic userId;
@dynamic userImage;
@dynamic markDeleted;

#pragma mark - model protocol

- (NSString *)cellKey
{
    return @"SHBeaconUserViewCell";
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
