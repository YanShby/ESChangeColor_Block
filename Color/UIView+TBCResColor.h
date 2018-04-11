//
//  UIView+TBCResColor.h
//  TBCResColor
//
//  Created by 申岩 on 2017/12/4.
//  Copyright © 2017年 申岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+TBCResColor.h"

@interface UIView (TBCResColor)
#ifdef USE_BLOCK
@property (nonatomic, copy) TBCResColorBlock res_backgroundColor;
@property (nonatomic, copy) TBCResColorBlock res_tintColor;
#endif

@property (nonatomic, strong, setter = tbc_setBackgroundColor:) UIColor *tbc_backgroundColor;
@property (nonatomic, strong, setter = tbc_setTintColor:) UIColor *tbc_tintColor;

@end








