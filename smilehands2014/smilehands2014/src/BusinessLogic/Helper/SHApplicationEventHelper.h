//
//  SHApplicationEventHelper.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 25..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHApplicationEventHelper : NSObject

+ (void)applicationDidFinishLaunchingWithOptions:(NSDictionary *)launchOptions;

+ (void)applicationDidBecomeActive;

+ (void)applicationWillTerminate;

@end
