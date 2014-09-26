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
    
    self.versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(10,
                                                                  CGRectGetMaxY(self.logoImageView.frame) + 15,
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
    
    [self.versionLabel setFrame:CGRectMake(10,
                                           CGRectGetMaxY(self.logoImageView.frame) + 15,
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
