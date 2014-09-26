//
//  SHFavoriteViewController.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 23..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHFavoriteViewController.h"
#import "SHEtiquetteInfoDetailViewController.h"

@interface SHFavoriteViewController ()

@end

@implementation SHFavoriteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = LocalString(@"title_favorite");
    
    [self registNotification];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self unregistNotification];
}

- (void)initCustomData
{
    [super initCustomData];
    
    self.currentCollectionView = self.collectionView;
}

- (SHFetcherType)fetcherType
{
    return SHFetcherTypeFavorite;
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

- (void)registNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changedFavoriteItem:)
                                                 name:kSHNotificationFavoriteEvent
                                               object:nil];
}

- (void)unregistNotification
{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:kSHNotificationFavoriteEvent
                                                  object:nil];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(self.view.bounds), 101);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    id etiquette = [self.dataList itemAtIndexPath:indexPath];
    
    SHEtiquetteInfoDetailViewController *detailVc = [[SHEtiquetteInfoDetailViewController alloc] initWithNibName:@"SHEtiquetteInfoDetailViewController"
                                                                                                          bundle:nil];
    detailVc.ettiquete = etiquette;
    [self.navigationController pushViewController:detailVc animated:YES];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader] == YES) {
        
        id <SHCommonSectionModelProtocol> model = [self.dataList seciontObjectAtSection:indexPath.section];
        
        if (model == nil) return nil;
        
        [collectionView registerClass:[model sectionClazz]
           forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                  withReuseIdentifier:[model sectionKey]];
         
        UICollectionReusableView <SHCommonSectionProtocol> *section = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                                                         withReuseIdentifier:[model sectionKey]
                                                                                                                forIndexPath:indexPath];
        [section refreshWithSectionModel:model];
        
        return section;
    }
    
    return nil;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    id <SHCommonSectionModelProtocol> model = [self.dataList seciontObjectAtSection:section];
    
    return CGSizeMake(CGRectGetWidth(self.view.frame), [model sectionSize].height);
}

- (void)changedFavoriteItem:(NSNotification *)noti
{
    if (noti.object) {
        
        [self.currentCollectionView performBatchUpdates:^{
            
            NSIndexPath *indexPath = nil;
            
            for (int i = 0 ; i < self.dataList.sectionData.count ; i++ ) {
                
                NSInteger row = 0;
                for (id item in [self.dataList itemsAtSection:i]) {
                    if ([noti.object isEqual:item] == YES) {
                        indexPath = [NSIndexPath indexPathForItem:row inSection:i];
                    }
                    
                    row ++;
                }
            }
            if (indexPath) {
                [[self.dataList itemsAtSection:indexPath.section] removeObject:noti.object];
                [self.currentCollectionView deleteItemsAtIndexPaths:@[indexPath]];
                
            }
        
        } completion:^(BOOL finished) {
            [self.fetcher requestData];
        }];
    }
    
}


@end
