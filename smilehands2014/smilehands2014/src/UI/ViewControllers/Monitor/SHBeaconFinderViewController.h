//
//  SHBeaconFinderViewController.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 23..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHDataList.h"
#import "SHFetcherFactory.h"

@interface SHBeaconFinderViewController : UIViewController
<UIGestureRecognizerDelegate, UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) SHDataList *dataList;

@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;

@end
