//
//  SHEtiquetteRootViewController.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 23..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHEtiquetteRootViewController.h"
#import "SHEtiquetteInfoListViewController.h"

#define kDefaultTopHandicapCount 4

@interface SHEtiquetteRootViewController ()

@end

@implementation SHEtiquetteRootViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    self.title = LocalString(@"title_etiquette");
}

- (UITabBarItem *)tabBarItem
{
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:nil
                                                       image:[UIImage imageNamed:@"favorite"]
                                               selectedImage:[UIImage imageNamed:@""]];
    return item;
}

- (SHFetcherType)fetcherType
{
    return SHFetcherTypeTopHandicap;
}

- (void)initCustomData
{
    [super initCustomData];
    
    self.currentCollectionView = self.collectionView;
}

- (void)initCustomUI
{
    [self.collectionView setFrame:CGRectMake(0, 0,
                                             CGRectGetWidth(self.view.bounds),
                                             CGRectGetHeight(self.view.bounds))];
    [self.collectionView setBackgroundColor:RGBColor(230, 230, 230)];
    [self.collectionView setAlwaysBounceVertical:YES];
    [self.view addSubview:self.collectionView];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(self.view.bounds),
                      CGRectGetHeight(self.view.bounds)/kDefaultTopHandicapCount);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    Etiquette *etiquette = [self.dataList itemAtIndexPath:indexPath];
    
    SHEtiquetteInfoListViewController *etiquetteInfoVc = [[SHEtiquetteInfoListViewController alloc] initWithNibName:@"SHEtiquetteInfoListViewController"
                                                                                                             bundle:nil];
    
    etiquetteInfoVc.majorId = etiquette.majorId;
    
    [self.navigationController pushViewController:etiquetteInfoVc animated:YES];
}

@end
