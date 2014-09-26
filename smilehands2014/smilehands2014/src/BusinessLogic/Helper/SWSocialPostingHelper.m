//
//  SWSocialPostingHelper.m
//  SWPhotoAlbum
//
//  Created by suwan on 2014. 6. 26..
//  Copyright (c) 2014년 DaumCommunications. All rights reserved.
//

#import "SWSocialPostingHelper.h"
#import <Social/Social.h>

@implementation SWSocialPostingHelper

static NSDictionary *socialTypeDictionary;

+ (void)initialize
{
    socialTypeDictionary = @{
                             @(SHSocialPostingTypeFacebook) : SLServiceTypeFacebook,
                             @(SHSocialPostingTypeTwitter)  : SLServiceTypeTwitter
                             };
}

+ (void)openBasicSocialPostWithType:(SHSocialPostingType)socialType
                     viewController:(UIViewController *)vc
{
    SLComposeViewController *controller = [SLComposeViewController composeViewControllerForServiceType:socialTypeDictionary[@(socialType)]];
    
    [controller setInitialText:@"#SmileHands\n"];
    
    [controller setCompletionHandler:^(SLComposeViewControllerResult result) {
        
        NSString *alertMessage = nil;
        
        switch (result) {
            case SLComposeViewControllerResultCancelled:
                alertMessage = LocalString(@"PostingCanceld");
                break;
            case SLComposeViewControllerResultDone:
                alertMessage = LocalString(@"PostingSuccess");
                break;
                
            default:
                break;
        }
        
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:alertMessage
                                                            message:nil
                                                           delegate:nil
                                                  cancelButtonTitle:LocalString(@"Ok")
                                                  otherButtonTitles:nil];
        [alertView show];
    }];
    
    [vc presentViewController:controller
                     animated:YES
                   completion:Nil];

}

@end
