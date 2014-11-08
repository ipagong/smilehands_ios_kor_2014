//
//  SHEmptyViewFactory
//
//  Created by suwan on 2014. 8. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SHEmptyView.h"

#define kEmptyViewTag 111222333

typedef NS_ENUM(NSInteger, SHEmptyViewType) {
    SHEmptyViewTypeFavorite = 0,
    SHEmptyViewTypeFinder,
};

@interface SHEmptyViewFactory : NSObject

+ (SHEmptyView *)addEmptyViewWithType:(SHEmptyViewType)type
                               superView:(UIView *)superView;

+ (void)removeFromEmptyViewWithSuperView:(UIView *)superView;

@end
