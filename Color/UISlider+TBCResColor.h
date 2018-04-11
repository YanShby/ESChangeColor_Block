//
//  UISlider+TBCResColor.h
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+TBCResColor.h"

@interface UISlider (TBCResColor)
#ifdef USE_BLOCK
@property (nonatomic, copy) TBCResColorBlock res_minimumTrackTintColor;
@property (nonatomic, copy) TBCResColorBlock res_maximumTrackTintColor;
@property (nonatomic, copy) TBCResColorBlock res_thumbTintColor;
#endif
@end
