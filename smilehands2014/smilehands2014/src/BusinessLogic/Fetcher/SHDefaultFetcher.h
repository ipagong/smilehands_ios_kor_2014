//
//  SHDefaultFetcher.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHDataList.h"

@protocol SHFetcherProtocol;

typedef NS_ENUM(NSInteger, SHFetcherResultType) {
    SHFetcherResultTypeSuccess = 0,
    SHFetcherResultTypeMoreRequestSuccess,
    SHFetcherResultTypeReloadSuccess,
    SHFetcherResultTypeNoData,
    SHFetcherResultTypeFailed,
};

@protocol SHFetcherDelegate <NSObject>

- (void)smileHandsFetcher:(id<SHFetcherProtocol>)fetcher
       finishedResultType:(SHFetcherResultType)resultType
                    error:(NSError *)error;

@end

@protocol SHFetcherProtocol <NSObject>

- (void)requestUpdate;
- (void)requestData;
- (void)requestMore;

@property (nonatomic, weak) SHDataList *dataList;
@property (nonatomic, weak) id<SHFetcherDelegate> delegate;

@property (nonatomic, strong) id parameter;
@property (nonatomic, assign) NSInteger fetcherType;

@end

@interface SHDefaultFetcher : NSObject <SHFetcherProtocol>

@property (nonatomic, strong) id parameter;

@property (nonatomic, assign) NSInteger fetcherType;

@property (nonatomic, weak) SHDataList *dataList;
@property (nonatomic, weak) id<SHFetcherDelegate> delegate;

- (void)sendFetcherResultType:(SHFetcherResultType)type error:(NSError *)error;

@end
