//
//  AppDelegate.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 21..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "AppDelegate.h"
#import "SHApplicationCoreDataHelper.h"

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
    
    [tabBarController setViewControllers:@[
                                           [self etiquetteNavigationViewController],
                                           [self favoriteNavigationViewController],
                                           [self monitorNavigationViewController],
                                           [self settingsNavigationViewController]
                                           ]];
    
    self.window.rootViewController = tabBarController;
    [self.window makeKeyAndVisible];
}

- (UINavigationController *)etiquetteNavigationViewController
{
    SHEtiquetteRootViewController *vc = [[SHEtiquetteRootViewController alloc] initWithNibName:@"SHEtiquetteRootViewController"
                                                                                        bundle:nil];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    
    return nc;
}

- (UINavigationController *)favoriteNavigationViewController
{
    SHFavoriteViewController *vc = [[SHFavoriteViewController alloc] initWithNibName:@"SHFavoriteViewController"
                                                                                        bundle:nil];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    return nc;
}

- (UINavigationController *)monitorNavigationViewController
{
    SHBeaconFinderViewController *vc = [[SHBeaconFinderViewController alloc] initWithNibName:@"SHBeaconFinderViewController"
                                                                                        bundle:nil];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    return nc;
}

- (UINavigationController *)settingsNavigationViewController
{
    SHSettingsViewController *vc = [[SHSettingsViewController alloc] initWithNibName:@"SHSettingsViewController"
                                                                                        bundle:nil];
    UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
    return nc;
}

@end