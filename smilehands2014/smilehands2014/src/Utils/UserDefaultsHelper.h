//
//  UserDefaultsHelper.h
//  EatStopEat
//
//  Created by Suwan Park on 2014. 4. 29..
//  Copyright (c) 2014년 Suwan Park. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultsHelper : NSObject
+ (void)setIntUserDefault:(NSString *)key value:(int)value;
+ (int)intUserDefault:(NSString *)key ;

+ (void)setLongUserDefault:(NSString *)key value:(long)value;
+ (long)longUserDefault:(NSString *)key;

+ (void)setBoolUserDefault:(NSString *)key value:(BOOL)value;
+ (BOOL)boolUserDefault:(NSString *)key ;

+ (void)setStringUserDefault:(NSString *)key value:(NSString *)value;
+ (NSString *)stringUserDefault:(NSString *)key;

+ (void)setObjectUserDefault:(NSString *)key value:(id)value;
+ (id)objectUserDefault:(NSString *)key;
@end
