//
//  SHCommonViewController.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHCommonViewController.h"
#import "SHSearchViewController.h"

@implementation SHCommonViewController

#pragma mark - setup methods

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initCustomData];
}

- (void)initCustomData
{
    self.dataList = [[SHDataList alloc] init];
    
    self.fetcher = [SHFetcherFactory createFetcherWithType:self.fetcherType delegate:self];
    self.fetcher.dataList = self.dataList;
    self.fetcher.parameter = self.fetcherParameter;
}

- (void)initCustomUI
{
    
}

- (SHFetcherType)fetcherType
{
    DLog(@"-----> should override...");
    return SHFetcherTypeTopHandicap;
}

- (id)fetcherParameter
{
    return nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self initCustomUI];
    [self setupNavigationBar];
    
    if (self.fetcher) {
        [self.fetcher requestData];
    }

    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    if(self.navigationController.viewControllers.count > 1) {
        return YES;
    }
    return NO;
}

#pragma mark - fetcher delegate

- (void)smileHandsFetcher:(id<SHFetcherProtocol>)fetcher finishedResultType:(SHFetcherResultType)resultType error:(NSError *)error
{
    switch (resultType) {
        case SHFetcherResultTypeSuccess:
        {
            [self.currentCollectionView reloadData];
        }
            break;
            
        case SHFetcherResultTypeReloadSuccess:
        {
            [self.currentCollectionView performBatchUpdates:^{
                [self.currentCollectionView reloadData];
            } completion:^(BOOL finished) {}];
        }
            break;
        case SHFetcherResultTypeNoData:
        {
            [self.currentCollectionView reloadData];
        }
            break;
        default:
            break;
    }
}

- (void)setupNavigationBar
{
    [self setupNavigationBarLeft];
    [self setupNavigationBarRight];
}

- (void)setupNavigationBarLeft
{
    if (self.navigationController && self.navigationController.viewControllers.count > 1) {
        
        SHBarButtonItem *previous = [SHBarButtonItem addBarButtonTitle:nil
                                                          defaultImage:[UIImage imageNamed:@"btn_back"]
                                                        highlightImage:nil target:self action:@selector(onClickBackButton:)];
        self.navigationItem.leftBarButtonItem = previous;
    }
}

- (void)setupNavigationBarRight
{
    SHBarButtonItem *search = [SHBarButtonItem addBarButtonTitle:nil
                                                    defaultImage:[UIImage imageNamed:@"btn_search"]
                                                  highlightImage:nil target:self action:@selector(onClickSearch:)];
    self.navigationItem.rightBarButtonItem = search;
}

- (void)onClickBackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)onClickSearch:(id)sender
{
    SHSearchViewController *searchVc = [[SHSearchViewController alloc] initWithNibName:@"SHSearchViewController"
                                                                                bundle:nil];
    
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:searchVc];
    
    [self.navigationController presentViewController:navi animated:YES completion:nil];
}

#pragma mark - layout methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DLog(@"---> you should override.");
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DLog(@"---> you should override.");
}
// override if need header/footer.
//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.dataList.sectionData.count;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.dataList itemsAtSection:section].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id <SHCommonModelProtocol> model = [self.dataList itemAtIndexPath:indexPath];
    
    if (model == nil) return nil;
    
    [collectionView registerClass:model.cellClazz
       forCellWithReuseIdentifier:model.cellKey];
    
    UICollectionViewCell <SHCommonCellProtocol> *cell = [collectionView dequeueReusableCellWithReuseIdentifier:model.cellKey
                                                                                                  forIndexPath:indexPath];
    
    [cell refreshWithModel:model];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    id <SHCommonModelProtocol> model = [self.dataList itemAtIndexPath:indexPath];
    return [model cellSize];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView
                        layout:(UICollectionViewLayout*)collectionViewLayout
        insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}



@end
