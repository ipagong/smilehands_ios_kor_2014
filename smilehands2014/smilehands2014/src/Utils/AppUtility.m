//
//  AppUtility.m
//  SWPhotoAlbum
//
//  Created by suwan on 2014. 6. 24..
//  Copyright (c) 2014년 DaumCommunications. All rights reserved.
//

#import "AppUtility.h"
#import "DSXActivityIndicator.h"

#define kFormmatterDefaultInfo        @"%d:%02d:%02d.%02d"
#define kGlobalSpinnerViewTag       101010101
@implementation AppUtility

+ (BOOL)isEmptyOrWhitespace:(NSString *)str
{
	return ![str length]||![str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]].length;
}

+ (NSString *)trimSideWhiteSpace:(NSString *)str
{
    NSUInteger location = 0;
    
    unichar charBuffer[[str length]];
    
    [str getCharacters:charBuffer];
    
    NSInteger i = 0;
    
    for ( i = [str length]; i >0; i--) {
        
        if (![[NSCharacterSet whitespaceCharacterSet] characterIsMember:charBuffer[i - 1]]) {
            break;
        }
        
    }
    
    return  [str substringWithRange:NSMakeRange(location, i  - location)];
}

+ (UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (NSString *)currentDateStringWithStyle:(NSDateFormatterStyle)style
{
    NSDateFormatter *formmater = [[NSDateFormatter alloc] init];
    
    [formmater setLocale:[NSLocale autoupdatingCurrentLocale]];
    [formmater setDateStyle:style];
    [formmater setTimeStyle:NSDateFormatterNoStyle];
    
    return [formmater stringFromDate:[NSDate date]];
}

+ (NSString *)currentTimeStringWithStyle:(NSDateFormatterStyle)style
{
    NSDateFormatter *formmater = [[NSDateFormatter alloc] init];
    
    [formmater setLocale:[NSLocale autoupdatingCurrentLocale]];
    [formmater setDateStyle:NSDateFormatterNoStyle];
    [formmater setTimeStyle:style];
    
    return [formmater stringFromDate:[NSDate date]];
}

+ (NSString *)currentDateAndTimeStringWithStyle:(NSDateFormatterStyle)style
{
    NSDateFormatter *formmater = [[NSDateFormatter alloc] init];
    
    [formmater setLocale:[NSLocale autoupdatingCurrentLocale]];
    [formmater setDateStyle:style];
    [formmater setTimeStyle:style];
    
    return [formmater stringFromDate:[NSDate date]];
}

+ (NSString *)dateStringWithStyle:(NSDateFormatterStyle)style date:(NSDate *)date
{
    NSDateFormatter *formmater = [[NSDateFormatter alloc] init];
    
    [formmater setLocale:[NSLocale autoupdatingCurrentLocale]];
    [formmater setDateStyle:style];
    [formmater setTimeStyle:NSDateFormatterNoStyle];
    
    return [formmater stringFromDate:date];
}

+ (NSString *)timeStringWithStyle:(NSDateFormatterStyle)style date:(NSDate *)date
{
    NSDateFormatter *formmater = [[NSDateFormatter alloc] init];
    
    [formmater setLocale:[NSLocale autoupdatingCurrentLocale]];
    [formmater setDateStyle:NSDateFormatterNoStyle];
    [formmater setTimeStyle:style];
    
    return [formmater stringFromDate:date];
}

+ (NSString *)dateAndTimeStringWithStyle:(NSDateFormatterStyle)style date:(NSDate *)date
{
    NSDateFormatter *formmater = [[NSDateFormatter alloc] init];
    
    [formmater setLocale:[NSLocale autoupdatingCurrentLocale]];
    [formmater setDateStyle:style];
    [formmater setTimeStyle:style];
    
    return [formmater stringFromDate:date];
}

+ (NSNumber *)yearWithDate:(NSDate *)date
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear
                                                                   fromDate:[NSDate date]];
    
    return @(components.year);
}

+ (NSNumber *)monthWithDate:(NSDate *)date
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitMonth
                                                                   fromDate:[NSDate date]];
    
    return @(components.month);
}

+ (NSNumber *)dayhWithDate:(NSDate *)date
{
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay
                                                                   fromDate:[NSDate date]];
    
    return @(components.day);
}

+ (NSString *)stringStopWatchTimeWithTime:(NSTimeInterval)time
{
    int hour    = ((int)time / 3600);
    int minute  = ((int)time / 60) % 60;
    int second  = ((int)time % 60);
    int miliSec = ((int)(time * 100) % 100);
    
    return [NSString stringWithFormat:kFormmatterDefaultInfo, hour, minute, second, miliSec];
}

#pragma mark - util for UI

+ (void)showSpinnerIndicatorWithView:(UIView *)superView
{
    DSXActivityIndicator *spinner = [[DSXActivityIndicator alloc] init];
    
    [spinner setTag:kGlobalSpinnerViewTag];
    
    spinner.center = superView.center;
    
    [spinner startAnimating];
    [superView addSubview:spinner];
}

+ (void)hideSpinnerIndicatorWithView:(UIView *)superView
{
    UIView *view = [superView viewWithTag:kGlobalSpinnerViewTag];
    
    if ([view isKindOfClass:[DSXActivityIndicator class]] == YES) {
        
        DSXActivityIndicator *spinner = (DSXActivityIndicator *)view;
        
        [spinner stopAnimating];
        [spinner removeFromSuperview];
    }
}


@end
