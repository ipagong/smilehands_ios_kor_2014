//
//  SHEtiquetteInfoDetailViewController.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHEtiquetteInfoDetailViewController.h"

@interface SHEtiquetteInfoDetailViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) UILabel *situationLabel;
@property (nonatomic, strong) UILabel *explainLabel;

@property (nonatomic, strong) UIView *topView;
@property (nonatomic, strong) UIView *splitView;

@property (nonatomic, strong) UIButton *favoriteButton;
@property (nonatomic, strong) UIButton *facebookShare;

@end

@implementation SHEtiquetteInfoDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTopContents];
    [self initDetailContents];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

- (NSString *)title
{
    return LocalString(@"title_etiquette_info");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.situationLabel setText:self.ettiquete.situation];
    
    NSString *oneLineString = [self.ettiquete.explain stringByReplacingOccurrencesOfString:@"\n"
                                                                                withString:@""];
    NSString *extendExplain = [oneLineString stringByReplacingOccurrencesOfString:@"."
                                                                       withString:@".\n\n "];
    
    [self.explainLabel setText:extendExplain];
    
    Etiquette *etiquette = [self.ettiquete MR_inThreadContext];
    
    [self.favoriteButton setSelected:etiquette.isFavorite.boolValue];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)initTopContents
{
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,
                                                           CGRectGetWidth(self.view.bounds),
                                                            112)];
    
    self.splitView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetHeight(self.topView.bounds) - 1,
                                                              CGRectGetWidth(self.view.bounds), 1)];
    [self.splitView setBackgroundColor:[UIColor colorWithRGB:0xc8c7cc]];
    
    [self.topView addSubview:self.splitView];
    
    self.situationLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 34,
                                                                    CGRectGetWidth(self.view.bounds) - 20,
                                                                    20)];
    self.situationLabel.font = [UIFont boldSystemFontOfSize:18.f];
    [self.situationLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    [self.situationLabel setTextAlignment:NSTextAlignmentCenter];
    [self.situationLabel setTextColor:[UIColor colorWithRGB:0x000000]];
    [self.situationLabel setBackgroundColor:[UIColor clearColor]];
    [self.topView addSubview:self.situationLabel];
    
    UIImage *fvNormalImage = [UIImage imageNamed:@"btn_favorite_normal"];
    UIImage *fvPressedImage = [UIImage imageNamed:@"btn_favorite_selected"];
    self.favoriteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.favoriteButton setImage:fvNormalImage forState:UIControlStateNormal];
    [self.favoriteButton setImage:fvPressedImage forState:UIControlStateHighlighted];
    [self.favoriteButton setImage:fvPressedImage forState:UIControlStateSelected];
    [self.favoriteButton setImage:fvNormalImage forState:UIControlStateDisabled];
    [self.favoriteButton addTarget:self
                            action:@selector(onClickFavoriteButton:)
                  forControlEvents:UIControlEventTouchUpInside];
    
    [self.favoriteButton setFrame:CGRectMake(CGRectGetWidth(self.view.bounds)/2 - 72,
                                            CGRectGetMaxY(self.situationLabel.frame) + 10,
                                            72, 40)];
    [self.topView addSubview:self.favoriteButton];

    UIImage *fbNormalImage = [UIImage imageNamed:@"facebook_unsel"];
    UIImage *fbPressedImage = [UIImage imageNamed:@"facebook_sel"];
    self.facebookShare = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.facebookShare setImage:fbNormalImage forState:UIControlStateNormal];
    [self.facebookShare setImage:fbPressedImage forState:UIControlStateHighlighted];
    [self.facebookShare setImage:fbPressedImage forState:UIControlStateSelected];
    [self.facebookShare setImage:fbNormalImage forState:UIControlStateDisabled];
    [self.facebookShare addTarget:self
                            action:@selector(onClickFacebookButton:)
                  forControlEvents:UIControlEventTouchUpInside];
    
    [self.facebookShare setFrame:CGRectMake(CGRectGetWidth(self.view.bounds)/2,
                                            CGRectGetMaxY(self.situationLabel.frame) + 10,
                                            72, 40)];
    [self.topView addSubview:self.facebookShare];
    
    [self.view addSubview:self.topView];
}

