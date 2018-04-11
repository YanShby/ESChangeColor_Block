//
//  SecondViewController.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/22.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "SecondViewController.h"
#import "ESThemeManager.h"
#import "UIColor+TBResColor.h"
#import "UIView+TBCResColor.h"
#import "UILabel+TBCResColor.h"
#import "UIImageView+TBCResColor.h"
#import "UIBarButtonItem+TBCResColor.h"
#import "NSMutableAttributedString+TBCResColor.h"
#import "UIPageControl+TBCResColor.h"

#import "YYLabel.h"
#import "YYLabel+TBCResColor.h"

#import "UIColor+TBCResManager.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor bgLineColorForKey:@"D"];
    
//    // backgroundColor of vc's view
//    self.view.res_backgroundColor = [UIColor normalColor:[UIColor whiteColor] nightColor:[UIColor blackColor]];
//
//    // NavBar's right button
//    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"ChangeMe" style:UIBarButtonItemStyleDone target:self action:@selector(change)];
//    self.navigationItem.rightBarButtonItem.res_tintColor = [UIColor normalColor:[UIColor blackColor] nightColor:[UIColor whiteColor]];
//
//    // NavBar's tint color
//    self.navigationController.navigationBar.res_tintColor = [UIColor normalColor:[UIColor redColor] nightColor:[UIColor greenColor]];
//
//    // UILable's attributedString
//    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 64, [UIScreen mainScreen].bounds.size.width, 200)];
//    NSAttributedString *string = [self generateAttributedString:@"attributed string"];
//    lable.res_attributedText = ^NSAttributedString *{
//        return string;
//    };
//    [self.view addSubview:lable];
//
//    // PageControl
//    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(100, 200, 100, 50)];
//    [self.view addSubview:pageControl];
//    pageControl.numberOfPages = 10;
//    pageControl.currentPage = 5;
//    pageControl.res_currentPageIndicatorTintColor = [UIColor normalColor:[UIColor blueColor] nightColor:[UIColor orangeColor]];
//    pageControl.res_pageIndicatorTintColor = [UIColor normalColor:[UIColor redColor] nightColor:[UIColor whiteColor]];
//
//    // YYLabel's string
//    YYLabel *yyLabel = [[YYLabel alloc] initWithFrame:CGRectMake(100, 250, 200, 30)];
//    yyLabel.text = @"YYLabel Test!";
//    yyLabel.res_textColor = [UIColor normalColor:[UIColor redColor] nightColor:[UIColor whiteColor]];
//    [self.view addSubview:yyLabel];
//
//    // YYLabel's attributedString
//    YYLabel *yyLabel1 = [[YYLabel alloc] initWithFrame:CGRectMake(100, 300, 200, 30)];
//    [self.view addSubview:yyLabel1];
//
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"YYLabel test again"];
//    [attributedString res_yy_setColorBlock:[UIColor normalColor:[UIColor blueColor] nightColor:[UIColor orangeColor]] range:NSMakeRange(0, 3)];
//    [attributedString res_yy_setColorBlock:[UIColor normalColor:[UIColor greenColor] nightColor:[UIColor redColor]] range:NSMakeRange(4, 7)];
//    [attributedString res_yy_setUnderlineColorBlock:[UIColor normalColor:[UIColor greenColor] nightColor:[UIColor redColor]] range:NSMakeRange(0, 7)];
//
//    attributedString.res_yy_color = [UIColor normalColor:[UIColor greenColor] nightColor:[UIColor redColor]];
//
//    yyLabel1.res_attributedText = ^NSAttributedString *{
//        return attributedString;
//    };
}

- (NSAttributedString *)generateAttributedString:(NSString *)attributedString
{
    NSString *string = [NSString stringWithFormat:@"Let's test %@ with night mode!",attributedString];
    NSMutableAttributedString *mutableAttributeString = [[NSMutableAttributedString alloc] initWithString:string];
#ifdef USE_BLOCK
    [mutableAttributeString addForegroundColorBlock:[UIColor normalColor:[UIColor greenColor] nightColor:[UIColor redColor]] range:NSMakeRange(0, 5)];
    [mutableAttributeString addForegroundColorBlock:[UIColor normalColor:[UIColor blueColor] nightColor:[UIColor orangeColor]] range:NSMakeRange(6, 10)];
    [mutableAttributeString addForegroundColorBlock:[UIColor normalColor:[UIColor redColor] nightColor:[UIColor lightGrayColor]] range:NSMakeRange(20, 6)];
    [mutableAttributeString addBackgroundColorBlock:[UIColor normalColor:[UIColor blackColor] nightColor:[UIColor whiteColor]] range:NSMakeRange(30, 10)];
#else
#endif
    
    return mutableAttributeString;
}

- (void)change
{
    [[ESThemeManager sharedInstance] changeStyle];
}

- (void)popme
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    NSLog(@"dealloc ----");
}

@end
