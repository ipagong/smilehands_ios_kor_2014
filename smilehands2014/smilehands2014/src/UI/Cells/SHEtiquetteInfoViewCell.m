//
//  SHEtiquetteInfoViewCell.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHEtiquetteInfoViewCell.h"

@interface SHEtiquetteInfoViewCell ()

@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) UILabel     *situationLabel;
@property (nonatomic, strong) UILabel     *explainLabel;

@property (nonatomic, strong) UIButton    *favoriteButton;

@end

@implementation SHEtiquetteInfoViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeDefaultView];
    }
    return self;
}

- (void)makeDefaultView
{
    UIImage *normalImage = [UIImage imageNamed:@"btn_favorite_normal"];
    UIImage *pressedImage = [UIImage imageNamed:@"btn_favorite_selected"];

    UIImage *cardBg = [UIImage imageNamed:@"cardbg"];
    UIImage *bgImage = [cardBg resizableImageWithCapInsets:UIEdgeInsetsMake(cardBg.size.height/2 - 2,
                                                                            cardBg.size.width/2 - 2,
                                                                            cardBg.size.height/2 - 2,
                                                                            cardBg.size.width/2 - 2)];
    
    self.bgImageView = [[UIImageView alloc] initWithImage:bgImage];
    [self.contentView addSubview:self.bgImageView];
    
    self.situationLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.situationLabel.font = [UIFont boldSystemFontOfSize:16.f];
    [self.situationLabel setLineBreakMode:NSLineBreakByCharWrapping];
    [self.situationLabel setTextAlignment:NSTextAlignmentLeft];
    [self.situationLabel setTextColor:RGBColor(20, 20, 20)];
    [self.situationLabel setBackgroundColor:[UIColor clearColor]];
    [self.bgImageView addSubview:self.situationLabel];
    
    self.explainLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.explainLabel.font = [UIFont systemFontOfSize:13.f];
    [self.explainLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    [self.explainLabel setTextColor:RGBColor(166, 166, 166)];
    [self.explainLabel setBackgroundColor:[UIColor clearColor]];
    [self.explainLabel setNumberOfLines:2];
    [self.explainLabel setTextAlignment:NSTextAlignmentLeft];
    
    [self.bgImageView addSubview:self.explainLabel];
    
    self.favoriteButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.favoriteButton setImage:normalImage forState:UIControlStateNormal];
    [self.favoriteButton setImage:pressedImage forState:UIControlStateHighlighted];
    [self.favoriteButton setImage:pressedImage forState:UIControlStateSelected];
    [self.favoriteButton setImage:normalImage forState:UIControlStateDisabled];
    [self.favoriteButton addTarget:self
                            action:@selector(onClickFavoriteButton:)
                  forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:self.favoriteButton];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.bgImageView setFrame:CGRectMake(10, 9,
                                          CGRectGetWidth(self.contentView.bounds) - 20,
                                          CGRectGetHeight(self.contentView.bounds) - 18)];

    [self.situationLabel setFrame:CGRectMake(10, 15,
                                             CGRectGetWidth(self.bgImageView.bounds) - 47,
                                             18)];
    
    [self.explainLabel setFrame:CGRectMake(CGRectGetMinX(self.situationLabel.frame),
                                           CGRectGetMaxY(self.situationLabel.frame),
                                           CGRectGetWidth(self.bgImageView.bounds) - 27,
                                           CGRectGetHeight(self.bgImageView.bounds) - CGRectGetMaxY(self.situationLabel.frame) + 7 - 13)];
    
    [self.favoriteButton setFrame:CGRectMake(CGRectGetWidth(self.contentView.bounds) - 46,
                                             9, 36, 45)];
}

- (void)refreshWithModel:(id<SHCommonModelProtocol>)model
{
    if ([model isKindOfClass:[Etiquette class]] == NO) {
        self.model = nil;
        return;
    }
    
    Etiquette *ettiquete = [((Etiquette *)model) MR_inThreadContext];
    
    self.model = ettiquete;
    
    if (ettiquete.isFavorite.boolValue == YES) {
        [self.favoriteButton setSelected:YES];
    } else {
        [self.favoriteButton setSelected:NO];
    }
    
    [self.situationLabel setText:ettiquete.situation];
    [self.explainLabel   setText:ettiquete.explain];
    
    [self setNeedsLayout];
}

- (void)onClickFavoriteButton:(UIButton *)button
{
    if (self.model == nil) return;
    
    Etiquette *ettiquete = [((Etiquette *)self.model) MR_inThreadContext];

    BOOL isFavorite = !button.selected;
    
    [[SHLocalDataManager sharedInstance] setFavoriteEtiquette:ettiquete
                                                   isFavorite:isFavorite];
    
    [button setSelected:isFavorite];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:kSHNotificationFavoriteEvent
                                                        object:ettiquete];
    
}

@end