- (void)initDetailContents
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.topView.frame),
                                                                     CGRectGetWidth(self.view.bounds),
                                                                     CGRectGetHeight(self.view.bounds) - CGRectGetMaxY(self.topView.frame))];
    [self.scrollView setDelegate:self];
    [self.scrollView setAlwaysBounceVertical:YES];
    
    
    self.explainLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.explainLabel.font = [UIFont boldSystemFontOfSize:16.f];
    [self.explainLabel setNumberOfLines:0];
    [self.explainLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.explainLabel setTextAlignment:NSTextAlignmentLeft];
    [self.explainLabel setTextColor:[UIColor colorWithRGB:0x4a4a4a]];
    [self.explainLabel setBackgroundColor:[UIColor clearColor]];
    [self.scrollView addSubview:self.explainLabel];
    
    [self.scrollView setContentSize:self.explainLabel.frame.size];
    
    [self.view addSubview:self.scrollView];
}

- (void)viewWillLayoutSubviews
{
    [self.topView setFrame:CGRectMake(0, 0,
                                      CGRectGetWidth(self.view.bounds),
                                      112)];
    
    [self.splitView setFrame:CGRectMake(0, CGRectGetHeight(self.topView.bounds) - 1,
                                        CGRectGetWidth(self.view.bounds), 1)];
    
    [self.situationLabel setFrame:CGRectMake(10, 35,
                                             CGRectGetWidth(self.view.bounds) - 20,
                                             20)];
    
    [self.favoriteButton setFrame:CGRectMake(CGRectGetWidth(self.view.bounds)/2 - 72,
                                             CGRectGetMaxY(self.situationLabel.frame) + 10,
                                             72, 40)];
    
    [self.facebookShare setFrame:CGRectMake(CGRectGetWidth(self.view.bounds)/2,
                                            CGRectGetMaxY(self.situationLabel.frame) + 10,
                                            72, 40)];
    
    CGFloat sizeWidth = CGRectGetWidth(self.view.bounds) - 52;
    
    NSDictionary *attributes = @{NSFontAttributeName: self.explainLabel.font};
    
    CGRect frame = [self.explainLabel.text boundingRectWithSize:CGSizeMake(sizeWidth, CGFLOAT_MAX)
                                                        options:NSStringDrawingUsesLineFragmentOrigin
                                                     attributes:attributes
                                                        context:nil];
    
    [self.scrollView setFrame:CGRectMake(0, CGRectGetMaxY(self.topView.frame),
                                         CGRectGetWidth(self.view.bounds),
                                         CGRectGetHeight(self.view.bounds) - CGRectGetMaxY(self.topView.frame))];
    
    [self.explainLabel setFrame:CGRectMake(26, 27,
                                          CGRectGetWidth(self.view.bounds) - 52,
                                           frame.size.height)];
    
    [self.scrollView setContentSize:CGSizeMake(CGRectGetWidth(self.explainLabel.frame) + 52,
                                               CGRectGetHeight(self.explainLabel.frame) + 54)];
    
}

- (void)onClickFavoriteButton:(UIButton *)button
{
    if (self.ettiquete == nil) return;
    
    Etiquette *ettiquete = [((Etiquette *)self.ettiquete) MR_inThreadContext];
    
    BOOL isFavorite = !button.selected;
    
    [[SHLocalDataManager sharedInstance] setFavoriteEtiquette:ettiquete
                                                   isFavorite:isFavorite];
    
    [button setSelected:isFavorite];
    
}

- (void)onClickFacebookButton:(UIButton *)button
{
    [SWSocialPostingHelper openBasicSocialPostWithType:SHSocialPostingTypeFacebook
                                        viewController:self];
}



@end
