//
//  SWSocialPostingHelper.h
//  SWPhotoAlbum
//
//  Created by suwan on 2014. 6. 26..
//  Copyright (c) 2014년 DaumCommunications. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    SHSocialPostingTypeFacebook = 0,
    SHSocialPostingTypeTwitter,
} SHSocialPostingType;

@interface SWSocialPostingHelper : NSObject

+ (void)openBasicSocialPostWithType:(SHSocialPostingType)socialType
                     viewController:(UIViewController *)vc;
@end
