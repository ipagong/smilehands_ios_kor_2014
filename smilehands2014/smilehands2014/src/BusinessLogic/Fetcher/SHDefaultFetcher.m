//
//  SHDefaultFetcher.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHDefaultFetcher.h"

@implementation SHDefaultFetcher

- (void)requestUpdate
{
   DLog(@"--> should override.");
}

- (void)requestData
{
   DLog(@"--> should override.");
}

- (void)requestMore
{
    DLog(@"--> should override.");
}

- (void)sendFetcherResultType:(SHFetcherResultType)type error:(NSError *)error
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(smileHandsFetcher:finishedResultType:error:)] == YES) {
        [self.delegate smileHandsFetcher:self finishedResultType:type error:error];
    }
}

@end
