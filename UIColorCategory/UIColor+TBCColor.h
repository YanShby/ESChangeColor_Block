//
//  UIColor+TBCColor.h
//  ESChangeColor
//
//  Created by 申岩 on 2018/4/10.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "UIColor+TBCResManager.h"

@interface UIColor (TBCColor)
@property (nonatomic, assign) BOOL needColorChange;
@property (nonatomic, strong) NSString *colorKey;
@property (nonatomic, assign) TBCColorType colorType;
@property (nonatomic, assign) CGFloat colorAlpha;
@end
