//
//  UITabBar+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UITabBar+TBCResColor.h"
#import <objc/runtime.h>

@interface UITabBar ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, TBCResColorBlock> *resColors;
@end

@implementation UITabBar (TBCResColor)

- (TBCResColorBlock)res_barTintColor
{
    return objc_getAssociatedObject(self, @selector(res_barTintColor));
}

- (void)setRes_barTintColor:(TBCResColorBlock)res_barTintColor
{
    if (res_barTintColor)
    {
        self.barTintColor = res_barTintColor();
        objc_setAssociatedObject(self, @selector(res_barTintColor), res_barTintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_barTintColor copy] forKey:NSStringFromSelector(@selector(setBarTintColor:))];
    }
}
@end
