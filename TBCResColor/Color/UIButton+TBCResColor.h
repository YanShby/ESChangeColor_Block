//
//  UIButton+TBCResColor.h
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+TBCResColor.h"

@interface UIButton (TBCResColor)
- (void)res_setTitleColor:(TBCResColorBlock)colorBlock forState:(UIControlState)state;
- (void)res_setBackgroundImage:(TBCResImageBlock)imageBlock forState:(UIControlState)state;
- (void)res_setImage:(TBCResImageBlock)imageBlock forState:(UIControlState)state;
@end
