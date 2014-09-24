//
//  UIColor+Addition.h
//  EatStopEat
//
//  Created by suwan on 2014. 6. 24..
//  Copyright (c) 2014년 DaumCommunications. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Addition)

+ (UIColor *)colorWithRGB:(int)aRGB;
+ (UIColor *)colorWithRGB:(int)aRGB withAlpha:(CGFloat)alpha;
+ (UIColor *)defaultBackgroundColor;
+ (UIColor *)colorWithRedDecimal:(int)red greenDecimal:(int)green blueDecimal:(int)blue;

@end
