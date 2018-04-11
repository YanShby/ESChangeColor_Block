//
//  UINavigationBar+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UINavigationBar+TBCResColor.h"
#import <objc/runtime.h>

@interface UINavigationBar ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, TBCResColorBlock> *resColors;
@end

@implementation UINavigationBar (TBCResColor)
#ifdef USE_BLOCK
- (TBCResColorBlock)res_tintColor
{
    return objc_getAssociatedObject(self, @selector(res_tintColor));
}

- (void)setRes_tintColor:(TBCResColorBlock)res_tintColor
{
    if (res_tintColor)
    {
        self.tintColor = res_tintColor();
        objc_setAssociatedObject(self, @selector(res_tintColor), res_tintColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_tintColor copy] forKey:NSStringFromSelector(@selector(setTintColor:))];
    }
}

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
        Method Method1 = class_getInstanceMethod([UINavigationBar class], @selector(setTintColor:));
        Method newMethod1 = class_getInstanceMethod([UINavigationBar class], @selector(tbc_setTintColor:));
        
        Method Method2 = class_getInstanceMethod([UINavigationBar class], @selector(setBarTintColor:));
        Method newMethod2 = class_getInstanceMethod([UINavigationBar class], @selector(tbc_setBarTintColor:));
        
        method_exchangeImplementations(Method1, newMethod1);
        method_exchangeImplementations(Method2, newMethod2);
    });
}

- (void)tbc_setTintColor:(UIColor *)tintColor
{
    if (tintColor) {
        [self tbc_setTintColor:tintColor];
        [self.resColors setObject:tintColor forKey:NSStringFromSelector(@selector(setTintColor:))];
    }
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
