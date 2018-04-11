//
//  UIPageControl+TBCResColor.h
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+TBCResColor.h"

@interface UIPageControl (TBCResColor)
@property (nonatomic, copy) TBCResColorBlock res_pageIndicatorTintColor;
@property (nonatomic, copy) TBCResColorBlock res_currentPageIndicatorTintColor;
@end

