//
//  SHEmptyView.m
//
//  Created by suwan on 2014. 8. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHEmptyView.h"

#define kCloudEmptyViewTopDefaultImageOffset        100
#define kCloudEmptyViewTopDefaultTitleOffset        27
#define kCloudEmptyViewTopDefaultSubtitleOffset     15

#define kDefaultImageSize CGSizeMake(124,66)

@interface SHEmptyView ()

@end

@implementation SHEmptyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self makeDefaultView];
        [self setupInitData];
    }
    return self;
}

- (void)makeDefaultView
{
//    [self onOutline];
    
    self.backgroundColor = [UIColor clearColor];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.imageView setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.imageView];
    
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.titleLabel setTextColor:RGBColor(133, 133, 133)];
    self.titleLabel.font = [UIFont systemFontOfSize:14.f];
    [self.titleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self.titleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.titleLabel setNumberOfLines:1];
    [self addSubview:self.titleLabel];
    
    self.subtitleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [self.subtitleLabel setTextColor:RGBColor(154, 158, 168)];
    self.subtitleLabel.font = [UIFont systemFontOfSize:14.f];
    [self.subtitleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.subtitleLabel setLineBreakMode:NSLineBreakByWordWrapping];
    [self.subtitleLabel setBackgroundColor:[UIColor clearColor]];
    [self.subtitleLabel setNumberOfLines:3];
    [self addSubview:self.subtitleLabel];
}

- (void)setupInitData
{
    self.topImageOffset = kCloudEmptyViewTopDefaultImageOffset;
    self.topTitleOffset = kCloudEmptyViewTopDefaultTitleOffset;
    self.topSubtitleOffset = kCloudEmptyViewTopDefaultSubtitleOffset;
    
}

- (void)layoutSubviews
{
    [self.titleLabel    setText:self.titleText];
    [self.subtitleLabel setText:self.subtitleText];
    
    [super layoutSubviews];
    
    if (self.onView) {
        self.frame = CGRectMake(0, 0,
                                CGRectGetWidth(self.onView.bounds),
                                CGRectGetHeight(self.onView.bounds));
    }
    
    CGSize imageSize = CGSizeZero;
    
    if (self.image) {
        imageSize = self.image.size;
        [self.imageView setImage:self.image];
    } else {
        imageSize = kDefaultImageSize;
        [self.imageView setImage:nil];
    }
    
    [self.imageView setFrame:CGRectMake(CGRectGetWidth(self.bounds)/2 - imageSize.width/2,
                                        self.topImageOffset,
                                        imageSize.width,
                                        imageSize.height)];
    
    [self.titleLabel setFrame:CGRectMake(0,
                                         CGRectGetMaxY(self.imageView.frame) + self.topTitleOffset - 3,
                                         CGRectGetWidth(self.bounds),
                                         18)];
    
    [self.subtitleLabel setFrame:CGRectMake(0,
                                         CGRectGetMaxY(self.titleLabel.frame) + self.topSubtitleOffset - 3,
                                         CGRectGetWidth(self.bounds),
                                         50)];
    
}

@end
