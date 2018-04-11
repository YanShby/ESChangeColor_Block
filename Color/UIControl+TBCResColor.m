//
//  UIControl+TBCResColor.m
//  ESChangeColor
//
//  Created by 申岩 on 2018/2/23.
//  Copyright © 2018年 申岩. All rights reserved.
//

#import "UIControl+TBCResColor.h"
#import <objc/runtime.h>

@interface UIControl ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, TBCResColorBlock> *resColors;
@end

@implementation UIControl (TBCResColor)
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

#else
//+ (void)load {
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        Method Method1 = class_getInstanceMethod([UIControl class], @selector(setTintColor:));
//        Method newMethod1 = class_getInstanceMethod([UIControl class], @selector(tbc_setTintColor:));
//        
//        method_exchangeImplementations(Method1, newMethod1);
//    });
//}
//
//- (void)tbc_setTintColor:(UIColor *)tintColor
//{
//    if (tintColor) {
//        [self tbc_setTintColor:tintColor];
//        [self.resColors setObject:tintColor forKey:NSStringFromSelector(@selector(setTintColor:))];
//    }
//}
#endif
@end
