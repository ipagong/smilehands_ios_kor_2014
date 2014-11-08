//
//  AppUtility.h
//  SWPhotoAlbum
//
//  Created by suwan on 2014. 6. 24..
//  Copyright (c) 2014년 DaumCommunications. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUtility : NSObject

+ (BOOL)isEmptyOrWhitespace:(NSString *)str;
+ (NSString *)trimSideWhiteSpace:(NSString *)str;

+ (UIImage *)imageWithColor:(UIColor *)color;

+ (NSString *)currentDateStringWithStyle:(NSDateFormatterStyle)style;
+ (NSString *)currentTimeStringWithStyle:(NSDateFormatterStyle)style;
+ (NSString *)currentDateAndTimeStringWithStyle:(NSDateFormatterStyle)style;

+ (NSString *)dateStringWithStyle:(NSDateFormatterStyle)style date:(NSDate *)date;
+ (NSString *)timeStringWithStyle:(NSDateFormatterStyle)style date:(NSDate *)date;
+ (NSString *)dateAndTimeStringWithStyle:(NSDateFormatterStyle)style date:(NSDate *)date;

+ (NSNumber *)yearWithDate:(NSDate *)date;
+ (NSNumber *)monthWithDate:(NSDate *)date;
+ (NSNumber *)dayhWithDate:(NSDate *)date;

+ (NSString *)stringStopWatchTimeWithTime:(NSTimeInterval)time;
+ (void)showSpinnerIndicatorWithView:(UIView *)superView;
+ (void)hideSpinnerIndicatorWithView:(UIView *)superView;

+ (NSString *)dateStringWithDate:(NSDate *)date;
+ (NSDate *)dateWithString:(NSString *)stringDate;

+ (BOOL)isIOS4x;
+ (BOOL)isIOS5x;
+ (BOOL)isIOS6x;
+ (BOOL)isIOS7x;
+ (BOOL)isIOS8x;

+ (void) runSpinAnimationOnView:(UIView*)view
                       duration:(CGFloat)duration
                      rotations:(CGFloat)rotations
                         repeat:(float)repeat;
+ (void)registLocalNotification;
+ (BOOL)nowRunInBackground;


@end
