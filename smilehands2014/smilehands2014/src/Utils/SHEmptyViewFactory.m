//
//  SHEmptyViewFactory
//
//  Created by suwan on 2014. 8. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHEmptyViewFactory.h"


@implementation SHEmptyViewFactory

+ (SHEmptyView *)addEmptyViewWithType:(SHEmptyViewType)type
                               superView:(UIView *)superView
{
    CGRect frame = CGRectMake(0, 0,
                              CGRectGetWidth(superView.bounds),
                              CGRectGetHeight(superView.bounds));
    
    SHEmptyView *emptyView = [[SHEmptyView alloc] initWithFrame:frame];
    emptyView.onView = superView;
    
    switch (type) {
        case SHEmptyViewTypeFavorite:
        {
            emptyView.image = [UIImage imageNamed:@"img_nofavorite"];
            emptyView.titleText = @"등록된 즐겨찾기가 없습니다.";
            emptyView.subtitleText = nil;
            
            emptyView.topImageOffset    = 87;
            emptyView.topTitleOffset    = 20;
        }
            break;
            
        case SHEmptyViewTypeFinder:
        {
            emptyView.image = [UIImage imageNamed:@"noexploration"];
            emptyView.titleText = @"주변에 장애인이 없습니다.";
            emptyView.subtitleText = nil;
            
            emptyView.topImageOffset    = 87;
            emptyView.topTitleOffset    = 20;
        }
            break;
       default:
            break;
    }
    
    [emptyView setTag:kEmptyViewTag];
    
    [superView addSubview:emptyView];
    [emptyView layoutSubviews];
    
    return emptyView;
}

+ (void)removeFromEmptyViewWithSuperView:(UIView *)superView
{
    [[superView viewWithTag:kEmptyViewTag] removeFromSuperview];
}


@end
