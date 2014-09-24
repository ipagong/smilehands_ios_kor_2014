//
//  SHDataList.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHDataList.h"

#define kSHDataDefaultSectionIndex   0
#define kSHDataDefaultItemIndex      1

@implementation SHDataList

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initData];
    }
    return self;
}

- (void)initData
{
    self.sectionData = [[NSMutableDictionary alloc] init];
}

-(void)dealloc
{
    [self.sectionData removeAllObjects];
    self.sectionData = nil;
}

- (void)setSection:(NSInteger)section sectionObject:(id)sectionObject sectionItems:(NSArray *)items
{
    NSMutableArray *sectionData = [self.sectionData objectForKey:@(section)];
    
    if (sectionData == nil) {
        sectionData = [[NSMutableArray alloc] init];
    }
    
    if (items == nil) {
        items = [NSMutableArray array];
    }
    
    if (sectionObject == nil) {
        sectionObject = [[NSObject alloc] init];
    }
    
    [sectionData insertObject:sectionObject atIndex:kSHDataDefaultSectionIndex];
    [sectionData insertObject:items atIndex:kSHDataDefaultItemIndex];
    
    [self.sectionData setObject:sectionData forKey:@(section)];
}

- (id)seciontObjectAtSection:(NSInteger)section
{
    NSMutableArray *sectionData = [self.sectionData objectForKey:@(section)];
    
    if (sectionData == nil) {
        return nil;
    }
    
    return [sectionData objectAtIndex:kSHDataDefaultSectionIndex];
}

- (NSArray *)itemsAtSection:(NSInteger)section
{
    NSMutableArray *sectionData = [self.sectionData objectForKey:@(section)];
    
    if (sectionData == nil) {
        return nil;
    }
    
    return [sectionData objectAtIndex:kSHDataDefaultItemIndex];
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath
{
    NSMutableArray *sectionData = [self.sectionData objectForKey:@(indexPath.section)];
    
    if (sectionData == nil) {
        return nil;
    }
    
    NSArray *items = [sectionData objectAtIndex:kSHDataDefaultItemIndex];
    
    id file = nil;
    
    @try {
        file = [items objectAtIndex:indexPath.row];
    }
    @catch (NSException *exception) {
        file = nil;
    }
    
    return file;
}

@end
