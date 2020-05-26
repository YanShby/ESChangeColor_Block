//
//  ViewController.m
//  ESChangeColor
//
//  Created by 申岩 on 2017/12/4.
//  Copyright © 2017年 申岩. All rights reserved.
//

#import "ViewController.h"
#import "UIView+TBCResColor.h"
#import "ESThemeManager.h"
#import "UIColor+TBResColor.h"
#import "ESTableViewCell.h"
#import "SecondViewController.h"
#import "UILabel+TBCResColor.h"
#import "UIImageView+TBCResColor.h"
#import "UITableView+TBCResColor.h"
#import "UISwitch+TBCResColor.h"
#import "UINavigationBar+TBCResColor.h"
#import "UIBarButtonItem+TBCResColor.h"

#import "UIColor+TBCColor.h"
#import "UIColor+TBCResManager.h"

@interface ViewController ()
@property (nonatomic, strong) UISwitch *themeSwitch;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[ESTableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    // tableview's separator
    self.tableView.res_separatorColor = [UIColor normalColor:[UIColor blackColor] nightColor:[UIColor yellowColor]];

    // NavBar's Title
    UILabel *navigationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 375, 44)];
    navigationLabel.text = @"NightRes";
    navigationLabel.res_textColor = [UIColor normalColor:[UIColor blackColor] nightColor:[UIColor whiteColor]];
    navigationLabel.textAlignment = NSTextAlignmentCenter;
    self.navigationItem.titleView = navigationLabel;

    // NavBar's right button
    UISwitch *themeSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(10, 100, 0, 0)];
    [themeSwitch addTarget:self action:@selector(themeSwitch:) forControlEvents:UIControlEventValueChanged];
    themeSwitch.res_onTintColor = [UIColor normalColor:[UIColor whiteColor] nightColor:[UIColor lightGrayColor]];
    self.themeSwitch = themeSwitch;
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:themeSwitch];

    // second vc's back button
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];

    // backgroundColor of vc's view
    self.view.res_backgroundColor = [UIColor normalColor:[UIColor whiteColor] nightColor:[UIColor blackColor]];

    [self.navigationController.navigationBar setRes_barTintColor:[UIColor normalColor:[UIColor whiteColor] nightColor:[UIColor blackColor]]];
    
    
    
    // Use hook.
    self.view.tbc_backgroundColor = [UIColor linkTipColorForKey:@"D"];

    self.tableView.separatorColor = [UIColor otherColorForKey:@"A"];

    self.navigationController.navigationBar.barTintColor = [UIColor bgLineColorForKey:@"E"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if ([ESThemeManager sharedInstance].isNight)
    {
        self.themeSwitch.on = YES;
    }
    else
    {
        self.themeSwitch.on = NO;
    }
}

- (void)themeSwitch:(UISwitch *)sender
{
    [[ESThemeManager sharedInstance] changeStyle];
}


#pragma mark - UITableView Delegate & DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if ([cell isKindOfClass:[ESTableViewCell class]])
    {
        ((ESTableViewCell *)cell).label.text = [NSString stringWithFormat:@"NightCell - %ld line.",(long)indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.navigationController pushViewController:[SecondViewController new] animated:YES];
}


@end
