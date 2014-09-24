//
//  SHEtiquetteRootViewController.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 23..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHEtiquetteRootViewController.h"

@interface SHEtiquetteRootViewController ()

@end

@implementation SHEtiquetteRootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.title = LocalString(@"title_etiquette");
}

- (UITabBarItem *)tabBarItem
{
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:nil
                                                       image:[UIImage imageNamed:@"favorite"]
                                               selectedImage:[UIImage imageNamed:@""]];
    return item;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
