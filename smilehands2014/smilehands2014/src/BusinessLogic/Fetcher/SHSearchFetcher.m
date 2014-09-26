//
//  SHSearchFetcher.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 27..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHSearchFetcher.h"
#import "SHSimpleSectionModel.h"

@implementation SHSearchFetcher

- (void)requestUpdate
{
    // do nothing..
}

- (void)requestData
{
    if (self.parameter == nil || [AppUtility isEmptyOrWhitespace:self.parameter] == YES) {
        [self sendFetcherResultType:SHFetcherResultTypeFailed error:nil];
        return;
    }
    
    [self.dataList.sectionData removeAllObjects];
    
    NSArray *handicapList = [[SHLocalDataManager sharedInstance] allHandlicappedList];
    
    NSInteger index = 0;
    
    for (KindHandicap *handicap in handicapList) {
        KindHandicap *handicapInContext = [handicap MR_inThreadContext];
        
        NSArray *etiquetteList = [[SHLocalDataManager sharedInstance] etiqutteListWithSearchText:self.parameter
                                                                                         majorId:handicapInContext.majorId];
        if (etiquetteList && etiquetteList.count > 0) {
            
            SHSimpleSectionModel *model = [[SHSimpleSectionModel alloc] init];
            model.title = [handicap.title copy];
            
            [self.dataList setSection:index
                        sectionObject:model
                         sectionItems:etiquetteList];
            index ++;
        }
    }
    
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
