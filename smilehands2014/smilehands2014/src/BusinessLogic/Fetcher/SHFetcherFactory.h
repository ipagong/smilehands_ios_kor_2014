//
//  SHFetcherFactory.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHDefaultFetcher.h"

typedef NS_ENUM(NSInteger, SHFetcherType) {
    SHFetcherTypeEtiquette = 0,
    SHFetcherTypeFavorite,
    SHFetcherTypeFinder,
    SHFetcherTypeSearch,
};


@interface SHFetcherFactory : NSObject

+ (id<SHFetcherProtocol>)createFetcherWithType:(SHFetcherType)type
                                      delegate:(id<SHFetcherDelegate>)delegate;

@end
