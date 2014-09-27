//
//  SHCommonViewController.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHDataList.h"
#import "SHFetcherFactory.h"


@interface SHCommonViewController : UIViewController
<UIGestureRecognizerDelegate, UICollectionViewDelegate, UICollectionViewDataSource, SHFetcherDelegate>

@property (nonatomic, strong) SHDataList *dataList;
@property (nonatomic, weak) UICollectionView *currentCollectionView;
@property (nonatomic, strong) SHDefaultFetcher *fetcher;


- (SHFetcherType)fetcherType;
- (void)initCustomData;
- (void)initCustomUI;

- (void)setupNavigationBar;
- (void)setupNavigationBarLeft;
- (void)setupNavigationBarRight;

@end
