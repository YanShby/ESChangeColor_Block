//
//  UIImageView+TBCResColor.h
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+TBCResColor.h"

@interface UIImageView (TBCResColor)
@property (nonatomic, copy) TBCResImageBlock res_image;
- (instancetype)res_initWithImage:(TBCResImageBlock)imageBlock;
@end
