//
//  UIToolbar+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UIToolbar+TBCResColor.h"
#import <objc/runtime.h>

@interface UIToolbar ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, TBCResColorBlock> *resColors;
@end

@implementation UIToolbar (TBCResColor)
#ifdef USE_BLOCK
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
#else
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method Method1 = class_getInstanceMethod([UIToolbar class], @selector(setBarTintColor:));
        Method newMethod1 = class_getInstanceMethod([UIToolbar class], @selector(tbc_setBarTintColor:));
        
        method_exchangeImplementations(Method1, newMethod1);
    });
}


- (void)tbc_setBarTintColor:(UIColor *)barTintColor
{
    if (barTintColor) {
        [self tbc_setBarTintColor:barTintColor];
        [self.resColors setObject:barTintColor forKey:NSStringFromSelector(@selector(setBarTintColor:))];
    }
}
#endif
@end
