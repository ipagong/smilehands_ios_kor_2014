//
//  SHCommonCellProtocol.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 23..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SHCommonModelProtocol.h"

@protocol SHCommonCellProtocol <NSObject>

- (void)refreshWithModel:(id<SHCommonModelProtocol>)model;

@property (nonatomic, strong) id model;

@end


@protocol SHCommonSectionProtocol <NSObject>

- (void)refreshWithSectionModel:(id<SHCommonSectionModelProtocol>)model;

@end
