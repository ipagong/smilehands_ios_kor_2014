//
//  SHSearchViewController.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 23..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHSearchViewController.h"
#import "SHEtiquetteInfoDetailViewController.h"

@interface SHSearchViewController () <UISearchBarDelegate>

@property (nonatomic, strong) UISearchBar *searchBar;
@end

@implementation SHSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self initCustomUI];
    [self setupNavigationBar];
    
    if (self.fetcher) {
        [self.fetcher requestData];
    }
    
    [self.searchBar removeFromSuperview];
    [self.navigationController.navigationBar addSubview:self.searchBar];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self.searchBar becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self.searchBar removeFromSuperview];
    
    [self.searchBar resignFirstResponder];
}

- (void)setupNavigationBar
{
    
    SHBarButtonItem *cancel = [SHBarButtonItem addBarButtonTitle:LocalString(@"label_cancel")
                                                      defaultImage:nil
                                                    highlightImage:nil
                                                         target:self
                                                         action:@selector(onClickBackButton:)];
    self.navigationItem.rightBarButtonItem = cancel;
}

- (void)onClickBackButton:(id)sender
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}


- (SHFetcherType)fetcherType
{
    return SHFetcherTypeSearch;
}

- (id)fetcherParameter
{
    return nil;
}

- (void)initCustomData
{
    [super initCustomData];
    
    self.currentCollectionView = self.collectionView;
}

- (void)initCustomUI
{
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 0,
                                                                   CGRectGetWidth(self.view.bounds) - 70, 44)];
    [self.searchBar setDelegate:self];
    
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
    id etiquette = [self.dataList itemAtIndexPath:indexPath];
    
    SHEtiquetteInfoDetailViewController *detailVc = [[SHEtiquetteInfoDetailViewController alloc] initWithNibName:@"SHEtiquetteInfoDetailViewController"
                                                                                                          bundle:nil];
    detailVc.ettiquete = etiquette;
    [self.navigationController pushViewController:detailVc animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    [NSObject cancelPreviousPerformRequestsWithTarget:self.fetcher selector:@selector(requestData) object:nil];
    self.fetcher.parameter = searchBar.text;
    [self.fetcher performSelector:@selector(requestData) withObject:nil afterDelay:0.3];
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    self.fetcher.parameter = searchBar.text;
    [self.fetcher performSelector:@selector(requestData) withObject:nil afterDelay:0];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.searchBar resignFirstResponder];
}


@end
