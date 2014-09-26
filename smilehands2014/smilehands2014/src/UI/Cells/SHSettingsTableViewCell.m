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
    [self.contentView addSubview:self.leftImageView];
    
    self.arrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"setting_open"]];
    [self.contentView addSubview:self.arrow];
    
    self.slider = [[UISwitch alloc] initWithFrame:CGRectMake(0, 0, 100, 30)];
    [self.slider setTintColor:[UIColor colorWithRGB:0xdb1939]];
    [self.contentView addSubview:self.slider];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.leftImageView setCenter:self.textLabel.center];
    [self.leftImageView setFrame:CGRectMake(15, 7.25,
                                            self.leftImageView.image.size.width,
                                            self.leftImageView.image.size.height)];
    [self.slider setCenter:self.textLabel.center];
    [self.slider setFrame:CGRectMake(CGRectGetWidth(self.contentView.bounds) - CGRectGetWidth(self.slider.frame) - 15,
                                     CGRectGetMinY(self.slider.frame),
                                     CGRectGetWidth(self.slider.frame),
                                     CGRectGetHeight(self.slider.frame))];
    [self.arrow setCenter:self.slider.center];
    
    [self.leftImageView setHidden:YES];
    [self.slider    setHidden:YES];
    [self.arrow     setHidden:YES];
    
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
            [self.arrow setHidden:NO];
        }
            break;
            
        case SHSettingTypeCreator:
        {
            [self.arrow setHidden:NO];
        }
            break;
            
        case SHSettingTypeAutoAlarm:
        {
            [self.slider setHidden:NO];
        }
            break;
            
        default:
            break;
    }
}
@end
