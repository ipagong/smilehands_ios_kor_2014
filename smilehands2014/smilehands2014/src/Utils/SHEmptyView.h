//
//  SHEmptyView.h
//
//  Created by suwan on 2014. 8. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHEmptyView : UIView

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel     *titleLabel;
@property (nonatomic, strong) UILabel     *subtitleLabel;

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *titleText;
@property (nonatomic, strong) NSString *subtitleText;

@property (nonatomic, assign) CGFloat topImageOffset;
@property (nonatomic, assign) CGFloat topTitleOffset;
@property (nonatomic, assign) CGFloat topSubtitleOffset;

@property (nonatomic, strong) UIView *onView;

@end