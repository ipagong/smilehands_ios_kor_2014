//
//  SHPreferences.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 26..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHPreferences.h"
#import "UserDefaultsHelper.h"

#define kPreferenceAutoAlarm @"kPreferenceAutoAlarm"

@implementation SHPreferences

+ (BOOL)isOnAutoAlarm
{
    return [UserDefaultsHelper boolUserDefault:kPreferenceAutoAlarm];
}

+ (void)setOnAutoAlarm:(BOOL)isOn
{
    [UserDefaultsHelper setBoolUserDefault:kPreferenceAutoAlarm value:isOn];
}

@end
