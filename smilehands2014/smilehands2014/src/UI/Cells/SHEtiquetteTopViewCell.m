//
//  SHEtiquetteTopViewCell.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHEtiquetteTopViewCell.h"
#import "KindHandicap.h"

@interface SHEtiquetteTopViewCell ()

@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UIImageView *titleBgView;
@property (nonatomic, strong) UILabel *title;

@property (nonatomic, strong) UIImage *normalImage;
@property (nonatomic, strong) UIImage *pressedImage;

@end

@implementation SHEtiquetteTopViewCell

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
    self.normalImage = [UIImage imageNamed:@"btn_main_nor"];
    self.pressedImage = [UIImage imageNamed:@"btn_main_pre"];
    
    self.bgImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.bgImageView setContentMode:UIViewContentModeScaleAspectFill];
    [self.bgImageView setClipsToBounds:YES];
    
    self.titleBgView = [[UIImageView alloc] initWithImage:self.normalImage];
    [self.titleBgView setHighlightedImage:self.pressedImage];
    [self.titleBgView setAlpha:0.6];
    
    self.title = [[UILabel alloc] initWithFrame:CGRectZero];
    self.title.font = [UIFont systemFontOfSize:17.f];
    [self.title setLineBreakMode:NSLineBreakByTruncatingMiddle];
    [self.title setTextColor:RGBColor(255, 255, 255)];
    [self.title setHighlightedTextColor:RGBColor(219, 25, 57)];
    [self.title setBackgroundColor:[UIColor clearColor]];
    
    [self.contentView addSubview:self.bgImageView];
    [self.contentView addSubview:self.titleBgView];
    [self.contentView addSubview:self.title];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.bgImageView setFrame:CGRectMake(2, 1,
                                          CGRectGetWidth(self.bounds) - 4,
                                          CGRectGetHeight(self.bounds) - 2)];
    
    [self.titleBgView setCenter:self.contentView.center];
    
    [self.title sizeToFit];
    [self.title setCenter:self.contentView.center];
    
}

-(void)refreshWithModel:(id<SHCommonModelProtocol>)model
{
    if ([model isKindOfClass:[KindHandicap class]] == NO) {
        return;
    }
    
    self.model = model;
    
    KindHandicap *handicap = [(KindHandicap *)model MR_inThreadContext];

    [self.title setText:handicap.title];
    
    UIImage *bgImage = [UIImage imageNamed:handicap.imagePath];
    
    if (bgImage == nil) {
        bgImage = [UIImage imageWithContentsOfFile:handicap.imagePath];
    }
    
    [self.bgImageView setImage:bgImage];
    
    [self setNeedsLayout];
}

@end