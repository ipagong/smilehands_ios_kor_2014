//
//  SHSimpleSectionReusableView.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 26..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHSimpleSectionReusableView.h"
#import "SHSimpleSectionModel.h"

@interface SHSimpleSectionReusableView ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation SHSimpleSectionReusableView

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
    self.titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.titleLabel.font = [UIFont boldSystemFontOfSize:14.f];
    [self.titleLabel setLineBreakMode:NSLineBreakByTruncatingTail];
    [self.titleLabel setTextAlignment:NSTextAlignmentLeft];
    [self.titleLabel setTextColor:RGBColor(20, 20, 20)];
    [self.titleLabel setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.titleLabel];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.titleLabel setFrame:CGRectMake(15,
                                         CGRectGetHeight(self.bounds)/2 - 3,
                                         CGRectGetWidth(self.bounds) - 30,
                                         18)];
}


- (void)refreshWithSectionModel:(id<SHCommonSectionModelProtocol>)model
{
    if ([model isKindOfClass:[SHSimpleSectionModel class]] == NO) return;
    
    SHSimpleSectionModel *section = (SHSimpleSectionModel *)model;
    [self.titleLabel setText:section.title];
    
    [self setNeedsLayout];
    
}

@end
