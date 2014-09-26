//
//  SHBarButtonItem.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 27..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHBarButtonItem.h"

@implementation SHBarButtonItem

+ (id)addBarButtonTitle:(NSString *)title
           defaultImage:(UIImage *)defaultImage
         highlightImage:(UIImage *)highlightImage
                 target:(id)target
                 action:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:15]];
    
    [button setTitleColor:RGBColor(255, 255, 255) forState:UIControlStateNormal];
    
    [button setImage:defaultImage forState:UIControlStateNormal];
    [button setImage:highlightImage forState:UIControlStateHighlighted];
    
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    [button sizeToFit];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barButtonItem;
}

+ (id)addBarButtonTitle:(NSString *)title
                 target:(id)target
                 action:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    
    [button.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [button setTitleColor:RGBColor(255, 255, 255) forState:UIControlStateNormal];
    [button sizeToFit];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barButtonItem;
}


@end
