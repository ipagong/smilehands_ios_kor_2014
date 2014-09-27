//
//  SHBeaconUserViewCell.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHBeaconUserViewCell.h"
#import "UIImageView+AFNetworking.h"

#import <QuartzCore/QuartzCore.h>

@interface SHBeaconUserViewCell ()

@property (nonatomic, strong) UIImageView *bgImageView;

@property (nonatomic, strong) UIImageView *dotImageView;
@property (nonatomic, strong) UILabel     *handicapLabel;
@property (nonatomic, strong) UILabel     *idLabel;

@property (nonatomic, strong) UIImageView *userImageView;

@property (nonatomic, strong) UIButton    *favoriteButton;

@end

@implementation SHBeaconUserViewCell

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
    
    UIImage *cardBg = [UIImage imageNamed:@"cardbg"];
    UIImage *bgImage = [cardBg resizableImageWithCapInsets:UIEdgeInsetsMake(cardBg.size.height/2 - 2,
                                                                            cardBg.size.width/2 - 2,
                                                                            cardBg.size.height/2 - 2,
                                                                            cardBg.size.width/2 - 2)];
    
    self.bgImageView = [[UIImageView alloc] initWithImage:bgImage];
    [self.contentView addSubview:self.bgImageView];
    
    self.userImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"photo"]];
    [self.userImageView setBackgroundColor:[UIColor clearColor]];
    [self.bgImageView addSubview:self.userImageView];
    
    self.userImageView.layer.cornerRadius = self.userImageView.image.size.width/5;
    self.userImageView.layer.masksToBounds = YES;
    
    self.handicapLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.handicapLabel.font = [UIFont boldSystemFontOfSize:17.f];
    [self.handicapLabel setLineBreakMode:NSLineBreakByCharWrapping];
    [self.handicapLabel setTextAlignment:NSTextAlignmentLeft];
    [self.handicapLabel setTextColor:[UIColor colorWithRGB:0x000000]];
    [self.handicapLabel setBackgroundColor:[UIColor clearColor]];
    [self.bgImageView addSubview:self.handicapLabel];
    
    self.idLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.idLabel.font = [UIFont systemFontOfSize:14.f];
    [self.idLabel setLineBreakMode:NSLineBreakByCharWrapping];
    [self.idLabel setTextColor:[UIColor colorWithRGB:0xdb1939]];
    [self.idLabel setBackgroundColor:[UIColor clearColor]];
    [self.idLabel setTextAlignment:NSTextAlignmentLeft];
    
    [self.bgImageView addSubview:self.idLabel];
    
    self.dotImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"section"]];
    [self.bgImageView addSubview:self.dotImageView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.bgImageView setFrame:CGRectMake(10, 9,
                                          CGRectGetWidth(self.contentView.bounds) - 20,
                                          CGRectGetHeight(self.contentView.bounds) - 18)];
    
    [self.userImageView setFrame:CGRectMake(10, 8, 45, 45)];
    
    [self.handicapLabel sizeToFit];
    
    [self.handicapLabel setFrame:CGRectMake(CGRectGetMaxX(self.userImageView.frame) + 10,
                                            CGRectGetHeight(self.bgImageView.bounds)/2 - 9,
                                            CGRectGetWidth(self.handicapLabel.bounds),
                                            18)];
    
    [self.dotImageView setFrame:CGRectMake(CGRectGetMaxX(self.handicapLabel.frame) + 4,
                                          CGRectGetHeight(self.bgImageView.frame)/2 - self.dotImageView.image.size.height/2,
                                          self.dotImageView.image.size.width,
                                          self.dotImageView.image.size.height)];
    
    [self.idLabel sizeToFit];
    [self.idLabel setFrame:CGRectMake(CGRectGetMinX(self.dotImageView.frame) + 6,
                                      CGRectGetHeight(self.bgImageView.bounds)/2 - 7,
                                      CGRectGetWidth(self.idLabel.bounds),
                                      15)];
}

- (void)refreshWithModel:(id<SHCommonModelProtocol>)model
{
    if ([model isKindOfClass:[WZBeacon class]] == NO) {
        self.model = nil;
        return;
    }
    self.model = model;
    WZBeacon *beacon = self.model;
    
    NSString *title = nil;
    @try {
        title = [SHLocalDataManager defaultHandicapInfoList][beacon.major.stringValue][kDefaultHandicapTitle];
    }
    @catch (NSException *exception) {

    }
    if ([AppUtility isEmptyOrWhitespace:title] == YES) {
        title = beacon.major.stringValue;
    }

    [self.handicapLabel setText:title];
    [self.idLabel setText:beacon.BDAddress];
    
    [self setNeedsLayout];
}

@end
