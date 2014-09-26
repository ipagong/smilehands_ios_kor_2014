//
//  SHSettingsMemberViewController.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHSettingsMemberViewController.h"

@interface SHSettingsMemberViewController ()
@property (nonatomic, strong) UILabel *teamNameLabel;
@end

@implementation SHSettingsMemberViewController

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

- (NSString *)title
{
    return LocalString(@"title_creators");
}

- (void)initCustomUI
{
    self.teamNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0,
                                                                   CGRectGetWidth(self.view.bounds),
                                                                   87)];
    self.teamNameLabel.font = [UIFont boldSystemFontOfSize:20.f];
    [self.teamNameLabel setLineBreakMode:NSLineBreakByCharWrapping];
    [self.teamNameLabel setTextAlignment:NSTextAlignmentCenter];
    [self.teamNameLabel setTextColor:[UIColor colorWithRGB:0x000000]];
    [self.teamNameLabel setBackgroundColor:[UIColor clearColor]];
    
    [self.teamNameLabel setText:LocalString(@"settings_teamname")];
    [self.view addSubview:self.teamNameLabel];
    
    [self.collectionView setFrame:CGRectMake(0, CGRectGetMaxY(self.teamNameLabel.frame),
                                             CGRectGetWidth(self.view.bounds),
                                             CGRectGetHeight(self.view.bounds) - CGRectGetMaxY(self.teamNameLabel.frame))];
    [self.collectionView setBackgroundColor:[UIColor clearColor]];
    [self.collectionView setAlwaysBounceVertical:NO];
    [self.view addSubview:self.collectionView];
}

- (SHFetcherType)fetcherType
{
    return SHFetcherTypeMember;
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    [self.teamNameLabel setFrame:CGRectMake(0, 0,
                                            CGRectGetWidth(self.view.bounds),
                                            87)];
    
    [self.collectionView setFrame:CGRectMake(0, CGRectGetMaxY(self.teamNameLabel.frame),
                                             CGRectGetWidth(self.view.bounds),
                                             CGRectGetHeight(self.view.bounds) - CGRectGetMaxY(self.teamNameLabel.frame))];
}

- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout*)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(CGRectGetWidth(self.view.bounds)/4, 126);
}


@end
