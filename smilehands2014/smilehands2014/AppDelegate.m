//
//  AppDelegate.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 21..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "AppDelegate.h"
#import "SHApplicationCoreDataHelper.h"
#import "SHApplicationEventHelper.h"

#import "SHTabBarController.h"
#import "SHFavoriteViewController.h"
#import "SHEtiquetteRootViewController.h"
#import "SHBeaconFinderViewController.h"
#import "SHSearchViewController.h"
#import "SHSettingsViewController.h"


@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [SHApplicationCoreDataHelper initCoreDataSetup];
    
    [SHApplicationEventHelper applicationDidFinishLaunchingWithOptions:launchOptions];

    [self initAppearance];
    
    [self initWindows];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{

}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    [SHApplicationCoreDataHelper applicationDidBecomeActive];
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    [SHApplicationCoreDataHelper applicationWillTerminate];
}

#pragma mark - private methods

- (void)initWindows
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] ;
    
    SHTabBarController *tabBarController = [[SHTabBarController alloc] init];
    
    [tabBarController setViewControllers:[SHTabBarController defaultTabViewControllers]];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
}


- (void)initAppearance
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [[UINavigationBar appearance] setBackgroundColor:RGBColor(219, 25, 57)];
    [[UINavigationBar appearance] setBarTintColor:RGBColor(219, 25, 57)];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                          [UIColor whiteColor],
                                                          NSForegroundColorAttributeName,
                                                          nil]];
    
    [[UITabBar appearance] setBackgroundColor:RGBColor(219, 25, 57)];
    [[UITabBar appearance] setBarTintColor:RGBColor(219, 25, 57)];
    [[UITabBar appearance] setTranslucent:NO];
}



@end