//
//  SHTopHandicapFetcher.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHTopHandicapFetcher.h"

@implementation SHTopHandicapFetcher

- (void)requestUpdate
{
    // do nothing..
}

- (void)requestData
{
    NSArray *handicapList = [[SHLocalDataManager sharedInstance] allHandlicappedList];
    
    [self.dataList.sectionData removeAllObjects];
    
    [self.dataList setSection:0 sectionObject:kEmptySectionData sectionItems:handicapList];
    
    if (handicapList && handicapList.count > 0) {
        [self sendFetcherResultType:SHFetcherResultTypeSuccess error:nil];
    } else {
        [self sendFetcherResultType:SHFetcherResultTypeNoData error:nil];
    }
}

- (void)requestMore
{
    [self requestData];
}

@end
