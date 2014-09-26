//
//  SHTeamMemberViewCell.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHTeamMemberViewCell.h"
#import "SHMemberModel.h"

@interface SHTeamMemberViewCell ()

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, strong) UILabel *roleLabel;
@property (nonatomic, strong) UILabel *nameLabel;

@end

@implementation SHTeamMemberViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self makeDefaultView];
        
    }
    return self;
}

- (void)makeDefaultView
{
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    [self.contentView addSubview:self.imageView];
    
    self.roleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.roleLabel.font = [UIFont boldSystemFontOfSize:12.f];
    [self.roleLabel setLineBreakMode:NSLineBreakByCharWrapping];
    [self.roleLabel setTextAlignment:NSTextAlignmentCenter];
    [self.roleLabel setTextColor:[UIColor colorWithRGB:0xa6a6a6]];
    [self.roleLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:self.roleLabel];
    
    self.nameLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.nameLabel.font = [UIFont boldSystemFontOfSize:15.f];
    [self.nameLabel setLineBreakMode:NSLineBreakByCharWrapping];
    [self.nameLabel setTextAlignment:NSTextAlignmentCenter];
    [self.nameLabel setTextColor:[UIColor colorWithRGB:0x555555]];
    [self.nameLabel setBackgroundColor:[UIColor clearColor]];
    [self.contentView addSubview:self.nameLabel];
}

- (void)layoutSubviews
{
    [self.imageView setFrame:CGRectMake(CGRectGetWidth(self.contentView.bounds)/2
                                        - self.imageView.image.size.width/2,
                                        0,
                                        self.imageView.image.size.width,
                                        self.imageView.image.size.height)];

    [self.roleLabel setFrame:CGRectMake(0,
                                        CGRectGetMaxY(self.imageView.frame) + 6,
                                        CGRectGetWidth(self.contentView.bounds),
                                        15)];

    [self.nameLabel setFrame:CGRectMake(0,
                                        CGRectGetMaxY(self.roleLabel.frame) + 5,
                                        CGRectGetWidth(self.contentView.bounds),
                                        18)];

    [super layoutSubviews];

}

- (void)refreshWithModel:(id<SHCommonModelProtocol>)model
{
    if (model == nil) return;
    if ([model isKindOfClass:[SHMemberModel class]] == NO) return;
    
    self.model = model;
    SHMemberModel *member = self.model;
    [self.imageView setImage:[UIImage imageNamed:member.imageName]];
    [self.roleLabel setText:member.role];
    [self.nameLabel setText:member.memberName];
    
    [self setNeedsLayout];
}

@end
