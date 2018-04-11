//
//  ESTableViewCell.h
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/22.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ESTableViewCell : UITableViewCell

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UIImageView *imageV;

@property (strong, nonatomic) UIColor *cellTintColor;

@end
