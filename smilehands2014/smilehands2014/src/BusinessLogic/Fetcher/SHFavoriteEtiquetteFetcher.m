//
//  SHFavoriteEtiquetteFetcher.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 26..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHFavoriteEtiquetteFetcher.h"
#import "SHSimpleSectionModel.h"

@implementation SHFavoriteEtiquetteFetcher

- (void)requestUpdate
{
    [self.dataList.sectionData removeAllObjects];
    
    NSArray *handicapList = [[SHLocalDataManager sharedInstance] allHandlicappedList];
    
    NSInteger index = 0;
    
    for (KindHandicap *handicap in handicapList) {
        KindHandicap *handicapInContext = [handicap MR_inThreadContext];
        
        NSArray *etiquetteList = [[SHLocalDataManager sharedInstance] favoriteEtiqutteListWithMajorId:handicapInContext.majorId
                                                                                                 page:1];
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
        [self sendFetcherResultType:SHFetcherResultTypeReloadSuccess error:nil];
    } else {
        [self sendFetcherResultType:SHFetcherResultTypeNoData error:nil];
    }
}

- (void)requestData
{
    [self.dataList.sectionData removeAllObjects];
    
    NSArray *handicapList = [[SHLocalDataManager sharedInstance] allHandlicappedList];
    
    NSInteger index = 0;
    
    for (KindHandicap *handicap in handicapList) {
        KindHandicap *handicapInContext = [handicap MR_inThreadContext];
        
        NSArray *etiquetteList = [[SHLocalDataManager sharedInstance] favoriteEtiqutteListWithMajorId:handicapInContext.majorId
                                                                                                 page:1];
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
