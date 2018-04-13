//
//  ESTableViewCell.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/22.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "ESTableViewCell.h"
#import "UIView+TBCResColor.h"
#import "UIColor+TBResColor.h"
#import "UILabel+TBCResColor.h"
#import "UIImageView+TBCResColor.h"
#import "ESThemeManager.h"

@implementation ESTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
#ifdef USE_BLOCK
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 270, 50)];
        self.label.numberOfLines = 0;
        self.label.res_textColor = [UIColor normalColor:[UIColor blackColor] nightColor:[UIColor whiteColor]];
        self.label.lineBreakMode = NSLineBreakByCharWrapping;
        [self.contentView addSubview:self.label];
        
        self.imageV = [[UIImageView alloc] res_initWithImage:[UIImage normalImage:[UIImage imageNamed:@"day"] nightImage:[UIImage imageNamed:@"night"]]];
        self.imageV.frame = CGRectMake(300, 15, 20, 20);
        [self.contentView addSubview:self.imageV];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
#else
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 270, 50)];
        self.label.numberOfLines = 0;
        self.label.textColor = [UIColor contColorForKey:@"C"];
        self.label.lineBreakMode = NSLineBreakByCharWrapping;
        [self.contentView addSubview:self.label];
        
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(150, 0, 100, 50)];
        [button setTitle:@"button" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor contColorForKey:@"A"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor contColorForKey:@"B"] forState:UIControlStateHighlighted];
        [button setBackgroundColor:[UIColor linkTipColorForKey:@"A"]];
        [self.contentView addSubview:button];
#endif
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
#ifdef USE_BLOCK
    if (highlighted) {
        self.contentView.res_backgroundColor = [UIColor normalColor:[UIColor purpleColor] nightColor:[UIColor orangeColor]];
    } else {
        self.contentView.res_backgroundColor = [UIColor normalColor:[UIColor whiteColor] nightColor:[UIColor blackColor]];
    }
#else
    if (highlighted) {
        self.contentView.backgroundColor = [UIColor bgLineColorForKey:@"C"];
    } else {
        self.contentView.backgroundColor = [UIColor bgLineColorForKey:@"A"];
    }
#endif
}

@end
