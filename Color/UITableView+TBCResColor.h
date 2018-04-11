//
//  UITableView+TBCResColor.h
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSObject+TBCResColor.h"

@interface UITableView (TBCResColor)
#ifdef USE_BLOCK
@property (nonatomic, copy) TBCResColorBlock res_separatorColor;
@property (nonatomic, copy) TBCResColorBlock res_sectionIndexColor;
@property (nonatomic, copy) TBCResColorBlock res_sectionIndexBackgroundColor;
@property (nonatomic, copy) TBCResColorBlock res_sectionIndexTrackingBackgroundColor;
#endif
@end
