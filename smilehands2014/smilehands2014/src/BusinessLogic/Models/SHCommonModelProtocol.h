//
//  SHCommonModelProtocol.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 23..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SHCommonModelProtocol <NSObject>

- (NSString *)cellKey;
- (Class)cellClazz;
- (CGSize)cellSize;

@end

@protocol SHCommonSectionModelProtocol <NSObject>

- (NSString *)sectionKey;
- (Class)sectionClazz;
- (CGSize)sectionSize;

@end
