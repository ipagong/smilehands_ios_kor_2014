//
//  SHBeaconFinderViewController.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 23..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHBeaconFinderViewController.h"
#import "WZBeacon.h"
#import "WZBeacon+SHModel.h"
#import "SHEtiquetteInfoListViewController.h"

@interface SHBeaconFinderViewController ()
@property (nonatomic, strong) SHBarButtonItem *refrsh;
@end

@implementation SHBeaconFinderViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initCustomData];
}

- (void)initCustomData
{
    self.dataList = [[SHDataList alloc] init];
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

- (NSString *)title
{
    return LocalString(@"title_beacon");
}

- (void)viewWillAppear:(BOOL)animated
{    
    [super viewWillAppear:animated];
    
    [self initCustomUI];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(changedBeaconsDevices:)
                                                 name:SHBeaconManagerNotificationDidUpdate
                                               object:nil];
    
    [self setupRightNavigationBar];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:SHBeaconManagerNotificationDidUpdate
                                                  object:nil];
}

- (void)setupRightNavigationBar
{
    self.refrsh = [SHBarButtonItem addBarButtonTitle:nil
                                                    defaultImage:[UIImage imageNamed:@"btn_refresh"]
                                                  highlightImage:nil target:self action:@selector(onClickRefresh:)];
    self.navigationItem.rightBarButtonItem = self.refrsh;
}

- (void)onClickRefresh:(id)sender
{
    [AppUtility runSpinAnimationOnView:self.refrsh.animationView
                              duration:4
                             rotations:2
                                repeat:0];
    
    [[SHBeaconManager sharedInstance] scanDevice];
}

- (void)changedBeaconsDevices:(NSNotification *)noti
{
//    DLog(@"-----> %@", [[SHBeaconManager sharedInstance] validDevices]);
    
    NSArray *validDevices = [[SHBeaconManager sharedInstance] validDevices];
    [self.dataList setSection:0 sectionObject:kEmptySectionData sectionItems:validDevices];
    
    [self.collectionView reloadData];
}

#pragma mark - layout methods

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    WZBeacon *beacon = [self.dataList itemAtIndexPath:indexPath];
    
    SHEtiquetteInfoListViewController *etiquetteInfoVc = [[SHEtiquetteInfoListViewController alloc] initWithNibName:@"SHEtiquetteInfoListViewController" bundle:nil];
    
    NSDictionary *handicapInfo = SHLocalDataManager.defaultHandicapInfoList[beacon.major.stringValue];
    
    if (handicapInfo == nil) {
        return;
    }
    
    NSString *title = handicapInfo[kDefaultHandicapTitle];
    
    etiquetteInfoVc.majorId = beacon.major.stringValue;
    
    etiquetteInfoVc.title = [NSString stringWithFormat:LocalString(@"title_etiquette_specific"), title];
    
    [self.navigationController pushViewController:etiquetteInfoVc animated:YES];
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath
{
    DLog(@"---> you should override.");
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    NSInteger count = self.dataList.sectionData.count;

    [SHEmptyViewFactory removeFromEmptyViewWithSuperView:self.collectionView];
    
    if (count == 0) {
        [SHEmptyViewFactory addEmptyViewWithType:SHEmptyViewTypeFinder
                                       superView:self.collectionView];
    }
    
    return count;
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
    return CGSizeMake(CGRectGetWidth(self.view.bounds), 80);
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
