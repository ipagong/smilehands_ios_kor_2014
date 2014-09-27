//
//  WZBeacon+SHModel.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 27..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "WZBeacon+SHModel.h"

@implementation WZBeacon (SHModel) 

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
