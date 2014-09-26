//
//  SHMemberModel.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 26..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHMemberModel.h"

@implementation SHMemberModel

- (NSString *)cellKey
{
    return @"SHTeamMemberViewCell";
}

- (Class)cellClazz
{
    return NSClassFromString(self.cellKey);
}

- (CGSize)cellSize
{
    return CGSizeMake(0, 70);
}



@end
