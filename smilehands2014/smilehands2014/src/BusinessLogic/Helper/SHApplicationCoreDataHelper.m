//
//  SHApplicationCoreDataHelper.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 23..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHApplicationCoreDataHelper.h"

#define kSHCoreDataSQLiteName   @"SmileHands.sqlite"

@implementation SHApplicationCoreDataHelper

+ (void)applicationDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self initCoreDataSetup];
}

+ (void)applicationDidBecomeActive
{
    [self initCoreDataSetup];
}

+ (void)applicationWillTerminate
{
    [self cleanUpCoreData];
}

+ (void)initCoreDataSetup
{
    [MagicalRecord setupCoreDataStackWithStoreNamed:kSHCoreDataSQLiteName];
}

+ (void)cleanUpCoreData
{
    [MagicalRecord cleanUp];
}

@end
