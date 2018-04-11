//
//  UIView+TBCResColor.m
//  TBCResColor
//
//  Created by 申岩 on 2017/12/4.
//  Copyright © 2017年 申岩. All rights reser;ved.
//

#import "UIView+TBCResColor.h"
#import <objc/runtime.h>
#import "UIColor+TBCColor.h"

#import "UIColor+TBCResManager.h"

@interface UIView ()
@property (nonatomic, strong) NSMutableDictionary<NSString *, TBCResColorBlock> *resColors;
@end

@implementation UIView (TBCResColor)
#ifdef USE_BLOCK
- (TBCResColorBlock)res_backgroundColor
{
    return objc_getAssociatedObject(self, @selector(res_backgroundColor));
}

- (void)setRes_backgroundColor:(TBCResColorBlock)res_backgroundColor
{
    if (res_backgroundColor)
    {
        self.backgroundColor = res_backgroundColor();
        objc_setAssociatedObject(self, @selector(res_backgroundColor), res_backgroundColor, OBJC_ASSOCIATION_COPY_NONATOMIC);
        [self.resColors setObject:[res_backgroundColor copy] forKey:NSStringFromSelector(@selector(setBackgroundColor:))];
    }
}

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
+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method originBackgroundColorMethod = class_getInstanceMethod([UIView class], @selector(setBackgroundColor:));
        Method newBackgroundColorMethod = class_getInstanceMethod([UIView class], @selector(tbc_setBackgroundColor:));
        
        Method originTintColorMethod = class_getInstanceMethod([UIView class], @selector(setTintColor:));
        Method newTintColorMethod = class_getInstanceMethod([UIView class], @selector(tbc_setTintColor:));
        
        method_exchangeImplementations(originBackgroundColorMethod, newBackgroundColorMethod);
        method_exchangeImplementations(originTintColorMethod, newTintColorMethod);
    });
}

- (void)tbc_setBackgroundColor:(UIColor *)backgroundColor
{
    [self tbc_setBackgroundColor:backgroundColor];
    if (backgroundColor) {
        [self.resColors setObject:backgroundColor forKey:@"setBackgroundColor:"];
    }
}

- (void)tbc_setTintColor:(UIColor *)tintColor
{
    [self tbc_setTintColor:tintColor];
    if (tintColor) {
        [self.resColors setObject:tintColor forKey:@"setTintColor:"];
    }
}
#endif
@end
