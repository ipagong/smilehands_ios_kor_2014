//
//  SHSettingsViewController.m
//  SmileHands2014
//
//  Created by suwan on 2014. 9. 23..
//  Copyright (c) 2014년 smilehands. All rights reserved.
//

#import "SHSettingsViewController.h"
#import "SHSettingsTableViewCell.h"

@interface SHSettingsViewController ()

@end

@implementation SHSettingsViewController

+ (NSArray *)sectionData
{
    return @[
  @[
      @[@(SHSettingTypeTitle), @"알림설정", @"icon_alarm"],
      @[@(SHSettingTypeAutoAlarm), @"장애인발견시자동알림"]
      ],
  
  @[
      @[@(SHSettingTypeTitle),       LocalString(@"settings_about"), @"icon_about"],
      @[@(SHSettingTypeVersionInfo), LocalString(@"title_version")],
      @[@(SHSettingTypeCreator),     LocalString(@"title_creators")]
      ]
  
  ];
}

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
    [self initCutomUI];
    self.title = LocalString(@"title_settings");
}

- (void)initCutomUI
{
    [self.tableView setFrame:CGRectMake(0, 0,
                                        CGRectGetWidth(self.view.bounds),
                                        CGRectGetHeight(self.view.bounds))];

    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[SHSettingsViewController sectionData][section] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [[SHSettingsViewController sectionData] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *settingCellIdentifier = @"SettingsCell";
    
    SHSettingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:settingCellIdentifier];
    
    if (cell == nil) {
        cell = [[SHSettingsTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:settingCellIdentifier];
        cell.backgroundColor = RGBColor(249, 250, 250);
    }
    
    [[cell.contentView viewWithTag:kSettingsImageViewTag] removeFromSuperview];
    
    NSArray *cellItem = [SHSettingsViewController sectionData][indexPath.section][indexPath.row];
    
    SHSettingType type = [cellItem[0] integerValue];
    
    cell.type = type;
    
    if (type == SHSettingTypeTitle) {
        [cell.leftImageView setImage:[UIImage imageNamed:[cellItem lastObject]]];
    }
    
    [cell.textLabel setText:[cellItem objectAtIndex:1]];
    
    [cell setNeedsLayout];
    
    return cell;
}

@end
