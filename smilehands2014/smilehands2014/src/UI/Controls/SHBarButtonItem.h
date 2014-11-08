//
//  SHBarButtonItem.h
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 27..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHBarButtonItem : UIBarButtonItem

@property (nonatomic, strong) UIView *animationView;

+ (id)addBarButtonTitle:(NSString *)title
                 target:(id)target
                 action:(SEL)selector;

+ (id)addBarButtonTitle:(NSString *)title
           defaultImage:(UIImage *)defaultImage
         highlightImage:(UIImage *)highlightImage
                 target:(id)target
                 action:(SEL)selector;

@end
