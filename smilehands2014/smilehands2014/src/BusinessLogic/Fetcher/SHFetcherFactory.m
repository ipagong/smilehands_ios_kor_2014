//
//  SHFetcherFactory.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHFetcherFactory.h"

static NSDictionary *gFetcherDictionary;

@implementation SHFetcherFactory

+ (void)initialize;
{
    if (self == [SHFetcherFactory class]) {
        [self setupFetcherDictionary];
    }
}

+ (void)setupFetcherDictionary
{
    if (gFetcherDictionary == nil) {
        gFetcherDictionary = @{
                               @(SHFetcherTypeEtiquette)   : @"CloudDataMovieFileFetcher",
                               @(SHFetcherTypeFavorite)    : @"CloudDataMovieFolderFetcher",
                               @(SHFetcherTypeFinder)      : @"CloudDataMainFolderFetcher",
                               @(SHFetcherTypeSearch)      : @"CloudDataDocFileFetcher"
                               };
    }
}


+ (NSString *)clazzForFetcherWithType:(SHFetcherType)type
{
    [self setupFetcherDictionary];
    
    NSString *clazzString = gFetcherDictionary[@(type)];
    
    if (clazzString == nil) {

        clazzString = @"SHDefaultFetcher";
        
        DLog(@"-------> you must match fetcher clazz name.(1)");
    }
    
    return clazzString;
}

+ (id<SHFetcherProtocol>)createFetcherWithType:(SHFetcherType)type
                                      delegate:(id<SHFetcherDelegate>)delegate
{
    id<SHFetcherProtocol> fetcher = nil;
    
    NSString *clazz = [self clazzForFetcherWithType:type];
    
    @try {
        Class fetcherClazz = NSClassFromString(clazz);
        fetcher = (id<SHFetcherProtocol>)[[fetcherClazz alloc] init];
    }
    @catch (NSException *exception) {
        DLog(@"-------> you must match fetcher clazz name.(2)");
        return nil;
    }
    
    [fetcher setFetcherType:type];
    [fetcher setDelegate:delegate];
    
    return fetcher;
}


@end
