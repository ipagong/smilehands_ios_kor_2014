//
//  SHSimpleSectionModel.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 26..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHSimpleSectionModel.h"

@implementation SHSimpleSectionModel

- (NSString *)sectionKey
{
    return @"SHSimpleSectionReusableView";
}

- (Class)sectionClazz
{
    return NSClassFromString(self.sectionKey);
}

- (CGSize)sectionSize
{
    return CGSizeMake(0, 30);
}

@end
