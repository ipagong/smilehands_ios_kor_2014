//
//  SHEtiquetteInfoListViewController.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHCommonViewController.h"

@interface SHEtiquetteInfoListViewController : SHCommonViewController
@property (nonatomic, strong) IBOutlet UICollectionView *collectionView;

@property (nonatomic, strong) NSString *majorId;
@end
