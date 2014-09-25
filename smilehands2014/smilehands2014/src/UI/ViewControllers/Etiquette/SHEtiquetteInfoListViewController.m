//
//  SHEtiquetteInfoListViewController.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHEtiquetteInfoListViewController.h"
#import "SHEtiquetteInfoDetailViewController.h"

@interface SHEtiquetteInfoListViewController ()

@end

@implementation SHEtiquetteInfoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initCustomData
{
    [super initCustomData];
    
    self.currentCollectionView = self.collectionView;
}

- (SHFetcherType)fetcherType
{
    return SHFetcherTypeEtiquette;
}

- (id)fetcherParameter
{
    return self.majorId;
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
    return CGSizeMake(CGRectGetWidth(self.view.bounds), 101);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    SHEtiquetteInfoDetailViewController *detailVc = [[SHEtiquetteInfoDetailViewController alloc] initWithNibName:@"SHEtiquetteInfoDetailViewController"
                                                                                                          bundle:nil];
    
    [self.navigationController pushViewController:detailVc animated:YES];
}

@end
