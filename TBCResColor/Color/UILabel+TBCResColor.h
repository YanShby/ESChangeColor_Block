//
//  UILabel+TBCResColor.h
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+TBCResColor.h"

typedef NSAttributedString *(^TBCResAttributedString)(void);

@interface UILabel (TBCResColor)
@property (nonatomic, copy) TBCResColorBlock res_textColor;
@property (nonatomic, copy) TBCResColorBlock res_shadowColor;
@property (nonatomic, copy) TBCResColorBlock res_highlightedTextColor;
@property (nonatomic, copy) TBCResAttributedString res_attributedText;
@end
