//
//  SHCommonViewController.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SHDataList.h"

@interface SHCommonViewController : UIViewController
<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) SHDataList *dataList;
@property (nonatomic, weak) UICollectionView *currentCollectionView;

@end
