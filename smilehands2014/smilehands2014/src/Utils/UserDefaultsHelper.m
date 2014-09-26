//
//  UserDefaultsHelper.m
//  EatStopEat
//
//  Created by Suwan Park on 2014. 4. 29..
//  Copyright (c) 2014년 Suwan Park. All rights reserved.
//

#import "UserDefaultsHelper.h"

@implementation UserDefaultsHelper

+ (void)setIntUserDefault:(NSString *)key value:(int)value
{
    [[NSUserDefaults standardUserDefaults] setObject:@(value) forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (int)intUserDefault:(NSString *)key
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:key] intValue];
}

+ (void)setLongUserDefault:(NSString *)key value:(long)value
{
    [[NSUserDefaults standardUserDefaults] setObject:@(value) forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (long)longUserDefault:(NSString *)key
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:key] longValue];
}

+ (void)setBoolUserDefault:(NSString *)key value:(BOOL)value
{
    [[NSUserDefaults standardUserDefaults] setObject:@(value) forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (BOOL)boolUserDefault:(NSString *)key
{
    return [[[NSUserDefaults standardUserDefaults] objectForKey:key] boolValue];
}

+ (void)setStringUserDefault:(NSString *)key value:(NSString *)value
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)stringUserDefault:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}

+ (void)setObjectUserDefault:(NSString *)key value:(id)value
{
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (id)objectUserDefault:(NSString *)key
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:key];
}


@end
