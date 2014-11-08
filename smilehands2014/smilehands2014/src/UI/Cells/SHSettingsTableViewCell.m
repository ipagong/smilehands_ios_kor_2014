//
//  SHSettingsTableViewCell.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 26..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHSettingsTableViewCell.h"

@implementation SHSettingsTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self makeDefaultView];
    }
    return self;
}

- (void)makeDefaultView
{
    self.leftImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self addSubview:self.leftImageView];
    
    self.arrowView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"setting_open"]];
    [self addSubview:self.arrowView];
    
    self.sliderView = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [self.sliderView setTintColor:[UIColor colorWithRGB:0xdb1939]];
    [self.sliderView setOnTintColor:[UIColor colorWithRGB:0xdb1939]];
    
    [self.sliderView addTarget:self
                        action:@selector(changedSwitchValue:)
              forControlEvents:UIControlEventValueChanged];
    
    [self addSubview:self.sliderView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.leftImageView setCenter:self.textLabel.center];
    [self.leftImageView setFrame:CGRectMake(15, 7.25,
                                            self.leftImageView.image.size.width,
                                            self.leftImageView.image.size.height)];
    [self.sliderView setCenter:self.textLabel.center];
    [self.sliderView setFrame:CGRectMake(CGRectGetWidth(self.bounds) - 60,
                                     7, 100, 30)];
    
    [self.arrowView setCenter:self.textLabel.center];
    [self.arrowView setFrame:CGRectMake(CGRectGetWidth(self.contentView.bounds) - 15 - self.arrowView.image.size.width,
                                    CGRectGetMinY(self.arrowView.frame),
                                    self.arrowView.image.size.width,
                                    self.arrowView.image.size.height)];
    
    [self.leftImageView setHidden:YES];
    [self.sliderView    setHidden:YES];
    [self.arrowView     setHidden:YES];
    
    [self setSelectionStyle:UITableViewCellSelectionStyleGray];
    
    [self.textLabel setFrame:CGRectMake(15,
                                        CGRectGetMinY(self.textLabel.frame),
                                        CGRectGetWidth(self.textLabel.frame),
                                        CGRectGetHeight(self.textLabel.frame))];
    
    [self.textLabel setTextColor:[UIColor colorWithRGB:0x8e8e93]];
    
    switch (self.type) {
        case SHSettingTypeTitle:
        {
            [self.leftImageView setHidden:NO];
            [self setSelectionStyle:UITableViewCellSelectionStyleNone];
            [self.textLabel setFrame:CGRectMake(CGRectGetMaxX(self.leftImageView.frame) + 7,
                                                CGRectGetMinY(self.textLabel.frame),
                                                CGRectGetWidth(self.textLabel.frame),
                                                CGRectGetHeight(self.textLabel.frame))];
            
            [self.textLabel setTextColor:[UIColor blackColor]];
            
        }
            break;
            
        case SHSettingTypeVersionInfo:
        {
            [self.arrowView setHidden:NO];
        }
            break;
            
        case SHSettingTypeCreator:
        {
            [self.arrowView setHidden:NO];
        }
            break;
            
        case SHSettingTypeAutoAlarm:
        {
            [self setSelectionStyle:UITableViewCellSelectionStyleNone];
            [self.sliderView setHidden:NO];
        }
            break;
            
        default:
            break;
    }
}

- (void)changedSwitchValue:(UISwitch *)slideView
{
    DLog(@"---> %d",slideView.isOn);
    
    [SHPreferences setOnAutoAlarm:slideView.isOn];
    
    if (slideView.isOn == NO) {
        [[SHBeaconUserManager sharedInstance].locationManager disallowDeferredLocationUpdates];
    } else {
        [[SHBeaconUserManager sharedInstance] checkAuthorizationIfOverIOS8];
    }
}

- (void)setSelected:(BOOL)selected
{
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    
}

@end
