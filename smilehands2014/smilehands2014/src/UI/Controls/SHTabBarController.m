//
//  SHTabBarController.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 23..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHTabBarController.h"

@interface SHTabBarController ()

@end

@implementation SHTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)beginCustomizingItems:(NSArray *)items
{
    for (id item in items) {
        DLog(@"---> item : %@", item);
    }
}
- (BOOL)endCustomizingAnimated:(BOOL)animated
{
    return NO;
}


+ (NSArray *)defaultTabViewControllers
{
    NSMutableArray *viewControllers = [[NSMutableArray alloc] init];
    
    for (NSString *clazz in [self tabClazzList]) {
        @try {
            Class viewControllerClazz = NSClassFromString(clazz);
            UIViewController *vc = [[viewControllerClazz alloc] initWithNibName:clazz
                                                                         bundle:nil];
            UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
            
            [viewControllers addObject:nc];
        }
        @catch (NSException *exception) {
            DLog(@"-------> you must match fetcher clazz name.(2)");
            return nil;
        }
    }
    
    return viewControllers;
}

+ (NSArray *)tabClazzList
{
    return @[
             @"SHEtiquetteRootViewController",
             @"SHFavoriteViewController",
             @"SHBeaconFinderViewController",
             @"SHSettingsViewController",
             ];
}

@end
