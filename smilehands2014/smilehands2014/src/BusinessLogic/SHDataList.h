//
//  SHDataList.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHDataList : NSObject

@property (nonatomic, strong) NSMutableDictionary *sectionData;

- (void)setSection:(NSInteger)section sectionObject:(id)sectionObject sectionItems:(NSArray *)items;

- (id)seciontObjectAtSection:(NSInteger)section;

- (NSArray *)itemsAtSection:(NSInteger)section;

- (id)itemAtIndexPath:(NSIndexPath *)indexPath;

@end
