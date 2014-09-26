//
//  SHSettingsTableViewCell.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 26..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSettingsImageViewTag 910223

typedef NS_ENUM(NSInteger, SHSettingType) {
    SHSettingTypeAutoAlarm   = 0,
    SHSettingTypeVersionInfo,
    SHSettingTypeCreator,
    SHSettingTypeTitle,
};

@interface SHSettingsTableViewCell : UITableViewCell

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *arrow;
@property (nonatomic, strong) UISwitch *slider;

@property (nonatomic, assign) SHSettingType type;

@end
