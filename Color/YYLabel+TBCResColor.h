//
//  YYLabel+TBCResColor.h
//  ESChangeColor
//
//  Created by 申岩 on 2018/3/30.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "YYLabel.h"
#import "NSObject+TBCResColor.h"

typedef NSAttributedString *(^TBCResAttributedString)(void);


@interface YYLabel (TBCResColor)
#ifdef USE_BLOCK
@property (nonatomic, copy) TBCResColorBlock res_textColor;
@property (nonatomic, copy) TBCResColorBlock res_shadowColor;

@property (nonatomic, copy) TBCResAttributedString res_attributedText;
#endif
@end
