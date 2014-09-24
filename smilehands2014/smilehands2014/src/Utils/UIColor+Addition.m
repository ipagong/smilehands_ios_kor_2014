//
//  UIColor+Addition.m
//
//  Created by suwan on 2014. 6. 24..
//  Copyright (c) 2014년 DaumCommunications. All rights reserved.
//

#import "UIColor+Addition.h"

@implementation UIColor (Addition)

+ (UIColor *)colorWithRGB:(int)aRGB
{
    int red   = (aRGB >> 16) & 0xff;
    int green = (aRGB >>  8) & 0xff;
    int blue  = (aRGB      ) & 0xff;
    
    return [UIColor colorWithRed:((CGFloat)red / 0xff) green:((CGFloat)green / 0xff) blue:((CGFloat)blue / 0xff) alpha:1.0];
}

+ (UIColor *)colorWithRGB:(int)aRGB withAlpha:(CGFloat)alpha
{
    int red   = (aRGB >> 16) & 0xff;
    int green = (aRGB >>  8) & 0xff;
    int blue  = (aRGB      ) & 0xff;
    
    return [UIColor colorWithRed:((CGFloat)red / 0xff) green:((CGFloat)green / 0xff) blue:((CGFloat)blue / 0xff) alpha:alpha];
}

+ (UIColor *)defaultBackgroundColor
{
    return [UIColor colorWithRGB:0xc3cbd8];
}

+ (UIColor *) colorWithRedDecimal:(int)red greenDecimal:(int)green blueDecimal:(int)blue
{
    return [UIColor colorWithRed:((CGFloat)red/255) green:((CGFloat)green/255) blue:((CGFloat)blue/255) alpha:1.0];
}

@end
