//
//  SHSettingsVersionViewController.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHSettingsVersionViewController.h"

@interface SHSettingsVersionViewController ()

@property (nonatomic, strong) UIImageView *logoImageView;

@property (nonatomic, strong) UILabel *teamLabel;

@property (nonatomic, strong) UILabel *versionLabel;

@property (nonatomic, strong) UIButton *updateButton;

@end

@implementation SHSettingsVersionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self initCustomUI];
    
    [self setupNavigationBar];
    
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



- (void)setupNavigationBar
{
    [self setupNavigationBarLeft];
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

- (void)onClickBackButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSString *)title
{
    return LocalString(@"title_version");
}

- (void)initCustomUI
{
    UIImage *logoImage = [UIImage imageNamed:@"smilehands"];
    
    self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetWidth(self.view.bounds)/2 - logoImage.size.width/2 , 95,
                                                                      logoImage.size.width,
                                                                       logoImage.size.height)];
    [self.logoImageView setImage:logoImage];
    [self.view addSubview:self.logoImageView];
    
    self.teamLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,
                                                               CGRectGetMaxY(self.logoImageView.frame) + 35,
                                                               CGRectGetWidth(self.view.frame) - 20,
                                                               21)];
    [self.teamLabel setText:[NSString stringWithFormat:LocalString(@"settings_version_project_name")]];
    self.teamLabel.font = [UIFont boldSystemFontOfSize:18.f];
    [self.teamLabel setLineBreakMode:NSLineBreakByCharWrapping];
    [self.teamLabel setTextAlignment:NSTextAlignmentCenter];
    [self.teamLabel setTextColor:[UIColor colorWithRGB:0x222222]];
    [self.teamLabel setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.teamLabel];
    
    self.versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,
                                                                  CGRectGetMaxY(self.teamLabel.frame) + 12,
                                                                  CGRectGetWidth(self.view.frame) - 20,
                                                                  18)];
    [self.versionLabel setText:[NSString stringWithFormat:LocalString(@"settings_version_info"),
                                [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]]];
    self.versionLabel.font = [UIFont boldSystemFontOfSize:16.f];
    [self.versionLabel setLineBreakMode:NSLineBreakByCharWrapping];
    [self.versionLabel setTextAlignment:NSTextAlignmentCenter];
    [self.versionLabel setTextColor:[UIColor colorWithRGB:0xa6a6a6]];
    [self.versionLabel setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:self.versionLabel];
    
    UIImage *image = [UIImage imageNamed:@"btn_update"];
    UIImage *resizableImage = [image resizableImageWithCapInsets:UIEdgeInsetsMake(image.size.height/2,
                                                                                  image.size.width/2,
                                                                                  image.size.height/2,
                                                                                  image.size.width/2)];
    
    self.updateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.updateButton setTitle:LocalString(@"settings_version_newest")
                       forState:UIControlStateNormal];
    [self.updateButton.titleLabel setFont:[UIFont systemFontOfSize:16]];
    [self.updateButton setTitleColor:[UIColor colorWithRGB:0xa6a6a6] forState:UIControlStateNormal];
    
    [self.updateButton addTarget:self
                          action:@selector(onClickUpdateButton:)
                forControlEvents:UIControlEventTouchUpInside];
    
    [self.updateButton setBackgroundImage:resizableImage forState:UIControlStateNormal];
    [self.updateButton setFrame:CGRectMake(CGRectGetWidth(self.view.bounds)/2 - 104,
                                           CGRectGetMaxY(self.versionLabel.frame) + 42,
                                           208, 46)];
    [self.view addSubview:self.updateButton];
    
}

- (void)viewWillLayoutSubviews
{
    [self.logoImageView setFrame:CGRectMake(CGRectGetWidth(self.view.bounds)/2 - self.logoImageView.image.size.width/2 ,
                                            95,
                                            self.logoImageView.image.size.width,
                                            self.logoImageView.image.size.height)];
    
    [self.teamLabel setFrame:CGRectMake(10,
                                        CGRectGetMaxY(self.logoImageView.frame) + 35,
                                        CGRectGetWidth(self.view.frame) - 20,
                                        21)];
    
    [self.versionLabel setFrame:CGRectMake(10,
                                           CGRectGetMaxY(self.teamLabel.frame) + 12,
                                           CGRectGetWidth(self.view.frame) - 20,
                                           18)];
    
    [self.updateButton setFrame:CGRectMake(CGRectGetWidth(self.view.bounds)/2 - 104,
                                           CGRectGetMaxY(self.versionLabel.frame) + 42,
                                           208, 46)];
}

- (void)onClickUpdateButton:(UIButton *)button
{
    //do nothing..
    return;
}


@end
