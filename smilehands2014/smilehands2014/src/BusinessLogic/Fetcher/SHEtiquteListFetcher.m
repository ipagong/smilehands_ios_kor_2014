 //
//  SHEtiquteListFetcher.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHEtiquteListFetcher.h"

@implementation SHEtiquteListFetcher

- (void)requestUpdate
{
    // do nothing..
}

- (void)requestData
{
    NSString *marjoId = self.parameter;
    
    NSArray *handicapList = [[SHLocalDataManager sharedInstance] etiqutteListWithMajorId:marjoId
                                                                                    page:1];
    
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
